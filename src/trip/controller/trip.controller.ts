import {Body, Controller, Get, HttpCode, Post, Req, UseGuards} from '@nestjs/common';
import {GenericController} from "../../core/generic-controller";
import {Trip} from "../../model/trip/trip.entity";
import {TripDTO} from "../../dto/trip/trip.dto";
import {TripService} from "../service/trip.service";
import {ApiOkResponse, ApiOperation} from "@nestjs/swagger";
import {Request} from "express";
import {AuthGuard} from "@nestjs/passport";

@UseGuards(AuthGuard('jwt'))
@Controller('trip')
export class TripController extends GenericController<Trip, TripDTO> {

    private readonly tripService: TripService;

    constructor(service: TripService) {
        super(service, service);
        this.tripService = service;
    }

    @Post()
    @HttpCode(201)
    @ApiOperation({
        title: "Crea una nueva entidad",
        description: "Le pasamos un JSON con los datos de la entidad, sin el id." +
            "El API nos devuelve el objeto creado con su ID asignado"
    })
    @ApiOkResponse({description: "Entidad creada"})
    createTrips(@Req() request: Request, @Body() body: { data: TripDTO, laps: number }): Promise<TripDTO[]> {
        return this.tripService.createTrips(new TripDTO(body.data), body.laps, (request.user as any).email);
    }

    @Get("last-trips")
    @ApiOperation({
        title: "Listar de últimos viajes",
        description: "Listado de los ultimos 10 viajes agregados ordenados por ID de forma descendente,"
    })
    @ApiOkResponse({description: "Entidad creada"})
    getLastTrips(): Promise<TripDTO[]> {
        return this.tripService.findLastTrips();
    }
}
