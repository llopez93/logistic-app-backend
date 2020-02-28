import {EntityRepository, Repository} from 'typeorm';
import {User} from "../model/security/user.entity";
import {Role} from "../model/security/role.entity";

@EntityRepository(Role)
export class RoleRepository extends Repository<Role> {

}
