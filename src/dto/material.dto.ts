import {AbstractDto} from "../core/domain/abstract.dto";
import {Material} from "../model/trip/material.entity";
import {findMaterialUnitByValue, MaterialUnit} from "../model/trip/material-unit";

export class MaterialDTO extends AbstractDto {

    name: string;
    unit: string;

    constructor(o: Partial<MaterialDTO> | Material) {
        super();
        Object.assign(this, o);
        if (o.unit && o instanceof Material)
            this.unit = MaterialUnit[this.unit];
    }

    mapToEntity(): Material {
        const {unit, ...dto} = this;
        const m = new Material(dto);
        m.unit = findMaterialUnitByValue(this.unit);
        return m;
    }
}
