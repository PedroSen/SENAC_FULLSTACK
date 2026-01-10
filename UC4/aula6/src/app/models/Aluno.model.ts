export class Aluno {
    // Construtor - método que cria o objeto aluno
    constructor(
        public id: number = 0,
        public nome: string = '',
        public sexo: string = '',
        public disciplina: string = '',
        public foto: string = '',
        public nota1: number = 0,
        public nota2: number = 0,
        public media: number = 0,
        public situacao: string = ''
    ){}

    calcularMedia():void{
        this.media = (this.nota1 + this.nota2)/2;
    }

    definirSituacao():void{
        this.situacao = this.media >= 7 ? 'Aprovado' : 'Reprovado';
        // Os símbolos ? e : são usados como uma forma simplificada de if e else.
    }

    processarNotas():void{
        this.calcularMedia();
        this.definirSituacao();
    }
}