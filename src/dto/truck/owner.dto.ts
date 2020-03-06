import { AbstractDto } from '../../core/domain/abstract.dto';
import { Owner } from '../../model/truck/owner.entity';

export class OwnerDTO extends AbstractDto {
  firstName: string;
  lastName: string;
  email: string;
  cuil: string;

  constructor(o: Partial<OwnerDTO> | Owner | Partial<Owner>) {
    super();
    Object.assign(this, o);
  }

  mapToEntity(): Owner {
    return new Owner(this);
  }
}
