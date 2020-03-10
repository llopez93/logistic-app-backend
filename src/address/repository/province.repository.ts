import {EntityRepository, Repository} from 'typeorm';
import {Province} from "../../model/address/province.entity";

@EntityRepository(Province)
export class ProvinceRepository extends Repository<Province> {
}
