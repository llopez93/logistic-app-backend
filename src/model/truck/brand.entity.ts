import {Column, Entity, PrimaryGeneratedColumn} from 'typeorm';
import {IsNotEmpty} from 'class-validator';
import {ApiModelProperty} from '@nestjs/swagger';
import {AbstractEntity} from "../commons/abstract.entity";

@Entity('brand')
export class Brand extends AbstractEntity {

    @Column({name: 'name'})
    @IsNotEmpty()
    @ApiModelProperty()
    name: string;

    constructor(o: Partial<Brand>) {
        super();
        Object.assign(this, o);
    }

}
