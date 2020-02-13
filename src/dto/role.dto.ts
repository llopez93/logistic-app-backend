import {AbstractDTO} from "./abstract.dto";
import {Role} from "../model/role.entity";

export class RoleDto extends AbstractDTO {

    name: string;

    constructor(o: Partial<RoleDto> | Role) {
        super();
        Object.assign(this, o);
    }

    mapEntity(e: Role) {
        super.mapEntity(e);
        this.name = e.name;
    }
}
