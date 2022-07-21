import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-person-toolbar',
  templateUrl: './person-toolbar.component.html'
})
export class PersonToolbarComponent implements OnInit {

  @Input() entityName: string = "";
  @Output() termEmitter = new EventEmitter<string>();

  constructor() { }

  ngOnInit(): void {
  }

  public onInput(term: string){
    this.termEmitter.emit(term);
  }

}
