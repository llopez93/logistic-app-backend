import {Column, Entity, JoinColumn, ManyToOne} from 'typeorm';
import {IsNotEmpty} from 'class-validator';
import {ApiModelProperty} from '@nestjs/swagger';
import {AbstractEntity} from "./abstract.entity";
import {Brand} from "./brand.entity";

@Entity('model')
export class Model extends AbstractEntity {

    @Column({name: 'name'})
    @IsNotEmpty()
    @ApiModelProperty()
    name: string;

    @ManyToOne(type => Brand)
    @JoinColumn({name: "brand_id"})
    @ApiModelProperty()
    brand: Brand;

    constructor(o: Partial<Model>) {
        super();
        Object.assign(this, o);
        if (this.brand)
            this.brand = new Brand(this.brand);
    }

}
