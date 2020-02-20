import {AbstractDto} from "./abstract.dto";

export class Pageable<T extends AbstractDto> {

    filters: { field: string, value: string }[] = undefined;
    order: { field: string, type: "ASC" | "DESC" } = undefined;
    page: number = 0;
    size: number = 0;

    public hasFilters(): boolean {
        return this.filters != undefined;
    }

    public hasOrder(): boolean {
        return this.order != undefined;
    }

    public defaultOrder(): { field: string, type: "ASC" | "DESC" } {
        return {field: "id", type: "DESC"};
    }

}
