import { useState, useEffect } from 'react';

export default function ListaProdutos() {
  const [produtos, setProdutos] = useState([]);
  const [loading, setLoading] = useState(true);
  const [erro, setErro] = useState(null);

  useEffect(() => {
    buscarProdutos();
  }, []);

  const buscarProdutos = async () => {
    try {
      setLoading(true);
      const response = await fetch('http://localhost:3000/produtos');
      
      if (!response.ok) {
        throw new Error('Erro ao buscar produtos');
      }
      
      const data = await response.json();
      setProdutos(data.produtos || data);
      setErro(null);
    } catch (error) {
      setErro('Erro ao carregar produtos: ' + error.message);
      console.error('Erro:', error);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div>
        <p>Carregando produtos...</p>
      </div>
    );
  }

  if (erro) {
    return (
      <div>
        <p><strong>Erro!</strong></p>
        <p>{erro}</p>
        <button onClick={buscarProdutos}>Tentar novamente</button>
      </div>
    );
  }

  return (
    <div>
      <h1>Lista de Produtos</h1>
  
      {produtos.length === 0 ? (
        <p>Nenhum produto encontrado</p>
      ) : (
        <div>
          {produtos.map((produto) => (
            <div key={produto.id}>
              <hr />
              <h3>{produto.nome}</h3>
              <p>Status: {produto.emEstoque ? 'Em estoque' : 'Indisponível'}</p>
              <p>Preço: R$ {produto.preco.toFixed(2)}</p>
              <p>ID: {produto.id}</p>
            </div>
          ))}
        </div>
      )}

      <hr />
      <p>Total de produtos: <strong>{produtos.length}</strong></p>
    </div>
  );
}
