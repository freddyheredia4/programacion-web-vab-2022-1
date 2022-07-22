import { Authority } from "../authority/authority";

export interface Person {
    personId: number,
    name: string,
    dni: string,
    created: Date,
    enabled: boolean,
    cityId: number,
    authorities: Authority[]
}