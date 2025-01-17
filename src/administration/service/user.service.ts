import {HttpException, HttpStatus, Injectable} from '@nestjs/common';
import {InjectRepository} from '@nestjs/typeorm';
import {User} from "../../model/security/user.entity";
import {UserRepository} from "../repository/user.repository";
import * as bcrypt from 'bcrypt';
import {UserDTO} from "../../dto/user.dto";
import {SelectQueryBuilder, UpdateResult} from "typeorm";
import {GenericCrudService} from "../../core/generic-crud-service";
import {PageableService} from "../../core/pageable-service";
import {Pageable} from "../../core/domain/pageable";
import {PaginatedPage} from "../../core/domain/paginatedPage";

const saltRounds = 12;
const basePassword = "changeme";

@Injectable()
export class UserService extends GenericCrudService<User, UserDTO> implements PageableService<UserDTO> {

    constructor(@InjectRepository(User) r: UserRepository) {
        super(r);
    }

    async findOne(id: number): Promise<UserDTO> {
        return this.repository.findOne({id: id}, {relations: ["role"]}).then(user => this.mapToDTO(user));
    }

    async create(entity: UserDTO): Promise<UserDTO> {
        let user: User;
        user = this.mapToEntity(entity);
        user.password = await bcrypt.hash(basePassword, saltRounds);

        return this.repository.save(user)
            .then(value =>
                this.mapToDTO(value)
            )
            .catch(e => {
                throw new HttpException("El correo electrónico asignado " +
                    "ya pertenece a un usuario del sistema", HttpStatus.CONFLICT);
            });


    }

    async findByUsernameFullJoined(email: string): Promise<UserDTO> {
        return this.repository.findOne({email: email}, {relations: ["role"]})
            .then(async user => {
                const dto = this.mapToDTO(user);
                dto.firstLogin = await bcrypt.compare(basePassword, user.password)
                return dto;
            });
    }

    public findByUsernameAndEnabled(email: string): Promise<User> {
        return this.repository.findOne({email: email, enabled: true});
    }

    mapToDTO(entity: User): UserDTO {
        const {password, ...dto} = entity;
        return new UserDTO(dto);
    }

    mapToEntity(dto: UserDTO): User {
        return new UserDTO(dto).mapToEntity();
    }

    async resetPassword(dto: UserDTO): Promise<UpdateResult> {
        const user = this.mapToEntity(dto);
        user.password = await bcrypt.hash(basePassword, saltRounds);
        return this.repository.update(user.id, user);
    }

    getPage(pageable: Pageable): Promise<PaginatedPage<UserDTO>> {
        const page: PaginatedPage<UserDTO> = new PaginatedPage<UserDTO>();
        const query: SelectQueryBuilder<User> = this.repository.createQueryBuilder("user");
        query.select("user");

        if (pageable.hasFilters()) {
            if (pageable.filters.get("firstName"))
                query.where("user.firstName like :firstName", {firstName: "%" + pageable.filters.get("firstName") + "%"})

            if (pageable.filters.get("lastName"))
                query.andWhere("user.lastName like :lastName", {lastName: "%" + pageable.filters.get("lastName") + "%"})

            if (pageable.filters.get("email"))
                query.andWhere("user.email like :email", {email: "%" + pageable.filters.get("email") + "%"})
        }
        query.skip(pageable.page * pageable.size);
        query.take(pageable.size);
        return query.getMany().then(users => {
            page.data = users.map(u => this.mapToDTO(u));
            return query.getCount();
        }).then(count => {
            page.total = count;
            page.page = pageable.page;
            return page;
        });
    }

    async changePassword(actualPassword, newPassword, email: string): Promise<UpdateResult> {
        newPassword.trim();
        if (newPassword && newPassword != '' && newPassword.length >= 6) {
            const user = await this.repository.findOne({email: email, enabled: true});
            const defaultPass = await bcrypt.compare(basePassword, user.password);
            if (defaultPass || await bcrypt.compare(actualPassword, user.password)) {
                user.password = await bcrypt.hash(newPassword, saltRounds);
                return this.repository.update(user.id, user);
            }
        }
        throw new HttpException("Las contraseñas no coinciden", HttpStatus.CONFLICT);
    }

}
