import {Controller, UseGuards} from '@nestjs/common';
import {GenericController} from "../../core/generic-controller";
import {Client} from "../../model/client.entity";
import {ClientDTO} from "../../dto/client.dto";
import {ClientService} from "../service/client.service";
import {AuthGuard} from "@nestjs/passport";
import {ApiUseTags} from "@nestjs/swagger";

@UseGuards(AuthGuard('jwt'))
@Controller('client')
@ApiUseTags('client')
export class ClientController extends GenericController<Client, ClientDTO> {

    constructor(service: ClientService) {
        super(service, service);
    }
}
