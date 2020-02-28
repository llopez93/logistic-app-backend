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

@Injectable()
export class ClientService extends GenericCrudService<Client, ClientDTO> implements PageableService<ClientDTO> {

    constructor(@InjectRepository(Client) r: ClientRepository) {
        super(r);
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

        }
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

    mapToDTO(entity: Client): ClientDTO {

        const dto = new ClientDTO(entity);
        dto.phoneType = PhoneType[entity.phoneType];
        return dto;
    }

    mapToEntity(dto: ClientDTO): Client {
        return dto.mapToEntity();
    }


}
