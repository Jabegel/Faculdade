USE aula_3_sistema_loja;

UPDATE clientes
SET nome = 'Ana'
WHERE cod = 5;

UPDATE clientes
SET nome = 'Julia', cidade = 'Brasília', uf = 'DF'
WHERE cd = 5;

UPDATE clientes
SET cep = '75120120'
WHERE cod = 5;

DELETE FROM cliente
WHERE cod_cliente = 6;