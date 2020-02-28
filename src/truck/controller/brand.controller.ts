import {Controller, Get, UseGuards} from '@nestjs/common';
import {AuthGuard} from "@nestjs/passport";
import {ApiOperation, ApiUseTags} from "@nestjs/swagger";
import {BrandService} from "../service/brand.service";
import {Brand} from "../../model/truck/brand.entity";


@UseGuards(AuthGuard('jwt'))
@Controller('brands')
@ApiUseTags('brands')
export class BrandController {


    constructor(private readonly service: BrandService) {}

    @Get()
    @ApiOperation({title: "Listado de marcas"})
    findAll(): Promise<Brand[]> {
        return this.service.findAll();
    }
}
