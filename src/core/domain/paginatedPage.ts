import {AbstractDto} from "./abstract.dto";

export class Pageable<T extends AbstractDto> {

    data: T[] = [];
    page: number = 0;
    total: number = 0;
}
