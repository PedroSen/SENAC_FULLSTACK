package aula3;

public class Main {
	
	public static void main(String[] args) {
		Funcionarios f1 = new Funcionarios("João", 3500.00);
		Funcionarios f2 = new Funcionarios("Maria", 2000.00);
		Funcionarios f3 = new Funcionarios("José", 6500.00);
		
		System.out.println("Desconto de João: R$ " + f1.getSalario() * 0.15 + ". Salário Líquido de João: R$ " + (f1.getSalario() - f1.getSalario() * 0.15));
		System.out.println("Desconto de Maria: R$ " + f2.getSalario() * 0.15 + ". Salário Líquido de Maria: R$ " + (f2.getSalario() - f2.getSalario() * 0.15));
		System.out.println("Desconto de José: R$ " + f3.getSalario() * 0.15 + ". Salário Líquido de José: R$ " + (f3.getSalario() - f3.getSalario() * 0.15));
	}
}
