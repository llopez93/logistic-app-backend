import {Controller, Get, Param} from '@nestjs/common';
import {ApiOperation} from "@nestjs/swagger";
import {MaterialService} from "../service/material.service";
import {MaterialDTO} from "../../dto/material.dto";
import {MaterialPriceService} from "../service/material-price.service";
import {MaterialPriceDTO} from "../../dto/material-price.dto";
import {MaterialPriceMapper} from "../../mapper/material-price.mapper";

@Controller('material')
export class MaterialController {

    private readonly service: MaterialService;
    private readonly materialPriceService: MaterialPriceService;
    private readonly materialPriceMapper: MaterialPriceMapper;

    constructor(service: MaterialService,
                materialPriceService: MaterialPriceService,
                materialPriceMapper: MaterialPriceMapper) {
        this.service = service;
        this.materialPriceService = materialPriceService;
        this.materialPriceMapper = materialPriceMapper;
    }

    @Get()
    @ApiOperation({title: "Recuperar todos los materiales"})
    async getAll(): Promise<MaterialDTO[]> {
        return this.service.findAll();

    }

    @Get("/prices/by-provider/:id")
    @ApiOperation({title: "Recuperar todos los materiales de un proveedor"})
    async getByProvider(@Param("id") providerId: number): Promise<MaterialPriceDTO[]> {
        return this.materialPriceService.findByProvider(providerId)
            .then(res => res.map(m => this.materialPriceMapper.toDTO(m)));

    }
}
