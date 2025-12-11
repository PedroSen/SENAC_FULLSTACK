package aula3;

import aula3.Funcionarios;

public class Main {
	private double desconto;
	private double liquido;
	
	public void calculoLiquido(Funcionarios s) {
		desconto = 0.15 * s.getSalario();
		liquido = s.getSalario() - desconto;
	}
	
	public double getDesconto() {
		return desconto;
	}
	
	public double getLiquido() {
		return liquido;
	}
	
	public static void main(String[] args) {
		Funcionarios p1 = new Funcionarios("João", 3500.00);
		Funcionarios f2 = new Funcionarios("Maria", 2000.00);
		Funcionarios f3 = new Funcionarios("José", 6500.00);
		
		System.out.println("Desconto: " + "Salário Líquido: R$ " + carrinho.getTotal());
	}
}
