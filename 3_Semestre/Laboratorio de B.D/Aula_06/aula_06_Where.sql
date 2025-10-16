SELECT descricao, id
FROM produtos
WHERE unidade IN ('G', 'Kg');

SELECT descricao, id
FROM produtos
WHERE unidade = 'G' OR unidade = 'Kg'; 




