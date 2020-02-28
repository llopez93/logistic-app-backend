import {Column, Entity} from 'typeorm';
import {IsNotEmpty} from 'class-validator';
import {ApiModelProperty} from '@nestjs/swagger';
import {AbstractEntity} from "./commons/abstract.entity";
import {PhoneType} from "./phone-type";

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

    @Column({
        name: 'phone_type',
        type: "enum",
        enum: PhoneType,
        default: PhoneType.NO_ESPECIFICADO})
    @IsNotEmpty()
    @ApiModelProperty()
    phoneType: PhoneType;

    @ApiModelProperty()
    @Column({name: 'email'})
    email: string;

    constructor(o: Partial<Client>) {
        super();
        Object.assign(this, o);
    }


}
