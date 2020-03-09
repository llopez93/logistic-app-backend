import {EntityRepository, Repository} from 'typeorm';
import {Address} from "../../model/address/address.entity";

@EntityRepository(Address)
export class AddressRepository extends Repository<Address>{
}
