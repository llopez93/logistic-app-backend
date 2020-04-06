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
import {TruckMapper} from "../mapper/truck/truck.mapper";
import {ModelMapper} from "../mapper/truck/model.mapper";
import {MaterialPriceMapper} from "../mapper/material-price.mapper";

@Module({
    imports: [
        AdministrationModule,
        TypeOrmModule.forRoot(TypeORMConfig),
        TypeOrmModule.forFeature([TripRepository])
    ],
    providers: [TripService, TripMapper, UserMapper, ClientMapper, MaterialPriceMapper,
        ProviderMapper, MaterialMapper, TruckMapper, ModelMapper],
    controllers: [TripController]
})
export class TripModule {
}
