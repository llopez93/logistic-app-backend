import {Injectable} from '@nestjs/common';
import {InjectRepository} from "@nestjs/typeorm";
import {Material} from "../../model/trip/material.entity";
import {MaterialRepository} from "../repository/material.repository";
import {MaterialDTO} from "../../dto/material.dto";
import {ClientRepository} from "../../client/repository/client.repository";
import {Client} from "../../model/client.entity";
import {ProviderRepository} from "../repository/provider.repository";

@Injectable()
export class MaterialService {

    private readonly repository: MaterialRepository;
    private readonly clientRepository: ClientRepository;

    constructor(@InjectRepository(Material) r: MaterialRepository,
        @InjectRepository(Client) clientRepository: ClientRepository,) {
        this.repository = r;
        this.clientRepository = clientRepository;
    }

    findAll(): Promise<MaterialDTO[]> {
        return this.repository.find().then(result => result.map(material => new MaterialDTO(material)));
    }

    async create(entity: Material[]): Promise<Material[]> {
        const promises = [];

        for (let m of entity) {
            const existingMaterial = await this.repository.findOne({
                where: {
                    name: m.name
                }
            });
            if (existingMaterial)
                promises.push(new Promise(() => existingMaterial));
            else
                promises.push(this.repository.save(m));
        }
        return Promise.all(promises);
    }

    findByProvider(providerId: number): Promise<MaterialDTO[]> {
        return this.clientRepository.findMaterialsByProviderId(providerId).then(result => result.map(m => new MaterialDTO(m)));
    }
}
