import {User} from "../model/security/user.entity";
import {RoleDto} from "./role.dto";
import {AbstractDto} from "../core/domain/abstract.dto";

export class UserDTO extends AbstractDto {

    firstName: string;
    lastName: string;
    email: string;
    enabled: boolean = true;
    firstLogin: boolean = false;
    role: RoleDto;

    constructor(o: Partial<UserDTO> | User | Partial<User>) {
        super();
        Object.assign(this, o);
        if (this.role)
            this.role = new RoleDto(this.role);
    }

    mapToEntity(): User {
        const {firstLogin, ...e} = this;
        return new User(e);
    }

}
