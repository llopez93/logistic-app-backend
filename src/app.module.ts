import {Module} from '@nestjs/common';
import {TypeORMConfig} from '../config/typeorm.config';
import {TypeOrmModule} from '@nestjs/typeorm';
import {PersonRepository} from './repository/person.repository';
import {PersonService} from './service/person.service';
import {PersonController} from './controller/person.controller';
import {AuthModule} from './auth/auth.module';
import {UserModule} from './user/user.module';

@Module({
    imports: [
        TypeOrmModule.forRoot(TypeORMConfig),
        TypeOrmModule.forFeature([PersonRepository]),
        AuthModule,
        UserModule
    ],
    controllers: [PersonController],
    providers: [PersonService],
})
export class AppModule {
}
