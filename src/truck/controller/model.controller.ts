import {Controller, Get, Param, UseGuards} from '@nestjs/common';
import {ApiOperation, ApiUseTags} from "@nestjs/swagger";
import {Brand} from "../../model/brand.entity";
import {AuthGuard} from "@nestjs/passport";
import {ModelService} from "../service/model.service";

@UseGuards(AuthGuard('jwt'))
@Controller('model')
@ApiUseTags('model')
export class ModelController {

    constructor(private readonly service: ModelService) {
    }

    @Get()
    @ApiOperation({title: "Listado de modelos"})
    findAll(): Promise<Brand[]> {
        return this.service.findAll();
    }

    @Get("by-brand/:id")
    @ApiOperation({title: "Listado de modelos por marca"})
    findByBrand(@Param("id") id: number): Promise<Brand[]> {
        return this.service.findByBrand(id);
    }
}
