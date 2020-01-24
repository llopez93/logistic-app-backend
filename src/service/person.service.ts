import {Injectable} from '@nestjs/common';
import {Person} from '../model/person.entity';
import {InjectRepository} from '@nestjs/typeorm';
import {PersonRepository} from '../repository/person.repository';
import {DeleteResult, UpdateResult} from 'typeorm';

@Injectable()
export class PersonService {

    constructor(@InjectRepository(Person) private readonly repository: PersonRepository) {}

    find(id: number): Promise<Person> {
        return this.repository.findOne(id);
    }

    findAll(): Promise<Person[]> {
        return this.repository.find();
    }

    create(person: Person): Promise<Person> {
        return this.repository.save(person);
    }

    update(person: Person): Promise<Person> {
        return this.repository.save(person);
    }

    remove(id: number): Promise<DeleteResult> {
        return this.repository.delete(id);
    }

}
