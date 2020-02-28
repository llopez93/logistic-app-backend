import {Injectable} from '@nestjs/common';
import {InjectRepository} from "@nestjs/typeorm";
import {Brand} from "../../model/truck/brand.entity";
import {Model} from "../../model/truck/model.entity";
import {ModelRepository} from "../repository/model.repository";

@Injectable()
export class ModelService {

    constructor(@InjectRepository(Model) private readonly repository: ModelRepository) {
    }

    public findAll(): Promise<Brand[]> {
        return this.repository.find({relations: ["brand"]});
    }

    public findByBrand(brandId: number): Promise<Model[]> {
        return this.repository.find({
            relations: ["brand"],
            where: { id: brandId },
        });
    }

}
