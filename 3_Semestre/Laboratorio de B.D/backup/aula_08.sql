SELECT COUNT(*)
FROM clientes;

SELECT COUNT(*)
FROM produtos
WHERE valor_unitario < 0.5;

SELECT AVG(salario) AS media
FROM vendedores;

SELECT SUM(salario)
FROM vendedores
WHERE faixa_comissao IN ('A','B');

SELECT MAX(salario);

