import {DeleteResult, Repository} from "typeorm";
import {AbstractDto} from "./domain/abstract.dto";

export abstract class GenericCrudService<T, DTO extends AbstractDto> {

    protected readonly repository: Repository<T>;

    protected constructor(r: Repository<T>) {
        this.repository = r;
    }

    async findOne(id: number): Promise<DTO> {
        return this.repository.findOne(id).then(value => this.mapToDTO(value));
    }

    async findAll(): Promise<DTO[]> {
        return this.repository.find().then(value => value.map(e => this.mapToDTO(e)));
    }

    async create(entity: DTO): Promise<DTO> {
        return this.repository.save(this.mapToEntity(entity)).then(value => this.mapToDTO(value));
    }

    async update(entity: DTO): Promise<DTO> {
        return this.repository.update(entity.id, this.mapToEntity(entity)).then(value => entity);
    }

    async remove(id: number): Promise<DeleteResult> {
        return this.repository.delete(id);
    }

    //Todo: Evaluar si estos metodos se pueden resolver mediante los mappers

    abstract mapToDTO(entity: T): DTO;

    abstract mapToEntity(dto: DTO): T;
}
