import { Column, Entity, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { IsNotEmpty } from 'class-validator';
import { ApiModelProperty } from '@nestjs/swagger';
import { AbstractEntity } from '../commons/abstract.entity';

@Entity('owner')
export class Owner extends AbstractEntity {
  @PrimaryGeneratedColumn()
  @ApiModelProperty()
  id: number;

  @Column({ name: 'first_name' })
  @IsNotEmpty()
  @ApiModelProperty()
  firstName: string;

  @IsNotEmpty()
  @ApiModelProperty()
  @Column({ name: 'last_name' })
  lastName: string;

  @IsNotEmpty()
  @ApiModelProperty()
  @Column({ name: 'email' })
  email: string;

  @ApiModelProperty()
  @Column({ name: 'cuil' })
  cuil: string = '';

  @ApiModelProperty()
  @Column({
    name: 'shovel_cost',
    type: 'decimal',
  })
  shovelCost: number = 0;

  @ApiModelProperty()
  @Column({
    name: 'trip_cost',
    type: 'decimal',
  })
  tripCost: number = 0;

  constructor(o: Partial<Owner>) {
    super();
    Object.assign(this, o);
  }
}
