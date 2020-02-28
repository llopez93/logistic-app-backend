import {EntityRepository} from 'typeorm';
import {Person} from '../../model/person.entity';
import {GenericRepository} from "../../core/generic-repository";

@EntityRepository(Person)
export class PersonRepository extends GenericRepository<Person> {
}
