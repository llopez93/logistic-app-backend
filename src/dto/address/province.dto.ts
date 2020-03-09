import {AbstractDto} from "../../core/domain/abstract.dto";
import {Province} from "../../model/address/province.entity";

export class ProvinceDTO extends AbstractDto {

    name: string;

    constructor(o: Partial<Province> | ProvinceDTO | Partial<ProvinceDTO>) {
        super();
        Object.assign(this, o);
    }

    mapToEntity(): Province {
        return new Province(this);
    }


}
