import { Controller, Get, Post, Body } from '@nestjs/common';
import { AlunoService } from './aluno.service';
import { CreateAlunoDto } from './dto/createAluno.dto';

@Controller('aluno')
export class AlunoController {

  constructor(private readonly alunoService: AlunoService) {}

  @Post()
  criar(@Body() createAlunoDto: CreateAlunoDto) {
    return this.alunoService.criar(createAlunoDto);
  }

  @Get()
  listar() {
    return this.alunoService.listar();
  }
}

