import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { Authority } from '../authority';
import { AuthorityService } from '../authority.service';

@Component({
  selector: 'app-authority-search',
  templateUrl: './authority-search.component.html'
})
export class AuthoritySearchComponent implements OnInit {

  constructor(
    private authorityService: AuthorityService
  ) { }

  authorities: Authority[] = [];

  @Output() authorityEmitter = new EventEmitter<Authority>();

  ngOnInit(): void {
  }

  onInput(term: string):void {
    if (term.length>=2){
      this.authorityService.findByName(term).subscribe(
        (response) => this.authorities = response
      )
    }
    if (term.length===0){
      this.authorities = [];
    }

  }

  onSelect(authority: Authority):void {
    this.authorityEmitter.emit(authority);
  }

}
