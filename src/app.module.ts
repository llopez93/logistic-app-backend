import {Module} from '@nestjs/common';
import {AuthModule} from './auth/auth.module';
import {AdministrationModule} from './administration/administration.module';
import {TruckModule} from './truck/truck.module';
import {PersonModule} from './person/person.module';

@Module({
    imports: [
        AuthModule,
        AdministrationModule,
        TruckModule,
        PersonModule,
    ]
})
export class AppModule {
}
