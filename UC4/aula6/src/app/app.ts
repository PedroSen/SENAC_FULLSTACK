import { Component, OnInit, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { Aluno } from './models/Aluno.model';
import { AlunoServices } from './services/aluno.services';
import { AlunoList } from './componentes/aluno-list/aluno-list';
import { AlunoForm } from "./componentes/aluno-form/aluno-form";


@Component({
  selector: 'app-root',
  standalone: true,
  imports: [AlunoList, AlunoForm],
  templateUrl: './app.html',
  styleUrl: './app.css'
})

export class App{
  aluno = signal<Aluno>(new Aluno());
  
  constructor(private alunoServices: AlunoServices) {}

  // Getter para a lista de alunos
  get alunos() {
    return this.alunoServices.obterAlunos();
  }

  // Método para adicionar aluno
  adicionarAluno(): void {
    this.alunoServices.adicionarAluno(this.aluno());
    this.limparFormulario();
  }

  // Limpar formulário após cadastro
  private limparFormulario(): void {
    this.aluno.set(new Aluno());
  }

  // Método de exemplo com mock
  adicionarAlunoMock(): void {
    const mockAluno = new Aluno(
      Math.floor(Math.random() * 1000),
      `Aluno Mock ${Math.random().toString(36).substr(2, 5)}`,
      Math.random() > 0.5 ? 'm' : 'f',
      '',
      'Angular',
      Math.floor(Math.random() * 10),
      Math.floor(Math.random() * 10)
    );
    
    this.alunoServices.adicionarAluno(mockAluno);
  }
  }
