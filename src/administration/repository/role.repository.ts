import {EntityRepository} from 'typeorm';
import {Role} from "../../model/role.entity";
import {GenericRepository} from "../../core/generic-repository";

@EntityRepository(Role)
export class RoleRepository extends GenericRepository<Role> {

}
