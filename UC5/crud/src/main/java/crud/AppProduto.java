package crud;
import java.sql.SQLException;
import java.util.Scanner;

public class AppProduto {
	
	public static void main(String[] args) {
        ProdutoDAO produtoDAO = new ProdutoDAO();
        Scanner scanner = new Scanner(System.in);

        System.out.println("Bem-vindo ao sistema de gerenciamento de produtos!");

        while (true) {
            System.out.println("\nMenu:");
            System.out.println("1. Adicionar Produto");
            System.out.println("2. Listar Produtos");
            System.out.println("3. Atualizar Produto");
            System.out.println("4. Deletar Produto");
            System.out.println("5. Sair");

            int escolha = scanner.nextInt();
            scanner.nextLine(); // consumir nova linha

            try {
                switch (escolha) {
                    case 1:
                        System.out.print("Nome: ");
                        String nomeproduto = scanner.nextLine();

                        System.out.print("Preço: ");
                        
                        double preco = Double.parseDouble(scanner.nextLine());
                        
                        System.out.print("Quantidade: ");
                        int qtd = Integer.parseInt(scanner.nextLine());
                        
                        System.out.print("Categoria: ");
                        String categoria = scanner.nextLine();

                        Produto produto = new Produto();
                        produto.setNomeproduto(nomeproduto);
                        produto.setPreco(preco);
                        produto.setQtd(qtd);
                        produto.setCategoria(categoria);

                        produtoDAO.adicionarProduto(produto);
                        System.out.println("Produto adicionado!");
                        break;

                    case 2:
                        produtoDAO.listarProdutos().forEach(u -> System.out.println(u.getIdproduto() + " - " + u.getNomeproduto() + " - " + u.getPreco() + " - " + u.getQtd() + " - " + u.getCategoria()));
                        break;

                    case 3:
                        System.out.print("Digite o ID do produto a ser atualizado: ");
                        int idAtualizar = scanner.nextInt();
                        scanner.nextLine();

                        System.out.print("Novo Nome: ");
                        String novoNome = scanner.nextLine();

                        System.out.print("Novo Preço: ");
                        double novoPreco = Double.parseDouble(scanner.nextLine());;

                        System.out.print("Nova Quantidade: ");
                        int novaQtd = Integer.parseInt(scanner.nextLine());
                        
                        System.out.print("Nova Categoria: ");
                        String novaCategoria = scanner.nextLine();

                        Produto produtoAtualizar = new Produto();
                        produtoAtualizar.setIdproduto(idAtualizar);
                        produtoAtualizar.setNomeproduto(novoNome);
                        produtoAtualizar.setPreco(novoPreco);
                        produtoAtualizar.setQtd(novaQtd);
                        produtoAtualizar.setCategoria(novaCategoria);

                        produtoDAO.atualizarProduto(produtoAtualizar);
                        System.out.println("Produto atualizado com sucesso!");
                        break;

                    case 4:
                        System.out.print("Digite o ID do produto a ser deletado: ");
                        int idDeletar = scanner.nextInt();
                        produtoDAO.deletarProduto(idDeletar);
                        System.out.println("Produto deletado com sucesso!");
                        break;

                    case 5:
                        System.out.println("Saindo...");
                        scanner.close();
                        return;

                    default:
                        System.out.println("Opção inválida!");
                }
            } catch (SQLException e) {
                System.err.println("Erro: " + e.getMessage());
	            }
	        }
	    }
	}
