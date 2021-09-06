#define N 100
char stack[N];
int t;

char pop (void) {
   return pilha[--t];
}

void push (char y) {
   pilha[t++] = y;
}

char *infixaParaPosfixa (char *inf) {
   int n = strlen (inf);
   char *posf; 
   posf = malloc ((n+1) * sizeof (char));
   push (inf[0]);       // empilha '('

   int j = 0;
   for (int i = 1; inf[i] != '\0'; ++i) {
      switch (inf[i]) {
         char x;
         case '(': push (inf[i]);
                   break;
         case ')': x = pop ();
                   while (x != '(') {
                      posf[j++] = x;
                      x = pop ();
                   }
                   break;
         case '+': 
         case '-': x = pop ();
                   while (x != '(') {
                      posf[j++] = x;
                      x = pop ();
                   }
                   push (x);
                   push (inf[i])
                   break;
         case '*':
         case '/': x = pop ();
                   while (x != '(' && x != '+' && x != '-') {
                      posf[j++] = x;
                      x = pop ();
                   }
                   push (x);
                   push (inf[i]);
                   break;
         default:  posf[j++] = inf[i];
      }
   }
   posf[j] = '\0';      
   return posf;
}

int main(int argc, char *argv[])
{
    for (int i = 0; i<3; i++){
        infixaParaPosfixa(argv[i]);
    }
    
}
