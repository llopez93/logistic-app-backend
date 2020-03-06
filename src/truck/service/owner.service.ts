import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Owner } from '../../model/truck/owner.entity';
import { OwnerRepository } from '../repository/owner.repository';

@Injectable()
export class OwnerService {
  constructor(
    @InjectRepository(Owner) private readonly repository: OwnerRepository,
  ) {}

  public findAll(): Promise<Owner[]> {
    return this.repository.find();
  }
}
