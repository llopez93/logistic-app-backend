import {Column, Entity, JoinColumn, ManyToOne} from 'typeorm';
import {IsNotEmpty} from 'class-validator';
import {ApiModelProperty} from '@nestjs/swagger';
import {AbstractEntity} from "../commons/abstract.entity";
import {Brand} from "./brand.entity";
import {Model} from "./model.entity";

@Entity('truck')
export class Truck extends AbstractEntity {

    @Column({name: 'name'})
    @IsNotEmpty()
    @ApiModelProperty()
    name: string;

    @Column({name: 'domain'})
    @IsNotEmpty()
    @ApiModelProperty()
    domain: string;

    @Column({name: 'year'})
    @IsNotEmpty()
    @ApiModelProperty()
    year: number ;

    @ManyToOne(type => Model)
    @JoinColumn({name: "model_id"})
    @ApiModelProperty()
    model: Model;

    //TODO: incluir el owner

    constructor(o: Partial<Truck>) {
        super();
        Object.assign(this, o);
        if (this.model)
            this.model = new Model(this.model);
    }

}
