import { Module } from '@nestjs/common';
import { TruckService } from './service/truck.service';
import { BrandService } from './service/brand.service';
import { ModelService } from './service/model.service';
import { ModelController } from './controller/model.controller';
import { BrandController } from './controller/brand.controller';
import { TruckController } from './controller/truck.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TypeORMConfig } from '../../config/typeorm.config';
import { BrandRepository } from './repository/brand.repository';
import { ModelRepository } from './repository/model.repository';
import { TruckRepository } from './repository/truck.repository';
import { OwnerRepository } from './repository/owner.repository';
import { OwnerService } from './service/owner.service';
import { OwnerController } from './controller/owner.controller';

@Module({
  imports: [
    TypeOrmModule.forRoot(TypeORMConfig),
    TypeOrmModule.forFeature([
      BrandRepository,
      ModelRepository,
      TruckRepository,
      OwnerRepository,
    ]),
  ],
  providers: [TruckService, BrandService, ModelService, OwnerService],
  controllers: [
    ModelController,
    BrandController,
    TruckController,
    OwnerController,
  ],
})
export class TruckModule {}
