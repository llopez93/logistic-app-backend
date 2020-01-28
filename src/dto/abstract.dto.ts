import {AbstractEntity} from "../model/abstract.entity";

export abstract class AbstractDTO {
    id: number;

    mapEntity(e: AbstractEntity) {
        this.id = e.id;
    }
}
