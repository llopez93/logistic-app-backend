import {AbstractEntity} from "../../model/commons/abstract.entity";

export abstract class AbstractDto {
    id: number;
    abstract mapToEntity(): AbstractEntity;
}
