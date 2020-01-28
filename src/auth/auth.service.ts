import {Injectable} from '@nestjs/common';
import {UserService} from "../service/user.service";
import * as bcrypt from 'bcrypt';

@Injectable()
export class AuthService {

    constructor(private readonly usersService: UserService) {
    }

    async validateUser(username: string, pass: string): Promise<any> {
        const user = await this.usersService.findByUsername(username);
        console.log(user);
        if (user && bcrypt.compare(pass, user.password)) {
            const {password, ...result} = user;
            return result;
        }
        return null;
    }
}
