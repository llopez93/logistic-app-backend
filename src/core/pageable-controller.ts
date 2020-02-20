import {Get, Param} from "@nestjs/common";
import {ApiOperation} from "@nestjs/swagger";
import {GenericCrudService} from "./generic-crud-service";
import {AbstractDto} from "./domain/abstract.dto";
import {PaginatedPage} from "./domain/paginatedPage";

export class PageableController<T, DTO extends AbstractDto> {

    constructor(protected readonly service: GenericCrudService<T, DTO>) {
    }

    @Get("page")
    @ApiOperation({title: "Recuperar una pagina"})
    async find(@Param('page') page: number, @Param('size') size: number,
               @Param('filters') filters: string[]): Promise<PaginatedPage<T>> {
        console.log(filters);
        return null;
    }

}
