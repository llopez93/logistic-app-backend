import {EntityRepository, Repository} from 'typeorm';
import {MaterialPrice} from "../../model/material-price.entity";

@EntityRepository(MaterialPrice)
export class MaterialPriceRepository extends Repository<MaterialPrice> {

    findByProviderId(providerId: number): Promise<MaterialPrice[]> {
        return this.find({relations: ["material"], where: {provider: {id: providerId}}});
    }
}
