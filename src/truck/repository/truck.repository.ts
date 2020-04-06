import {EntityRepository} from 'typeorm';
import {GenericRepository} from "../../core/generic-repository";
import {Truck} from "../../model/truck/truck.entity";

@EntityRepository(Truck)
export class TruckRepository extends GenericRepository<Truck> {

    public findAll(): Promise<Truck[]> {
        return this.find({relations: ['owner']});
    }
}
