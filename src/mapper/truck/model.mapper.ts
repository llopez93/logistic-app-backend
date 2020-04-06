import {Injectable} from "@nestjs/common";
import {GenericMapper} from "../../core/generic-mapper";
import {Model} from "../../model/truck/model.entity";
import {ModelDTO} from "../../dto/truck/model.dto";


@Injectable()
export class ModelMapper extends GenericMapper<Model, ModelDTO> {

    toDTO(entity: Model): ModelDTO {
        return new ModelDTO(entity);
    }

    toEntity(dto: ModelDTO): Model {
        return new Model(dto);
    }


}
