package aula3;

public class Funcionario {
	public String nome;
	public double salario;
	
	public Funcionario(String nome, double salario) {
		this.nome = nome;
		this.salario = salario;
	}
	
	public double getSalario() {
		return salario;
	}
	
	public String getNome() {
		return nome;
	}
	
	public double calcDesconto() {
		double desconto = salario * 0.15;
		return desconto;
	}
	
	public double calcLiquido() {
		double liquido = salario - calcDesconto();
		return liquido;
	}
	
	public String getData() {
        return String.format("Funcionário: %s | Bruto: R$ %.2f | Desconto: R$ %.2f | Líquido: R$ %.2f", nome, salario, calcDesconto(), calcLiquido());
	}
}
