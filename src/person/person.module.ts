import {Module} from '@nestjs/common';
import {PersonController} from './controller/person.controller';
import {PersonService} from './service/person.service';
import {TypeOrmModule} from "@nestjs/typeorm";
import {TypeORMConfig} from "../../config/typeorm.config";
import {PersonRepository} from "./repository/person.repository";

@Module({
    imports: [
        TypeOrmModule.forRoot(TypeORMConfig),
        TypeOrmModule.forFeature([PersonRepository])],
    controllers: [PersonController],
    providers: [PersonService]
})
export class PersonModule {
}
