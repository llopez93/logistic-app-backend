import {Injectable} from '@nestjs/common';
import {InjectRepository} from '@nestjs/typeorm';
import {DeleteResult} from 'typeorm';
import {User} from "../model/user.entity";
import {UserRepository} from "../user/repository/user.repository";
import * as bcrypt from 'bcrypt';
import {UserDTO} from "../dto/user.dto";

const saltRounds = 12;
const basePassword = "changeme";

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

    async create(user: User): Promise<UserDTO> {
        //TODO: Atrapar la excepción cuando un usuario ya existe.
        user.password = await bcrypt.hash(basePassword, saltRounds);
        return this.repository.save(user)
            .then(value => {
                let u = new UserDTO(null);
                u.mapEntity(value);
                return u;
            });
    }

    update(user: User): Promise<User> {
        return this.repository.save(user);
    }

    remove(id: number): Promise<DeleteResult> {
        return this.repository.delete(id);
    }

    async findByUsername(email: string): Promise<User> {
        return this.repository.findOne({email: email});
    }

}
