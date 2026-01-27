export class Produto {
    // Construtor - método que cria o objeto aluno
    constructor(
        public id: number = 0,
        public nome: string = '',
        public preco: number = 0,
        public categoria: string = '',
    ){}
}