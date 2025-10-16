const express = require('express');
const app = express();
const PORT = 3000;

// 1. ROTA COM UM PARÂMETRO
app.get('/saudacao/:nome', (req, res) => {
  res.send(`Olá, ${req.params.nome}! Seja bem-vindo!`);
});

// 2. ROTA COM DOIS PARÂMETROS - Soma
app.get('/soma/:n1/:n2', (req, res) => {
  const n1 = parseFloat(req.params.n1);
  const n2 = parseFloat(req.params.n2);
  res.send(`${n1} + ${n2} = ${n1 + n2}`);
});

// 3. ROTA COM QUERY PARAMETERS
// Exemplo: /pesquisa?termo=javascript&autor=joao
app.get('/pesquisa', (req, res) => {
  const termo = req.query.termo || 'nenhum';
  const autor = req.query.autor || 'não especificado';
  res.send(`Pesquisa: ${termo} | Autor: ${autor}`);
});

// 4. ROTA COM PARÂMETRO E QUERY
// Exemplo: /perfil/maria?idade=25&cidade=saopaulo
app.get('/perfil/:nome', (req, res) => {
  const nome = req.params.nome;
  const idade = req.query.idade || 'não informada';
  const cidade = req.query.cidade || 'não informada';
  res.send(`Perfil: ${nome} | Idade: ${idade} | Cidade: ${cidade}`);
});

app.get('/ola', (req, res) => {
  res.send('Olá!');
});

// Rota com parâmetro - idioma específico
app.get('/ola/:idioma', (req, res) => {
  const idioma = req.params.idioma;
  const saudacoes = {
    portugues: 'Olá!',
    ingles: 'Hello!'
  };
  res.send(saudacoes[idioma] || 'Olá!');
});

app.get('/', (req, res) => {
  res.send('API V1');
});

app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});