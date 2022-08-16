import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable()
export class TokenInterceptor implements HttpInterceptor {

  constructor() {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    console.log(request.url);
    
    if (sessionStorage.getItem("seguridad_token")!=null && request.url!="http://localhost:8080/login"){
      let tokenRequest = request.clone(
        {
          headers: request.headers.set('Authorization', String(sessionStorage.getItem('seguridad_token')))
        }
      );
      return next.handle(tokenRequest);
    }
    return next.handle(request);
  }
  
}
