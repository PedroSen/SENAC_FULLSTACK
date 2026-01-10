import { Component, Input } from '@angular/core';
import { Aluno } from '../../models/Aluno.model'
import { DecimalPipe } from '@angular/common'

@Component({
  selector: 'app-aluno-list',
  imports: [DecimalPipe],
  templateUrl: './aluno-list.html',
  styleUrl: './aluno-list.css'
})
export class AlunoList {
  @Input() alunos: Aluno[] = []

  trackById(index: number, aluno: Aluno): number {
    return aluno.id;
  }
}
