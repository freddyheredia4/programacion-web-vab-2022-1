import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FeatureRoutingModule } from './feature-routing.module';
import { PersonFormComponent } from './person/form/person.form.component';
import { FormsModule } from '@angular/forms';
import { PersonListComponent } from './person/list/person-list.component';
import { PersonToolbarComponent } from './person/toolbar/person-toolbar.component';
import { CityComboboxComponent } from './city/city-combobox.component';


@NgModule({
  declarations: [
    PersonFormComponent,
    PersonListComponent,
    PersonToolbarComponent,
    CityComboboxComponent
  ],
  imports: [
    CommonModule,
    FeatureRoutingModule,
    FormsModule
  ]
})
export class FeatureModule { }
