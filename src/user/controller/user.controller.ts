import {
    Body,
    ClassSerializerInterceptor,
    Controller,
    Get,
    HttpCode,
    Post,
    UseGuards,
    UseInterceptors
} from '@nestjs/common';
import {ApiOkResponse, ApiOperation, ApiUseTags} from '@nestjs/swagger';
import {UserService} from "../../service/user.service";
import {User} from "../../model/user.entity";
import {UserDTO} from "../../dto/user.dto";
import {AuthGuard} from "@nestjs/passport";

@UseGuards(AuthGuard('jwt'))
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

}
