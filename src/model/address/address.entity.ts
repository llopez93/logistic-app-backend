import {Column, Entity, JoinColumn, ManyToOne} from 'typeorm';
import {ApiModelProperty} from '@nestjs/swagger';
import {AbstractEntity} from "../commons/abstract.entity";
import {City} from "./city.entity";

@Entity('address')
export class Address extends AbstractEntity {

    @ApiModelProperty()
    @Column({name : "street"})
    street: string;

    @ApiModelProperty()
    @Column({name : "number"})
    number: string;

    @ApiModelProperty()
    @ManyToOne(type => City)
    @JoinColumn({name: "city_id"})
    city: City;

    constructor(o: Partial<Address>) {
        super();
        Object.assign(this, o);
        if (this.city)
            this.city = new City(this.city);
    }

}
