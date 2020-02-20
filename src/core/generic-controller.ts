import {GenericCrudService} from "./generic-crud-service";
import {AbstractDto} from "./domain/abstract.dto";
import {GenericCrudController} from "./generic-crud-controller";
import {Get, Param, Query} from "@nestjs/common";
import {ApiOperation} from "@nestjs/swagger";
import {PaginatedPage} from "./domain/paginatedPage";
import {PageableService} from "./pageable-service";
import {Pageable} from "./domain/pageable";

export class GenericController<T, DTO extends AbstractDto> extends GenericCrudController<T, DTO> {

    private pageableService : PageableService<DTO>;

    constructor(service: GenericCrudService<T, DTO>, pageableService : PageableService<DTO>) {
        super(service);
        this.pageableService = pageableService;
    }

    @Get("page")
    @ApiOperation({title: "Recuperar una pagina"})
    async getPage(@Query('page') page: number, @Query('size') size: number,
                  @Query('filters') filters: string[]): Promise<PaginatedPage<DTO>> {

        return this.pageableService.getPage( new Pageable({page: page, size: size}, filters ? filters : []));
    }


}
