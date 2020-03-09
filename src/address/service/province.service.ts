import {Injectable} from '@nestjs/common';
import {ProvinceRepository} from "../repository/province.repository";
import {InjectRepository} from "@nestjs/typeorm";
import {Province} from "../../model/address/province.entity";
import {ProvinceDTO} from "../../dto/address/province.dto";

@Injectable()
export class ProvinceService {

    private readonly provinceRepository: ProvinceRepository;

    constructor(@InjectRepository(Province) repository: ProvinceRepository) {
        this.provinceRepository = repository;
    }

    findAll(): Promise<ProvinceDTO[]> {
        return this.provinceRepository.find().then(provinces => provinces.map(p => new ProvinceDTO(p)));
    }
}
