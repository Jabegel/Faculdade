CREATE DATABASE IF NOT EXISTS aula_03_sistema_loja;

USE aula_03_sistema_loja;

CREATE TABLE IF NOT EXISTS cliente (
 cod_cliente INT NOT NULL,
 nome_cliente VARCHAR(100) NOT NULL,
 endereco_cliente VARCHAR(250) NOT NULL,
 cidade_cliente VARCHAR(250) NOT NULL,
 cep_cliente CHAR(8),
 uf_cliente CHAR(2) NOT NULL,
 cnpj_cliente CHAR (14) NOT NULL UNIQUE,
 ie_cliente CHAR(9),
 PRIMARY KEY(cod_cliente)
);

CREATE TABLE IF NOT EXISTS vendedores (
cod_vendedor INT,
nome_vendedor CHAR(50),
salario_vendedor DOUBLE(7,2),
faixa_comi_vendedor ENUM('A', 'B', 'C'),
PRIMARY KEY(cod_vendedor)
);

CREATE TABLE IF NOT EXISTS pedido(
numero_pedido INT NOT NULL,
prazo_entrega_pedido INT NOT NULL,
cod_cliente INT,
cod_vendedor INT,
PRIMARY KEY(numero_pedido),
FOREIGN KEY (cod_cliente) REFERENCES cliente (cod_cliente),
FOREIGN KEY (cod_vendedor) REFERENCES vendedores (cod_vendedor)
);

CREATE TABLE IF NOT EXISTS produto (
cod_produto INT NOT NULL,
uni_produto VARCHAR(5) NOT NULL,
descri_produto VARCHAR(50) NOT NULL,
valor_uni_produto DOUBLE(5,2) NOT NULL,
PRIMARY KEY (cod_produto)
);

CREATE TABLE IF NOT EXISTS item_pedido (
numero_pedido INT,
cod_produto INT,
qnt INT(4) NOT NULL,
PRIMARY KEY (numero_pedido, cod_produto),
FOREIGN KEY (numero_pedido) REFERENCES pedido (numero_pedido),
FOREIGN KEY (cod_produto) REFERENCES produto (cod_produto)
);