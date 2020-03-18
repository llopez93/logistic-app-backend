import {Module} from '@nestjs/common';
import {ProviderService} from './service/provider.service';
import {ProviderController} from './controller/provider.controller';
import {AddressModule} from "../address/address.module";
import {TypeOrmModule} from "@nestjs/typeorm";
import {TypeORMConfig} from "../../config/typeorm.config";
import {ClientRepository} from "../client/repository/client.repository";
import {MaterialController} from './controller/material.controller';
import {MaterialService} from './service/material.service';
import {MaterialRepository} from "./repository/material.repository";
import {AdministrationModule} from "../administration/administration.module";
import {ProviderMapper} from "../mapper/provider.mapper";
import {MaterialMapper} from "../mapper/trip/material.mapper";

@Module({
    imports: [
        AdministrationModule,
        AddressModule,
        TypeOrmModule.forRoot(TypeORMConfig),
        TypeOrmModule.forFeature([ClientRepository, MaterialRepository])],
    providers: [ProviderService, MaterialService, ProviderMapper, MaterialMapper],
    controllers: [ProviderController, MaterialController]
})
export class ProviderModule {
}
