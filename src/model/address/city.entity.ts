import {Column, Entity, JoinColumn, ManyToOne} from 'typeorm';
import {IsNotEmpty} from 'class-validator';
import {ApiModelProperty} from '@nestjs/swagger';
import {AbstractEntity} from "../commons/abstract.entity";
import {Province} from "./province.entity";

@Entity('city')
export class City extends AbstractEntity {

    @IsNotEmpty()
    @ApiModelProperty()
    @Column({name: 'name'})
    name: string;

    @ApiModelProperty()
    @ManyToOne(type => Province)
    @JoinColumn({name: "province_id"})
    province: Province;


    constructor(o: Partial<City>) {
        super();
        Object.assign(this, o);
        if (this.province)
            this.province = new Province(this.province);
    }


}
