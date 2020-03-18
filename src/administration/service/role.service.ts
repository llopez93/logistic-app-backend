import {Injectable} from '@nestjs/common';
import {InjectRepository} from '@nestjs/typeorm';
import {GenericCrudService} from "../../core/generic-crud-service";
import {RoleDto} from "../../dto/role.dto";
import {Role} from "../../model/security/role.entity";
import {RoleRepository} from "../repository/role.repository";
import {PageableService} from "../../core/pageable-service";
import {Pageable} from "../../core/domain/pageable";
import {PaginatedPage} from "../../core/domain/paginatedPage";
import {SelectQueryBuilder} from "typeorm";
import {RoleMapper} from "../../mapper/administration/role.mapper";


@Injectable()
export class RoleService extends GenericCrudService<Role, RoleDto> implements PageableService<RoleDto> {

    private readonly mapper: RoleMapper;

    constructor(
        mapper: RoleMapper,
        @InjectRepository(Role) repository: RoleRepository) {
        super(repository);
        this.mapper = mapper;
    }

    mapToDTO(entity: Role): RoleDto {
        return this.mapper.toDTO(entity);
    }

    mapToEntity(dto: RoleDto): Role {
        return this.mapper.toEntity(dto);
    }

    getPage(pageable: Pageable): Promise<PaginatedPage<RoleDto>> {
        const page: PaginatedPage<RoleDto> = new PaginatedPage<RoleDto>();
        const query: SelectQueryBuilder<Role> = this.repository.createQueryBuilder("role");
        query.select("role");

        if (pageable.hasFilters()) {
            if (pageable.filters.get("name"))
                query.where("role.name like :name", {name: "%" + pageable.filters.get("name") + "%"})
        }
        query.skip(pageable.page * pageable.size);
        query.take(pageable.size);
        return query.getMany().then(roles => {
            page.data = roles.map(role => this.mapToDTO(role));
            return query.getCount();
        }).then(count => {
            page.total = count;
            page.page = pageable.page;
            return page;
        });
    }


}
