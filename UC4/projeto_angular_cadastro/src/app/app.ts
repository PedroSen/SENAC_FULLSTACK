import { Component, OnInit, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { Produto } from './models/produto.model';
import { ProdutoServices } from './services/banco-de-dados.services';
import { ProdutoList } from './componentes/produto-list/produto-list';
import { ProdutoForm } from "./componentes/produto-form/produto-form";


@Component({
  selector: 'app-root',
  standalone: true,
  imports: [ProdutoList, ProdutoForm],
  templateUrl: './app.html',
  styleUrl: './app.css'
})

export class App{
  produto = signal<Produto>(new Produto());
  
  constructor(private produtoServices: ProdutoServices) {}

  // Getter para a lista de produtos
  get produtos() {
    return this.produtoServices.obterProdutos();
  }

  // Método para adicionar produto
  adicionarProduto(): void {
    this.produtoServices.adicionarProduto(this.produto());
    this.limparFormulario();
  }

  // Limpar formulário após cadastro
  private limparFormulario(): void {
    this.produto.set(new Produto());
  }
  }