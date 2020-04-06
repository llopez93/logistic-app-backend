import {Column, Entity, JoinColumn, ManyToOne} from "typeorm";
import {AbstractEntity} from "./commons/abstract.entity";
import {IsNotEmpty} from "class-validator";
import {ApiModelProperty} from "@nestjs/swagger";
import {Material} from "./trip/material.entity";
import {Client} from "./client.entity";

@Entity('material_price')
export class MaterialPrice extends AbstractEntity {

    @IsNotEmpty()
    @ApiModelProperty()
    @Column({name: 'price', type: "bigint"})
    price: number = null;

    @ApiModelProperty()
    @ManyToOne(type => Material)
    @JoinColumn({name: "material_id"})
    material: Material;

    @ApiModelProperty()
    @ManyToOne(type => Client)
    @JoinColumn({name: "provider_id"})
    provider: Client;

}
