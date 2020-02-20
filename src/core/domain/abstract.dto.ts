import {AbstractEntity} from "../../model/abstract.entity";

export abstract class AbstractDto {
    id: number;
    abstract mapToEntity(): AbstractEntity;
}
