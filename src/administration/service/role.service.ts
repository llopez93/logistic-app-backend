import {Injectable} from '@nestjs/common';
import {InjectRepository} from '@nestjs/typeorm';
import {GenericCrudService} from "../../core/generic-crud-service";
import {RoleDto} from "../../dto/role.dto";
import {Role} from "../../model/role.entity";
import {RoleRepository} from "../repository/role.repository";


@Injectable()
export class RoleService extends GenericCrudService<Role, RoleDto> {

    constructor(@InjectRepository(Role) repository: RoleRepository) {
        super(repository);
    }

    mapToDTO(entity: Role): RoleDto {
        return new RoleDto(entity);
    }

    mapToEntity(dto: RoleDto): Role {
        return new RoleDto(dto).mapToEntity();
    }

}
