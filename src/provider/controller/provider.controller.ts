import {Controller, Get, Param} from '@nestjs/common';
import {GenericController} from "../../core/generic-controller";
import {Client} from "../../model/client.entity";
import {ProviderDTO} from "../../dto/provider.dto";
import {ProviderService} from "../service/provider.service";
import {ApiOperation} from "@nestjs/swagger";

@Controller('provider')
export class ProviderController extends GenericController<Client, ProviderDTO> {

    private readonly providerService: ProviderService;

    constructor(service: ProviderService) {
        super(service, service);
        this.providerService = service;
    }

    @Get("/by-cuil/:cuil")
    @ApiOperation({title: "Recuperar proveedores por un número de cuil/cuit"})
    async getByCuil(@Param('cuil') cuil: string): Promise<ProviderDTO[]> {
        return this.providerService.findProvidersByCUIL(cuil);
    }
}
