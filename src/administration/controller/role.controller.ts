import {Controller, UseGuards} from '@nestjs/common';
import {ApiUseTags} from '@nestjs/swagger';
import {AuthGuard} from "@nestjs/passport";
import {GenericCrudController} from "../../core/generic-crud-controller";
import {Role} from "../../model/role.entity";
import {RoleDto} from "../../dto/role.dto";
import {RoleService} from "../service/role.service";

@UseGuards(AuthGuard('jwt'))
@Controller('roles')
@ApiUseTags('roles')
export class RoleController extends GenericCrudController<Role, RoleDto> {

    constructor(service: RoleService) {
        super(service);
    }
}
