import {Injectable} from '@nestjs/common';
import {GenericCrudService} from "../../core/generic-crud-service";
import {Client} from "../../model/client.entity";
import {PageableService} from "../../core/pageable-service";
import {AddressService} from "../../address/service/address.service";
import {InjectRepository} from "@nestjs/typeorm";
import {ProviderDTO} from "../../dto/provider.dto";
import {ClientRepository} from "../../client/repository/client.repository";
import {MaterialService} from "./material.service";
import {ProviderMapper} from "../../mapper/provider.mapper";
import {MaterialPriceService} from "./material-price.service";
import {Pageable} from "../../core/domain/pageable";
import {PaginatedPage} from "../../core/domain/paginatedPage";
import {DeleteResult, Like, SelectQueryBuilder} from "typeorm";
import {MaterialPriceMapper} from "../../mapper/material-price.mapper";

@Injectable()
export class ProviderService extends GenericCrudService<Client, ProviderDTO> implements PageableService<ProviderDTO> {

    private readonly addressService: AddressService;
    private readonly materialService: MaterialService;
    private readonly materialPriceService: MaterialPriceService;
    private readonly providerMapper: ProviderMapper;
    private readonly materialPriceMapper: MaterialPriceMapper;

    constructor(@InjectRepository(Client) private readonly  r: ClientRepository,
                materialService: MaterialService,
                addressService: AddressService,
                materialPriceService: MaterialPriceService,
                providerMapper: ProviderMapper,
                materialPriceMapper: MaterialPriceMapper
    ) {
        super(r);
        this.addressService = addressService;
        this.materialService = materialService;
        this.materialPriceService = materialPriceService;
        this.providerMapper = providerMapper;
        this.materialPriceMapper = materialPriceMapper;
    }


    async findAll(): Promise<ProviderDTO[]> {
        return this.repository.find({
            where: [{onlyProvider: true}, {hasMaterials: true}]
        }).then(result => result.map(c => this.mapToDTO(c)));
    }

    async findOne(id: number): Promise<ProviderDTO> {
        let dto = await this.repository.findOne({
            where: {id: id},
            relations: ["address", "address.city", "address.city.province"]
        }).then(p => this.mapToDTO(p));
        dto.materials = await this.materialPriceService.findByProvider(id).then(res => res.map(m => this.materialPriceMapper.toDTO(m)));
        return dto;
    }

    async create(entity: ProviderDTO): Promise<ProviderDTO> {
        let provider = this.mapToEntity(entity);
        let materials = entity.materials.map(m => this.materialPriceMapper.toEntity(m));

        provider.onlyProvider = true;
        provider.hasMaterials = materials.length > 0;
        provider.address = await this.addressService.create(entity.address).then(a => a.mapToEntity());
        provider = await this.repository.save(provider);
        materials.forEach(m => m.provider = provider);
        let materialsDTOs = await this.materialPriceService.create(materials).then(res => res.map(m => this.materialPriceMapper.toDTO(m)));

        const providerDTO = this.mapToDTO(provider);
        providerDTO.materials = materialsDTOs;

        return providerDTO;
    }

    async update(entity: ProviderDTO): Promise<ProviderDTO> {
        //TODO: Recuperar el estado de cuenta previamente
        let e: Client = this.mapToEntity(entity);
        let savedMaterials = await this.materialPriceService.findByProvider(e.id);
        let materials = entity.materials.map(m => this.materialPriceMapper.toEntity(m));
        let deletedMaterials = savedMaterials.filter(m => !materials.some(savedMaterial => savedMaterial.id === m.id));
        if (deletedMaterials.length > 0)
            await this.materialPriceService.removeMaterials(deletedMaterials);

        e.hasMaterials = materials.length > 0;

        //TODO: Revisar porque siempre lo almacena como onlyProvider
        e.onlyProvider = await (this.repository as ClientRepository).isOnlyProvider(entity.id);
        e = await this.repository.save(e);

        materials.forEach(m => m.provider = e);
        let materialsDTOs = await this.materialPriceService.create(materials).then(res => res.map(m => this.materialPriceMapper.toDTO(m)));

        const providerDTO = this.mapToDTO(e);
        providerDTO.materials = materialsDTOs;

        return providerDTO;
    }


    async remove(id: number): Promise<DeleteResult> {
        const p: Client = await this.repository.findOne({
            where: {id: id},
            relations: ["address"]
        });
        const addressID = p.address.id;
        return this.materialPriceService.removeByProvider(id)
            .then(() => super.remove(id))
            .then(value => this.addressService.remove(p.address.id));
    }

    getPage(pageable: Pageable): Promise<PaginatedPage<ProviderDTO>> {
        const page: PaginatedPage<ProviderDTO> = new PaginatedPage<ProviderDTO>();
        const query: SelectQueryBuilder<Client> = this.repository.createQueryBuilder("client");
        query.select("client");

        if (pageable.hasFilters()) {

            if (pageable.filters.get("name"))
                query.where("client.name like :name", {name: "%" + pageable.filters.get("name") + "%"})

            if (pageable.filters.get("email"))
                query.andWhere("client.email like :email", {email: "%" + pageable.filters.get("email") + "%"})

            if (pageable.filters.get("socialReason"))
                query.andWhere("client.socialReason like :socialReason", {socialReason: "%" + pageable.filters.get("socialReason") + "%"})

            if (pageable.filters.get("cuil"))
                query.andWhere("client.cuil like :cuil", {cuil: "%" + pageable.filters.get("cuil") + "%"})

        }
        query.andWhere("client.onlyProvider = true");
        query.orWhere("client.hasMaterials = true");
        query.skip(pageable.page * pageable.size);
        query.take(pageable.size);
        return query.getMany().then(providers => {
            page.data = providers.map(t => this.mapToDTO(t));
            return query.getCount();
        }).then(count => {
            page.total = count;
            page.page = pageable.page;
            return page;
        });
    }

    mapToDTO(entity: Client): ProviderDTO {
        return this.providerMapper.toDTO(entity);
    }

    mapToEntity(dto: ProviderDTO): Client {
        return this.providerMapper.toEntity(dto);
    }

    findProvidersByCUIL(cuil: string):
        Promise<ProviderDTO[]> {
        return this.repository.find({
            where: {
                cuil: Like("%" + cuil + "%"),
                hasMaterials: false,
                onlyProvider: false
            },
            take: 10,
            skip: 0
        }).then(result => result.map(p => this.mapToDTO(p)));
    }
}
