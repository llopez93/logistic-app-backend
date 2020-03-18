import {AbstractDto} from "../core/domain/abstract.dto";
import {Client} from "../model/client.entity";
import {findTypeByValue} from "../model/phone-type";
import {AddressDTO} from "./address/address.dto";

export class ClientDTO extends AbstractDto {

    name: string;
    socialReason: string;
    cuil: string;
    phone: string;
    phoneType: string;
    email: string;
    address: AddressDTO;
    stateAcount: number;

    constructor(o: Partial<ClientDTO> | Client | Partial<Client>) {
        super();
        Object.assign(this, o);
        if (this.address)
            this.address = new AddressDTO(this.address);
    }

    mapToEntity(): Client {
        const {phoneType, ...dto} = this;
        const c = new Client(dto);
        c.phoneType = findTypeByValue(this.phoneType);
        return c;
    }

}
