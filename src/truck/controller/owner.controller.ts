import { Controller, UseGuards, Get, Param, NotFoundException } from '@nestjs/common';
import { Owner } from '../../model/truck/owner.entity';
import { OwnerService } from '../service/owner.service';
import { AuthGuard } from '@nestjs/passport';
import { ApiUseTags, ApiOperation } from '@nestjs/swagger';
import { OwnerDTO } from 'src/dto/truck/owner.dto';
import { GenericController } from 'src/core/generic-controller';

@UseGuards(AuthGuard('jwt'))
@Controller('owners')
@ApiUseTags('owners')
export class OwnerController extends GenericController<Owner, OwnerDTO> {
  
  private readonly ownerService: OwnerService;

  constructor(service: OwnerService) {
    super(service, service);
    this.ownerService = service;
  }

  @Get('/by-cuil/:cuil')
  @ApiOperation({ title: 'Recuperar propietarios por número de cuil/cuit' })
  async getByCuil(@Param('cuil') cuil: string): Promise<OwnerDTO[]> {
    return this.ownerService.findOwnersByCUIL(cuil);
  }
}
