SELECT * 
FROM vendedores
WHERE salario_vendedor BETWEEN 1800 AND 2000;

SELECT nome_vendedor, faixa_comi_vendedor
FROM vendedores
WHERE salario_vendedor BETWEEN 1800 AND 2000;

SELECT nome_vendedor, faixa_comi_vendedor
FROM vendedores
WHERE salario_vendedor BETWEEN 1800 AND 2000
ORDER BY nome ASC; -- ASC = Acendente e DESC = Descendente

SELECT nome_vendedor, salario_vendedor
FROM vendedores
WHERE nome_vendedor BETWEEN 'Ana' AND 'Carlos'
ORDER BY salario_vendedor;

SELECT nome_vendedor, salario_vendedor, faixa_comi_vendedor
FROM vendedores
WHERE salario_vendedor BETWEEN 1800 AND 2000 OR salario_vendedor = 3500
ORDER BY nome_vendedor ASC;

