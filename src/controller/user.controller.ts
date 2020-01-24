import {ClassSerializerInterceptor, Controller, Get, UseInterceptors} from '@nestjs/common';
import {ApiOperation, ApiUseTags} from '@nestjs/swagger';
import {UserService} from "../service/user.service";
import {User} from "../model/user.entity";

@Controller('users')
@ApiUseTags('users')
export class UserController {

    constructor(public service: UserService) {
    }

    @UseInterceptors(ClassSerializerInterceptor)
    @Get()
    @ApiOperation({title: "Devuelve el listado de todas los usuarios"})
    findAll(): Promise<User[]> {
        return this.service.findAll();
    }

}
