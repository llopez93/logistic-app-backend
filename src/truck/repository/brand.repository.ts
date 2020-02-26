import {EntityRepository, Repository} from 'typeorm';
import {Brand} from "../../model/brand.entity";

@EntityRepository(Brand)
export class BrandRepository extends Repository<Brand> {

}
