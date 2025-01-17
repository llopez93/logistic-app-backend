import {EntityRepository} from 'typeorm';
import {User} from "../../model/security/user.entity";
import {GenericRepository} from "../../core/generic-repository";

@EntityRepository(User)
export class UserRepository extends GenericRepository<User> {

}
