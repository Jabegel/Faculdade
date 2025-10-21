/* 
NOMES E MATRICULAS:
1º - Iago Juan Sousa Moreira | UC24202165
2º - Ian Gomes Caixeta | UC24201511
3º - João Gabriel dos Santos Pereira | UC24201641
4º - Ramyne Fernandes Pessoa | Uc24202867

Indique se houve alterações na modelagem de dados:
( ) Sim. O arquivo atualizado foi enviado novamente no AVA. 
(X) Não.
*/

CREATE DATABASE IF NOT EXISTS ha_bit;

CREATE TABLE IF NOT EXISTS usuario (
id_usuario INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(250) NOT NULL,
data_nascimento DATE,
email VARCHAR(250) NOT NULL UNIQUE,
senha VARCHAR(250),
PRIMARY KEY (id_usuario)
);

CREATE TABLE IF NOT EXISTS usuario_consquista (
id_usuario_conquista INT NOT NULL AUTO_INCREMENT,
id_usuario INT NOT NULL,
id_conquista INT NOT NULL,
PRIMARY KEY (id_usuario_conquista),
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
FOREIGN KEY (id_conquista) REFERENCES conquista (id_conquista)
);

CREATE TABLE IF NOT EXISTS consquista (
id_consquista INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(250) NOT NULL,
descricao TEXT,
recompensa INT NOT NULL,
data_conquista DATE NOT NULL,
criador VARCHAR(255) NOT NULL,
tipo_conquista VARCHAR(255) NOT NULL,
PRIMARY KEY (id_usuario)
);

CREATE TABLE IF NOT EXISTS perfil (
id_perfil INT NOT NULL AUTO_INCREMENT,
id_usuario INT NOT NULL UNIQUE,
foto VARCHAR(255),
bio TEXT,
data_criacao DATE
);