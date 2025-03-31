import java.util.Scanner;

public class Escola {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String prof;
		String aluno;
		double n1, n2, media;
		
		System.out.println("Qual o nome do Professor? ");
		prof = sc.next();
		
		System.out.println("Qual o nome do(a) aluno(a)? ");
		aluno = sc.next();
		
		System.out.println("Qual sua 1º Nota do Semestre?(Ex. 8,50) ");
		n1 = sc.nextDouble();
		
		System.out.println("Qual sua 2º Nota do Semestre?(Ex. 8,50) ");
		n2 = sc.nextDouble();
		
		media = (n1 + n2)  / 2;
		
		System.out.printf("\n");
		System.out.printf("-----1º Semestre-------");
		System.out.printf("\nAluno(a): %s", aluno);
		System.out.printf("\nNota 1: %.2f", n1);
		System.out.printf("\nNota 2: %.2f", n2);
		System.out.printf("\nMédia: %.2f", media);
		
		sc.close();
	}

}
