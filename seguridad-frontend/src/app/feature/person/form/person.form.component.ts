import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Authority } from '../../authority/authority';
import { AuthorityService } from '../../authority/authority.service';
import { Person } from '../person';
import { PersonService } from '../person.service';

@Component({
  selector: 'app-person-form',
  templateUrl: './person.form.component.html'
})
export class PersonFormComponent implements OnInit {

  constructor(
    private personService: PersonService,
    private authorityService: AuthorityService,
    private activatedRoute: ActivatedRoute,
    private router:Router
  ) { }

  currentEntity: Person = 
  {
    personId: 0,
    name: "",
    dni: "",
    created: new Date(),
    enabled: true,
    cityId: 0,
    authorities: []
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
          enabled: true,
          cityId: 0,
          authorities: []
        };
        this.router.navigate(['/layout/person-list']);
      }
    )
  }

  findById(id: number):void {
    this.personService.findById(id).subscribe(
      (response) => {
        this.currentEntity = response;
        this.currentEntity.authorities.forEach(
          (auth) => {
            this.authorityService.findById(auth.id).subscribe(
              (item) => auth.name = item.name
            )
          }
        )
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

  removeAuthority(id: number):void {

    this.currentEntity.authorities =
    this.currentEntity.authorities.filter(
      (item) => item.id != id 
    );
  }

}
