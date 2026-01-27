import { Injectable, signal } from '@angular/core';
import { PRODUTOS_MOCK } from '../shared/mock.data';
import { Produto } from '../models/produto.model';

@Injectable({
  providedIn: 'root'
})
export class ProdutoServices {
  private produtosSignal = signal<Produto[]>([...PRODUTOS_MOCK]);

  //INCREMENTA ID
  private gerarProximoId(): number {
    const produtos = this.produtosSignal();
    if (produtos.length === 0) return 1;
    return Math.max(...produtos.map(a => a.id)) + 1;
  }

  // CREATE
  adicionarProduto(novoProduto: Produto): void {
    const produtoComId = new Produto(
      this.gerarProximoId(),
      novoProduto.nome,
      novoProduto.preco,
      novoProduto.categoria
    );
    
    this.produtosSignal.update(produtos => [...produtos, produtoComId]);
  }

  //READ
  obterProdutos() {
    return this.produtosSignal.asReadonly();
  }

  //READ USANDO ID
  obterProdutoPorId(id: number): Produto | undefined {
    return this.produtosSignal().find(produto => produto.id === id);
  }
}