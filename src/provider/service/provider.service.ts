import {Injectable} from '@nestjs/common';
import {GenericCrudService} from "../../core/generic-crud-service";
import {Client} from "../../model/client.entity";
import {PageableService} from "../../core/pageable-service";
import {AddressService} from "../../address/service/address.service";
import {InjectRepository} from "@nestjs/typeorm";
import {ProviderDTO} from "../../dto/provider.dto";
import {PaginatedPage} from "../../core/domain/paginatedPage";
import {Pageable} from "../../core/domain/pageable";
import {PhoneType} from "../../model/phone-type";
import {DeleteResult, Like, SelectQueryBuilder} from "typeorm";
import {ClientRepository} from "../../client/repository/client.repository";
import {MaterialService} from "./material.service";
import {ProviderMapper} from "../../mapper/provider.mapper";

@Injectable()
export class ProviderService extends GenericCrudService<Client, ProviderDTO> implements PageableService<ProviderDTO> {

    private readonly addressService: AddressService;
    private readonly materialService: MaterialService;
    private readonly providerMapper: ProviderMapper;

    constructor(@InjectRepository(Client) private readonly  r: ClientRepository,
                materialService: MaterialService,
                addressService: AddressService,
                providerMapper: ProviderMapper

    ) {
        super(r);
        this.addressService = addressService;
        this.materialService = materialService;
        this.providerMapper = providerMapper;
    }


    async findOne(id: number): Promise<ProviderDTO> {
        return this.repository.findOne({
            where: {id: id},
            relations: ["address", "materials", "address.city", "address.city.province"]
        }).then(p => this.mapToDTO(p));
    }

    async create(entity: ProviderDTO): Promise<ProviderDTO> {
        const provider = this.mapToEntity(entity);
        let newMaterials = provider.materials.filter(m => m.id === null);
        provider.materials = provider.materials.filter(m => m.id !== null);
        newMaterials = await this.materialService.create(newMaterials);
        newMaterials.forEach(newMaterial => provider.materials.push(newMaterial));
        provider.onlyProvider = true;
        provider.address = await this.addressService.create(entity.address).then(a => a.mapToEntity());
        return this.repository.save(provider).then(p => this.mapToDTO(p));
    }

    async update(entity: ProviderDTO): Promise<ProviderDTO> {
        //TODO: Revisar porque siempre lo almacena como onlyProvider
        //TODO: Recuperar el estado de cuenta previamente
        const e: Client = this.mapToEntity(entity);
        e.onlyProvider = await (this.repository as ClientRepository).isOnlyProvider(entity.id);
        return this.repository.save(e).then(p => this.mapToDTO(p));
    }


    async remove(id: number): Promise<DeleteResult> {
        const p: Client = await this.repository.findOne({
            where: {id: id},
            relations: ["address", "materials"]
        });
        p.materials = [];
        const addressID = p.address.id;
        return this.repository.save(p)
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
