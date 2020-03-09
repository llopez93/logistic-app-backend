import {Column, Entity, Index, Unique} from 'typeorm';
import {IsNotEmpty} from 'class-validator';
import {ApiModelProperty} from '@nestjs/swagger';
import {AbstractEntity} from "../commons/abstract.entity";

@Unique(["name"])
@Entity('province')
export class Province extends AbstractEntity {

    @IsNotEmpty()
    @ApiModelProperty()
    @Column({name: 'name'})
    name: string;

    constructor(o: Partial<Province>) {
        super();
        Object.assign(this, o);
    }
}
