import {Column, Entity} from 'typeorm';
import {IsNotEmpty} from 'class-validator';
import {ApiModelProperty} from '@nestjs/swagger';
import {AbstractEntity} from "./commons/abstract.entity";

@Entity('client')
export class Client extends AbstractEntity {

    @IsNotEmpty()
    @ApiModelProperty()
    @Column({name: 'name'})
    name: string;

    @Column({name: 'phone'})
    @IsNotEmpty()
    @ApiModelProperty()
    phone: string;

    @ApiModelProperty()
    @Column({name: 'email'})
    email: string;

    constructor(o: Partial<Client>) {
        super();
        Object.assign(this, o);
    }


}
