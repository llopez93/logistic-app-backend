import {Column, Entity, JoinColumn, ManyToOne} from 'typeorm';
import {IsNotEmpty} from 'class-validator';
import {ApiModelProperty} from '@nestjs/swagger';
import {AbstractEntity} from "./abstract.entity";
import {Exclude, Expose} from "class-transformer";
import {Role} from "./role.entity";

@Entity('user')
export class User extends AbstractEntity {

    @Column({name: 'first_name'})
    @IsNotEmpty()
    @ApiModelProperty()
    firstName: string;

    @IsNotEmpty()
    @ApiModelProperty()
    @Column({name: 'last_name'})
    lastName: string;

    @Exclude()
    @IsNotEmpty()
    @ApiModelProperty()
    @Column({name: 'password'})
    password: string;

    @IsNotEmpty()
    @ApiModelProperty()
    @Column({name: 'email'})
    email: string;

    @IsNotEmpty()
    @ApiModelProperty()
    @Column({name: 'enabled'})
    enabled: boolean = true;

    @Expose()
    @JoinColumn({name: 'role_id'})
    @ManyToOne(type => Role)
    role: Role;

    constructor(o: Partial<User>) {
        super();
        Object.assign(this, o);
    }
}
