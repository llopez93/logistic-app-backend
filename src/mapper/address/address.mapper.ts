import {GenericMapper} from "../../core/generic-mapper";
import {Injectable} from "@nestjs/common";
import {Address} from "../../model/address/address.entity";
import {AddressDTO} from "../../dto/address/address.dto";

@Injectable()
export class AddressMapper extends GenericMapper<Address, AddressDTO> {

    toDTO(entity: Address): AddressDTO {
        return new AddressDTO(entity);;
    }

    toEntity(dto: AddressDTO): Address {
        return new Address(dto);
    }
}
