import {Injectable} from "@nestjs/common";
import {Client} from "../model/client.entity";
import {ClientDTO} from "../dto/client.dto";
import {GenericMapper} from "../core/generic-mapper";
import {findTypeByValue, PhoneType} from "../model/phone-type";

@Injectable()
export class ClientMapper extends GenericMapper<Client, ClientDTO> {

    toDTO(entity: Client): ClientDTO {
        const {hasMaterials, onlyProvider, ...data} = entity;
        const dto = new ClientDTO(data);
        dto.phoneType = PhoneType[entity.phoneType];
        return dto;
    }

    toEntity(dto: ClientDTO): Client {
        const {phoneType, ...data} = dto;
        const c = new Client(data);
        c.phoneType = findTypeByValue(dto.phoneType);
        return c;
    }


}
