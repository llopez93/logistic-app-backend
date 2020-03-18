import {Controller, Get, Param} from '@nestjs/common';
import {ApiOperation} from "@nestjs/swagger";
import {MaterialService} from "../service/material.service";
import {MaterialDTO} from "../../dto/material.dto";

@Controller('material')
export class MaterialController {

    private readonly service: MaterialService;

    constructor(service: MaterialService) {
        this.service = service;
    }

    @Get()
    @ApiOperation({title: "Recuperar todos los materiales"})
    async getAll(): Promise<MaterialDTO[]> {
        return this.service.findAll();

    }

    @Get("by-provider/:id")
    @ApiOperation({title: "Recuperar todos los materiales de un proveedor"})
    async getByProvider(@Param("id") providerId: number): Promise<MaterialDTO[]> {
        return this.service.findByProvider(providerId);

    }
}
