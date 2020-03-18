import {EntityRepository} from 'typeorm';
import {GenericRepository} from "../../core/generic-repository";
import {Client} from "../../model/client.entity";
import {Material} from "../../model/trip/material.entity";

@EntityRepository(Client)
export class ClientRepository extends GenericRepository<Client> {

    isOnlyProvider(id): Promise<boolean> {
        return this.findOne({
            where: {
                id: id
            }
        }).then(c => c.onlyProvider);
    }

    findMaterialsByProviderId(id: number): Promise<Material[]> {
        const query = this.createQueryBuilder("client");
        query.select(["client", "materials"]);
        query.innerJoin("client.materials", "materials");
        query.where("client.id = :id", {id: id});
        return query.getOne().then(result => result ? result.materials : []);
    }
}
