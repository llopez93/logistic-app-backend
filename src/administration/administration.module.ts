import {Module} from '@nestjs/common';
import {UserService} from './service/user.service';
import {TypeOrmModule} from "@nestjs/typeorm";
import {TypeORMConfig} from "../../config/typeorm.config";
import {RoleRepository} from "../repository/role.repository";
import {UserRepository} from "./repository/user.repository";
import {UserController} from "./controller/user.controller";
import {RoleService} from "./service/role.service";
import {RoleController} from "./controller/role.controller";

@Module({
    imports: [
        TypeOrmModule.forRoot(TypeORMConfig),
        TypeOrmModule.forFeature([UserRepository, RoleRepository])
    ],
    providers: [UserService, RoleService],
    exports: [UserService],
    controllers: [UserController, RoleController]
})
export class AdministrationModule {
}
