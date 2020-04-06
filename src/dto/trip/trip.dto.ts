import {AbstractDto} from "../../core/domain/abstract.dto";
import {ClientDTO} from "../client.dto";
import {TruckDTO} from "../truck/truck.dto";
import {MaterialDTO} from "../material.dto";
import {UserDTO} from "../user.dto";
import {ProviderDTO} from "../provider.dto";
import {Trip} from "../../model/trip/trip.entity";

export class TripDTO extends AbstractDto {

    client: ClientDTO;
    truck: TruckDTO;
    tripDate: number;
    origin: ProviderDTO = null;
    originName: string = null;
    destination: string;
    material: MaterialDTO;
    loadSize: number = 0;
    loadCost: number;
    fuel: number;
    price: number;
    shipmentPrice: number;
    shovelPrice: number;
    createTime: number;
    createdBy: UserDTO;

    constructor(o: Partial<TripDTO>) {
        super();
        Object.assign(this, o);
        if (this.client)
            this.client = new ClientDTO(this.client);

        if (this.truck)
            this.truck = new TruckDTO(this.truck);

        if (this.origin)
            this.origin = new ProviderDTO(this.origin);

        if (this.material)
            this.material = new MaterialDTO(this.material);

        if (this.createdBy)
            this.createdBy = new UserDTO(this.createdBy);
    }

    mapToEntity(): Trip {
        const {client, origin, tripDate, material, createdBy, truck, createTime, ...partialData} = this;
        const trip: Trip = new Trip(partialData);
        if (this.client)
            trip.client = this.client.mapToEntity();

        if (this.origin)
            trip.origin = this.origin.mapToEntity();

        if (this.material)
            trip.material = this.material.mapToEntity();

        if (this.truck)
            trip.truck = this.truck.mapToEntity();

        if (this.createdBy)
            trip.createdBy = this.createdBy.mapToEntity();

        if (this.tripDate)
            trip.tripDate = new Date(this.tripDate);

        if (this.createTime)
            trip.createTime = new Date(this.createTime);

        return trip;
    }


}
