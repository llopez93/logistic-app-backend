import {Injectable} from '@nestjs/common';
import {GenericCrudService} from "../../core/generic-crud-service";
import {PageableService} from "../../core/pageable-service";
import {Truck} from "../../model/truck/truck.entity";
import {TruckDTO} from "../../dto/truck/truck.dto";
import {InjectRepository} from "@nestjs/typeorm";
import {TruckRepository} from "../repository/truck.repository";
import {Pageable} from "../../core/domain/pageable";
import {PaginatedPage} from "../../core/domain/paginatedPage";
import {SelectQueryBuilder} from "typeorm";

@Injectable()
export class TruckService extends GenericCrudService<Truck, TruckDTO> implements PageableService<TruckDTO> {

    constructor(@InjectRepository(Truck) r: TruckRepository) {
        super(r);
    }

    async findOne(id: number): Promise<TruckDTO> {
        return this.repository.findOne({id: id}, {relations: ["model", "model.brand"]}).then(truck => this.mapToDTO(truck));
    }

    mapToDTO(entity: Truck): TruckDTO {
        return new TruckDTO(entity);
    }

    mapToEntity(dto: TruckDTO): Truck {
        return new TruckDTO(dto).mapToEntity();
    }

    getPage(pageable: Pageable): Promise<PaginatedPage<TruckDTO>> {
        const page: PaginatedPage<TruckDTO> = new PaginatedPage<TruckDTO>();
        const query: SelectQueryBuilder<Truck> = this.repository.createQueryBuilder("truck");
        query.select("truck");
        query.innerJoinAndSelect("truck.model", "model");
        query.innerJoinAndSelect("model.brand", "brand");

        if (pageable.hasFilters()) {
            if (pageable.filters.get("name"))
                query.where("truck.name like :name", {name: "%" + pageable.filters.get("name") + "%"})

            if (pageable.filters.get("domain"))
                query.andWhere("truck.domain like :domain", {domain: "%" + pageable.filters.get("domain") + "%"})
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
}
