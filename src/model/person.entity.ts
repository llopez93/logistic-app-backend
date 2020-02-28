import {Column, Entity, PrimaryGeneratedColumn} from 'typeorm';
import {IsNotEmpty} from 'class-validator';
import {ApiModelProperty} from '@nestjs/swagger';

@Entity('person')
export class Person {

    @PrimaryGeneratedColumn()
    @ApiModelProperty()
    id: number;

    @Column({name: 'first_name'})
    @IsNotEmpty()
    @ApiModelProperty()
    firstName: string;

    @IsNotEmpty()
    @ApiModelProperty()
    @Column({name: 'last_name'})
    lastName: string;

    @IsNotEmpty()
    @ApiModelProperty()
    @Column({name: 'email'})
    email: string;

    @ApiModelProperty()
    @Column({name: 'cuil'})
    cuil: string = "";


    constructor(o: Partial<Person>) {
       Object.assign(this, o);
    }
}
