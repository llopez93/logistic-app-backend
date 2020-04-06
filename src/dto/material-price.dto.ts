import {AbstractDto} from "../core/domain/abstract.dto";
import {Material} from "../model/trip/material.entity";
import {ProviderDTO} from "./provider.dto";
import {MaterialDTO} from "./material.dto";
import {MaterialPrice} from "../model/material-price.entity";

export class MaterialPriceDTO extends AbstractDto {

    price: number;
    //provider: ProviderDTO;
    material: MaterialDTO;

    constructor(o: Partial<MaterialPriceDTO> | MaterialPrice) {
        super();
        Object.assign(this, o);
        /*
        if (o.unit && o instanceof Material)
            this.unit = MaterialUnit[this.unit];
         */
    }

    mapToEntity(): MaterialPrice {
        return null;
    }
}
