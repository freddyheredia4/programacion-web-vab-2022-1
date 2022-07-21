import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Person } from '../person';
import { PersonService } from '../person.service';

@Component({
  selector: 'app-person-form',
  templateUrl: './person.form.component.html'
})
export class PersonFormComponent implements OnInit {

  constructor(
    private personService: PersonService,
    private activatedRoute: ActivatedRoute
  ) { }

  currentEntity: Person = 
  {
    personId: 0,
    name: "",
    dni: "",
    created: new Date(),
    enabled: true
  };

  ngOnInit(): void {
    this.activatedRoute.paramMap.subscribe(
      (params) => {
        if (params.get("id")){
          this.findById(parseInt(params.get("id")!));
        }
      }
    )
  }

  save():void {
    console.table(this.currentEntity);
    this.personService.save(this.currentEntity)
    .subscribe(
      () => {
        this.currentEntity = 
        {
          personId: 0,
          name: "",
          dni: "",
          created: new Date(),
          enabled: true
        };
      }
    )
  }

  findById(id: number):void {
    this.personService.findById(id).subscribe(
      (response) => {
        this.currentEntity = response;
      }
    )
  }

  deleteById():void{
    this.personService.deleteById(this.currentEntity.personId).subscribe(
      () => {
        console.log("Borrado");
        //redireccionar ....
      }
    )
  }

}
