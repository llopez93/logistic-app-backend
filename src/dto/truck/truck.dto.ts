import { AbstractDto } from '../../core/domain/abstract.dto';
import { Truck } from '../../model/truck/truck.entity';
import { ModelDTO } from './model.dto';
import { OwnerDTO } from './owner.dto';

export class TruckDTO extends AbstractDto {
  name: string;
  domain: string;
  year: number;
  model: ModelDTO;
  owner: OwnerDTO;

  constructor(o: Partial<TruckDTO> | Truck | Partial<Truck>) {
    super();
    Object.assign(this, o);
    if (this.model) this.model = new ModelDTO(this.model);
    if (this.owner) this.owner = new OwnerDTO(this.owner);
  }

  mapToEntity(): Truck {
    return new Truck(this);
  }
}
