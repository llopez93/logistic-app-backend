import {AbstractDto} from "./domain/abstract.dto";
import {Pageable} from "./domain/pageable";
import {PaginatedPage} from "./domain/paginatedPage";

export interface PageableService<DTO extends AbstractDto> {

    getPage(pageable: Pageable): Promise<PaginatedPage<DTO>>;

}
