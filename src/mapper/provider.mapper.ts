import {Injectable} from "@nestjs/common";
import {Client} from "../model/client.entity";
import {GenericMapper} from "../core/generic-mapper";
import {findTypeByValue, PhoneType} from "../model/phone-type";
import {ProviderDTO} from "../dto/provider.dto";
import {MaterialPriceMapper} from "./material-price.mapper";

@Injectable()
export class ProviderMapper extends GenericMapper<Client, ProviderDTO> {

    private readonly materialPriceMapper: MaterialPriceMapper;

    constructor(mapper: MaterialPriceMapper) {
        super();
        this.materialPriceMapper = mapper;
    }

    toDTO(entity: Client): ProviderDTO {
        const {hasMaterials, onlyProvider, phoneType, stateAcount, ...dtoData} = entity;
        const dto = new ProviderDTO(dtoData);
        dto.phoneType = PhoneType[entity.phoneType];
        return dto;
    }

    toEntity(dto: ProviderDTO): Client {
        const {phoneType, materials, ...data} = dto;
        const c = new Client(data);
        c.phoneType = findTypeByValue(dto.phoneType);
        /*
        c.materials = dto.materials.map(m => this.materialPriceMapper.toEntity(m));
        c.hasMaterials = c.materials.length > 0;
         */
        return c;
    }


}
