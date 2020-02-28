import {Repository} from "typeorm";
import {AbstractEntity} from "../model/commons/abstract.entity";

export class GenericRepository<T extends AbstractEntity> extends Repository<T> {


}
