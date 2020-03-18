import {Injectable} from '@nestjs/common';
import {GenericCrudService} from "../../core/generic-crud-service";
import {PageableService} from "../../core/pageable-service";
import {InjectRepository} from "@nestjs/typeorm";
import {Trip} from "../../model/trip/trip.entity";
import {TripDTO} from "../../dto/trip/trip.dto";
import {TripRepository} from "../repository/trip.repository";
import {Pageable} from "../../core/domain/pageable";
import {PaginatedPage} from "../../core/domain/paginatedPage";
import {UserService} from "../../administration/service/user.service";

@Injectable()
export class TripService extends GenericCrudService<Trip, TripDTO>
    implements PageableService<TripDTO> {

    private readonly tripRepository: TripRepository;
    private readonly userService: UserService;

    constructor(@InjectRepository(Trip) r: TripRepository,
                userService: UserService) {
        super(r);
        this.tripRepository = r;
        this.userService = userService;
    }

    async createTrips(dto: TripDTO, laps: number, username: string): Promise<TripDTO[]> {
        const entity: Trip = this.mapToEntity(dto);
        entity.tripDate = new Date(dto.tripDate);
        entity.createTime = new Date();
        entity.createdBy = await this.userService.findByUsernameAndEnabled(username);
        const entityArray: Trip[] = [];
        for (let i = 0; i < laps; i++) {
            entityArray.push(entity);
        }
        return this.tripRepository.save(entityArray).then(res => res.map(e => this.mapToDTO(e)));
    }

    findLastTrips(): Promise<TripDTO[]> {
        return this.tripRepository.findLastTrips(10).then(res => res.map(t => this.mapToDTO(t)));
    }

    getPage(pageable: Pageable): Promise<PaginatedPage<TripDTO>> {
        return undefined;
    }

    // Todo: implementar mapeo
    mapToDTO(entity: Trip): TripDTO {
        //Ver como usar los mapeos del servicio de proveedor, material, user, etc...
        return new TripDTO({id: entity.id});
    }

    mapToEntity(dto: TripDTO): Trip {
        return dto.mapToEntity();
    }

}
