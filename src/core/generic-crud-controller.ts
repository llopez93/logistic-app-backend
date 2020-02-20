import {Body, Delete, Get, HttpCode, NotFoundException, Param, Post, Put} from "@nestjs/common";
import {ApiNotFoundResponse, ApiOkResponse, ApiOperation} from "@nestjs/swagger";
import {DeleteResult} from "typeorm";
import {GenericCrudService} from "./generic-crud-service";
import {AbstractDto} from "./domain/abstract.dto";

export class GenericCrudController<T, DTO extends AbstractDto> {

    constructor(protected readonly service: GenericCrudService<T, DTO>) {
    }

    @Get(":id")
    @ApiOperation({title: "Encontrar por ID"})
    async find(@Param('id') id: number): Promise<DTO> {
        const e = await this.service.findOne(id);
        if (e == undefined) {
            throw new NotFoundException();
        }
        return e;
    }

    @Get()
    @ApiOperation({title: "Listado de entidades"})
    findAll(): Promise<DTO[]> {
        return this.service.findAll();
    }

    @Post()
    @HttpCode(201)
    @ApiOperation({
        title: "Crea una nueva entidad",
        description: "Le pasamos un JSON con los datos de la entidad, sin el id." +
            " La API nos devuelve el objeto creado con su ID asignado"
    })
    @ApiOkResponse({description: "Entidad creada"})
    create(@Body() dto: DTO): Promise<DTO> {
        return this.service.create(dto);
    }

    @Put()
    @ApiOperation({title: "Actualiza los datos de una entidad"})
    @ApiOkResponse({description: "Datos actualizados"})
    update(@Body() dto: DTO): Promise<DTO> {
        return this.service.update(dto);
    }

    @Delete(":id")
    @ApiOperation({title: "Eliminar entidad por ID"})
    @ApiNotFoundResponse({description: "Entidad no encontrada"})
    @ApiOkResponse({description: "Entidad eliminada"})
    async remove(@Param('id') id: number): Promise<void> {
        const result: DeleteResult = await this.service.remove(id);
        if (result.affected === 0) {
            throw new NotFoundException();
        }
    }

}
