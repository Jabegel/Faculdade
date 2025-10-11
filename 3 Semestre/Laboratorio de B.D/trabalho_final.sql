/* 
NOMES E MATRICULAS:
1º - Iago Juan Sousa Moreira | UC24202165
2º - Ian Gomes Caixeta | UC24201511
3º - João Gabriel dos Santos Pereira | UC24201641
4º - Ramyne Fernandes Pessoa | Uc24202867

Indique se houve alterações na modelagem de dados:
(X) Sim. O arquivo atualizado foi enviado novamente no AVA. 
( ) Não.
*/

CREATE DATABASE IF NOT EXISTS ha_bit;

CREATE TABLE IF NOT EXISTS usuario (
id_usuario INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
data_nascimento DATE,
email VARCHAR(255) NOT NULL UNIQUE,
senha VARCHAR(255),
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
nome VARCHAR(255) NOT NULL,
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

CREATE TABLE IF NOT EXISTS habito_usuario(
id_habito_usuario INT NOT NULL AUTO_INCREMENT,
id_habito INT NOT NULL,
id_usuario INT NOT NULL,
PRIMARY KEY (id_habito_usuario),
FOREIGN KEY (id_habito) REFERENCES habito (id_habito),
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

CREATE TABLE IF NOT EXISTS habito (
id_habito INT NOT NULL AUTO_INCREMENT,
id_usuario INT NOT NULL,
id_categoria INT NOT NULL,
id_frequencia INT NOT NULL,
nome VARCHAR(255) NOT NULL,
data_criacao DATE,
meta TEXT,
descricao TEXT,
icone VARCHAR(255) NOT NULL,
cor VARCHAR(7) NOT NULL,
PRIMARY KEY (id_habito),
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
FOREIGN KEY (id_frequencia) REFERENCES frequencia (id_frequencia)
);

CREATE TABLE IF NOT EXISTS notificacao (
id_notificacao INT NOT NULL AUTO_INCREMENT,
id_habito INT NOT NULL,
horario TEXT,
mensagem VARCHAR(255),
ativo TINYINT NOT NULL,
recorencia VARCHAR(255),
PRIMARY KEY (id_notificação),
FOREIGN KEY (id_habito) REFERENCES habito (id_habito)
);

CREATE TABLE IF NOT EXISTS frequencia (
id_frequencia INT NOT NULL AUTO_INCREMENT,
sequencia TINYINT NOT NULL,
PRIMARY KEY (id_frequencia)
);