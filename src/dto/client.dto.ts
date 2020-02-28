import {AbstractDto} from "../core/domain/abstract.dto";
import {Client} from "../model/client.entity";
import {PhoneType} from "../model/phone-type";

export class ClientDTO extends AbstractDto {

    name: string;
    phone: string;
    phoneType: string;
    email: string;

    constructor(o: Partial<ClientDTO> | Client | Partial<Client>) {
        super();
        Object.assign(this, o);
    }

    mapToEntity(): Client {
        const {phoneType, ...dto} = this;
        const c = new Client(dto);
        c.phoneType = PhoneType[this.phoneType];
        return c;
    }

}
