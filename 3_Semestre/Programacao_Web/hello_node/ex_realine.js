var readline = require('readline');

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('Digite seu nome: ', function(nome) {
  rl.question('Digite sua idade: ', function(idade) {
    const idadeFutura = parseInt(idade) + 10;
    console.log(`${nome}, em 10 anos sua idade será ${idadeFutura} anos`);
    rl.close();
  });
});