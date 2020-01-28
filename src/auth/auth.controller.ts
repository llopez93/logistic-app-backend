import {Body, Controller, Post, UseGuards} from '@nestjs/common';
import {AuthGuard} from "@nestjs/passport";

@Controller('auth')
export class AuthController {

    //@UseGuards(AuthGuard('local'))
    @Post()
    async login(@Body('username') user, @Body('password') pass) {
        return user + "  " + pass;
    }
}
