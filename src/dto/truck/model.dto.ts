import {AbstractDto} from "../../core/domain/abstract.dto";
import {Brand} from "../../model/truck/brand.entity";
import {Model} from "../../model/truck/model.entity";
import {BrandDTO} from "./brand.dto";

export class ModelDTO extends AbstractDto {

    name: string;
    brand: BrandDTO;

    constructor(o: Partial<ModelDTO> | Model | Partial<Model>) {
        super();
        Object.assign(this, o);
        if (this.brand)
            this.brand = new BrandDTO(this.brand);
    }

    mapToEntity(): Brand {
        return new Brand(this);
    }

}
