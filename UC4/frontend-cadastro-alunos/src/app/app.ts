import { Component, signal } from '@angular/core';
import { AlunosComponent } from './pages/alunos/alunos';

//O código abaixo cria uma tag de HTML chamada <app-root> 
@Component({
  selector: 'app-root',
  standalone: true,
  imports: [AlunosComponent],
  template: '<app-alunos></app-alunos>'
})
export class App {
  protected readonly title = signal('front');
}
