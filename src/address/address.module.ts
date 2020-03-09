import {Module} from '@nestjs/common';
import {CityService} from './service/city.service';
import {ProvinceService} from './service/province.service';
import {AddressService} from './service/address.service';
import {TypeOrmModule} from "@nestjs/typeorm";
import {TypeORMConfig} from "../../config/typeorm.config";
import {AddressRepository} from "./repository/address.repository";
import {CityRepository} from "./repository/city.repository";
import {ProvinceRepository} from "./repository/province.repository";
import { AddressController } from './controller/address.controller';

@Module({
    imports: [
        TypeOrmModule.forRoot(TypeORMConfig),
        TypeOrmModule.forFeature([AddressRepository, CityRepository, ProvinceRepository])],
    providers: [CityService, ProvinceService, AddressService],
    exports: [AddressService],
    controllers: [AddressController]
})
export class AddressModule {
}
