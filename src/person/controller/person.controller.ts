import {Controller, UseGuards} from '@nestjs/common';
import {GenericController} from "../../core/generic-controller";
import {Person} from "../../model/person.entity";
import {PersonDTO} from "../../dto/person.dto";
import {PersonService} from "../service/person.service";
import {AuthGuard} from "@nestjs/passport";
import {ApiUseTags} from "@nestjs/swagger";

@UseGuards(AuthGuard('jwt'))
@Controller('person')
@ApiUseTags('person')
export class PersonController extends GenericController<Person, PersonDTO> {

    constructor(service: PersonService) {
        super(service, service);
    }
}
