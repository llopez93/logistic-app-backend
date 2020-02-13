import {Controller, UseGuards} from '@nestjs/common';
import {Crud} from "@nestjsx/crud";
import {AuthGuard} from "@nestjs/passport";
import {ApiUseTags} from "@nestjs/swagger";
import {Role} from "../../model/role.entity";
import {RoleService} from "../service/role.service";

@Crud({
    model: {
        type: Role,
    },
})
@UseGuards(AuthGuard('jwt'))
@Controller('roles')
@ApiUseTags('roles')
export class RoleController {
    constructor(public service: RoleService) {
    }
}
