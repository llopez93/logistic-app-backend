import {Injectable} from "@nestjs/common";
import {GenericMapper} from "../core/generic-mapper";
import {MaterialPrice} from "../model/material-price.entity";
import {MaterialPriceDTO} from "../dto/material-price.dto";
import {ProviderMapper} from "./provider.mapper";
import {MaterialMapper} from "./trip/material.mapper";


@Injectable()
export class MaterialPriceMapper extends GenericMapper<MaterialPrice, MaterialPriceDTO> {

    private readonly providerMapper: ProviderMapper;
    private readonly materialMapper: MaterialMapper;

    constructor(materialMapper: MaterialMapper) {
        super();
        this.materialMapper = materialMapper;
        //TODO: Revisar porque falla la inyeccion del ProviderMapper
        this.providerMapper = new ProviderMapper(this);
    }

    toDTO(entity: MaterialPrice): MaterialPriceDTO {
        const dto: MaterialPriceDTO = new MaterialPriceDTO(entity);
        dto.material = this.materialMapper.toDTO(entity.material);
        /*
        if (entity.provider)
            dto.provider = this.providerMapper.toDTO(entity.provider);*/
        return dto;
    }

    toEntity(dto: MaterialPriceDTO): MaterialPrice {
        const {material, /*provider,*/ ...data} = dto;
        const entity: MaterialPrice = new MaterialPrice();
        entity.id = dto.id;
        entity.price = dto.price;
        entity.material = this.materialMapper.toEntity(dto.material);
        /*
        if (dto.provider)
            entity.provider = this.providerMapper.toEntity(dto.provider);

         */
        return entity;
    }
}
