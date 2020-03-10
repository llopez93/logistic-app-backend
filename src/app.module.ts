import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';
import { AdministrationModule } from './administration/administration.module';
import { TruckModule } from './truck/truck.module';
import { ClientModule } from './client/client.module';
import { AddressModule } from './address/address.module';
import { ProviderModule } from './provider/provider.module';

@Module({
  imports: [AuthModule, AdministrationModule, TruckModule, ClientModule, AddressModule, ProviderModule],
})
export class AppModule {
}
