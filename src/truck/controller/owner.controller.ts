import { Controller, UseGuards, Get } from '@nestjs/common';
import { Owner } from '../../model/truck/owner.entity';
import { OwnerService } from '../service/owner.service';
import { AuthGuard } from '@nestjs/passport';
import { ApiUseTags, ApiOperation } from '@nestjs/swagger';

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
}
