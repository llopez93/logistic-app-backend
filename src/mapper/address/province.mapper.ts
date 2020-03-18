import {GenericMapper} from "../../core/generic-mapper";
import {Injectable} from "@nestjs/common";
import {Province} from "../../model/address/province.entity";
import {ProvinceDTO} from "../../dto/address/province.dto";

@Injectable()
export class CityMapper extends GenericMapper<Province, ProvinceDTO> {

    //TODO: implementar
    toDTO(entity: Province): ProvinceDTO {
        return undefined;
    }

    toEntity(dto: ProvinceDTO): Province {
        return undefined;
    }
}
