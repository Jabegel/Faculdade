const express = require('express');
const Database = require('better-sqlite3');
const app = express();
const PORT = 3000;

app.use(express.json());

// Conectar ao banco de dados SQLite
const db = new Database('produtos.db');

// Criar tabela se não existir
db.exec(`
  CREATE TABLE IF NOT EXISTS produtos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    preco REAL NOT NULL,
    emEstoque INTEGER NOT NULL
  )
`);

// Inserir dados iniciais (apenas se a tabela estiver vazia)
const count = db.prepare('SELECT COUNT(*) as total FROM produtos').get();
if (count.total === 0) {
  const insert = db.prepare('INSERT INTO produtos (nome, preco, emEstoque) VALUES (?, ?, ?)');
  
  insert.run('Notebook quase...', 3500, 1);
  insert.run('Mouse aceitável', 150, 0);
  insert.run('Teclado bom', 450, 1);
  insert.run('Monitor consigo ver', 800, 0);
  insert.run('Webcam difícil de ver', 280, 1);
  
  console.log('Dados iniciais inseridos no banco de dados');
}

app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE');
  res.header('Access-Control-Allow-Headers', 'Content-Type');
  next();
});

// LIST - Listar todos os produtos
app.get('/produtos', (req, res) => {
  try {
    const produtos = db.prepare('SELECT * FROM produtos').all();
    
    // Converter emEstoque de INTEGER para BOOLEAN
    const produtosFormatados = produtos.map(p => ({
      ...p,
      emEstoque: p.emEstoque === 1
    }));
    
    res.json({
      total: produtosFormatados.length,
      produtos: produtosFormatados
    });
  } catch (error) {
    res.status(500).json({ erro: 'Erro ao buscar produtos: ' + error.message });
  }
});

// READ - Buscar produto por ID
app.get('/produtos/:id', (req, res) => {
  try {
    const id = parseInt(req.params.id);
    const produto = db.prepare('SELECT * FROM produtos WHERE id = ?').get(id);
    
    if (produto) {
      produto.emEstoque = produto.emEstoque === 1;
      res.json(produto);
    } else {
      res.status(404).json({ erro: 'Produto não encontrado' });
    }
  } catch (error) {
    res.status(500).json({ erro: 'Erro ao buscar produto: ' + error.message });
  }
});

// CREATE - Criar novo produto
app.post('/produtos', (req, res) => {
  try {
    const { nome, preco, emEstoque } = req.body;
    const emEstoqueInt = emEstoque ? 1 : 0;
    
    const insert = db.prepare('INSERT INTO produtos (nome, preco, emEstoque) VALUES (?, ?, ?)');
    const result = insert.run(nome, preco, emEstoqueInt);
    
    const novoProduto = {
      id: result.lastInsertRowid,
      nome,
      preco,
      emEstoque
    };
    
    res.status(201).json({
      mensagem: 'Produto criado com sucesso',
      produto: novoProduto
    });
  } catch (error) {
    res.status(500).json({ erro: 'Erro ao criar produto: ' + error.message });
  }
});

// UPDATE - Atualizar produto completo
app.put('/produtos/:id', (req, res) => {
  try {
    const id = parseInt(req.params.id);
    const { nome, preco, emEstoque } = req.body;
    const emEstoqueInt = emEstoque ? 1 : 0;
    
    const update = db.prepare('UPDATE produtos SET nome = ?, preco = ?, emEstoque = ? WHERE id = ?');
    const result = update.run(nome, preco, emEstoqueInt, id);
    
    if (result.changes > 0) {
      res.json({
        mensagem: 'Produto atualizado com sucesso',
        produto: { id, nome, preco, emEstoque }
      });
    } else {
      res.status(404).json({ erro: 'Produto não encontrado' });
    }
  } catch (error) {
    res.status(500).json({ erro: 'Erro ao atualizar produto: ' + error.message });
  }
});

// UPDATE PARCIAL - Atualizar apenas campos específicos
app.patch('/produtos/:id', (req, res) => {
  try {
    const id = parseInt(req.params.id);
    
    // Buscar produto atual
    const produtoAtual = db.prepare('SELECT * FROM produtos WHERE id = ?').get(id);
    
    if (!produtoAtual) {
      return res.status(404).json({ erro: 'Produto não encontrado' });
    }
    
    // Mesclar dados atuais com novos dados
    const nome = req.body.nome !== undefined ? req.body.nome : produtoAtual.nome;
    const preco = req.body.preco !== undefined ? req.body.preco : produtoAtual.preco;
    const emEstoque = req.body.emEstoque !== undefined ? (req.body.emEstoque ? 1 : 0) : produtoAtual.emEstoque;
    
    const update = db.prepare('UPDATE produtos SET nome = ?, preco = ?, emEstoque = ? WHERE id = ?');
    update.run(nome, preco, emEstoque, id);
    
    res.json({
      mensagem: 'Produto atualizado parcialmente',
      produto: { id, nome, preco, emEstoque: emEstoque === 1 }
    });
  } catch (error) {
    res.status(500).json({ erro: 'Erro ao atualizar produto: ' + error.message });
  }
});

// DELETE - Remover produto
app.delete('/produtos/:id', (req, res) => {
  try {
    const id = parseInt(req.params.id);
    
    // Buscar produto antes de deletar
    const produto = db.prepare('SELECT * FROM produtos WHERE id = ?').get(id);
    
    if (!produto) {
      return res.status(404).json({ erro: 'Produto não encontrado' });
    }
    
    const deleteStmt = db.prepare('DELETE FROM produtos WHERE id = ?');
    deleteStmt.run(id);
    
    produto.emEstoque = produto.emEstoque === 1;
    
    res.json({
      mensagem: 'Produto removido com sucesso',
      produto: produto
    });
  } catch (error) {
    res.status(500).json({ erro: 'Erro ao remover produto: ' + error.message });
  }
});

app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
  console.log('Banco de dados: produtos.db');
});

// Fechar conexão ao encerrar o servidor
process.on('SIGINT', () => {
  db.close();
  console.log('\nBanco de dados fechado');
  process.exit(0);
});