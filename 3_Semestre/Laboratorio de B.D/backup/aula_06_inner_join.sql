SELECT clientes.nome, pedidos.prazo_entrega
FROM clientes
INNER JOIN pedidos
ON clientes.id = pedidos.id_cliente;

SELECT clientes.nome, pedidos.prazo_entrega
FROM clientes
INNER JOIN pedidos
ON clientes.id = pedidos.id_cliente
WHERE pedidos.prazo_entrega > 20;

SELECT clientes.nome, pedidos.prazo_entrega
FROM clientes
INNER JOIN pedidos
ON clientes.id = pedidos.id_cliente
WHERE pedidos.prazo_entrega > 20
ORDER BY clientes.nome;
-- EU
SELECT vendedores.nome, pedidos.id, pedidos.prazo_entrega
FROM vendedores
INNER JOIN pedidos
ON vendedores.id = pedidos.id_vendedor;

-- Professora
SELECT vendedores.id, pedidos.id_vendedor, vendedores.nome, pedidos.prazo_entrega
FROM vendedores 
INNER JOIN pedidos
ON vendedores.id = pedidos.id_vendeor;

-- Professora abrevido
SELECT v.id, p.id_vendedor, v.nome, p.prazo_entrega
FROM vendedores AS v
INNER JOIN pedidos AS p
ON v.id = p.id_vendedor;

SELECT p.id, p.prazo_entrega, c.nome, v.nome
FROM pedidos AS p
INNER JOIN clientes AS c ON c.id = p.id_cliente
INNER JOIN vendedores AS v ON v.id = p.id_vendedor
WHERE v.nome = 'Carlos';


