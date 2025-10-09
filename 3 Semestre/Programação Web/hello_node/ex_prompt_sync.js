const prompt = require('prompt-sync')();

var nome = prompt('Digite seu nome: ');
var idade = prompt('Digite sua idade: ');
var idadeFutura = parseInt(idade) + 10;
console.log(`${nome}, em 10 anos sua idade será ${idadeFutura} anos`);