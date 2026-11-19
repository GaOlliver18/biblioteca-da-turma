# 📚 Projeto Biblioteca - SQL

## Sobre o projeto

Esse projeto foi desenvolvido durante o módulo de SQL da Turma 34. A ideia foi criar um banco de dados para simular o funcionamento de uma biblioteca, onde podemos cadastrar autores, livros, sócios e registrar os empréstimos realizados.

Durante a atividade, procurei colocar em prática os conteúdos que foram ensinados nas aulas, desde a criação das tabelas até consultas mais avançadas.

## 🗄️ Estrutura do banco de dados

O banco de dados foi criado com quatro tabelas:

- **autores:** armazena o nome e o país de origem dos autores.
- **livros:** armazena os títulos, gêneros, preços e o autor de cada livro.
- **socios:** guarda o nome, a cidade e a data de cadastro dos sócios.
- **emprestimos:** registra qual sócio pegou determinado livro, a data do empréstimo, a devolução e possíveis multas.

As tabelas possuem relacionamentos através de chaves primárias (PRIMARY KEY) e chaves estrangeiras (FOREIGN KEY). Por exemplo, a tabela de empréstimos utiliza o ID do sócio e o ID do livro para identificar quem pegou cada livro.

## 💻 O que foi desenvolvido

Primeiro, criei o banco de dados e as quatro tabelas, definindo seus campos, tipos de dados e relacionamentos. Depois, inseri alguns registros para conseguir realizar os testes e as consultas.

Também desenvolvi consultas utilizando:

- **SELECT, WHERE e ORDER BY:** para visualizar, filtrar e organizar os dados.
- **INNER JOIN:** para juntar informações de diferentes tabelas, como sócios, livros, autores e empréstimos.
- **LEFT JOIN e RIGHT JOIN:** para consultar os sócios mesmo quando não possuem empréstimos.
- **COUNT, SUM, AVG, MIN e MAX:** para realizar contagens, somas e cálculos.
- **GROUP BY e HAVING:** para agrupar informações e filtrar os resultados dos agrupamentos.
- **IN, EXISTS e NOT EXISTS:** para trabalhar com subconsultas e verificar a existência de registros.

## 📊 Algumas consultas realizadas

Entre as consultas que desenvolvi, estão:

- Buscar todos os livros de determinado gênero.
- Encontrar os livros mais caros.
- Mostrar os empréstimos realizados por sócios de Feira de Santana.
- Identificar livros que nunca foram emprestados.
- Contar quantos empréstimos foram realizados.
- Calcular o total de multas por cidade e por sócio.
- Encontrar os três livros que tiveram mais empréstimos.
- Identificar sócios que já realizaram empréstimos e aqueles que nunca realizaram.

## ⚙️ Transações e otimização

Também pratiquei o uso de transações com `START TRANSACTION` e `COMMIT`, realizando atualizações e inserções de registros.

Na parte de otimização, utilizei o comando `EXPLAIN` para analisar uma consulta antes e depois da criação de um índice na coluna `id_socio` da tabela `emprestimos`.

O objetivo foi observar como os índices podem ajudar a melhorar o desempenho das consultas no banco de dados.

## 📚 O que aprendi

Com esse projeto, consegui praticar melhor os comandos SQL e entender como as tabelas se relacionam dentro de um banco de dados.

Uma das partes que mais exigiu atenção foi trabalhar com os JOINs e as subconsultas, pois precisei entender como buscar informações que estavam distribuídas em diferentes tabelas.

Também pude compreender melhor a importância das chaves estrangeiras, das funções de agregação e dos índices para organizar e consultar os dados.

Foi uma atividade importante para colocar em prática o que aprendi durante o módulo de SQL.

---

**Projeto desenvolvido como desafio para o módulo de SQL - Turma 34.**
