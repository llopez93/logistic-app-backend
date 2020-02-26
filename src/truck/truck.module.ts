import {Module} from '@nestjs/common';
import {TruckService} from './service/truck.service';
import {BrandService} from './service/brand.service';
import {ModelService} from './service/model.service';
import {ModelController} from './controller/model.controller';
import {BrandController} from './controller/brand.controller';
import {TruckController} from './controller/truck.controller';
import {TypeOrmModule} from "@nestjs/typeorm";
import {TypeORMConfig} from "../../config/typeorm.config";
import {BrandRepository} from "./repository/brand.repository";
import {ModelRepository} from "./repository/model.repository";
import {TruckRepository} from "./repository/truck.repository";

@Module({
    imports: [
        TypeOrmModule.forRoot(TypeORMConfig),
        TypeOrmModule.forFeature([BrandRepository, ModelRepository, TruckRepository])
    ],
    providers: [TruckService, BrandService, ModelService],
    controllers: [ModelController, BrandController, TruckController]
})
export class TruckModule {
}
