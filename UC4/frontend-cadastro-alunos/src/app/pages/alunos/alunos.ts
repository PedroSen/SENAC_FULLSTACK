import { Component, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AlunoService } from '../../services/alunoservice';

@Component({
  selector: 'app-alunos',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './alunos.html',
  styleUrls: ['./alunos.css']
})
export class AlunosComponent implements OnInit {
  alunos = signal<any[]>([]);
  
  novoAluno = {
    nome: '',
    nota1: 0,
    nota2: 0
  };

  constructor(private alunoService: AlunoService) {}

  ngOnInit(): void {
    this.carregarAlunos();
  }

  getSituacaoClass(situacao: string): string {
    switch (situacao?.toLocaleLowerCase()) {
      case 'aprovado':
        return 'aprovado';
      case 'reprovado':
        return 'reprovado';
      case 'recuperacao':
        return 'recuperacao';
      default:
        return '';
    }
  }

  carregarAlunos(): void {
    this.alunoService.listar().subscribe({
      next: (dados) => {
        console.log('Dados recebidos:', dados);
        this.alunos.set(dados);
      },
      error: (erro) => {
        console.error('Erro ao carregar alunos:', erro);
        alert('Erro ao carregar alunos. Verifique se o backend está rodando.');
      }
    });
  }

  salvarAluno(): void {
    if (!this.novoAluno.nome.trim()) {
      alert('Digite o nome do aluno');
      return;
    }

    this.alunoService.criar({ ...this.novoAluno }).subscribe({
      next: () => {
        this.carregarAlunos();
        this.novoAluno = { nome: '', nota1: 0, nota2: 0 };
      },
      error: (erro) => {
        console.error('Erro ao salvar aluno:', erro);
        alert('Erro ao salvar aluno');
      }
    }
  )
}
}