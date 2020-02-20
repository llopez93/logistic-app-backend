import {Controller, UseGuards} from '@nestjs/common';
import {ApiUseTags} from '@nestjs/swagger';
import {AuthGuard} from "@nestjs/passport";
import {Role} from "../../model/role.entity";
import {RoleDto} from "../../dto/role.dto";
import {RoleService} from "../service/role.service";
import {GenericController} from "../../core/generic-controller";

@UseGuards(AuthGuard('jwt'))
@Controller('roles')
@ApiUseTags('roles')
export class RoleController extends GenericController<Role, RoleDto> {

    constructor(service: RoleService) {
        super(service, service);
    }

}
