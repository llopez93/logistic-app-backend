export class Pageable {

    filters: Map<string, string> = new Map<string, string>();
    order: { field: string, type: "ASC" | "DESC" } = undefined;
    page: number = 0;
    size: number = 0;

    constructor(o : Partial<Pageable>, filters : string[] | string) {
        Object.assign(this, o);

        if ( typeof filters === "string") {
            const array = filters.split("||");
            this.filters.set( array[0], array[1]);
        } else {
            filters.forEach(f => {
                const array = f.split("||");
                this.filters.set( array[0], array[1]);
            })
        }


    }

    public hasFilters(): boolean {
        return this.filters.size > 0;
    }

    public hasOrder(): boolean {
        return this.order != undefined;
    }

    public defaultOrder(): { field: string, type: "ASC" | "DESC" } {
        return {field: "id", type: "DESC"};
    }

}
