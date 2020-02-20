import {Role} from "../model/role.entity";
import {AbstractDto} from "../core/domain/abstract.dto";

export class RoleDto extends AbstractDto {

    name: string;

    constructor(o: Partial<RoleDto> | Role) {
        super();
        Object.assign(this, o);
    }

    mapToEntity(): Role {
        return new Role(this);
    }
}
