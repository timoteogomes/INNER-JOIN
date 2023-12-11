-- Criar o banco de dados
CREATE DATABASE LivrosAutoresDB;
USE LivrosAutoresDB;

-- Tabela de autores
CREATE TABLE Autores (
    AutorID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Nacionalidade VARCHAR(50)
);

-- Tabela de livros
CREATE TABLE Livros (
    LivroID INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(200),
    AnoPublicacao INT,
    AutorID INT,
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

-- Inserção de três autores fictícios
INSERT INTO Autores (Nome, Nacionalidade) VALUES
('Autor1', 'Brasil'),
('Autor2', 'Estados Unidos'),
('Autor3', 'França');

-- Inserção de cinco livros fictícios, associados aos autores
INSERT INTO Livros (Titulo, AnoPublicacao, AutorID) VALUES
('Livro1', 2000, 1),
('Livro2', 2015, 1),
('Livro3', 1998, 2),
('Livro4', 2010, 3),
('Livro5', 2021, 3);

-- Consulta para listar todos os autores e seus livros associados
SELECT Autores.Nome AS NomeAutor, Livros.Titulo AS TituloLivro
FROM Autores
LEFT JOIN Livros ON Autores.AutorID = Livros.AutorID;

-- Consulta usando INNER JOIN para listar os detalhes dos livros e seus autores correspondentes
SELECT Autores.Nome AS NomeAutor, Livros.Titulo AS TituloLivro, Livros.AnoPublicacao
FROM Autores
INNER JOIN Livros ON Autores.AutorID = Livros.AutorID;

-- Consulta usando LEFT JOIN para exibir todos os autores, independente de terem livros associados ou não
SELECT Autores.Nome AS NomeAutor, Livros.Titulo AS TituloLivro
FROM Autores
LEFT JOIN Livros ON Autores.AutorID = Livros.AutorID;

-- Consulta com filtro por nacionalidade do autor (Brasil, por exemplo)
SELECT Autores.Nome AS NomeAutor, Autores.Nacionalidade, Livros.Titulo AS TituloLivro
FROM Autores
LEFT JOIN Livros ON Autores.AutorID = Livros.AutorID
WHERE Autores.Nacionalidade = 'Brasil';

-- Consulta que agrega dados para contar quantos livros cada autor escreveu
SELECT Autores.Nome AS NomeAutor, COUNT(Livros.LivroID) AS TotalLivros
FROM Autores
LEFT JOIN Livros ON Autores.AutorID = Livros.AutorID
GROUP BY Autores.AutorID;
