import {Module} from '@nestjs/common';
import {ClientService} from './service/client.service';
import {ClientController} from './controller/client.controller';
import {TypeOrmModule} from "@nestjs/typeorm";
import {TypeORMConfig} from "../../config/typeorm.config";
import {ClientRepository} from "./repository/client.repository";
import {AddressModule} from "../address/address.module";

@Module({
    imports: [
        AddressModule,
        TypeOrmModule.forRoot(TypeORMConfig),
        TypeOrmModule.forFeature([ClientRepository])],
    providers: [ClientService],
    controllers: [ClientController]
})
export class ClientModule {
}
