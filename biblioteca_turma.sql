CREATE DATABASE biblioteca_turma;
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

  
  
  
  
    
    
    

    
    
