import {AbstractDto} from "../core/domain/abstract.dto";
import {Person} from "../model/person.entity";

export class PersonDTO extends AbstractDto {

    firstName: string;
    lastName: string;
    email: string;
    cuil: string;

    constructor(o: Partial<PersonDTO> | Person | Partial<Person>) {
        super();
        Object.assign(this, o);
    }

    mapToEntity(): Person {
        return new Person(this);
    }

}
