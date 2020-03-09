import {Injectable} from '@nestjs/common';
import {AddressRepository} from "../repository/address.repository";
import {InjectRepository} from "@nestjs/typeorm";
import {Address} from "../../model/address/address.entity";
import {AddressDTO} from "../../dto/address/address.dto";
import {UpdateResult} from "typeorm";

@Injectable()
export class AddressService {

    private readonly addressRepository: AddressRepository;


    constructor(@InjectRepository(Address) addressRepository: AddressRepository) {
        this.addressRepository = addressRepository;
    }

    create(dto: AddressDTO): Promise<AddressDTO> {
        return this.addressRepository.save(new Address(dto)).then(a => new AddressDTO(a));
    }

    update(dto: AddressDTO): Promise<UpdateResult> {
        return this.addressRepository.update(dto.id, new Address(dto));
    }

}
