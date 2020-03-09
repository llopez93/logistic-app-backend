import {Injectable} from '@nestjs/common';
import {InjectRepository} from "@nestjs/typeorm";
import {CityRepository} from "../repository/city.repository";
import {City} from "../../model/address/city.entity";
import {CityDTO} from "../../dto/address/city.dto";

@Injectable()
export class CityService {

    private readonly cityRepository: CityRepository;

    constructor(@InjectRepository(City) repository: CityRepository) {
        this.cityRepository = repository;
    }

    findByProvince(provinceId: number): Promise<CityDTO[]> {
        return this.cityRepository.find({
            relations: ["province"],
            where: {
                province: {
                    id: provinceId
                }
            }
        }).then(cities => cities.map(c => new CityDTO(c)));
    }
}
