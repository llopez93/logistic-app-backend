import {EntityRepository} from 'typeorm';
import {GenericRepository} from "../../core/generic-repository";
import {Trip} from "../../model/trip/trip.entity";

@EntityRepository(Trip)
export class TripRepository extends GenericRepository<Trip> {

    async findLastTrips(limit: number): Promise<Trip[]> {
        return this.find({
            relations: ["client", "origin", "material", "createdBy"],
            skip: 0,
            take: 10,
            order: {id: "DESC"}});
    }
}
