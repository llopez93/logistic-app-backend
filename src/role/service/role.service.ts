import {Injectable} from '@nestjs/common';
import {TypeOrmCrudService} from "@nestjsx/crud-typeorm";
import {Role} from "../../model/role.entity";
import {InjectRepository} from "@nestjs/typeorm";
import {RoleRepository} from "../repository/role.repository";

@Injectable()
export class RoleService extends TypeOrmCrudService<Role> {

    constructor(@InjectRepository(Role) private readonly repository: RoleRepository) {
        super(repository);
    }

}
