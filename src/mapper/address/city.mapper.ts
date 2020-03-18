import {GenericMapper} from "../../core/generic-mapper";
import {Injectable} from "@nestjs/common";
import {City} from "../../model/address/city.entity";
import {CityDTO} from "../../dto/address/city.dto";

@Injectable()
export class CityMapper extends GenericMapper<City, CityDTO> {

    //TODO: implementar
    toDTO(entity: City): CityDTO {
        return undefined;
    }

    toEntity(dto: CityDTO): City {
        return undefined;
    }

}
