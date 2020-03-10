import {AbstractDto} from "../core/domain/abstract.dto";
import {Material} from "../model/trip/material.entity";
import {findMaterialUnitByValue} from "../model/trip/material-unit";

export class MaterialDTO extends AbstractDto {

    name: string;
    unit: string;

    constructor(o: Partial<MaterialDTO> | Material) {
        super();
        Object.assign(this, o);
    }

    mapToEntity(): Material {
        const {unit, ...dto} = this;
        const m = new Material(dto);
        m.unit = findMaterialUnitByValue(this.unit);
        return m;
    }
}
