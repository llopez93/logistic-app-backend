import {EntityRepository, Repository} from 'typeorm';
import {Province} from "../../model/address/province.entity";
import {Address} from "../../model/address/address.entity";

@EntityRepository(Province)
export class ProvinceRepository extends Repository<Province> {
}
