const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());

app.get('/produto', (req, res) => {
  res.send('Chamada de GET (todos) realizada com sucesso! Lista de produtos retornada.');
});

app.get('/produto/:id', (req, res) => {
  const { id } = req.params;
  res.send(`Chamada de GET (por ID) realizada com sucesso! Produto ID: ${id}`);
});

app.post('/produto', (req, res) => {
  const dados = req.body;
  res.send(`Chamada de POST realizada com sucesso! Produto criado: ${JSON.stringify(dados)}`);
});

app.put('/produto/:id', (req, res) => {
  const { id } = req.params;
  const dados = req.body;
  res.send(`Chamada de PUT realizada com sucesso! Produto ID: ${id}, Dados atualizados: ${JSON.stringify(dados)}`);
});

app.patch('/produto/:id', (req, res) => {
  const { id } = req.params;
  const dados = req.body;
  res.send(`Chamada de PATCH realizada com sucesso! Produto ID: ${id}, Campos alterados: ${JSON.stringify(dados)}`);
});

app.delete('/produto/:id', (req, res) => {
  const { id } = req.params;
  res.send(`Chamada de DELETE realizada com sucesso! Produto removido: ${id}`);
});

app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
