import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Owner } from '../../model/truck/owner.entity';
import { OwnerRepository } from '../repository/owner.repository';
import { OwnerDTO } from 'src/dto/truck/owner.dto';

@Injectable()
export class OwnerService {
  constructor(
    @InjectRepository(Owner) private readonly repository: OwnerRepository,
  ) {}

  public findAll(): Promise<Owner[]> {
    return this.repository.find();
  }

  create(entity: Owner): Promise<Owner> {
    return this.repository.save(entity);
  }

  mapToDTO(entity: Owner): OwnerDTO {
    return new OwnerDTO(entity);
  }

  mapToEntity(dto: OwnerDTO): Owner {
    return new OwnerDTO(dto).mapToEntity();
  }
}
