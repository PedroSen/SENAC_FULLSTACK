import { Component, model, output } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Produto } from '../../models/produto.model';

@Component({
  selector: 'app-produto-form',
  standalone:true,
  imports: [FormsModule],
  templateUrl: './produto-form.html',
  styleUrl: './produto-form.css'
})

export class ProdutoForm {
  Produto = model.required<Produto>();

  onSubmit = output<void>();

  cadastrarProduto():void{
    this.onSubmit.emit();
  }
}
