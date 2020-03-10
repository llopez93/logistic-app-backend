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
import {Like, SelectQueryBuilder} from "typeorm";
import {ClientRepository} from "../../client/repository/client.repository";
import {MaterialUnit} from "../../model/trip/material-unit";

@Injectable()
export class ProviderService extends GenericCrudService<Client, ProviderDTO> implements PageableService<ProviderDTO> {

    private readonly addressService: AddressService;

    constructor(@InjectRepository(Client) private readonly  r: ClientRepository,
                addressService: AddressService
    ) {
        super(r);
        this.addressService = addressService;
    }


    async findOne(id: number): Promise<ProviderDTO> {
        return this.repository.findOne({
            where: {id: id},
            relations: ["address", "materials", "address.city", "address.city.province"]
        }).then(p => this.mapToDTO(p));
    }

    async create(entity: ProviderDTO): Promise<ProviderDTO> {
        const provider = this.mapToEntity(entity);
        provider.onlyProvider = true;
        return this.repository.save(provider).then(p => this.mapToDTO(p));
    }

    async update(entity: ProviderDTO): Promise<ProviderDTO> {
        return super.update(entity);
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
        query.andWhere("client.hasMaterials = true");
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
        const {hasMaterials, onlyProvider, phoneType, materials, ...dtoData} = entity;
        dtoData["materials"] = entity.materials.map(m => new Object({id: m.id, unit: MaterialUnit[m.unit], name: m.name}));
        const dto = new ProviderDTO(dtoData);
        dto.phoneType = PhoneType[entity.phoneType];
        return dto;
    }

    mapToEntity(dto: ProviderDTO): Client {
        return dto.mapToEntity();
    }

    findProvidersByCUIL(cuil: string): Promise<ProviderDTO[]> {
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
