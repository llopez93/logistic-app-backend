import {Injectable} from '@nestjs/common';
import {GenericCrudService} from "../../core/generic-crud-service";
import {PageableService} from "../../core/pageable-service";
import {InjectRepository} from "@nestjs/typeorm";
import {Client} from "../../model/client.entity";
import {ClientDTO} from "../../dto/client.dto";
import {ClientRepository} from "../repository/client.repository";
import {PaginatedPage} from "../../core/domain/paginatedPage";
import {Pageable} from "../../core/domain/pageable";
import {SelectQueryBuilder} from "typeorm";
import {PhoneType} from "../../model/phone-type";
import {AddressService} from "../../address/service/address.service";

@Injectable()
export class ClientService extends GenericCrudService<Client, ClientDTO> implements PageableService<ClientDTO> {

    private readonly addressService: AddressService;

    constructor(@InjectRepository(Client) private readonly  r: ClientRepository,
                addressService: AddressService
    ) {
        super(r);
        this.addressService = addressService;
    }


    async create(entity: ClientDTO): Promise<ClientDTO> {
        entity.address = await this.addressService.create(entity.address);
        return super.create(entity);
    }


    async update(entity: ClientDTO): Promise<ClientDTO> {
        // TODO: Probar con la propiedad cascade
        await this.addressService.update(entity.address);
        return super.update(entity);
    }

    async findOne(id: number): Promise<ClientDTO> {
        const query: SelectQueryBuilder<Client> = this.repository.createQueryBuilder("client");
        query.select(["client", "address", "city", "province"]);
        query.innerJoin("client.address", "address");
        query.innerJoin("address.city", "city");
        query.innerJoin("city.province", "province");
        query.where("client.id =  :id", {id: id});
        return query.getOne().then(client => {
            return this.mapToDTO(client)
        });
    }

    getPage(pageable: Pageable): Promise<PaginatedPage<ClientDTO>> {
        const page: PaginatedPage<ClientDTO> = new PaginatedPage<ClientDTO>();
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
        query.andWhere("client.onlyProvider = false");
        query.skip(pageable.page * pageable.size);
        query.take(pageable.size);
        return query.getMany().then(clients => {
            page.data = clients.map(t => this.mapToDTO(t));
            return query.getCount();
        }).then(count => {
            page.total = count;
            page.page = pageable.page;
            return page;
        });
    }


    async findAll(): Promise<ClientDTO[]> {
        return this.repository.find( {
            where : {
                onlyProvider : false
            }
        }).then( result => result.map( c => this.mapToDTO(c)));
    }

    mapToDTO(entity: Client): ClientDTO {
        const {hasMaterials, onlyProvider, ...data} = entity;
        const dto = new ClientDTO(data);
        dto.phoneType = PhoneType[entity.phoneType];
        return dto;
    }

    mapToEntity(dto: ClientDTO): Client {
        return new ClientDTO(dto).mapToEntity();
    }


}
