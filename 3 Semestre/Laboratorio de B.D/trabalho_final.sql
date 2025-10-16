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

USE ha_bit;

CREATE TABLE IF NOT EXISTS usuario (
id_usuario INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
data_nascimento DATE,
email VARCHAR(255) NOT NULL UNIQUE,
senha VARCHAR(255),
PRIMARY KEY (id_usuario)
);

CREATE TABLE IF NOT EXISTS conquista (
id_conquista INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
descricao TEXT,
recompensa INT NOT NULL,
data_conquista DATE NOT NULL,
criador VARCHAR(255) NOT NULL,
tipo_conquista VARCHAR(255) NOT NULL,
PRIMARY KEY (id_conquista)
);

CREATE TABLE IF NOT EXISTS usuario_conquista (
id_usuario_conquista INT NOT NULL AUTO_INCREMENT,
id_usuario INT NOT NULL,
id_conquista INT NOT NULL,
PRIMARY KEY (id_usuario_conquista),
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
FOREIGN KEY (id_conquista) REFERENCES conquista (id_conquista)
);

CREATE TABLE IF NOT EXISTS perfil (
id_perfil INT NOT NULL AUTO_INCREMENT,
id_usuario INT NOT NULL UNIQUE,
foto VARCHAR(255),
bio TEXT,
data_criacao DATE,
PRIMARY KEY (id_perfil),
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

CREATE TABLE IF NOT EXISTS frequencia (
id_frequencia INT NOT NULL AUTO_INCREMENT,
sequencia TINYINT NOT NULL,
PRIMARY KEY (id_frequencia)
);

CREATE TABLE IF NOT EXISTS categoria (
id_categoria INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL UNIQUE,
icone VARCHAR(255) NOT NULL,
cor CHAR(7) NOT NULL,
descricao TEXT,
PRIMARY KEY (id_categoria)
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

CREATE TABLE IF NOT EXISTS habito_usuario(
id_habito_usuario INT NOT NULL AUTO_INCREMENT,
id_habito INT NOT NULL,
id_usuario INT NOT NULL,
PRIMARY KEY (id_habito_usuario),
FOREIGN KEY (id_habito) REFERENCES habito (id_habito),
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);


CREATE TABLE IF NOT EXISTS notificacao (
id_notificacao INT NOT NULL AUTO_INCREMENT,
id_habito INT NOT NULL,
horario TIME,
mensagem VARCHAR(255),
ativo TINYINT NOT NULL,
recorrencia VARCHAR(255),
PRIMARY KEY (id_notificacao),
FOREIGN KEY (id_habito) REFERENCES habito (id_habito)
);

CREATE TABLE IF NOT EXISTS feito (
id_feito INT NOT NULL AUTO_INCREMENT,
id_habito INT NOT NULL,
data_feito DATE NOT NULL,
status_feito TINYINT NOT NULL,
observacao TEXT,
PRIMARY KEY (id_feito),
FOREIGN KEY (id_habito) REFERENCES habito (id_habito)
);

CREATE TABLE IF NOT EXISTS nota (
id_nota INT NOT NULL AUTO_INCREMENT,
data_nota DATE,
conteudo TEXT,
nome VARCHAR(255) NOT NULL,
anexar VARCHAR(255),
PRIMARY KEY (id_nota)
);

CREATE TABLE IF NOT EXISTS notas_habito (
id_notas_habito INT NOT NULL AUTO_INCREMENT,
id_nota INT NOT NULL,
id_habito INT NOT NULL,
PRIMARY KEY	(id_notas_habito),
FOREIGN KEY (id_nota) REFERENCES nota (id_nota),
FOREIGN KEY (id_habito) REFERENCES habito (id_habito)
);

-- 1) Usuarios (50)
INSERT INTO usuario (id_usuario, nome, data_nascimento, email, senha) VALUES
(1,'Miguel Oliveira','1995-03-12','miguel.oliveira@example.com','senhaMiguel01'),
(2,'Ana Silva','1998-07-23','ana.silva@example.com','senhaAna02'),
(3,'Lucas Ferreira','1992-11-05','lucas.ferreira@example.com','senhaLucas03'),
(4,'Mariana Costa','2000-01-17','mariana.costa@example.com','senhaMariana04'),
(5,'Gabriel Souza','1994-09-30','gabriel.souza@example.com','senhaGabriel05'),
(6,'Beatriz Santos','1996-05-11','beatriz.santos@example.com','senhaBeatriz06'),
(7,'Rafael Pereira','1990-12-02','rafael.pereira@example.com','senhaRafael07'),
(8,'Julia Rodrigues','1997-04-28','julia.rodrigues@example.com','senhaJulia08'),
(9,'Pedro Almeida','1993-08-14','pedro.almeida@example.com','senhaPedro09'),
(10,'Camila Gomes','1999-02-19','camila.gomes@example.com','senhaCamila10'),
(11,'Felipe Cardoso','1991-06-06','felipe.cardoso@example.com','senhaFelipe11'),
(12,'Larissa Nunes','1995-10-22','larissa.nunes@example.com','senhaLarissa12'),
(13,'Gustavo Rocha','1989-03-03','gustavo.rocha@example.com','senhaGustavo13'),
(14,'Sofia Martins','2001-07-07','sofia.martins@example.com','senhaSofia14'),
(15,'Thiago Lima','1992-12-21','thiago.lima@example.com','senhaThiago15'),
(16,'Marcos Barros','1988-04-09','marcos.barros@example.com','senhaMarcos16'),
(17,'Isabela Pinto','1996-09-02','isabela.pinto@example.com','senhaIsabela17'),
(18,'Rodrigo Castro','1993-01-30','rodrigo.castro@example.com','senhaRodrigo18'),
(19,'Patricia Moreira','1997-11-11','patricia.moreira@example.com','senhaPatricia19'),
(20,'André Azevedo','1990-05-25','andre.azevedo@example.com','senhaAndre20'),
(21,'Vanessa Lopes','1994-08-08','vanessa.lopes@example.com','senhaVanessa21'),
(22,'Fernando Reis','1987-10-02','fernando.reis@example.com','senhaFernando22'),
(23,'Clara Teixeira','2002-03-18','clara.teixeira@example.com','senhaClara23'),
(24,'Eduardo Menezes','1991-09-29','eduardo.menezes@example.com','senhaEduardo24'),
(25,'Rita Duarte','1995-06-13','rita.duarte@example.com','senhaRita25'),
(26,'Bruno Carvalho','1993-12-27','bruno.carvalho@example.com','senhaBruno26'),
(27,'Daniela Faria','1998-02-05','daniela.faria@example.com','senhaDaniela27'),
(28,'Mateus Ribeiro','1990-07-19','mateus.ribeiro@example.com','senhaMateus28'),
(29,'Aline Gomes','1996-11-01','aline.gomes@example.com','senhaAline29'),
(30,'Vitor Santana','1992-04-04','vitor.santana@example.com','senhaVitor30'),
(31,'Bianca Campos','1999-08-16','bianca.campos@example.com','senhaBianca31'),
(32,'Leandro Monteiro','1986-01-24','leandro.monteiro@example.com','senhaLeandro32'),
(33,'Carolina Rocha','1997-05-02','carolina.rocha@example.com','senhaCarolina33'),
(34,'Igor Lima','1994-03-09','igor.lima@example.com','senhaIgor34'),
(35,'Daniel Souza','1991-11-15','daniel.souza@example.com','senhaDaniel35'),
(36,'Laura Ribeiro','1998-06-21','laura.ribeiro@example.com','senhaLaura36'),
(37,'Bruna Alves','1993-09-03','bruna.alves@example.com','senhaBruna37'),
(38,'Alex Silva','1990-02-14','alex.silva@example.com','senhaAlex38'),
(39,'Yasmin Costa','1995-12-10','yasmin.costa@example.com','senhaYasmin39'),
(40,'Mauricio Pires','1989-07-26','mauricio.pires@example.com','senhaMauricio40'),
(41,'Cecilia Borges','1996-10-30','cecilia.borges@example.com','senhaCecilia41'),
(42,'Hugo Nascimento','1992-01-08','hugo.nascimento@example.com','senhaHugo42'),
(43,'Marina Duarte','1994-05-06','marina.duarte@example.com','senhaMarina43'),
(44,'Pablo Freitas','1991-03-31','pablo.freitas@example.com','senhaPablo44'),
(45,'Sabrina Rocha','1997-09-12','sabrina.rocha@example.com','senhaSabrina45'),
(46,'Otávio Lima','1988-11-23','otavio.lima@example.com','senhaOtavio46'),
(47,'Nicole Batista','2000-02-02','nicole.batista@example.com','senhaNicole47'),
(48,'Ruan Alves','1993-08-01','ruan.alves@example.com','senhaRuan48'),
(49,'Helena Marques','1995-04-12','helena.marques@example.com','senhaHelena49'),
(50,'Samuel Prado','1990-06-17','samuel.prado@example.com','senhaSamuel50');

-- 2) Categoria (50)
INSERT INTO categoria (id_categoria, nome, icone, cor, descricao) VALUES
(1,'Saúde','heart','️#e74c3c','Hábitos relacionados à saúde física e mental'),
(2,'Exercício','running','️#27ae60','Atividades físicas regulares'),
(3,'Meditação','spa','️#8e44ad','Práticas de atenção plena e meditação'),
(4,'Leitura','book','️#3498db','Hábitos de leitura diária ou semanal'),
(5,'Estudo','school','️#f1c40f','Rotina de estudos e aprendizado'),
(6,'Alimentação','utensils','️#e67e22','Hábitos alimentares saudáveis'),
(7,'Sono','bed','️#2ecc71','Rotina de sono e higiene do sono'),
(8,'Produtividade','clock','️#34495e','Hábitos para aumentar foco e produtividade'),
(9,'Finanças','piggy-bank','️#16a085','Controle e planejamento financeiro'),
(10,'Lazer','gamepad','️#9b59b6','Atividades de lazer e tempo livre'),
(11,'Hidratação','tint','️#1abc9c','Beber água regularmente'),
(12,'Higiene','soap','️#d35400','Higiene pessoal diária'),
(13,'Organização','boxes','️#7f8c8d','Organizar espaço e tarefas'),
(14,'Criatividade','palette','️#c0392b','Atividades criativas'),
(15,'Aprendizado','lightbulb','️#f39c12','Aprender novas habilidades'),
(16,'Trabalho','briefcase','️#2c3e50','Rotina de trabalho e tarefas profissionais'),
(17,'Social','users','️#e84393','Interações e relacionamentos sociais'),
(18,'Família','family','️#6ab04c','Atividades voltadas à família'),
(19,'Limpeza','broom','️#00b894','Limpeza e manutenção do lar'),
(20,'Caminhada','walking','️#00cec9','Caminhadas regulares'),
(21,'Yoga','om','️#74b9ff','Prática de yoga'),
(22,'Corrida','running-fast','️#ff7675','Treino de corrida'),
(23,'Alongamento','hand-rock','️#55efc4','Rotina de alongamentos'),
(24,'Respiração','wind','️#00a8ff','Exercícios respiratórios'),
(25,'Diário','journal','️#ffbe76','Escrever diário / journaling'),
(26,'Idioma','language','️#6d214f','Estudo de língua estrangeira'),
(27,'Música','music','️#4834d4','Prática musical'),
(28,'Pintura','brush','️#f0932b','Atividades artísticas'),
(29,'Jardinagem','leaf','️#badc58','Cuidar de plantas e jardim'),
(30,'Nutrição','apple-alt','️#2f3542','Planejamento de refeições'),
(31,'Economia','chart-line','️#3742fa','Acompanhamento de investimentos'),
(32,'Reciclagem','recycle','️#7bed9f','Hábitos sustentáveis'),
(33,'Voluntariado','hands-helping','️#e056fd','Ações de voluntariado'),
(34,'Programação','code','️#6ab04c','Prática de programação'),
(35,'Gestão do tempo','stopwatch','️#2f3542','Técnicas de gestão do tempo'),
(36,'Minimalismo','boxes-open','️#a29bfe','Desapego e organização minimalista'),
(37,'Gratidão','gift','️#f9ca24','Prática de gratidão diária'),
(38,'Planejamento','clipboard','️#22a6b3','Planejar a semana / mês'),
(39,'Higiene dental','tooth','️#ff7979','Cuidados com a saúde bucal'),
(40,'Postura','chair','️#30336b','Exercícios para postura'),
(41,'Redução de telas','mobile-alt','️#b71540','Limitar uso de telas'),
(42,'Café sem açúcar','coffee','️#cd6155','Reduzir açúcar no café'),
(43,'Desafio 30 dias','calendar-alt','️#45aaf2','Desafios com rotina de 30 dias'),
(44,'Hábito verde','seedling','️#20bf6b','Atitudes ambientais'),
(45,'Foco','bullseye','️#eb3b5a','Sessões de foco intenso'),
(46,'Revisão semanal','repeat','️#fa8231','Revisão das tarefas semanalmente'),
(47,'Autocuidado','hands','️#f6e58d','Atos de cuidado pessoal'),
(48,'Culinária','utensil-spoon','️#f9ca24','Prática de cozinhar receitas'),
(49,'Estudo breve','stopwatch-20','️#58b19f','Micro-estudos diários'),
(50,'Networking','handshake','️#6f1e51','Construir rede de contatos');

-- 3) Frequencia (50) => sequencia campo numérico (ex.: 1 = diária, etc.)
INSERT INTO frequencia (id_frequencia, sequencia) VALUES
(1,1),(2,2),(3,3),(4,4),(5,7),
(6,14),(7,30),(8,1),(9,2),(10,7),
(11,1),(12,3),(13,7),(14,1),(15,30),
(16,1),(17,7),(18,14),(19,1),(20,7),
(21,1),(22,1),(23,7),(24,1),(25,30),
(26,7),(27,14),(28,1),(29,7),(30,30),
(31,1),(32,7),(33,1),(34,14),(35,7),
(36,1),(37,7),(38,14),(39,1),(40,7),
(41,1),(42,30),(43,1),(44,7),(45,1),
(46,7),(47,14),(48,1),(49,7),(50,30);

-- 4) Conquista (50)
INSERT INTO conquista (id_conquista, nome, descricao, recompensa, data_conquista, criador, tipo_conquista) VALUES
(1,'Primeiro hábito completado','Completar um hábito pela primeira vez',10,'2025-01-10','Sistema','Pessoal'),
(2,'7 dias seguidos','Completar um hábito por 7 dias consecutivos',50,'2025-02-01','Sistema','Desafio'),
(3,'30 dias consistentes','Completar um hábito por 30 dias',200,'2025-03-05','Sistema','Maratona'),
(4,'Manhã produtiva','Realizar rotinas matinais por 15 dias',75,'2025-04-01','Equipe','Rotina'),
(5,'Leitor iniciante','Ler 5 livros',100,'2025-02-20','Equipe','Meta'),
(6,'Hidratação contínua','Beber 2L de água por 7 dias',40,'2025-05-06','Sistema','Saúde'),
(7,'Primeira nota','Criar a primeira nota no app',5,'2025-01-15','Sistema','Social'),
(8,'Organização semanal','Fazer planejamento semanal 4 vezes',80,'2025-06-10','Equipe','Produtividade'),
(9,'30 minutos de exercício','Completar 30 minutos de exercício 10 vezes',90,'2025-03-20','Equipe','Saúde'),
(10,'Desafio sem açúcar','7 dias sem açúcar',60,'2025-04-12','Sistema','Saúde'),
(11,'Voluntário','Participar de 1 ação voluntária',120,'2025-05-22','Parceiro','Social'),
(12,'Café saudável','Reduzir açúcar no café por 14 dias',25,'2025-03-30','Sistema','Saúde'),
(13,'Maratona de leitura','Ler todos os dias por 21 dias',150,'2025-07-01','Equipe','Leitura'),
(14,'Hábito verde','Fazer reciclagem por 10 semanas',110,'2025-08-03','Parceiro','Sustentabilidade'),
(15,'Aprendiz','Completar 20 horas de estudo',160,'2025-06-21','Equipe','Aprendizado'),
(16,'Diário fiel','Escrever no diário 30 dias',140,'2025-09-11','Sistema','Autocuidado'),
(17,'Postura ok','Exercícios de postura por 14 dias',45,'2025-02-25','Equipe','Saúde'),
(18,'Maratona de programação','Resolver 15 desafios de código',300,'2025-05-18','Parceiro','Profissional'),
(19,'3 idiomas','Praticar 3 idiomas por 7 dias cada',220,'2025-06-30','Equipe','Aprendizado'),
(20,'Revisão mês','Fazer revisão semanal todo mês por 3 meses',130,'2025-07-15','Sistema','Produtividade'),
(21,'Recompensa financeira','Economizar por 3 meses',500,'2025-10-01','Equipe','Finanças'),
(22,'Desafio 30 dias','Concluir um desafio de 30 dias',250,'2025-08-20','Sistema','Desafio'),
(23,'Corrida 5k','Completar corrida 5km',90,'2025-03-14','Parceiro','Saúde'),
(24,'Aula de música','Praticar instrumento 20 vezes',110,'2025-04-05','Equipe','Criatividade'),
(25,'Horta em casa','Criar uma horta',150,'2025-05-02','Parceiro','Lazer'),
(26,'Sem tela antes de dormir','14 noites sem tela',70,'2025-06-17','Sistema','Bem-estar'),
(27,'Semana produtiva','Alcançar metas semanais 8 vezes',95,'2025-07-19','Equipe','Produtividade'),
(28,'Água todo dia','Beber água todos os dias por 14 dias',35,'2025-01-20','Sistema','Hidratação'),
(29,'Yoga iniciante','Praticar yoga 20 vezes',120,'2025-02-14','Parceiro','Saúde'),
(30,'Cozinheiro','Preparar 10 receitas novas',180,'2025-05-27','Equipe','Culinária'),
(31,'Minimalista','Desapegar de 50 itens',200,'2025-03-27','Sistema','Estilo de vida'),
(32,'Networking ativo','Participar de 5 eventos de networking',140,'2025-08-09','Parceiro','Carreira'),
(33,'Semana sem lixo','Reduzir lixo por 7 dias',85,'2025-04-22','Equipe','Sustentabilidade'),
(34,'Primeiro projeto','Terminar primeiro projeto pessoal',400,'2025-09-05','Sistema','Profissional'),
(35,'Gratidão diária','Praticar gratidão 21 dias',60,'2025-03-02','Equipe','Autocuidado'),
(36,'Revisão mensal','Revisar metas no fim do mês por 6 meses',210,'2025-10-01','Sistema','Planejamento'),
(37,'Mestre da língua','Completar nível intermediário',320,'2025-07-10','Parceiro','Idioma'),
(38,'Economista iniciante','Fazer planejamento financeiro anual',230,'2025-09-20','Equipe','Finanças'),
(39,'Higiene exemplar','Criar rotina de higiene por 30 dias',55,'2025-04-08','Sistema','Higiene'),
(40,'Desafio criativo','Fazer exercício criativo 15 dias',75,'2025-05-12','Equipe','Criatividade'),
(41,'Jardineiro','Cuidar plantas por 60 dias',95,'2025-06-05','Parceiro','Lazer'),
(42,'Caminhante','100 km acumulados em um mês',260,'2025-07-25','Sistema','Saúde'),
(43,'Organizador','Organizar casa inteira em 30 dias',190,'2025-08-30','Equipe','Organização'),
(44,'Chef doméstico','Cozinhar diariamente por 14 dias',85,'2025-03-21','Parceiro','Culinária'),
(45,'Foco total','Sessões Pomodoro por 30 dias',160,'2025-05-30','Sistema','Produtividade'),
(46,'Semana sem desperdício','Reduzir desperdício por 7 dias',70,'2025-06-12','Equipe','Sustentabilidade'),
(47,'Voluntário regular','4 ações voluntárias',210,'2025-09-15','Parceiro','Social'),
(48,'Revisão de código','Fazer revisão técnica 10 vezes',150,'2025-04-18','Equipe','Profissional'),
(49,'Estudo breve constante','Micro-estudos 50 dias',125,'2025-07-29','Sistema','Estudo'),
(50,'Primeira semana','Completar todas as metas da primeira semana',30,'2025-01-05','Sistema','Iniciação');

-- 5) usuario_conquista (50) -> relaciona usuarios 1..50 a conquistas 1..50 (ex.: user i -> conquista i)
INSERT INTO usuario_conquista (id_usuario_conquista, id_usuario, id_conquista) VALUES
(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),
(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),
(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),
(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),
(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),
(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),
(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),
(36,36,36),(37,37,37),(38,38,38),(39,39,39),(40,40,40),
(41,41,41),(42,42,42),(43,43,43),(44,44,44),(45,45,45),
(46,46,46),(47,47,47),(48,48,48),(49,49,49),(50,50,50);

-- 6) Perfil (50) -> um perfil por usuário (id_usuario 1..50)
INSERT INTO perfil (id_perfil, id_usuario, foto, bio, data_criacao) VALUES
(1,1,'/fotos/miguel.jpg','Estudante de TI. Gosta de correr e ler.','2025-01-05'),
(2,2,'/fotos/ana.jpg','Designer gráfica em formação.','2025-02-10'),
(3,3,'/fotos/lucas.jpg','Desenvolvedor backend. Café lover.','2025-03-12'),
(4,4,'/fotos/mariana.jpg','Apaixonada por fotografia e viagens.','2025-04-01'),
(5,5,'/fotos/gabriel.jpg','Treina 3x por semana e estuda finanças.','2025-05-02'),
(6,6,'/fotos/beatriz.jpg','Ama cozinhar receitas saudáveis.','2025-01-20'),
(7,7,'/fotos/rafael.jpg','Corredor amador aos finais de semana.','2025-02-14'),
(8,8,'/fotos/julia.jpg','Pratica meditação diariamente.','2025-03-01'),
(9,9,'/fotos/pedro.jpg','Gosta de esquadrinhar novos podcasts.','2025-04-08'),
(10,10,'/fotos/camila.jpg','Estuda idiomas nas horas vagas.','2025-05-09'),
(11,11,'/fotos/felipe.jpg','Fã de produtividade e GTD.','2025-01-12'),
(12,12,'/fotos/larissa.jpg','Estudante de medicina, focada em bem-estar.','2025-02-22'),
(13,13,'/fotos/gustavo.jpg','Trabalha com dados e estatísticas.','2025-03-18'),
(14,14,'/fotos/sofia.jpg','Artista plástica nas horas vagas.','2025-04-15'),
(15,15,'/fotos/thiago.jpg','Estuda contabilidade e finanças pessoais.','2025-05-30'),
(16,16,'/fotos/marcos.jpg','Professor e curioso por tecnologia.','2025-01-25'),
(17,17,'/fotos/isabela.jpg','Amante de yoga e equilíbrio.','2025-02-28'),
(18,18,'/fotos/rodrigo.jpg','Gosta de correr ao ar livre.','2025-03-11'),
(19,19,'/fotos/patricia.jpg','Organiza grupos de estudo.','2025-04-20'),
(20,20,'/fotos/andre.jpg','Economista amador e leitor assíduo.','2025-05-14'),
(21,21,'/fotos/vanessa.jpg','Frequentadora de workshops.','2025-01-30'),
(22,22,'/fotos/fernando.jpg','Engenheiro que corre nos finais de semana.','2025-02-03'),
(23,23,'/fotos/clara.jpg','Gosta de jardinagem e plantas.','2025-03-25'),
(24,24,'/fotos/eduardo.jpg','Curioso por startups e empreendedorismo.','2025-04-05'),
(25,25,'/fotos/rita.jpg','Dedica tempo a hobbies criativos.','2025-05-22'),
(26,26,'/fotos/bruno.jpg','Treina força e crossfit.','2025-01-18'),
(27,27,'/fotos/daniela.jpg','Estuda idiomas e cultural.','2025-02-11'),
(28,28,'/fotos/mateus.jpg','Gosta de trilhas e natureza.','2025-03-29'),
(29,29,'/fotos/aline.jpg','Aplica técnicas de organização pessoal.','2025-04-12'),
(30,30,'/fotos/vitor.jpg','Focado em produtividade no trabalho.','2025-05-05'),
(31,31,'/fotos/bianca.jpg','Músico amador e fã de piano.','2025-01-09'),
(32,32,'/fotos/leandro.jpg','Programador backend com amor por dados.','2025-02-24'),
(33,33,'/fotos/carolina.jpg','Desenvolve projetos de arte urbana.','2025-03-06'),
(34,34,'/fotos/igor.jpg','Atleta amador e coach de corrida.','2025-04-25'),
(35,35,'/fotos/daniel2.jpg','Gosta de aprender via cursos online.','2025-05-28'),
(36,36,'/fotos/laura.jpg','Leitora ávida e organizadora de clubes.','2025-01-14'),
(37,37,'/fotos/bruna.jpg','Fotógrafa e viajante nas horas vagas.','2025-02-19'),
(38,38,'/fotos/alex.jpg','Empreendedor em fase inicial.','2025-03-21'),
(39,39,'/fotos/yasmin.jpg','Estuda nutrição e bem-estar.','2025-04-27'),
(40,40,'/fotos/mauricio.jpg','Professor universitário e corredor.','2025-05-18'),
(41,41,'/fotos/cecilia.jpg','Diretora de projetos culturais.','2025-01-07'),
(42,42,'/fotos/hugo.jpg','Analista de sistemas e leitor.','2025-02-06'),
(43,43,'/fotos/marina.jpg','Chef amadora e food blogger.','2025-03-02'),
(44,44,'/fotos/pablo.jpg','Producer e editor de vídeo.','2025-04-09'),
(45,45,'/fotos/sabrina.jpg','Advogada que ama corrida.','2025-05-25'),
(46,46,'/fotos/otavio.jpg','Trabalha com logística e gosta de meditar.','2025-01-19'),
(47,47,'/fotos/nicole.jpg','Estuda design de interação.','2025-02-27'),
(48,48,'/fotos/ruan.jpg','Gosta de programação e jogos.','2025-03-16'),
(49,49,'/fotos/helena.jpg','Ativa em projetos voluntários.','2025-04-03'),
(50,50,'/fotos/samuel.jpg','Administrador focado em finanças.','2025-05-01');

-- 7) Habito (50) -> usa id_usuario 1..50, id_categoria 1..50, id_frequencia 1..50
INSERT INTO habito (id_habito, id_usuario, id_categoria, id_frequencia, nome, data_criacao, meta, descricao, icone, cor) VALUES
(1,1,2,1,'Correr 30 minutos','2025-01-05','Correr 3x por semana','Corrida leve ao ar livre','running','#27ae60'),
(2,2,1,1,'Beber 2L de água','2025-01-08','2 litros diários','Manter hidratação ao longo do dia','tint','#1abc9c'),
(3,3,5,5,'Estudar programação','2025-01-10','30 minutos por dia','Resolver exercícios e revisar conceitos','code','#6ab04c'),
(4,4,4,3,'Ler 30 minutos','2025-01-12','Ler 20 páginas por dia','Foco em livros técnicos e literatura','book','#3498db'),
(5,5,6,1,'Comer salada no almoço','2025-01-15','Incluir salada todos os dias','Prato com verduras e proteína','utensils','#e67e22'),
(6,6,3,1,'Meditar 10 minutos','2025-01-16','Prática diária de atenção plena','Sessões guiadas de meditação','spa','#8e44ad'),
(7,7,7,1,'Dormir 8 horas','2025-01-18','Ir para cama antes das 23h','Higiene do sono consistente','bed','#2ecc71'),
(8,8,8,7,'Planejar o dia','2025-01-19','Planejar tarefas toda manhã','Organizar prioridades e tempo','clock','#34495e'),
(9,9,11,1,'Beber água ao acordar','2025-01-20','1 copo de água ao levantar','Iniciar o dia hidratado','tint','#1abc9c'),
(10,10,13,14,'Arrumar a mesa','2025-01-21','Manter local de trabalho organizado','Organização diária do espaço','boxes','#7f8c8d'),
(11,11,21,1,'Aula de yoga','2025-01-22','Praticar 3x por semana','Sequência de posturas e respiração','om','#74b9ff'),
(12,12,2,1,'Caminhar 20 minutos','2025-01-23','Caminhar diariamente','Atividade leve ao ar livre','walking','#00cec9'),
(13,13,26,1,'Praticar inglês','2025-01-24','20 minutos por dia','Exercícios de listening e speaking','language','#6d214f'),
(14,14,14,7,'Desenhar 20 minutos','2025-01-25','Desenvolver técnica artística','Exercícios de desenho e sketch','palette','#c0392b'),
(15,15,31,7,'Revisar finanças','2025-01-26','Atualizar controle financeiro semanalmente','Registrar gastos e planejar orçamentos','chart-line','#3742fa'),
(16,16,34,3,'Praticar coding katas','2025-01-27','Resolver 3 desafios por semana','Melhorar lógica e sintaxe','code','#6ab04c'),
(17,17,37,1,'Exercício de gratidão','2025-01-28','Anotar 3 coisas por dia','Prática mental para bem-estar','gift','#f9ca24'),
(18,18,29,7,'Cuidar das plantas','2025-01-29','Regar e podar semanalmente','Manutenção da horta caseira','leaf','#badc58'),
(19,19,19,14,'Limpeza rápida','2025-01-30','15 minutos por dia','Pequenas tarefas de limpeza diária','broom','#00b894'),
(20,20,22,1,'Treino intervalado','2025-02-01','2 sessões semanais','Treino de corrida com intensidades','running-fast','#ff7675'),
(21,21,45,1,'Sessão de foco','2025-02-02','4 blocos Pomodoro por dia','Bloqueio de tempo para trabalho profundo','bullseye','#eb3b5a'),
(22,22,23,1,'Alongar pela manhã','2025-02-03','10 minutos diários','Rotina de mobilidade e alongamento','hand-rock','#55efc4'),
(23,23,44,7,'Praticar coleta seletiva','2025-02-04','Separar lixo reciclável semanalmente','Hábitos sustentáveis','recycle','#7bed9f'),
(24,24,30,14,'Planejar refeições','2025-02-05','Organizar cardápio semanalmente','Planejamento alimentar balanceado','apple-alt','#2f3542'),
(25,25,25,1,'Escrever diário','2025-02-06','5 minutos por dia','Registrar pensamentos e reflexões','journal','#ffbe76'),
(26,26,36,7,'Desapegar itens','2025-02-07','Separar 5 itens por semana','Reduzir acúmulo de coisas','boxes-open','#a29bfe'),
(27,27,28,7,'Pintar por hobby','2025-02-08','30 minutos por semana','Prática artística e relaxamento','brush','#f0932b'),
(28,28,20,1,'Trilhas aos domingos','2025-02-09','Caminhada longa semanal','Conexão com a natureza','walking','#00cec9'),
(29,29,9,14,'Economizar x por mês','2025-02-10','Reservar valor para poupança','Disciplina financeira mensal','piggy-bank','#16a085'),
(30,30,12,1,'Escovar fio e dentes','2025-02-11','Rotina manhã e noite','Higiene dental completa','tooth','#ff7979'),
(31,31,27,7,'Praticar instrumento','2025-02-12','15 minutos por dia','Estudo musical diário','music','#4834d4'),
(32,32,33,14,'Voluntariado mensal','2025-02-13','Participar 1 vez por mês','Ações comunitárias','hands-helping','#e056fd'),
(33,33,15,1,'Curso online','2025-02-14','Estudar 1 hora por dia','Aprofundar conhecimento em área','lightbulb','#f39c12'),
(34,34,35,7,'Técnicas de tempo','2025-02-15','Aplicar técnicas de gestão semanalmente','Melhorar uso do tempo','stopwatch','#2f3542'),
(35,35,41,1,'Desconectar antes de dormir','2025-02-16','No screens 1h before bed','Melhor qualidade de sono','mobile-alt','#b71540'),
(36,36,38,14,'Planejar mês','2025-02-17','Revisar metas mensais','Planejamento e ajustes','clipboard','#22a6b3'),
(37,37,39,1,'Higiene bucal avançada','2025-02-18','Fio dental e enxágue diário','Cuidado extra com dentes','tooth','#ff7979'),
(38,38,40,7,'Exercícios posturais','2025-02-19','Sessões 3x por semana','Fortalecer postura','chair','#30336b'),
(39,39,43,1,'Desafio de 30 dias','2025-02-20','Concluir desafio específico','Hábitos intensivos por 30 dias','calendar-alt','#45aaf2'),
(40,40,42,7,'Reduzir açúcar','2025-02-21','Cortar açúcar por 14 dias','Melhor hábito alimentar','coffee','#cd6155'),
(41,41,47,7,'Autocuidado semanal','2025-02-22','Atos de autocuidado 1x por semana','Bem-estar pessoal','hands','#f6e58d'),
(42,42,48,14,'Cozinhar novas receitas','2025-02-23','Experimentar 2 receitas por semana','Aprimorar habilidades culinárias','utensil-spoon','#f9ca24'),
(43,43,49,1,'Micro-estudos','2025-02-24','10 minutos de revisão diária','Pequenos blocos de estudo','stopwatch-20','#58b19f'),
(44,44,46,7,'Revisão semanal','2025-02-25','Fazer revisão semanalmente','Ajuste de prioridades e status','repeat','#fa8231'),
(45,45,16,1,'Trabalho focado','2025-02-26','4 horas de trabalho profundo por dia','Alcançar entregas importantes','briefcase','#2c3e50'),
(46,46,32,7,'Reciclar plástico','2025-02-27','Separar plástico todo fim de semana','Ação de sustentabilidade','recycle','#7bed9f'),
(47,47,18,14,'Tempo em família','2025-02-28','Atividades quinzenais com família','Fortalecer laços familiares','family','#6ab04c'),
(48,48,17,7,'Socializar','2025-03-01','Encontrar amigos uma vez por semana','Manter rede social ativa','users','#e84393'),
(49,49,24,1,'Exercício respiratório','2025-03-02','3 minutos pela manhã','Melhora da respiração e calma','wind','#00a8ff'),
(50,50,10,14,'Sessão de jogo','2025-03-03','Dedicar tempo de lazer bi-semanalmente','Relaxamento e diversão','gamepad','#9b59b6');

-- 8) habito_usuario (50) -> relaciona habitos 1..50 a usuarios (vários links plausiveis)
INSERT INTO habito_usuario (id_habito_usuario, id_habito, id_usuario) VALUES
(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),
(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),
(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),
(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),
(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),
(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),
(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),
(36,36,36),(37,37,37),(38,38,38),(39,39,39),(40,40,40),
(41,41,41),(42,42,42),(43,43,43),(44,44,44),(45,45,45),
(46,46,46),(47,47,47),(48,48,48),(49,49,49),(50,50,50);

-- 9) Notificacao (50) -> vinculado a habito 1..50
INSERT INTO notificacao (id_notificacao, id_habito, horario, mensagem, ativo, recorrencia) VALUES
(1,1,'06:30:00','Hora da corrida matinal',1,'Diária'),
(2,2,'08:00:00','Hora de beber água',1,'Diária'),
(3,3,'20:00:00','Tempo de estudo',1,'Diária'),
(4,4,'21:00:00','Hora da leitura',1,'Diária'),
(5,5,'12:00:00','Hora da salada no almoço',1,'Diária'),
(6,6,'07:00:00','Meditação matinal',1,'Diária'),
(7,7,'22:30:00','Preparar para dormir',1,'Diária'),
(8,8,'07:30:00','Revisar plano do dia',1,'Diária'),
(9,9,'07:10:00','Copinho de água ao acordar',1,'Diária'),
(10,10,'09:00:00','Organizar a mesa de trabalho',1,'Diária'),
(11,11,'18:00:00','Aula de yoga online',1,'Semanal'),
(12,12,'19:00:00','Caminhada do dia',1,'Diária'),
(13,13,'21:00:00','Hora do inglês',1,'Diária'),
(14,14,'17:30:00','Tempo para desenhar',1,'Diária'),
(15,15,'08:30:00','Revisar orçamento',1,'Semanal'),
(16,16,'20:30:00','Coding kata diária',1,'Semanal'),
(17,17,'22:00:00','Momento de gratidão',1,'Diária'),
(18,18,'09:00:00','Cuidar das plantas',1,'Semanal'),
(19,19,'18:30:00','15 min limpeza rápida',1,'Diária'),
(20,20,'06:00:00','Treino intervalado',1,'Semanal'),
(21,21,'09:00:00','Sessão de foco',1,'Diária'),
(22,22,'06:15:00','Alongamento matinal',1,'Diária'),
(23,23,'08:00:00','Separar recicláveis',1,'Semanal'),
(24,24,'18:00:00','Preparar refeições semanais',1,'Semanal'),
(25,25,'22:10:00','Escrever no diário',1,'Diária'),
(26,26,'10:00:00','Separar doações',1,'Semanal'),
(27,27,'16:00:00','Tempo de pintura',1,'Semanal'),
(28,28,'08:00:00','Trekking dominical',1,'Semanal'),
(29,29,'01:00:00','Lembrete de economia mensal',1,'Mensal'),
(30,30,'07:50:00','Higiene bucal rotina',1,'Diária'),
(31,31,'18:30:00','Praticar instrumento',1,'Diária'),
(32,32,'09:00:00','Ação voluntária do mês',1,'Mensal'),
(33,33,'20:00:00','Curso online',1,'Diária'),
(34,34,'08:30:00','Aplicar técnica de tempo',1,'Semanal'),
(35,35,'21:30:00','Desconectar dispositivos',1,'Diária'),
(36,36,'09:00:00','Planejar o mês',1,'Mensal'),
(37,37,'22:00:00','Higiene bucal extra',1,'Diária'),
(38,38,'07:40:00','Exercício postural',1,'Semanal'),
(39,39,'08:00:00','Desafio diário',1,'Diária'),
(40,40,'12:00:00','Refeição sem açúcar',1,'Diária'),
(41,41,'19:00:00','Momento de autocuidado',1,'Semanal'),
(42,42,'17:00:00','Cozinhar nova receita',1,'Semanal'),
(43,43,'20:10:00','Micro-estudo diário',1,'Diária'),
(44,44,'18:00:00','Revisão semanal',1,'Semanal'),
(45,45,'09:00:00','Bloco de trabalho profundo',1,'Diária'),
(46,46,'10:00:00','Separar recicláveis',1,'Semanal'),
(47,47,'15:00:00','Tempo com a família',1,'Quinzenal'),
(48,48,'20:00:00','Encontro com amigos',1,'Semanal'),
(49,49,'06:10:00','Exercício respiratório',1,'Diária'),
(50,50,'21:00:00','Sessão de jogo',1,'Bi-semanal');

-- 10) Feito (50) -> registros de execução de hábitos (várias datas)
INSERT INTO feito (id_feito, id_habito, data_feito, status_feito, observacao) VALUES
(1,1,'2025-01-06',1,'Corrida leve 30min'),
(2,1,'2025-01-07',1,'Boa disposição'),
(3,2,'2025-01-08',1,'2L ok'),
(4,3,'2025-01-10',1,'Projeto estudado 30min'),
(5,4,'2025-01-12',1,'Lido 25 páginas'),
(6,5,'2025-01-15',1,'Salada com peito de frango'),
(7,6,'2025-01-16',1,'Meditação guiada 10min'),
(8,7,'2025-01-18',1,'8 horas dormidas'),
(9,8,'2025-01-19',1,'Dia planejado com 3 prioridades'),
(10,9,'2025-01-20',1,'Água ao acordar'),
(11,10,'2025-01-21',1,'Mesa organizada'),
(12,11,'2025-01-22',1,'Aula assistida'),
(13,12,'2025-01-23',1,'Caminhada 20min'),
(14,13,'2025-01-24',1,'Praticado listening'),
(15,14,'2025-01-25',1,'Sketch rápido feito'),
(16,15,'2025-01-26',1,'Planilha atualizada'),
(17,16,'2025-01-27',1,'Katas resolvidos'),
(18,17,'2025-01-28',1,'3 coisas anotadas'),
(19,18,'2025-01-29',1,'Regou as plantas'),
(20,19,'2025-01-30',1,'15 minutos completados'),
(21,20,'2025-02-01',1,'Treino intenso'),
(22,21,'2025-02-02',1,'2 blocos Pomodoro'),
(23,22,'2025-02-03',1,'Alonguei 10 minutos'),
(24,23,'2025-02-04',1,'Reciclou PLÁSTICO e papel'),
(25,24,'2025-02-05',1,'Planejou cardápio semanal'),
(26,25,'2025-02-06',1,'Entrou no hábito do diário'),
(27,26,'2025-02-07',1,'Doação separada'),
(28,27,'2025-02-08',1,'Pintura de 30 minutos'),
(29,28,'2025-02-09',1,'Trilha de 8km'),
(30,29,'2025-02-10',1,'Valor economizado registrado'),
(31,30,'2025-02-11',1,'Rotina dental feita'),
(32,31,'2025-02-12',1,'Prática musical 15min'),
(33,32,'2025-02-13',1,'Voluntariado realizado'),
(34,33,'2025-02-14',1,'Curso assistido 1h'),
(35,34,'2025-02-15',1,'Técnica de tempo aplicada'),
(36,35,'2025-02-16',1,'Sem telas 1 hora antes'),
(37,36,'2025-02-17',1,'Planejamento do mês pronto'),
(38,37,'2025-02-18',1,'Fio dental usado'),
(39,38,'2025-02-19',1,'Exercício postural realizado'),
(40,39,'2025-02-20',1,'Dia do desafio cumprido'),
(41,40,'2025-02-21',1,'Substituiu sobremesa doce'),
(42,41,'2025-02-22',1,'Banho relaxante e leitura'),
(43,42,'2025-02-23',1,'Nova receita testada'),
(44,43,'2025-02-24',1,'Micro-estudo 10 minutos'),
(45,44,'2025-02-25',1,'Revisão semanal feita'),
(46,45,'2025-02-26',1,'4 horas com foco'),
(47,46,'2025-02-27',1,'Plástico separado'),
(48,47,'2025-02-28',1,'Tarde em família'),
(49,48,'2025-03-01',1,'Encontro com amigos'),
(50,49,'2025-03-02',1,'Respiração 3 minutos');

-- 11) Nota (50)
INSERT INTO nota (id_nota, data_nota, conteudo, nome, anexar) VALUES
(1,'2025-01-06','Primeira anotação sobre rotina de corrida','Plano corrida','/anexos/corrida1.pdf'),
(2,'2025-01-08','Registro de consumo de água da semana','Hidratação semanal',''),
(3,'2025-01-10','Tópicos para estudo em programação','Checklist estudo','/anexos/estudo.pdf'),
(4,'2025-01-12','Resumo do capítulo lido','Resumo leitura',''),
(5,'2025-01-15','Ideias de receitas com saladas','Receitas saudáveis','/anexos/receitas.docx'),
(6,'2025-01-16','Sessão de meditação e sensações','Meditação notas',''),
(7,'2025-01-18','Observações sobre sono e rotina','Sono','/anexos/sono.xlsx'),
(8,'2025-01-19','To-do do dia com prioridades','Planejamento diário',''),
(9,'2025-01-20','Observações de hidratação matinal','Hidratação manhã',''),
(10,'2025-01-21','Lista de organização da mesa','Organização','/anexos/organizar.pdf'),
(11,'2025-01-22','Feedback da aula de yoga','Yoga feedback',''),
(12,'2025-01-23','Trajeto da caminhada e tempo','Caminhada log',''),
(13,'2025-01-24','Notas de aula de inglês','Inglês','/anexos/ingles.pdf'),
(14,'2025-01-25','Ideias para desenhos rápidos','Sketch ideas',''),
(15,'2025-01-26','Resumo financeiro semanal','Finanças','/anexos/financas.xlsx'),
(16,'2025-01-27','Observações sobre katas','Coding notes',''),
(17,'2025-01-28','3 coisas que agradeci hoje','Gratidão',''),
(18,'2025-01-29','Agenda de rega da horta','Horta','/anexos/horta.pdf'),
(19,'2025-01-30','Checklist de limpeza diária','Limpeza',''),
(20,'2025-02-01','Plano de treino intervalado','Treino','/anexos/treino.docx'),
(21,'2025-02-02','Resumo de sessão de foco','Foco notes',''),
(22,'2025-02-03','Sequência de alongamentos','Alongamento','/anexos/alongar.pdf'),
(23,'2025-02-04','Procedimento de reciclagem doméstica','Reciclagem',''),
(24,'2025-02-05','Cardápio da semana','Cardápio','/anexos/cardapio.xlsx'),
(25,'2025-02-06','Entrada de diário breve','Diário 1',''),
(26,'2025-02-07','Lista de itens para desapegar','Desapego','/anexos/desapego.pdf'),
(27,'2025-02-08','Observações sobre pintura','Pintura',''),
(28,'2025-02-09','Roteiro da trilha','Trilha','/anexos/trilha.kml'),
(29,'2025-02-10','Meta de economia deste mês','Economia',''),
(30,'2025-02-11','Rotina completa de higiene','Higiene','/anexos/higiene.pdf'),
(31,'2025-02-12','Cifra e exercícios do instrumento','Música',''),
(32,'2025-02-13','Contato da ONG local','Voluntariado','/anexos/ong.vcf'),
(33,'2025-02-14','Resumo de curso online','Curso resumo',''),
(34,'2025-02-15','Técnicas de gestão do tempo testadas','Time management','/anexos/time.docx'),
(35,'2025-02-16','Plano de desligamento eletrônico','No-screen plan',''),
(36,'2025-02-17','Checklist para planejar o mês','Planejamento mensal','/anexos/mes.xlsx'),
(37,'2025-02-18','Dicas de higiene bucal','Dental tips',''),
(38,'2025-02-19','Sequência postural para coluna','Postura','/anexos/postura.pdf'),
(39,'2025-02-20','Notas do desafio de 30 dias','Desafio30',''),
(40,'2025-02-21','Alternativas para sobremesas','Sobremesa saudável','/anexos/sobremesas.pdf'),
(41,'2025-02-22','Ideias de autocuidado','Autocuidado',''),
(42,'2025-02-23','Receita testada hoje','Receita 1','/anexos/receita1.docx'),
(43,'2025-02-24','Resumo de micro-estudo','Micro-estudo',''),
(44,'2025-02-25','Template de revisão semanal','Revisão semanal','/anexos/template.docx'),
(45,'2025-02-26','Plano de trabalho focado','Produtividade',''),
(46,'2025-02-27','Lista de itens recicláveis','Reciclar 1','/anexos/reciclagem.pdf'),
(47,'2025-02-28','Atividades para o fim de semana com família','Família',''),
(48,'2025-03-01','Lista de contatos para networking','Networking','/anexos/contatos.csv'),
(49,'2025-03-02','Exercício respiratório guiado','Respiração',''),
(50,'2025-03-03','Pontuação e notas de jogos','Jogos','/anexos/jogos.txt');

-- 12) notas_habito (50) -> liga notas 1..50 a habitos 1..50
INSERT INTO notas_habito (id_notas_habito, id_nota, id_habito) VALUES
(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),
(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),
(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),
(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),
(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),
(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),
(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),
(36,36,36),(37,37,37),(38,38,38),(39,39,39),(40,40,40),
(41,41,41),(42,42,42),(43,43,43),(44,44,44),(45,45,45),
(46,46,46),(47,47,47),(48,48,48),(49,49,49),(50,50,50);

-- 3. Índices

-- 1️ Índice na tabela 'usuario' para otimizar buscas por e-mail (login, recuperação de senha ...)
CREATE INDEX idx_usuario_email ON usuario (email);
-- Justificativa:
-- O campo 'email' é muito usado em consultas de login e verificação de existência de usuário.
-- O índice acelera essas consultas, evitando a leitura completa da tabela e melhorando o desempenho.

-- 2️ Índice na tabela 'habito' para buscas rápidas pelos hábitos de um usuário
CREATE INDEX idx_habito_usuario ON habito (id_usuario);
-- Justificativa:
-- Esse índice otimiza consultas que listam os hábitos de um determinado usuário.
-- Como é comum o sistema exibir os hábitos do usuário logado, o índice melhora muito o tempo de resposta.

-- 3️ Índice na tabela 'feito' para pesquisas de hábitos concluídos em uma data específica
CREATE INDEX idx_feito_data ON feito (data_feito);
-- Justificativa:
-- O campo 'data_feito' é utilizado para verificar o histórico diário de hábitos concluídos.
-- O índice melhora o desempenho em consultas que filtram registros por data.

-- 4️ Índice na tabela 'notificacao' para verificar notificações ativas
CREATE INDEX idx_notificacao_ativo ON notificacao (ativo);
-- Justificativa:
-- O campo 'ativo' é utilizado para determinar se uma notificação está habilitada.
-- Criar um índice neste campo agiliza consultas que buscam apenas notificações ativas, 
-- otimizando a execução de tarefas automatizadas do sistema.

-- 5️ Índice na tabela 'categoria' para facilitar buscas por nome de categoria
CREATE INDEX idx_categoria_nome ON categoria (nome);
-- Justificativa:
-- O campo 'nome' é frequentemente utilizado em pesquisas e exibições de categorias.
-- O índice acelera as consultas que filtram ou ordenam as categorias pelo nome.
