import {EntityRepository, Repository} from 'typeorm';
import {Role} from "../../model/role.entity";

@EntityRepository(Role)
export class RoleRepository extends Repository<Role> {

}
