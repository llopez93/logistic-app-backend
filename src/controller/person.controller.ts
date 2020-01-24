import {Body, Controller, Delete, Get, HttpCode, NotFoundException, Param, Post, Put} from '@nestjs/common';
import {Person} from '../model/person.entity';
import {PersonService} from '../service/person.service';
import {DeleteResult} from 'typeorm';
import {ApiNotFoundResponse, ApiOkResponse, ApiOperation, ApiResponse, ApiUseTags} from '@nestjs/swagger';

@Controller('persons')
@ApiUseTags('persons')
export class PersonController {

    constructor(public service: PersonService) {}

    @Get(":id")
    @ApiOperation({title: "Encontrar persona por ID"})
    @ApiNotFoundResponse({description: "Persona no encontrada"})
    @ApiOkResponse({description: "Persona encontrada"})
    async find(@Param('id') id: number): Promise<Person> {
        const person = await this.service.find(id);
        if(person == undefined) {
            throw new NotFoundException();
        }
        return person;
    }

    @Get()
    @ApiOperation({title: "Devuelve el listado de todas las personas"})
    findAll(): Promise<Person[]> {
        return this.service.findAll();
    }

    @Post()
    @HttpCode(201)
    @ApiOperation({title: "Crea una nueva persona",
        description: "Le pasamos un JSON con los datos de la persona, sin el id." +
            " La API nos devuelve el objeto creado con su ID asignado"})
    @ApiOkResponse({description: "Persona creada"})
    create(@Body() person: Person): Promise<Person> {
        return this.service.create(person);
    }

    @Put()
    @ApiOperation({title: "Actualiza los datos de una persona ya creada"})
    @ApiOkResponse({description: "Datos actualizados"})
    update(@Body() person: Person): Promise<Person> {
        return this.service.update(person);
    }

    @Delete(":id")
    @ApiOperation({title: "Eliminar persona por ID"})
    @ApiNotFoundResponse({description: "Persona no encontrada"})
    @ApiOkResponse({description: "Persona encontrada"})
    async remove(@Param('id') id: number): Promise<void> {
        const result: DeleteResult = await this.service.remove(id);
        if(result.affected === 0) {
            throw new NotFoundException();
        }
    }

}
