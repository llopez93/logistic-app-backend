import {Module} from '@nestjs/common';
import {ProviderService} from './service/provider.service';
import {ProviderController} from './controller/provider.controller';
import {AddressModule} from "../address/address.module";
import {TypeOrmModule} from "@nestjs/typeorm";
import {TypeORMConfig} from "../../config/typeorm.config";
import {ClientRepository} from "../client/repository/client.repository";

@Module({
    imports: [
        AddressModule,
        TypeOrmModule.forRoot(TypeORMConfig),
        TypeOrmModule.forFeature([ClientRepository])],
    providers: [ProviderService],
    controllers: [ProviderController]
})
export class ProviderModule {
}
