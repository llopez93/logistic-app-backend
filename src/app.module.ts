import {Module} from '@nestjs/common';
import {TypeORMConfig} from '../config/typeorm.config';
import {TypeOrmModule} from '@nestjs/typeorm';
import {PersonRepository} from './repository/person.repository';
import {PersonService} from './service/person.service';
import {PersonController} from './controller/person.controller';
import {UserController} from "./controller/user.controller";
import {UserService} from "./service/user.service";
import {UserRepository} from "./repository/user.repository";
import {RoleRepository} from "./repository/role.repository";

@Module({
  imports: [
      TypeOrmModule.forRoot(TypeORMConfig),
      TypeOrmModule.forFeature([PersonRepository, UserRepository, RoleRepository])
  ],
  controllers: [PersonController, UserController],
  providers: [PersonService, UserService],
})
export class AppModule {}
