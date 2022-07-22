import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { City } from './city';
import { CityService } from './city.service';

@Component({
  selector: 'app-city-combobox',
  templateUrl: './city-combobox.component.html'
})
export class CityComboboxComponent implements OnInit {

  constructor(
    private cityService: CityService
  ) { }

  cities: City[] = [];
  @Output() cityIdEmitter = new EventEmitter<number>();
  @Input() cityId: number = 0;

  ngOnInit(): void {
    this.findAll();
  }

  public findAll():void {
    this.cityService.findAll().subscribe(
      (respose) => this.cities = respose
    )
  }

  public onSelect(id:string){
    console.log("El id de la ciudad es:" + id);
    this.cityIdEmitter.emit(parseInt(id));
  }

}
