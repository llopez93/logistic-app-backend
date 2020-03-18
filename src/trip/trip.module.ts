import {Module} from '@nestjs/common';
import {TripService} from './service/trip.service';
import {TripController} from './controller/trip.controller';
import {TypeOrmModule} from "@nestjs/typeorm";
import {TypeORMConfig} from "../../config/typeorm.config";
import {TripRepository} from "./repository/trip.repository";
import {AdministrationModule} from "../administration/administration.module";
import {TripMapper} from "../mapper/trip/trip.mapper";
import {UserMapper} from "../mapper/administration/user.mapper";
import {ClientMapper} from "../mapper/client.mapper";
import {ProviderMapper} from "../mapper/provider.mapper";
import {MaterialMapper} from "../mapper/trip/material.mapper";

@Module({
    imports: [
        AdministrationModule,
        TypeOrmModule.forRoot(TypeORMConfig),
        TypeOrmModule.forFeature([TripRepository])
    ],
    providers: [TripService, TripMapper, UserMapper, ClientMapper, ProviderMapper, MaterialMapper],
    controllers: [TripController]
})
export class TripModule {
}
