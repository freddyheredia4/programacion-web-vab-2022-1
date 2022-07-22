import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { City } from './city';

@Injectable({
  providedIn: 'root'
})
export class CityService {

  constructor(
    private http: HttpClient
  ) { }

  private httpOptions = {
    headers: new HttpHeaders({"Content-Type":"application/json"})
  }

  private url: string = "http://localhost:8080/api/city";



  public findById(id: number): Observable<City>{
    return this.http.get<City>(this.url+"/findById/"+id, this.httpOptions);
  }



  public findAll(): Observable<City[]>{
    return this.http.get<City[]>(this.url+"/findAll", this.httpOptions);
  }

 
}
