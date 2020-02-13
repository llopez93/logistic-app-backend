import {AbstractDTO} from "./abstract.dto";
import {User} from "../model/user.entity";
import {RoleDto} from "./role.dto";

export class UserDTO extends AbstractDTO {

    firstName: string;
    lastName: string;
    email: string;
    enabled: boolean = true;
    role: RoleDto;

    constructor(o: Partial<UserDTO>) {
        super();
        Object.assign(this, o);
        if (this.role)
            this.role = new RoleDto(this.role);
    }

    mapEntity(o: User) {
        super.mapEntity(o);
        this.firstName = o.firstName;
        this.lastName = o.lastName;
        this.email = o.email;
        this.enabled = o.enabled;
        if (o.role) {
            this.role = new RoleDto(o.role);
        }
    }
}
