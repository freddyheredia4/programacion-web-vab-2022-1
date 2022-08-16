import { HttpResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Credenciales } from './credenciales';
import { LoginService } from './login.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html'
})
export class LoginComponent implements OnInit {

  credential: Credenciales = {username:"",password:""};

  loggedIn: boolean = false;
  constructor(
    private loginService: LoginService,
    private router: Router
  ) { }

  ngOnInit(): void {
  }

  singIn(): void{
    this.loginService.singIn(this.credential).subscribe(
      (response: HttpResponse<Credenciales>) => {
        if (response.headers.get('Authorization')!=null){
          sessionStorage.setItem("seguridad_token", String(response.headers.get('Authorization')));
          sessionStorage.setItem("username", this.credential.username);
        }
      }
    )
    this.loggedIn = true;
    sessionStorage.setItem("loggedIn","true");
    this.router.navigate(["layout"]);
  }
}
