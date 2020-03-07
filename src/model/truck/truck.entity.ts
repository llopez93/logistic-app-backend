import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { IsNotEmpty } from 'class-validator';
import { ApiModelProperty } from '@nestjs/swagger';
import { AbstractEntity } from '../commons/abstract.entity';
import { Model } from './model.entity';
import { Owner } from './owner.entity';

@Entity('truck')
export class Truck extends AbstractEntity {
  @Column({ name: 'name' })
  @IsNotEmpty()
  @ApiModelProperty()
  name: string;

  @Column({ name: 'domain' })
  @IsNotEmpty()
  @ApiModelProperty()
  domain: string;

  @Column({ name: 'year' })
  @IsNotEmpty()
  @ApiModelProperty()
  year: number;

  @ManyToOne(type => Model)
  @JoinColumn({ name: 'model_id' })
  @ApiModelProperty()
  model: Model;

  @ManyToOne(type => Owner)
  @JoinColumn({ name: 'owner_id' })
  @ApiModelProperty()
  owner: Owner;

  constructor(o: Partial<Truck>) {
    super();
    Object.assign(this, o);
    if (this.model) this.model = new Model(this.model);
    if (this.owner) this.owner = new Owner(this.owner);
  }
}
