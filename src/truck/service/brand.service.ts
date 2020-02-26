import {Injectable} from '@nestjs/common';
import {InjectRepository} from "@nestjs/typeorm";
import {Brand} from "../../model/brand.entity";
import {BrandRepository} from "../repository/brand.repository";

@Injectable()
export class BrandService {

    constructor(@InjectRepository(Brand) private readonly repository: BrandRepository) {
    }

    public findAll(): Promise<Brand[]> {
        return this.repository.find();
    }
}
