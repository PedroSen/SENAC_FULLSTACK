import { Component, model, output } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Aluno } from '../../models/Aluno.model';

@Component({
  selector: 'app-aluno-form',
  standalone:true,
  imports: [FormsModule],
  templateUrl: './aluno-form.html',
  styleUrl: './aluno-form.css'
})
export class AlunoForm {
  aluno = model.required<Aluno>();

  onSubmit = output<void>();

  cadastrarAluno():void{
    if (this.validarFormulario()){
      this.onSubmit.emit();
    }
  }

  private validarFormulario():boolean{
    const a = this.aluno();
    return a.nome.length > 0 && a.nota1 >= 0 && a.nota2 > 0;
  }

  gerarFotoAleatoria():void{
    const randomId = Math.floor(Math.random() * 100) + 1;
    var genero = ''
    if (this.aluno().sexo == 'f'){
      genero = 'woman';
    } else {
      genero = 'men';
    }
    this.aluno().foto = `https://randomuser.me/api/portraits/${genero}/${randomId}.jpg`;
  }

}
