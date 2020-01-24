import {TypeOrmModuleOptions} from '@nestjs/typeorm';

const config = require('config');

export const TypeORMConfig: TypeOrmModuleOptions = {
    type: 'mysql',
    host: config.get('db.host'),
    port: config.get('db.port'),
    username: config.get('db.user'),
    timezone: '-3',
    password: config.get('db.password'),
    database: config.get('db.database'),
    entities: ['dist/src/**/*.entity{.ts,.js}'],
    synchronize: false,
    logging: config.get('db.logging'),
};
