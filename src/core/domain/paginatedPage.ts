import {AbstractDto} from "./abstract.dto";

export class PaginatedPage<T> {

    data: T[] = [];
    page: number = 0;
    total: number = 0;
}
