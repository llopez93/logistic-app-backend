import {EntityRepository, Repository} from 'typeorm';
import {Material} from "../../model/trip/material.entity";

@EntityRepository(Material)
export class MaterialRepository extends Repository<Material> {
}
