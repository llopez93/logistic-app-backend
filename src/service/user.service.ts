import {Injectable} from '@nestjs/common';
import {InjectRepository} from '@nestjs/typeorm';
import {DeleteResult} from 'typeorm';
import {User} from "../model/user.entity";
import {UserRepository} from "../repository/user.repository";

@Injectable()
export class UserService {

    constructor(@InjectRepository(User) private readonly repository: UserRepository) {
    }

    find(id: number): Promise<User> {
        return this.repository.findOne(id);
    }

    findAll(): Promise<User[]> {
        return this.repository.find({relations: ["role"]});
    }

    create(User: User): Promise<User> {
        return this.repository.save(User);
    }

    update(User: User): Promise<User> {
        return this.repository.save(User);
    }

    remove(id: number): Promise<DeleteResult> {
        return this.repository.delete(id);
    }

}
