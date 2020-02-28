import {EntityRepository} from 'typeorm';
import {GenericRepository} from "../../core/generic-repository";
import {Client} from "../../model/client.entity";

@EntityRepository(Client)
export class ClientRepository extends GenericRepository<Client> {
}
