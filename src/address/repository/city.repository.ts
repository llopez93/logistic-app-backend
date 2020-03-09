import {EntityRepository, Repository} from 'typeorm';
import {City} from "../../model/address/city.entity";
import {Address} from "../../model/address/address.entity";

@EntityRepository(City)
export class CityRepository extends Repository<City> {
}
