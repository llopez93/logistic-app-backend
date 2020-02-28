import {PrimaryGeneratedColumn} from 'typeorm';
import {ApiModelProperty} from '@nestjs/swagger';

export abstract class AbstractEntity {

    @PrimaryGeneratedColumn()
    @ApiModelProperty()
    id: number;
}
