import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FeatureRoutingModule } from './feature-routing.module';
import { PersonComponent } from './person/person.component';
import { FormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    PersonComponent
  ],
  imports: [
    CommonModule,
    FeatureRoutingModule,
    FormsModule
  ]
})
export class FeatureModule { }
