import {AbstractDto} from "../../core/domain/abstract.dto";
import {Truck} from "../../model/truck/truck.entity";
import {ModelDTO} from "./model.dto";

export class TruckDTO extends AbstractDto {

    name: string;
    domain: string;
    year: number;
    model: ModelDTO;

    constructor(o: Partial<TruckDTO> | Truck | Partial<Truck>) {
        super();
        Object.assign(this, o);
    }

    mapToEntity(): Truck {
        return null;
    }

}
