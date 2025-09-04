
import java.util.Scanner;

public class Empresa {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		String mesa;
		String pedido1, pedido2;
		double valor1, valor2,valortotal;
		int qtd1, qtd2;

		System.out.println("Qual o número da mesa? ");
		mesa = sc.next();
		
		System.out.println("Qual seu pedido?");
		System.out.println("Qual Produto: ");
		pedido1 = sc.next();
		
		System.out.println("Qual o Valor: R$ ");
		valor1 = sc.nextDouble();
		
		System.out.println("Quantos(as)? ");
		qtd1 = sc.nextInt();
		System.out.printf("\n");
		
		System.out.println("Qual seu outro Pedido?");
		System.out.println("Qual Produto: ");
		pedido2 = sc.next();
		
		System.out.println("Qual o Valor: R$ ");
		valor2 = sc.nextDouble();
		
		System.out.println("Quantos(as)? ");
		qtd2 = sc.nextInt();
		
		valortotal = (valor1 * qtd1) + (valor2 * qtd2);
		
		System.out.println("------------------PEDIDO TOTAL-----------------");
		System.out.printf("                     Mesa: %s", mesa);
		System.out.printf("\n1º Pedido: %s --- R$ %.2f ---- Qtd: %d", pedido1,valor1,qtd1);
		System.out.printf("\n2º Pedido: %s --- R$ %.2f ---- Qtd: %d", pedido2,valor2,qtd2);
		System.out.println("\n---------------------------------------------");
		System.out.printf("Valor Total do Pedido é R$ %.2f", valortotal);
		
		
		sc.close();
	}

}
