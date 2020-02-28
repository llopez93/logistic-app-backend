import {Injectable} from '@nestjs/common';
import {GenericCrudService} from "../../core/generic-crud-service";
import {PageableService} from "../../core/pageable-service";
import {InjectRepository} from "@nestjs/typeorm";
import {Person} from "../../model/person.entity";
import {PersonRepository} from "../repository/person.repository";
import {PersonDTO} from "../../dto/person.dto";
import {Pageable} from "../../core/domain/pageable";
import {PaginatedPage} from "../../core/domain/paginatedPage";

@Injectable()
export class PersonService extends GenericCrudService<Person, PersonDTO> implements PageableService<PersonDTO> {

    constructor(@InjectRepository(Person) r: PersonRepository) {
        super(r);
    }

    getPage(pageable: Pageable): Promise<PaginatedPage<PersonDTO>> {
        //TODO: Implementar metodo de paginado
        return undefined;
    }

    mapToEntity(dto: PersonDTO): Person {
        return dto.mapToEntity();
    }

    mapToDTO(entity: Person): PersonDTO {
        return new PersonDTO(entity);
    }
}
