import { Controller, UseGuards, Get, Param, NotFoundException } from '@nestjs/common';
import { Owner } from '../../model/truck/owner.entity';
import { OwnerService } from '../service/owner.service';
import { AuthGuard } from '@nestjs/passport';
import { ApiUseTags, ApiOperation } from '@nestjs/swagger';
import { OwnerDTO } from 'src/dto/truck/owner.dto';

@UseGuards(AuthGuard('jwt'))
@Controller('owners')
@ApiUseTags('owners')
export class OwnerController {
  constructor(private readonly service: OwnerService) {}

  @Get()
  @ApiOperation({ title: 'Listado de peopietarios' })
  findAll(): Promise<Owner[]> {
    return this.service.findAll();
  }

  @Get(':id')
  @ApiOperation({ title: 'Encontrar propietario por ID' })
  async find(@Param('id') id: number): Promise<OwnerDTO> {
    const owner = await this.service.findOne(id);
    if (owner == undefined) {
      throw new NotFoundException();
    }
    return owner;
  }

  @Get('/by-cuil/:cuil')
  @ApiOperation({ title: 'Recuperar propietarios por número de cuil/cuit' })
  async getByCuil(@Param('cuil') cuil: string): Promise<OwnerDTO[]> {
    return this.service.findOwnersByCUIL(cuil);
  }
}
