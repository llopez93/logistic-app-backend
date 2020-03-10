import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Owner } from '../../model/truck/owner.entity';
import { OwnerRepository } from '../repository/owner.repository';
import { OwnerDTO } from 'src/dto/truck/owner.dto';
import { Like } from 'typeorm';

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

  findOne(id: number): Promise<OwnerDTO> {
    return this.repository.findOne(id).then(owner => this.mapToDTO(owner));
  }

  findOwnersByCUIL(cuil: string): Promise<OwnerDTO[]> {
    return this.repository
      .find({
        where: {
          cuil: Like('%' + cuil + '%'),
        },
        take: 10,
        skip: 0,
      })
      .then(result => result.map(owner => this.mapToDTO(owner)));
  }

  mapToDTO(entity: Owner): OwnerDTO {
    return new OwnerDTO(entity);
  }

  mapToEntity(dto: OwnerDTO): Owner {
    return new OwnerDTO(dto).mapToEntity();
  }
}
