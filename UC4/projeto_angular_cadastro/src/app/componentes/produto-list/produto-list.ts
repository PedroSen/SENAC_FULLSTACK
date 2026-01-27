import { Component, Input } from '@angular/core';
import { Produto } from '../../models/produto.model' //Importa o banco de dados com os dados dos produtos cadastrados
import { DecimalPipe } from '@angular/common'

@Component({
  selector: 'app-produto-list', //Selector cria a tag HTML <app-produto-list>, que será usada no HTML para se usar o método da classe abaixo, que cria uma lista de produtos
  imports: [DecimalPipe],
  templateUrl: './produto-list.html', //templateUrl envia a classe PtodutoList abaixo para o HTML produto-list.html, permitindo que esse método seja usado no código app.html do qual produto-list.html faz parte
  styleUrl: './produto-list.css'
})

//O método da classe abaixo cria uma lista com todos os produtos presentes no banco de dados
export class ProdutoList {
  @Input() produtos: Produto[] = []

  trackById(index: number, produto: Produto): number {
    return produto.id;
  }
}

