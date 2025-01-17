import {Controller, UseGuards} from '@nestjs/common';
import {AuthGuard} from "@nestjs/passport";
import {ApiUseTags} from "@nestjs/swagger";
import {GenericController} from "../../core/generic-controller";
import {Truck} from "../../model/truck/truck.entity";
import {TruckDTO} from "../../dto/truck/truck.dto";
import {TruckService} from "../service/truck.service";

@UseGuards(AuthGuard('jwt'))
@Controller('trucks')
@ApiUseTags('trucks')
export class TruckController extends GenericController<Truck, TruckDTO> {

    constructor(service: TruckService) {
        super(service, service);
    }
}

