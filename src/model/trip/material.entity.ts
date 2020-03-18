import {Column, Entity, Index} from 'typeorm';
import {IsNotEmpty} from 'class-validator';
import {ApiModelProperty} from '@nestjs/swagger';
import {MaterialUnit} from "./material-unit";
import {AbstractEntity} from "../commons/abstract.entity";

@Entity('material')
@Index(["name"], { unique: true })
export class Material extends AbstractEntity {

    @Column({name: 'name'})
    @IsNotEmpty()
    @ApiModelProperty()
    name: string;

    @Column( {
    name: 'unit',
    type: "enum",
    enum: MaterialUnit,
    default: MaterialUnit.CUBIC_METER })
    unit: MaterialUnit;

    constructor(o: Partial<Material>) {
        super();
        Object.assign(this, o);
    }
}
