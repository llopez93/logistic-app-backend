import {Module} from '@nestjs/common';
import {RoleService} from './service/role.service';
import {RoleController} from './controller/role.controller';
import {TypeOrmModule} from "@nestjs/typeorm";
import {TypeORMConfig} from "../../config/typeorm.config";
import {RoleRepository} from "../repository/role.repository";

@Module({
    imports: [
        TypeOrmModule.forRoot(TypeORMConfig),
        TypeOrmModule.forFeature([RoleRepository])
    ],
    providers: [RoleService],
    controllers: [RoleController]
})
export class RoleModule {
}
