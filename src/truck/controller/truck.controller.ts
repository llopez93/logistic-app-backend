import { Controller, UseGuards, Get, Param } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { ApiUseTags, ApiOperation } from '@nestjs/swagger';
import { GenericController } from '../../core/generic-controller';
import { Truck } from '../../model/truck/truck.entity';
import { TruckDTO } from '../../dto/truck/truck.dto';
import { TruckService } from '../service/truck.service';

@UseGuards(AuthGuard('jwt'))
@Controller('trucks')
@ApiUseTags('trucks')
export class TruckController extends GenericController<Truck, TruckDTO> {
  private readonly truckService: TruckService;

  constructor(service: TruckService) {
    super(service, service);
    this.truckService = service;
  }

  @Get('by-owner/:id')
  @ApiOperation({ title: 'Listado de camiones por propietario' })
  findByOwner(@Param('id') id: number): Promise<Truck[]> {
    return this.truckService.findByOwner(id);
  }
}
