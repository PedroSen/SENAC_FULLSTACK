package teste;

public class Aluno {
	
	private String nome;
	private int idade;
	    
	public Aluno(String nome, int idade) {
		this.nome = nome;
		this.idade = idade;
		}
	    
	public String toString() { 
		return nome + " (" + idade + " anos)"; 
	}
	
}
