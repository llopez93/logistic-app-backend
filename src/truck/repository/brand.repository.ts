import {EntityRepository, Repository} from 'typeorm';
import {Brand} from "../../model/truck/brand.entity";

@EntityRepository(Brand)
export class BrandRepository extends Repository<Brand> {

}
