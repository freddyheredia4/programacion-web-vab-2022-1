import { Injectable } from '@angular/core';
import { Person } from './person';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class PersonService {

  constructor(
    private http: HttpClient
  ) { }

  private httpOptions = {
    headers: new HttpHeaders({"Content-Type":"application/json"})
  }

  private url: string = "http://localhost:8080/api/person";

  public save(person: Person): Observable<Person>{
    return this.http.post<Person>(this.url+"/save", person, this.httpOptions);
  }

  public findById(id: number): Observable<Person>{
    return this.http.get<Person>(this.url+"/"+id, this.httpOptions);
  }

  public deleteById(id: number): Observable<Person>{
    return this.http.delete<Person>(this.url+"/deleteById/"+id, this.httpOptions);
  }

}
