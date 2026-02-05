import { Injectable } from '@nestjs/common';
import { Aluno } from './models/aluno.model'
import { CreateAlunoDto } from './dto/createAluno.dto';

@Injectable()
export class AlunoService {
    private alunos: Aluno[] = [];
    private contadorId = 1;

    criar(createAlunoDto: CreateAlunoDto): Aluno {
        
        const media = (createAlunoDto.nota1 + createAlunoDto.nota2) / 2;
        const situacao = media >= 6 ? 'Aprovado' : 'Reprovado';

        const aluno: Aluno = {
            id: this.contadorId++,       //Num projeto real, não é necessário colocar o ID, pois ele é gerado automaticamente pelo banco de dados
            nome: createAlunoDto.nome,
            nota1: createAlunoDto.nota1,
            nota2: createAlunoDto.nota2,
            media,
            situacao
        }

        this.alunos.push(aluno);
        return aluno;
    }

    listar(): Aluno[] {
        return this.alunos
    }
}
