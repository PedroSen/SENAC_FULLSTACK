import java.util.Scanner;

public class Classe2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Digite o valor de a: ");
        int a = scanner.nextInt();
        
        System.out.print("Digite o valor de b: ");
        int b = scanner.nextInt();
        
        System.out.println("Soma: " + (a + b));
        System.out.println("Subtração: " + (a - b));
        System.out.println("Multiplicação: " + (a * b));
        System.out.println("Divisão: " + (a / b));
        System.out.println("Média: " + ((a + b)/2.0));
    }
}