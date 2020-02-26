import {Body, Controller, Get, Put, Req, UseGuards} from '@nestjs/common';
import {ApiBearerAuth, ApiOperation, ApiUseTags} from '@nestjs/swagger';
import {UserService} from "../service/user.service";
import {User} from "../../model/user.entity";
import {UserDTO} from "../../dto/user.dto";
import {AuthGuard} from "@nestjs/passport";
import {Request} from 'express';
import {GenericController} from "../../core/generic-controller";

@UseGuards(AuthGuard('jwt'))
@Controller('users')
@ApiUseTags('users')
export class UserController extends GenericController<User, UserDTO> {

    private readonly userService: UserService;

    constructor(service: UserService) {
        super(service, service);
        this.userService = service;
    }

    @Get('logged')
    @ApiOperation({title: "Devuelve la información del usuario que esta logeado."})
    @ApiBearerAuth()
    userLogged(@Req() request: Request): Promise<UserDTO> {
        let sessionInfo: any = request.user;
        return this.userService.findByUsernameFullJoined(sessionInfo.email);
    }

    @Put('reset')
    @ApiOperation({title: "Restaura la contraseña de un usuario."})
    @ApiBearerAuth()
    resetPassword(@Body() u: UserDTO): Promise<any> {
        return this.userService.resetPassword(u);
    }


}
