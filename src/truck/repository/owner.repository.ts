import { EntityRepository, Repository } from 'typeorm';
import { Owner } from '../../model/truck/owner.entity';

@EntityRepository(Owner)
export class OwnerRepository extends Repository<Owner> {}
