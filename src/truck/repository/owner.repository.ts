import { EntityRepository } from 'typeorm';
import { Owner } from '../../model/truck/owner.entity';
import { GenericRepository } from 'src/core/generic-repository';

@EntityRepository(Owner)
export class OwnerRepository extends GenericRepository<Owner> {}
