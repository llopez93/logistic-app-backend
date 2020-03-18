import {GenericMapper} from "../../core/generic-mapper";
import {User} from "../../model/security/user.entity";
import {UserDTO} from "../../dto/user.dto";
import {Injectable} from "@nestjs/common";

@Injectable()
export class UserMapper extends GenericMapper<User, UserDTO> {

    toDTO(entity: User): UserDTO {
        const {password, ...dto} = entity;
        return new UserDTO(dto);
    }

    toEntity(dto: UserDTO): User {
        const {firstLogin, ...data} = dto;
        return new User(data);
    }

}
