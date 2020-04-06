import {Injectable} from '@nestjs/common';
import {InjectRepository} from "@nestjs/typeorm";
import {Material} from "../../model/trip/material.entity";
import {MaterialRepository} from "../repository/material.repository";
import {ClientRepository} from "../../client/repository/client.repository";
import {Client} from "../../model/client.entity";
import {MaterialPriceRepository} from "../repository/material-price.repository";
import {MaterialPrice} from "../../model/material-price.entity";
import {DeleteResult} from "typeorm";

@Injectable()
export class MaterialPriceService {

    private readonly repository: MaterialRepository;
    private readonly materialPriceRepository: MaterialPriceRepository;

    constructor(@InjectRepository(Material) r: MaterialRepository,
                @InjectRepository(Client) clientRepository: ClientRepository,
                @InjectRepository(MaterialPrice) materialPriceRepository: MaterialPriceRepository) {
        this.repository = r;
        this.materialPriceRepository = materialPriceRepository;
    }

    async create(entity: MaterialPrice[]): Promise<MaterialPrice[]> {
        const promises = [];

        for (let m of entity) {
            if (m.material.id === null) {
                m.material = await this.repository.save(m.material);
            }
            promises.push(this.materialPriceRepository.save(m));
        }
        return Promise.all(promises);
    }

    async removeMaterials(materialPrices: MaterialPrice[]): Promise<DeleteResult> {
        return this.materialPriceRepository.delete(materialPrices.map(m => m.id));
    }


    async removeByProvider(providerId: number): Promise<DeleteResult> {
        return this.materialPriceRepository.delete({provider: {id: providerId}});
    }

    findByProvider(providerId: number): Promise<MaterialPrice[]> {
        return this.materialPriceRepository.findByProviderId(providerId);
    }
}
