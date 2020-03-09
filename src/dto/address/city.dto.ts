
import {AbstractDto} from "../../core/domain/abstract.dto";
import {City} from "../../model/address/city.entity";
import {ProvinceDTO} from "./province.dto";


export class CityDTO extends AbstractDto {

    name: string;
    province: ProvinceDTO;

    constructor(o: Partial<City> | CityDTO | Partial<CityDTO>) {
        super();
        Object.assign(this, o);
        if (this.province)
            this.province = new ProvinceDTO(this.province);
    }

    mapToEntity(): City {
        return new City(this);
    }

}
