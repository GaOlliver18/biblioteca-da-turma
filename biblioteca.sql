CREATE DATABASE IF NOT EXISTS biblioteca_turma;
USE biblioteca_turma;

CREATE TABLE autores (
	id_autor int PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL
    );

CREATE TABLE livros (
	id_livro int PRIMARY KEY AUTO_INCREMENT,
    id_autor INT NOT NULL,
    titulo VARCHAR (100) NOT NULL,
    genero VARCHAR (20) NOT NULL,
    preco DECIMAL (10,2) NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autores (id_autor)
    );
    
CREATE TABLE socios (
	id_socio int PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR (20) NOT NULL,
    desde DATE NOT NULL
    );
    
CREATE TABLE emprestimos (
	id_emprestimo int PRIMARY KEY AUTO_INCREMENT,
    id_socio INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NULL,
    multa DECIMAL (10,2) DEFAULT 0,
    FOREIGN KEY (id_socio) REFERENCES socios (id_socio),
	FOREIGN KEY (id_livro) REFERENCES livros (id_livro)
    );
    
    INSERT INTO autores (nome, pais) VALUES
	('Masashi Kishimoto', 'Japão'),
    ('Eiichiro Oda', 'Japão'),
    ('J. K. Rowling', 'Inglaterra'),
    ('Augusto Cury', 'Brasil'),
    ('Stan Lee', 'Estados Unidos'),
    ('Reki Kawahara', 'Japão'),
    ('Machado de Assis', 'Brasil'),
    ('Koyoharu Gotouge', 'Japão'),
    ('Yūki Tabata', 'Japão');
    
    INSERT INTO livros (id_autor, titulo, genero, preco) VALUES
    (1, 'Naruto', 'Aventura', 1800),
    (2, 'One Piece', 'Aventura', 2000),
    (3, 'Harry Potter', 'Magia', 850),
    (4, 'O Vendedor de Sonhos', 'Romance', 449.90),
    (5, 'Os Vingadores', 'Ação', 699),
    (6, 'Sword Art Online', 'Aventura', 1400),
    (7, 'Memórias Póstumas de Brás Cubas', 'Romance', 41.90),
    (8, 'Demon Slayer', 'Ação', 1600),
    (9,'Black Clover', 'Ação', 1400);
    
    INSERT INTO socios (nome, cidade, desde) VALUES
    ('Gabriel', 'Feira de Santana', '2024-07-07'),
    ('Robson', 'Salvador', '2025-09-01'),
    ('Kaio', 'Serrinha', '2025-10-07'),
    ('Felipe', 'Washigton', '2024-11-09'),
    ('Neto', 'Agua Fria', '2026-06-18'),
    ('Fernanda', 'Feira de Santana', '2026-02-15');
    
    INSERT INTO emprestimos (id_socio, id_livro, data_emprestimo, data_devolucao, multa) VALUES
    (3, 1, '2025-06-10', '2025-06-20', 0.00),
	(4, 2, '2025-06-15', '2025-06-25', 10.00),
	(5, 4, '2025-07-01', '2025-07-12', 0.00),
	(6, 5, '2025-07-05', '2025-07-15', 20.00),
	(2, 6, '2025-07-10', '2025-07-20', 0.00),
	(3, 3, '2025-07-15', '2025-07-25', 5.00),
	(1, 7, '2025-08-01', '2025-08-10', 0.00),
	(4, 8, '2025-08-05', '2025-08-15', 12.00),
	(5, 2, '2025-08-10', '2025-08-20', 0.00),
	(6, 1, '2025-08-15', '2025-08-25', 8.00),
	(2, 4, '2025-09-01', '2025-09-11', 0.00),
	(3, 5, '2025-09-05', '2025-09-15', 15.00);
    
  SELECT * FROM livros;
  SELECT * FROM socios;
  SELECT * FROM emprestimos;
  SELECT * FROM livros WHERE genero = 'Aventura';
  SELECT * FROM livros ORDER BY preco DESC;
  SELECT * FROM livros ORDER BY preco ASC;
  SELECT * FROM livros 
  WHERE genero = 'Aventura'
  ORDER BY preco DESC;
  SELECT id_emprestimo, data_devolucao
  FROM emprestimos;
  
  SELECT titulo, preco
  FROM livros
  WHERE preco > 1000
  ORDER BY preco DESC;
  
  START TRANSACTION;

  UPDATE emprestimos
  SET data_devolucao = NULL
  WHERE id_emprestimo = 12;

  SELECT * FROM emprestimos
  WHERE id_emprestimo = 12;

  COMMIT;
  
  START TRANSACTION;

  INSERT INTO socios (nome, cidade, desde)
  VALUES ('Deivite', 'São Paulo', '2023-06-10');

  INSERT INTO livros (id_autor, titulo, genero, preco)
  VALUES (2, 'Lógica de programação', 'Didático', 4000);

  SELECT * FROM socios
  WHERE nome = 'Deivite';

  SELECT * FROM livros
  WHERE titulo = 'Lógica de programação';
  
  
  -- somente os emprestimos da cidade de feira de santana
  
  SELECT s.nome, l.titulo, e.data_emprestimo
FROM emprestimos e
INNER JOIN socios s
    ON s.id_socio = e.id_socio
INNER JOIN livros l
    ON l.id_livro = e.id_livro
WHERE s.cidade = 'Feira de Santana'
ORDER BY e.data_emprestimo;

-- todos os emprestimos, socios, livros e autores

SELECT
    e.id_emprestimo,
    s.nome AS socio,
    l.titulo AS livro,
    a.nome AS autor
FROM emprestimos e
INNER JOIN socios s
    ON s.id_socio = e.id_socio
INNER JOIN livros l
    ON l.id_livro = e.id_livro
INNER JOIN autores a
    ON a.id_autor = l.id_autor
ORDER BY e.id_emprestimo;

-- todos os socios e seus emprestimos com LEFT JOIN

SELECT
    s.nome,
    e.id_emprestimo
FROM socios s
LEFT JOIN emprestimos e
    ON e.id_socio = s.id_socio
ORDER BY s.nome;

-- livros nunca emprestados 

SELECT l.titulo
FROM livros l
LEFT JOIN emprestimos e
    ON e.id_livro = l.id_livro
WHERE e.id_emprestimo IS NULL;

-- todos os socios e seus emprestimos com RIGHT JOIN

SELECT
    s.nome,
    e.id_emprestimo
FROM emprestimos e
RIGHT JOIN socios s
    ON e.id_socio = s.id_socio;

-- quantidade total de emprestimos

SELECT COUNT(*) AS total_emprestimos
FROM emprestimos;

-- soma do total de multas

SELECT SUM(multa) AS total_multas
FROM emprestimos;

-- media de valores de livros, menor e maior preco

SELECT
    AVG(preco) AS preco_medio,
    MIN(preco) AS menor_preco,
    MAX(preco) AS maior_preco
FROM livros;

-- quantidade de socios distindo que emprestam livros

SELECT COUNT(DISTINCT id_socio) AS socios_que_emprestaram
FROM emprestimos;

-- total de multas por cidade

SELECT
    s.cidade,
    SUM(e.multa) AS total_multas
FROM socios s
INNER JOIN emprestimos e
    ON e.id_socio = s.id_socio
GROUP BY s.cidade
ORDER BY total_multas DESC;

-- cidades com mais de 2 emprestimos

SELECT
    s.cidade,
    COUNT(*) AS total_emprestimos
FROM socios s
INNER JOIN emprestimos e
    ON e.id_socio = s.id_socio
WHERE e.data_emprestimo >= '2023-01-01'
GROUP BY s.cidade
HAVING COUNT(*) > 2;

-- livros mais caros

SELECT titulo, preco
FROM livros
WHERE preco > (
    SELECT AVG(preco)
    FROM livros
);

-- todos os socios que fizeram emprestimos com IN

SELECT nome
FROM socios
WHERE id_socio IN (
    SELECT id_socio
    FROM emprestimos
);

-- todos os socios que nunca fizeram emprestimos 

SELECT s.nome
FROM socios s
WHERE NOT EXISTS (
    SELECT 1
    FROM emprestimos e
    WHERE e.id_socio = s.id_socio
);

-- socios que ja fizeram emprestimos com EXISTS

SELECT s.nome
FROM socios s
WHERE EXISTS (
    SELECT 1
    FROM emprestimos e
    WHERE e.id_socio = s.id_socio
);

-- EXPLAIN antes de criar o índice, utilizei novamente depois de criar o indice 

EXPLAIN
SELECT id_emprestimo
FROM emprestimos
WHERE id_socio = 1;

-- criacao do indice na FK

CREATE INDEX idx_emprestimos_socio
ON emprestimos (id_socio);

-- total de multas por socio e tambem quem nunca teve nenhum multa

SELECT
    s.nome,
    COALESCE(SUM(e.multa), 0) AS total_multas
FROM socios s
LEFT JOIN emprestimos e
    ON e.id_socio = s.id_socio
GROUP BY s.id_socio, s.nome
ORDER BY total_multas DESC;

-- os 3 livros com mais emprestimos 

SELECT
    l.titulo,
    COUNT(*) AS quantidade_emprestimos
FROM livros l
INNER JOIN emprestimos e
    ON e.id_livro = l.id_livro
GROUP BY l.id_livro, l.titulo
ORDER BY quantidade_emprestimos DESC, l.titulo ASC
LIMIT 3;

-- quantidade de emprestimos e o total de multas por cidade

SELECT
    s.cidade,
    COUNT(DISTINCT e.id_emprestimo) AS quantidade_emprestimos,
    SUM(e.multa) AS total_multas
FROM socios s
INNER JOIN emprestimos e
    ON e.id_socio = s.id_socio
GROUP BY s.cidade
ORDER BY total_multas DESC;

SELECT titulo, preco FROM livros;

-- atualizar o valor do livro com id 9 para 1500

START TRANSACTION;

UPDATE livros
SET preco = 1500
WHERE id_livro = 9;

COMMIT;

SELECT * FROM socios WHERE id_socio = 7;

START TRANSACTION;

DELETE FROM socios
WHERE id_socio = 7;

COMMIT;


