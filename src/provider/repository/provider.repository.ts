import {EntityRepository} from 'typeorm';
import {GenericRepository} from "../../core/generic-repository";
import {Client} from "../../model/client.entity";

@EntityRepository(Client)
export class ProviderRepository extends GenericRepository<Client> {

}
