import {EntityRepository, Repository} from 'typeorm';
import {User} from "../model/user.entity";
import {Role} from "../model/role.entity";

@EntityRepository(Role)
export class RoleRepository extends Repository<Role> {

}
