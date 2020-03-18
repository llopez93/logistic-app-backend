import {Module} from '@nestjs/common';
import {TripService} from './service/trip.service';
import {TripController} from './controller/trip.controller';
import {TypeOrmModule} from "@nestjs/typeorm";
import {TypeORMConfig} from "../../config/typeorm.config";
import {TripRepository} from "./repository/trip.repository";
import {AdministrationModule} from "../administration/administration.module";

@Module({
    imports: [
        AdministrationModule,
        TypeOrmModule.forRoot(TypeORMConfig),
        TypeOrmModule.forFeature([TripRepository])
    ],
    providers: [TripService],
    controllers: [TripController]
})
export class TripModule {
}
