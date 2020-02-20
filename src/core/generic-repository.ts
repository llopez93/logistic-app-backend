import {Repository} from "typeorm";
import {AbstractEntity} from "../model/abstract.entity";

export class GenericRepository<T extends AbstractEntity> extends Repository<T> {


}
