import {Body, Controller, Get, Patch, Req, UseGuards} from '@nestjs/common';
import {ApiBearerAuth, ApiOperation, ApiUseTags} from '@nestjs/swagger';
import {UserService} from "../service/user.service";
import {User} from "../../model/user.entity";
import {UserDTO} from "../../dto/user.dto";
import {AuthGuard} from "@nestjs/passport";
import {Request} from 'express';
import {Crud} from "@nestjsx/crud";

@Crud({
    model: {
        type: User
    },
    dto: {
        create: UserDTO,
        update: UserDTO,
        replace: UserDTO
    },
    serialize: {
        get: UserDTO
    },
    query: {
        join: {
            role: {
                eager: true,
                alias: "r"
            }
        }
    }
})
@UseGuards(AuthGuard('jwt'))
@Controller('users')
@ApiUseTags('users')
export class UserController {

    constructor(public service: UserService) {
    }

    /**
     @UseInterceptors(ClassSerializerInterceptor)
     @Get()
     @ApiOperation({title: "Devuelve el listado de todas los usuarios"})
     @ApiBearerAuth()
     findAll(): Promise<User[]> {
        return this.service.findAll();
    }

     @Post()
     @HttpCode(201)
     @ApiOperation({
        title: "Crear un nuevo usuario",
        description: "Le pasamos un JSON con los datos del ususario, sin el id." +
            " La API nos devuelve el objeto creado con su ID asignado"
    })
     @ApiOkResponse({description: "Persona creada"})
     create(@Body() user: UserDTO): Promise<UserDTO> {
        return this.service.create(new User(user));
    }
     */

    @Get('logged')
    @ApiOperation({title: "Devuelve la información del usuario que esta logeado."})
    @ApiBearerAuth()
    userLogged(@Req() request: Request): Promise<UserDTO | any> {
        let sessionInfo: any = request.user;//new UserDTO(request.user));
        return this.service.findByUsername(sessionInfo.email)
            .then(value => {
                let dto = new UserDTO(null);
                dto.mapEntity(value);
                return dto;
            });
    }

    @Patch('')
    @ApiOperation({title: "Update de un usuario"})
    @ApiBearerAuth()
    update(@Body() user: UserDTO): Promise<UserDTO | any> {
        return this.service.update(user);
    }
}
