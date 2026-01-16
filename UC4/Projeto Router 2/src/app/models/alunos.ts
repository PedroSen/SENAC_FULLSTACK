export interface Aluno {
    id: number;
  nome: string;
  email: string;
  matricula: string;
  curso: string;
  periodo: 'MATUTINO' | 'VESPERTINO' | 'NOTURNO';
  dataCriacao: Date;
  ativo: boolean;
}