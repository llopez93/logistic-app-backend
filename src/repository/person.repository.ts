import {EntityRepository, Repository} from 'typeorm';
import {Person} from '../model/person.entity';

@EntityRepository(Person)
export class PersonRepository extends Repository<Person> {

}
