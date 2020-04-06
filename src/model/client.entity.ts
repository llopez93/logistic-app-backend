import {Column, Entity, JoinColumn, ManyToOne} from 'typeorm';
import {IsNotEmpty} from 'class-validator';
import {ApiModelProperty} from '@nestjs/swagger';
import {AbstractEntity} from "./commons/abstract.entity";
import {PhoneType} from "./phone-type";
import {Address} from "./address/address.entity";

@Entity('client')
export class Client extends AbstractEntity {

    @IsNotEmpty()
    @ApiModelProperty()
    @Column({name: 'name'})
    name: string;

    @IsNotEmpty()
    @ApiModelProperty()
    @Column({name: 'social_reason'})
    socialReason: string;

    @IsNotEmpty()
    @ApiModelProperty()
    @Column({name: 'cuil'})
    cuil: string;

    @Column({name: 'phone'})
    @IsNotEmpty()
    @ApiModelProperty()
    phone: string;

    @Column({
        name: 'phone_type',
        type: "enum",
        enum: PhoneType,
        default: PhoneType.NO_ESPECIFICADO
    })
    @IsNotEmpty()
    @ApiModelProperty()
    phoneType: PhoneType;

    @ApiModelProperty()
    @Column({name: 'email'})
    email: string;

    @ApiModelProperty()
    @ManyToOne(type => Address)
    @JoinColumn({name: "address_id"})
    address: Address;

    @ApiModelProperty()
    @Column({name: 'only_provider'})
    onlyProvider: boolean = false;

    @ApiModelProperty()
    @Column({name: 'has_materials'})
    hasMaterials: boolean = false;

    /**
     @ManyToMany(type => Material)
     @JoinTable({
        name: "client_materials_material",
        joinColumn: {
            name: "client_id",
            referencedColumnName: "id"
        },
        inverseJoinColumn: {
            name: "material_id",
            referencedColumnName: "id"
        }
    })
     */

    @Column(
        {
            name: "acount_state",
            type: "bigint"
        })
    stateAcount: number = 0;

    constructor(o: Partial<Client>) {
        super();
        Object.assign(this, o);
        if (this.address)
            this.address = new Address(this.address);
    }


}
