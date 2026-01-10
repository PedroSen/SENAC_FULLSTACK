import { Aluno } from "../models/Aluno.model";

export const ALUNOS_MOCK: Aluno[] = [
    new Aluno(1,'Marcos', 'M', 'Angular', 'https://randomuser.me/api/portraits/men/65.jpg', 8, 9),
    new Aluno(2,'Pedro', 'M', 'Java', 'https://randomuser.me/api/portraits/men/60.jpg', 5, 10),
    new Aluno(3,'Letícia', 'F', 'Angular', 'https://randomuser.me/api/portraits/women/67.jpg', 6, 7),
    new Aluno(4,'Patrícia', 'F', 'Java', 'https://randomuser.me/api/portraits/women/5.jpg', 10, 6),
    new Aluno(5,'Miguel', 'M', 'Angular', 'https://randomuser.me/api/portraits/men/80.jpg', 9, 7)
];

ALUNOS_MOCK.forEach(Aluno => Aluno.processarNotas())

