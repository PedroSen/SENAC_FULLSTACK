package aula3;

public class Main2 {

	public static void main(String[] args) {
		Funcionario f1 = new Funcionario("João da Silva", 3500.00);
		Funcionario f2 = new Funcionario("Maria Pereira", 2000.00);
		Funcionario f3 = new Funcionario("José Silveira", 6500.00);
		
		System.out.println(f1.getData());
		System.out.println(f2.getData());
		System.out.println(f3.getData());
	}

}
