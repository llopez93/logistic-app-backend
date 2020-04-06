import {Column, Entity, JoinColumn, ManyToOne} from 'typeorm';
import {ApiModelProperty} from '@nestjs/swagger';
import {AbstractEntity} from "../commons/abstract.entity";
import {Client} from "../client.entity";
import {Truck} from "../truck/truck.entity";
import {Material} from "./material.entity";
import {User} from "../security/user.entity";

@Entity('trip')
export class Trip extends AbstractEntity {

    @ApiModelProperty()
    @ManyToOne(type => Client,
        {nullable: false})
    @JoinColumn({name: "client_id"})
    client: Client;

    @ApiModelProperty()
    @ManyToOne(type => Truck,
        {nullable: false})
    @JoinColumn({name: "truck_id"})
    truck: Truck;

    @ApiModelProperty()
    @Column({name: "trip_date", type: "datetime"})
    tripDate: Date;

    @ApiModelProperty()
    @ManyToOne(type => Client,
        {nullable: true})
    @JoinColumn({name: "origin_id"})
    origin: Client = null;

    @ApiModelProperty()
    @Column({name: "origin_name", type: "varchar", length: 300, nullable: true})
    originName: string = null;

    @ApiModelProperty()
    @Column({name: "destination", type: "varchar", length: 300, nullable: false})
    destination: string;

    @ApiModelProperty()
    @ManyToOne(type => Material,
        {nullable: false})
    @JoinColumn({name: "material_id"})
    material: Material;

    @ApiModelProperty()
    @Column(
        {
            name: "load_size",
            type: "int"
        })
    loadSize: number = 0;

    @ApiModelProperty()
    @Column(
        {
            name: "shipment_price",
            type: "int"
        })
    shipmentPrice: number = 0;

    @ApiModelProperty()
    @Column(
        {
            name: "shovel_price",
            type: "int"
        })
    shovelPrice: number = 0;

    @ApiModelProperty()
    @Column(
        {
            name: "load_cost",
            type: "boolean"
        })
    loadCost: number;

    @ApiModelProperty()
    @Column(
        {
            name: "fuel",
            type: "int"
        })
    fuel: number;

    @ApiModelProperty()
    @Column(
        {
            name: "price",
            type: "bigint"
        })
    price: number;

    @ApiModelProperty()
    @Column(
        {
            name: "create_time",
            type: "datetime"
        })
    createTime: Date = new Date();

    @ManyToOne(type => User,
        {eager: false, nullable: false})
    @JoinColumn({name: "user_id"})
    createdBy: User;

    constructor(o: Partial<Trip>) {
        super();
        Object.assign(this, o);
        if (this.client)
            this.client = new Client(this.client);

        if (this.truck)
            this.truck = new Truck(this.truck);

        if (this.origin)
            this.origin = new Client(this.origin);

        if (this.material)
            this.material = new Material(this.material);

        if (this.createdBy)
            this.createdBy = new User(this.createdBy);
    }
}
