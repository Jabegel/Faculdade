const express = require('express');
const app = express();
const PORT = 3000;

const produtos = [
  { nome: 'Notebook quase...', preco: 3500, emEstoque: true },
  { nome: 'Mouse aceitável', preco: 150, emEstoque: false },
  { nome: 'Teclado bom', preco: 450, emEstoque: true },
  { nome: 'Monitor consigo ver"', preco: 800, emEstoque: false },
  { nome: 'Webcam difícil de ver', preco: 280, emEstoque: true }
];

app.get('/produtos', (req, res) => {
  res.json({
    total: produtos.length,
    produtos: produtos
  });
});

app.get('/nomes', (req, res) => {
  const nomes = produtos.map(produto => produto.nome);
  
  res.json({
    descricao: 'MAP: Retorna um novo array com apenas os nomes',
    resultado: nomes
  });
});

app.get('/disponiveis', (req, res) => {
  const disponiveis = produtos.filter(produto => produto.emEstoque === true);
  
  res.json({
    descricao: 'FILTER: Retorna apenas produtos em estoque',
    quantidade: disponiveis.length,
    resultado: disponiveis
  });
});

app.get('/indisponiveis', (req, res) => {
  const indisponiveis = produtos.filter(produto => produto.emEstoque === false);
  
  res.json({
    descricao: 'FILTER: Retorna apenas produtos fora de estoque',
    quantidade: indisponiveis.length,
    resultado: indisponiveis
  });
});

app.get('/valor-total', (req, res) => {
  const valorTotal = produtos.reduce((acumulador, produto) => {
    return acumulador + produto.preco;
  }, 0);
  
  const precoMedio = valorTotal / produtos.length;
  
  res.json({
    descricao: 'REDUCE: Soma todos os preços',
    valorTotal: `R$ ${valorTotal.toFixed(2)}`,
    precoMedio: `R$ ${precoMedio.toFixed(2)}`
  });
});

app.get('/buscar/:nome', (req, res) => {
  const nomeBusca = req.params.nome;
  const produtoEncontrado = produtos.find(produto => 
    produto.nome.toLowerCase().includes(nomeBusca.toLowerCase())
  );
  
  if (produtoEncontrado) {
    res.json({
      descricao: 'FIND: Retorna o primeiro produto encontrado',
      resultado: produtoEncontrado
    });
  } else {
    res.json({
      descricao: 'FIND: Produto não encontrado',
      resultado: null
    });
  }
});

app.get('/', (req, res) => {
  res.json({
    mensagem: 'API de Exemplos de Métodos de Array - Produtos',
    rotas: {
      '/produtos': 'Lista todos os produtos',
      '/nomes': 'MAP - Retorna apenas os nomes',
      '/disponiveis': 'FILTER - Retorna produtos em estoque',
      '/indisponiveis': 'FILTER - Retorna produtos fora de estoque',
      '/valor-total': 'REDUCE - Soma e média dos preços',
      '/buscar/:nome': 'FIND - Busca produto por nome'
    }
  });
});

app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});