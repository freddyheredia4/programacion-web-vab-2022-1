import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PersonFormComponent } from '../feature/person/form/person.form.component';
import { PersonListComponent } from '../feature/person/list/person-list.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { MainComponent } from './main/main.component';

const routes: Routes = [
  {path: '', component:MainComponent ,
    children: [
      {path: '', component:DashboardComponent},
      {path: 'person-form', component:PersonFormComponent},
      {path: 'person-form/:id', component:PersonFormComponent},
      {path: 'person-list', component:PersonListComponent},
      {path: 'dashboard', component:DashboardComponent}
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LayoutRoutingModule { }
