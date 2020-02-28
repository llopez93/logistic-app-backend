import {AbstractDto} from "../../core/domain/abstract.dto";
import {Brand} from "../../model/truck/brand.entity";

export class BrandDTO extends AbstractDto {

    name: string;

    constructor(o: Partial<BrandDTO> | Brand | Partial<Brand>) {
        super();
        Object.assign(this, o);
    }

    mapToEntity(): Brand {
        return new Brand(this);
    }

}
