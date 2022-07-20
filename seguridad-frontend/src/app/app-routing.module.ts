import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {path: '', redirectTo: '/layout', pathMatch: 'full'},
  {path: 'layout', loadChildren:() => import('./layout/layout.module').then(m => m.LayoutModule)},
  {path: 'feature', loadChildren:() => import('./feature/feature.module').then(m => m.FeatureModule)}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
