import java.util.Scanner;

public class Classe4 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Digite o seu salário bruto: ");
        float bruto = scanner.nextFloat();
        
        System.out.println("Seu salário líquido é de " + (bruto - (0.1 * bruto)));
        scanner.close()
    }
}