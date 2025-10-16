const express = require('express');
const app = express();
const PORT = 3000;

app.use(express.json());

// Array de produtos
let produtos = [
  { id: 1, nome: 'Notebook quase...', preco: 3500, emEstoque: true },
  { id: 2, nome: 'Mouse aceitável', preco: 150, emEstoque: false },
  { id: 3, nome: 'Teclado bom', preco: 450, emEstoque: true },
  { id: 4, nome: 'Monitor consigo ver', preco: 800, emEstoque: false },
  { id: 5, nome: 'Webcam difícil de ver', preco: 280, emEstoque: true }
];

let proximoId = 6;

app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  next();
});


app.get('/produtos', (req, res) => {
  res.json({
    total: produtos.length,
    produtos: produtos
  });
});


app.get('/produtos/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const produto = produtos.find(p => p.id === id);
  
  if (produto) {
    res.json(produto);
  } else {
    res.status(404).json({ erro: 'Produto não encontrado' });
  }
});


app.post('/produtos', (req, res) => {
  const novoProduto = {
    id: proximoId++,
    nome: req.body.nome,
    preco: req.body.preco,
    emEstoque: req.body.emEstoque
  };
  
  produtos.push(novoProduto);
  
  res.status(201).json({
    mensagem: 'Produto criado com sucesso',
    produto: novoProduto
  });
});

app.put('/produtos/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const index = produtos.findIndex(p => p.id === id);
  
  if (index !== -1) {
    produtos[index] = {
      id: id,
      nome: req.body.nome,
      preco: req.body.preco,
      emEstoque: req.body.emEstoque
    };
    
    res.json({
      mensagem: 'Produto atualizado com sucesso',
      produto: produtos[index]
    });
  } else {
    res.status(404).json({ erro: 'Produto não encontrado' });
  }
});

app.patch('/produtos/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const index = produtos.findIndex(p => p.id === id);
  
  if (index !== -1) {
    produtos[index] = { ...produtos[index], ...req.body, id: id };
    
    res.json({
      mensagem: 'Produto atualizado parcialmente',
      produto: produtos[index]
    });
  } else {
    res.status(404).json({ erro: 'Produto não encontrado' });
  }
});

app.delete('/produtos/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const index = produtos.findIndex(p => p.id === id);
  
  if (index !== -1) {
    const produtoRemovido = produtos[index];
    produtos.splice(index, 1);
    
    res.json({
      mensagem: 'Produto removido com sucesso',
      produto: produtoRemovido
    });
  } else {
    res.status(404).json({ erro: 'Produto não encontrado' });
  }
});

app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});