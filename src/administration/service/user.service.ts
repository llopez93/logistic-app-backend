import {Injectable} from '@nestjs/common';
import {InjectRepository} from '@nestjs/typeorm';
import {User} from "../../model/user.entity";
import {UserRepository} from "../repository/user.repository";
import * as bcrypt from 'bcrypt';
import {UserDTO} from "../../dto/user.dto";
import {CrudRequest} from "@nestjsx/crud";
import {DeepPartial} from "typeorm";
import {GenericCrudService} from "../../core/generic-crud-service";

const saltRounds = 12;
const basePassword = "changeme";

@Injectable()
export class UserService extends GenericCrudService<User, UserDTO> {

    constructor(@InjectRepository(User) r: UserRepository) {
        super(r);
    }

    async create(entity: UserDTO): Promise<UserDTO> {
        const user = this.mapToEntity(entity);
        user.password = await bcrypt.hash(basePassword, saltRounds);
        return this.repository.save(user)
            .then(value =>
                this.mapToDTO(value)
            );
    }

    /*
        async create(entity:UserDTO: User): Promise<UserDTO> {
            //TODO: Atrapar la excepción cuando un usuario ya existe.
            user.password = await bcrypt.hash(basePassword, saltRounds);
            return this.repository.save(user)
                .then(value => {
                    let u = new UserDTO(null);
                    //u.mapEntity(value);
                    return u;
                });
        }

     */

    public findByUsername(email: string): Promise<User> {
        return this.repository.findOne({email: email}, {relations: ["role"]});
    }


    async createOne(req: CrudRequest, dto: DeepPartial<User>): Promise<User> {
        dto.password = await bcrypt.hash(basePassword, saltRounds);
        return null;//super.createOne(req, dto);
    }

    /**
     async update(user: UserDTO) {
        const u = await this.repository.findOne(user.id, {relations: ["role"]});
        Object.assign(u, user);
        return this.repository.update({id: u.id}, u);
    }
     */

    mapToDTO(entity: User): UserDTO {
        const {password, ...dto} = entity;
        return new UserDTO(dto);
    }

    mapToEntity(dto: UserDTO): User {
        return new UserDTO(dto).mapToEntity();
    }


}
