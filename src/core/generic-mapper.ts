import {AbstractDto} from "./domain/abstract.dto";
import {AbstractEntity} from "../model/commons/abstract.entity";

export abstract class GenericMapper<T extends AbstractEntity, DTO extends AbstractDto> {

    abstract toDTO(entity: T): DTO;

    abstract toEntity(dto: DTO): T;
}
