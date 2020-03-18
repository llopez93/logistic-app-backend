import {GenericMapper} from "../../core/generic-mapper";
import {Injectable} from "@nestjs/common";
import {Role} from "../../model/security/role.entity";
import {RoleDto} from "../../dto/role.dto";

@Injectable()
export class RoleMapper extends GenericMapper<Role, RoleDto> {
    toDTO(entity: Role): RoleDto {
        return new RoleDto(entity);
    }

    toEntity(dto: RoleDto): Role {
        return new Role(dto);
    }
}
