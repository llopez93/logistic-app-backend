import {EntityRepository} from 'typeorm';
import {GenericRepository} from "../../core/generic-repository";
import {Truck} from "../../model/truck.entity";

@EntityRepository(Truck)
export class TruckRepository extends GenericRepository<Truck> {
}
