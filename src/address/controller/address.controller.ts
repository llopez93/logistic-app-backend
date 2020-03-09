import {Controller, Get, Param} from '@nestjs/common';
import {ApiOperation} from "@nestjs/swagger";
import {ProvinceService} from "../service/province.service";
import {CityService} from "../service/city.service";
import {ProvinceDTO} from "../../dto/address/province.dto";
import {CityDTO} from "../../dto/address/city.dto";

@Controller('address')
export class AddressController {

    private readonly provinceService: ProvinceService;
    private readonly cityService: CityService;

    constructor(provinceService: ProvinceService, cityService: CityService) {
        this.provinceService = provinceService;
        this.cityService = cityService;
    }

    @Get("province")
    @ApiOperation({title: "Retorna el listado de provincias"})
    findAllProvinces(): Promise<ProvinceDTO[]> {
        return this.provinceService.findAll();
    }

    @Get("cities/by-province/:id")
    @ApiOperation({title: "Retorna el listado de provincias"})
    findCitiesByProvince(@Param('id') id: number): Promise<CityDTO[]> {
        return this.cityService.findByProvince(id);
    }
}
