import {Injectable} from "@nestjs/common";
import {Material} from "../../model/trip/material.entity";
import {MaterialDTO} from "../../dto/material.dto";
import {GenericMapper} from "../../core/generic-mapper";
import {findMaterialUnitByValue} from "../../model/trip/material-unit";

@Injectable()
export class MaterialMapper extends GenericMapper<Material, MaterialDTO> {

    toDTO(entity: Material): MaterialDTO {
        //TODO: Traer lógica de cambio en el valor del enumero a este método.
        return new MaterialDTO(entity);
    }

    toEntity(dto: MaterialDTO): Material {
        const {unit, ...data} = dto;
        const m = new Material(data);
        m.unit = findMaterialUnitByValue(dto.unit);
        return m;
    }


}
