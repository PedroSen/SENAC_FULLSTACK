package crud;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

public class AppTodos {
    private static Scanner scanner = new Scanner(System.in);
    private static ClienteDAO clienteDAO = new ClienteDAO();
    private static ProdutoDAO produtoDAO = new ProdutoDAO();
    private static PedidoDAO pedidoDAO = new PedidoDAO();

    public static void main(String[] args) {
        System.out.println("=== SISTEMA CRUD - CLIENTE | PRODUTO | PEDIDO ===\n");
        
        while (true) {
            mostrarMenuPrincipal();
            int opcao = lerInt("Escolha uma opção: ");
            
            switch (opcao) {
                case 1 -> menuCliente();
                case 2 -> menuProduto();
                case 3 -> menuPedido();
                case 0 -> {
                    System.out.println("Saindo... Até logo!");
                    return;
                }
                default -> System.out.println(" Opção inválida!\n");
            }
        }
    }
    
    private static void mostrarMenuPrincipal() {
        System.out.println("\n" + "=".repeat(50));
        System.out.println("1 - GERENCIAR CLIENTES");
        System.out.println("2 - GERENCIAR PRODUTOS");
        System.out.println("3 - GERENCIAR PEDIDOS");
        System.out.println("0 - SAIR");
        System.out.println("=".repeat(50));
    }

    // === MENU CLIENTE ===
    private static void menuCliente() {
        while (true) {
            System.out.println("\n🔹 CLIENTES");
            System.out.println("1 - Listar | 2 - Adicionar | 3 - Buscar ID | 4 - Atualizar | 5 - Deletar | 0 - Voltar");
            int opcao = lerInt("Opção: ");
            switch (opcao) {
                case 1 -> listarClientes();
                case 2 -> adicionarCliente();
                case 3 -> buscarCliente();
                case 4 -> atualizarCliente();
                case 5 -> deletarCliente();
                case 0 -> { return; }
                default -> System.out.println(" Opção inválida!");
            }
        }
    }

    private static void listarClientes() {
        try {
            List<Cliente> clientes = clienteDAO.listarClientes();
            System.out.println("\n📋 LISTA DE CLIENTES:");
            clientes.forEach(c -> System.out.printf("ID: %d | Nome: %s | CPF: %s%n", c.getId(), c.getNome(), c.getCpf()));
        } catch (SQLException e) {
            System.out.println("❌ Erro: " + e.getMessage());
        }
    }

    private static void adicionarCliente() {
        Cliente c = new Cliente();
        c.setNome(lerString("Nome: "));
        c.setCpf(lerString("CPF: "));
        c.setEmail(lerString("Email: "));
        try {
            clienteDAO.adicionarCliente(c);
            System.out.println("✅ Cliente cadastrado com sucesso!");
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    private static void buscarCliente() {
        int idcliente = lerInt("ID do Cliente: ");
        try {
            Cliente c = clienteDAO.buscarPorId(idcliente);
            if (c != null) System.out.println("Encontrado: " + c.getNome() + " - " + c.getEmail());
            else System.out.println(" Não encontrado.");
        } catch (SQLException e) { System.out.println(" Erro: " + e.getMessage()); }
    }

    private static void atualizarCliente() {
        int idcliente = lerInt("ID para atualizar: ");
        try {
            Cliente c = clienteDAO.buscarPorId(idcliente);
            if (c == null) return;
            c.setNome(lerString("Novo Nome (" + c.getNome() + "): ", c.getNome()));
            c.setCpf(lerString("Novo CPF (" + c.getCpf() + "): ", c.getCpf()));
            c.setEmail(lerString("Novo Email (" + c.getEmail() + "): ", c.getEmail()));
            clienteDAO.atualizarCliente(c);
            System.out.println("✅ Atualizado!");
        } catch (SQLException e) { System.out.println(" Erro: " + e.getMessage()); }
    }

    private static void deletarCliente() {
        int idcliente = lerInt("ID para deletar: ");
        try {
            clienteDAO.deletarCliente(idcliente);
            System.out.println("✅ Deletado!");
        } catch (SQLException e) { System.out.println(" Erro: " + e.getMessage()); }
    }

    // === MENU PRODUTO ===
    private static void menuProduto() {
        while (true) {
            System.out.println("\n📦 PRODUTOS");
            System.out.println("1 - Listar | 2 - Adicionar | 3 - Atualizar | 4 - Deletar | 0 - Voltar");
            int opcao = lerInt("Opção: ");
            switch (opcao) {
                case 1 -> listarProdutos();
                case 2 -> adicionarProduto();
                case 3 -> atualizarProduto();
                case 4 -> deletarProduto();
                case 0 -> { return; }
                default -> System.out.println(" Opção inválida!");
            }
        }
    }

    private static void listarProdutos() {
        try {
            produtoDAO.listarProdutos().forEach(p -> 
                System.out.printf("ID: %d | Nome: %s | Preço: R$%.2f | Qtd: %d%n", 
                p.getIdproduto(), p.getNomeproduto(), p.getPreco(), p.getQtd()));
        } catch (SQLException e) { System.out.println(" Erro: " + e.getMessage()); }
    }

    private static void adicionarProduto() {
        Produto p = new Produto();
        p.setNomeproduto(lerString("Nome do Produto: "));
        p.setPreco(lerDouble("Preço: "));
        p.setQtd(lerInt("Quantidade em Estoque: "));
        p.setCategoria(lerString("Categoria: "));
        try {
            produtoDAO.adicionarProduto(p);
            System.out.println("✅ Produto adicionado!");
        } catch (SQLException e) { System.out.println(" Erro: " + e.getMessage()); }
    }

    private static void atualizarProduto() {
        int idproduto = lerInt("ID do Produto: ");
        try {
            // Como seu ProdutoDAO não tem buscarPorId, listamos e filtramos ou pedimos dados novos
            Produto p = new Produto();
            p.setIdproduto(idproduto);
            p.setNomeproduto(lerString("Novo Nome: "));
            p.setPreco(lerDouble("Novo Preço: "));
            p.setQtd(lerInt("Nova Qtd: "));
            p.setCategoria(lerString("Nova Categoria: "));
            produtoDAO.atualizarProduto(p);
            System.out.println("✅ Produto atualizado!");
        } catch (SQLException e) { System.out.println(" Erro: " + e.getMessage()); }
    }

    private static void deletarProduto() {
        int idproduto = lerInt("ID do Produto: ");
        try {
            produtoDAO.deletarProduto(idproduto);
            System.out.println("✅ Produto removido!");
        } catch (SQLException e) { System.out.println(" Erro: " + e.getMessage()); }
    }

    // === MENU PEDIDO ===
    private static void menuPedido() {
        while (true) {
            System.out.println("\n🛒 PEDIDOS");
            System.out.println("1 - Listar | 2 - Novo Pedido | 3 - Deletar | 0 - Voltar");
            int opcao = lerInt("Opção: ");
            switch (opcao) {
                case 1 -> listarPedidos();
                case 2 -> adicionarPedido();
                case 3 -> deletarPedido();
                case 0 -> { return; }
                default -> System.out.println(" Opção inválida!");
            }
        }
    }

    private static void listarPedidos() {
        try {
            pedidoDAO.listar().forEach(System.out::println);
        } catch (SQLException e) { System.out.println(" Erro: " + e.getMessage()); }
    }

    private static void adicionarPedido() {
        try {
            Pedido p = new Pedido();
            p.setIdcliente(lerInt("ID do Cliente: "));
            p.setIdproduto(lerInt("ID do Produto: "));
            p.setQtd(lerInt("Quantidade: "));
            p.setTotal(lerDouble("Valor Total: "));
            p.setData(new Date()); // Data atual
            
            pedidoDAO.adicionar(p);
            System.out.println("✅ Pedido realizado! ID: " + p.getIdpedido());
        } catch (SQLException e) { System.out.println(" Erro: " + e.getMessage()); }
    }

    private static void deletarPedido() {
        int idpedido = lerInt("ID do Pedido: ");
        try {
            pedidoDAO.deletar(idpedido);
            System.out.println("✅ Pedido cancelado/deletado!");
        } catch (SQLException e) { System.out.println(" Erro: " + e.getMessage()); }
    }

    // === UTILITÁRIOS DE LEITURA (CORRIGIDOS) ===
    private static int lerInt(String mensagem) {
        while (true) {
            try {
                System.out.print(mensagem);
                return Integer.parseInt(scanner.nextLine());
            } catch (NumberFormatException e) {
                System.out.println(" Digite um número inteiro válido.");
            }
        }
    }

    private static double lerDouble(String mensagem) {
        while (true) {
            try {
                System.out.print(mensagem);
                return Double.parseDouble(scanner.nextLine());
            } catch (NumberFormatException e) {
                System.out.println(" Digite um valor decimal válido (ex: 10.5).");
            }
        }
    }

    private static String lerString(String mensagem) {
        System.out.print(mensagem);
        return scanner.nextLine();
    }

    private static String lerString(String mensagem, String valorPadrao) {
        System.out.print(mensagem);
        String input = scanner.nextLine();
        return input.trim().isEmpty() ? valorPadrao : input;
    }
}