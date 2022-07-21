import { Component, OnInit } from '@angular/core';
import { Person } from '../person';
import { PersonService } from '../person.service';

@Component({
  selector: 'app-person-list',
  templateUrl: './person-list.component.html'
})
export class PersonListComponent implements OnInit {

  constructor(
    private personService: PersonService
  ) { }

  personList: Person[] = [];

  ngOnInit(): void {
    this.findAll();
  }

  public findAll():void {
    this.personService.findAll().subscribe(
      (response) => this.personList = response
    )
  }

  public findByName(term: string): void{
    if (term.length>=2){
      this.personService.findByName(term).subscribe(
        (response) => this.personList = response
      )
    }
    if (term.length===0){
      this.findAll();
    }

  }

}
