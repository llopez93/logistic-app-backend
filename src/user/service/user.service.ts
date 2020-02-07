import {Injectable} from '@nestjs/common';
import {InjectRepository} from '@nestjs/typeorm';
import {User} from "../../model/user.entity";
import {UserRepository} from "../repository/user.repository";
import * as bcrypt from 'bcrypt';
import {UserDTO} from "../../dto/user.dto";
import {TypeOrmCrudService} from "@nestjsx/crud-typeorm";

const saltRounds = 12;
const basePassword = "changeme";

@Injectable()
export class UserService extends TypeOrmCrudService<User> {

    constructor(@InjectRepository(User) private readonly repository: UserRepository) {
        super(repository);
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

    findByUsername(email: string): Promise<User> {
        return this.repository.findOne({email: email}, {relations: ["role"]});
    }

}
