import {Body, Controller, Post} from '@nestjs/common';
import {AuthService} from "./auth.service";

@Controller('auth')
export class AuthController {

    constructor(public service: AuthService) {
    }

    @Post()
    async login(@Body('username') email, @Body('password') pass) {
        return this.service.validateUser(email, pass);
    }
}
