import {TypeOrmModuleOptions} from '@nestjs/typeorm';
import { join } from 'path';

const config = require('config');

export const TypeORMConfig: TypeOrmModuleOptions = {
    type: 'mysql',
    host: config.get('db.host'),
    port: config.get('db.port'),
    username: config.get('db.user'),
    timezone: '-3',
    password: config.get('db.password'),
    database: config.get('db.database'),
    // Resuelve: https://github.com/typeorm/typeorm/issues/2882#issuecomment-576395044
    entities: [join(__dirname, '..', 'src', 'model', '**', '*.entity{.ts,.js}')],
    synchronize: false,
    logging: config.get('db.logging'),
};
