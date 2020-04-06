import {AbstractDto} from "../core/domain/abstract.dto";
import {Client} from "../model/client.entity";
import {findTypeByValue} from "../model/phone-type";
import {AddressDTO} from "./address/address.dto";
import {MaterialDTO} from "./material.dto";
import {MaterialPriceDTO} from "./material-price.dto";

export class ProviderDTO extends AbstractDto {

    name: string;
    socialReason: string;
    cuil: string;
    phone: string;
    phoneType: string;
    email: string;
    address: AddressDTO;
    materials: MaterialPriceDTO[] = [];


    constructor(o: Partial<ProviderDTO> | Client | Partial<Client>) {
        super();
        Object.assign(this, o);
        if (this.address)
            this.address = new AddressDTO(this.address);
        if (this.materials)
            this.materials = this.materials.map(m => new MaterialPriceDTO(m));
    }

    mapToEntity(): Client {
        const {phoneType, materials, ...dto} = this;
        const c = new Client(dto);
        c.phoneType = findTypeByValue(this.phoneType);
        c.hasMaterials = this.materials.length > 0;
        return c;
    }

}
