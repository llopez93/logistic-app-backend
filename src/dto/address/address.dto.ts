import {CityDTO} from "./city.dto";
import {Address} from "../../model/address/address.entity";
import {AbstractDto} from "../../core/domain/abstract.dto";
import {ObjectLiteral} from "typeorm";

export class AddressDTO extends AbstractDto {

    street: string;
    number: string;
    city: CityDTO;

    constructor(o: Partial<Address> | AddressDTO | Partial<AddressDTO> | ObjectLiteral[]) {
        super();
        Object.assign(this, o);
        if (this.city)
            this.city = new CityDTO(this.city);
    }

    mapToEntity(): Address {
        return new Address(this);
    }



}
