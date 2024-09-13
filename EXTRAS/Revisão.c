/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
#include <stdio.h>

int main()
{

int weldes;
weldes =  7;

printf("Numero do Weldes e:%d\n", weldes);
scanf("%d",&weldes);
printf("Numero do Weldes e:%d\n", weldes);

weldes = 5%2;

printf("Resto do Número e:%d", weldes);

if(weldes >= 1 ){
printf("\nCondição testada e e verdadeira");
}
else {
printf("\nCondição testada e e falsa");
}

switch(weldes){
    case 0:
    printf("\nOla");
    break;
    
    case 1:
    printf("\nHi");
    break;
    
    case 2:
    printf("\nHolla");
    break;
    
    default:
    printf("\nTenta dnv");
    break;
    
}

for (int i=0; i < 5; i++){
    
    printf("\nO FOR e: %d",i);
    
}

int paulo = 0;

do { 
    printf("\n%d",paulo);
    paulo++;
} while (paulo <= 5);

return 0;
}
