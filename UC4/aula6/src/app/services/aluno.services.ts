import { Injectable, signal } from '@angular/core';
import { ALUNOS_MOCK } from '../shared/mock-alunos.data';
import { Aluno } from '../models/Aluno.model';

@Injectable({
  providedIn: 'root'
})
export class AlunoServices {
  private alunosSignal = signal<Aluno[]>([...ALUNOS_MOCK]);

  // GERAR ID AUTOMÁTICO
  private gerarProximoId(): number {
    const alunos = this.alunosSignal();
    if (alunos.length === 0) return 1;
    return Math.max(...alunos.map(a => a.id)) + 1;
  }

  adicionarAluno(novoAluno: Aluno): void {
    // Criar cópia do aluno com ID automático
    const alunoComId = new Aluno(
      this.gerarProximoId(),    // ID automático
      novoAluno.nome,
      novoAluno.sexo,
      novoAluno.foto,
      novoAluno.disciplina,
      novoAluno.nota1,
      novoAluno.nota2
    );
    
    // ✅ AGORA SIM: processarNotas() existe!
    alunoComId.processarNotas();
    
    this.alunosSignal.update(alunos => [...alunos, alunoComId]);
  }

  obterAlunos() {
    return this.alunosSignal.asReadonly();
  }

  obterAlunoPorId(id: number): Aluno | undefined {
    return this.alunosSignal().find(aluno => aluno.id === id);
  }
}