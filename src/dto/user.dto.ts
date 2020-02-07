import {AbstractDTO} from "./abstract.dto";
import {User} from "../model/user.entity";
import {Role} from "../model/role.entity";

export class UserDTO extends AbstractDTO {

    firstName: string;
    lastName: string;
    email: string;
    enabled: boolean = true;
    role: Role;

    constructor(o: Partial<UserDTO>) {
        super();
        Object.assign(this, o);
    }

    mapEntity(o: User) {
        super.mapEntity(o);
        this.firstName = o.firstName;
        this.lastName = o.lastName;
        this.email = o.email;
        this.enabled = o.enabled;
        this.role = o.role;
    }
}
