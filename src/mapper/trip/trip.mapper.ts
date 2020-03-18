import {Injectable} from "@nestjs/common";
import {GenericMapper} from "../../core/generic-mapper";
import {Trip} from "../../model/trip/trip.entity";
import {TripDTO} from "../../dto/trip/trip.dto";
import {ClientMapper} from "../client.mapper";
import {ProviderMapper} from "../provider.mapper";
import {UserMapper} from "../administration/user.mapper";
import {MaterialMapper} from "./material.mapper";

@Injectable()
export class TripMapper extends GenericMapper<Trip, TripDTO> {

    private readonly clientMapper: ClientMapper;
    private readonly providerMapper: ProviderMapper;
    private readonly userMapper: UserMapper;
    private readonly materialMapper: MaterialMapper;

    constructor(clientMapper: ClientMapper,
                providerMapper: ProviderMapper,
                userMapper: UserMapper,
                materialMapper: MaterialMapper) {
        super();
        this.clientMapper = clientMapper;
        this.providerMapper = providerMapper;
        this.userMapper = userMapper;
        this.materialMapper = materialMapper;
    }


    toDTO(entity: Trip): TripDTO {
        const {material, client, truck, origin, createdBy, createTime, tripDate, ...plainData} = entity;
        const dto = new TripDTO(plainData);
        dto.createTime = entity.createTime.getTime();
        dto.client = this.clientMapper.toDTO(entity.client);
        dto.truck = null; // Falta el mapper
        dto.origin = entity.origin ? this.providerMapper.toDTO(entity.origin) : null;
        dto.material = this.materialMapper.toDTO(entity.material);
        dto.createdBy = this.userMapper.toDTO(entity.createdBy);

        return dto;
    }

    toEntity(dto: TripDTO): Trip {
        return undefined;
    }
}