import {Injectable} from "@nestjs/common";
import {GenericMapper} from "../../core/generic-mapper";
import {Truck} from "../../model/truck/truck.entity";
import {TruckDTO} from "../../dto/truck/truck.dto";
import {ModelMapper} from "./model.mapper";

@Injectable()
export class TruckMapper extends GenericMapper<Truck, TruckDTO> {

    private readonly modelMapper: ModelMapper;

    constructor(modelMapper: ModelMapper) {
        super();
        this.modelMapper = modelMapper;
    }

    toDTO(entity: Truck): TruckDTO {
        const dto = new TruckDTO(entity);
        if (entity.model)
            dto.model = this.modelMapper.toDTO(entity.model);
        return dto;
    }

    toEntity(dto: TruckDTO): Truck {
        const entity: Truck = new Truck(dto);
        if (dto.model)
            entity.model = this.modelMapper.toEntity(dto.model);
        return entity;
    }
}
