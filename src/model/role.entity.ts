import {Column, Entity, PrimaryGeneratedColumn} from 'typeorm';
import {IsNotEmpty} from 'class-validator';
import {ApiModelProperty} from '@nestjs/swagger';
import {AbstractEntity} from "./abstract.entity";

@Entity('role')
export class Role extends AbstractEntity {

    @PrimaryGeneratedColumn()
    @ApiModelProperty()
    id: number;

    @Column({name: 'name'})
    @IsNotEmpty()
    @ApiModelProperty()
    name: string;

    constructor(o: Partial<Role>) {
        super();
        Object.assign(this, o);
    }

}
