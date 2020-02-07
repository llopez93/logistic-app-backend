import {Injectable, UnauthorizedException} from '@nestjs/common';
import {UserService} from "../user/service/user.service";
import * as bcrypt from 'bcrypt';
import {JwtService} from "@nestjs/jwt";
import {jwtConstants} from "./constants";

@Injectable()
export class AuthService {

    constructor(
        private readonly usersService: UserService,
        private readonly jwtService: JwtService) {
    }

    async validateUser(username: string, pass: string): Promise<any> {
        const user = await this.usersService.findByUsername(username);
        if (user && await bcrypt.compare(pass, user.password)) {
            let payload = {name: user.firstName + " " + user.lastName, email: user.email};
            return {token: jwtConstants.tokenBearer + this.jwtService.sign(payload)};
        }

        throw new UnauthorizedException("Usuario o contraseña inválidos.");
    }
}
