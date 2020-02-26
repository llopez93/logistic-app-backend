import {Injectable} from '@nestjs/common';
import {GenericCrudService} from "../../core/generic-crud-service";
import {PageableService} from "../../core/pageable-service";
import {Truck} from "../../model/truck.entity";
import {TruckDTO} from "../../dto/truck/truck.dto";
import {InjectRepository} from "@nestjs/typeorm";
import {TruckRepository} from "../repository/truck.repository";
import {Pageable} from "../../core/domain/pageable";
import {PaginatedPage} from "../../core/domain/paginatedPage";
import {UserDTO} from "../../dto/user.dto";
import {SelectQueryBuilder} from "typeorm";
import {User} from "../../model/user.entity";

@Injectable()
export class TruckService extends GenericCrudService<Truck, TruckDTO> implements PageableService<TruckDTO> {

    constructor(@InjectRepository(Truck) r: TruckRepository) {
        super(r);
    }

    getPage(pageable: Pageable): Promise<PaginatedPage<TruckDTO>> {
        const page: PaginatedPage<TruckDTO> = new PaginatedPage<TruckDTO>();
        const query: SelectQueryBuilder<Truck> = this.repository.createQueryBuilder("truck");
        query.select("truck");
        query.innerJoinAndSelect("truck.model", "model");
        query.innerJoinAndSelect("model.brand", "brand");

        if (pageable.hasFilters()) {
            /*
            if (pageable.filters.get("firstName"))
                query.where("user.firstName like :firstName", {firstName: "%" + pageable.filters.get("firstName") + "%"})

            if (pageable.filters.get("lastName"))
                query.andWhere("user.lastName like :lastName", {lastName: "%" + pageable.filters.get("lastName") + "%"})

            if (pageable.filters.get("email"))
                query.andWhere("user.email like :email", {email: "%" + pageable.filters.get("email") + "%"})

             */
            console.log("Setear los filtros...");
        }
        query.skip(pageable.page * pageable.size);
        query.take(pageable.size);
        return query.getMany().then(trucks => {
            page.data = trucks.map(t => this.mapToDTO(t));
            return query.getCount();
        }).then(count => {
            page.total = count;
            page.page = pageable.page;
            return page;
        });
    }

    mapToDTO(entity: Truck): TruckDTO {
        return new TruckDTO(entity);
    }

    mapToEntity(dto: TruckDTO): Truck {
        return dto.mapToEntity();
    }

}
