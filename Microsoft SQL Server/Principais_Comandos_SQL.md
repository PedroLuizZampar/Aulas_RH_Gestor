

# 💡 Principais Comandos SQL

| **Comando**         | **Descrição**                                                                                 | **Exemplo de Uso**                                                                      |
|----------------------|---------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| `SELECT`            | Recupera dados de uma tabela.                                                               | `SELECT nome, idade FROM usuarios;`                                                  |
| `SELECT AS`         | Renomeia colunas ou tabelas temporariamente na consulta.                                     | `SELECT nome AS NomeCompleto FROM usuarios;`                                         |
| `INSERT INTO`       | Insere novos registros em uma tabela.                                                       | `INSERT INTO usuarios (nome, idade) VALUES ('João', 30);`                            |
| `UPDATE`            | Atualiza registros existentes em uma tabela.                                                | `UPDATE usuarios SET idade = 31 WHERE nome = 'João';`                                |
| `DELETE`            | Remove registros de uma tabela.                                                             | `DELETE FROM usuarios WHERE idade < 18;`                                            |
| `CREATE TABLE`      | Cria uma nova tabela no banco de dados.                                                     | `CREATE TABLE usuarios (id INT, nome VARCHAR(50), idade INT);`                       |
| `DROP TABLE`        | Exclui uma tabela do banco de dados.                                                        | `DROP TABLE usuarios;`                                                               |
| `ALTER TABLE`       | Modifica a estrutura de uma tabela.                                                         | `ALTER TABLE usuarios ADD email VARCHAR(100);`                                       |
| `CREATE DATABASE`   | Cria um novo banco de dados.                                                                | `CREATE DATABASE minha_base;`                                                        |
| `DROP DATABASE`     | Exclui um banco de dados.                                                                   | `DROP DATABASE minha_base;`                                                          |
| `TRUNCATE TABLE`    | Remove todos os registros de uma tabela.                                                    | `TRUNCATE TABLE usuarios;`                                                           |
| `WHERE`             | Filtra registros com base em uma condição.                                                  | `SELECT * FROM usuarios WHERE idade > 18;`                                           |
| `ORDER BY`          | Ordena os registros com base em uma ou mais colunas.                                        | `SELECT * FROM usuarios ORDER BY idade DESC;`                                        |
| `GROUP BY`          | Agrupa registros com base em uma ou mais colunas.                                           | `SELECT cidade, COUNT(*) FROM usuarios GROUP BY cidade;`                             |
| `HAVING`            | Filtra grupos de registros após o uso de `GROUP BY`.                                        | `SELECT cidade, COUNT(*) FROM usuarios GROUP BY cidade HAVING COUNT(*) > 5;`         |
| `DISTINCT`          | Retorna apenas registros únicos.                                                            | `SELECT DISTINCT cidade FROM usuarios;`                                             |
| `LIMIT`             | Limita o número de registros retornados (MySQL, PostgreSQL).                                | `SELECT * FROM usuarios LIMIT 10;`                                                  |
| `TOP`               | Limita o número de registros retornados (SQL Server).                                       | `SELECT TOP 10 * FROM usuarios;`                                                    |
| `OFFSET`            | Especifica a partir de qual registro começar a exibição dos resultados.                     | `SELECT * FROM usuarios LIMIT 10 OFFSET 5;`                                         |
| `AS`                | Define um alias (nome temporário) para colunas ou tabelas.                                  | `SELECT nome AS NomeCompleto FROM usuarios;`                                         |
| `JOIN`              | Combina registros de duas ou mais tabelas com base em uma condição.                         | `SELECT u.nome, p.produto FROM usuarios u JOIN pedidos p ON u.id = p.usuario_id;`    |
| `INNER JOIN`        | Retorna registros que possuem correspondências em ambas as tabelas.                         | `SELECT u.nome, p.produto FROM usuarios u INNER JOIN pedidos p ON u.id = p.usuario_id;` |
| `LEFT JOIN`         | Retorna todos os registros da tabela da esquerda e os correspondentes da direita.           | `SELECT u.nome, p.produto FROM usuarios u LEFT JOIN pedidos p ON u.id = p.usuario_id;` |
| `RIGHT JOIN`        | Retorna todos os registros da tabela da direita e os correspondentes da esquerda.           | `SELECT u.nome, p.produto FROM usuarios u RIGHT JOIN pedidos p ON u.id = p.usuario_id;` |
| `FULL OUTER JOIN`   | Retorna todos os registros de ambas as tabelas.                                             | `SELECT u.nome, p.produto FROM usuarios u FULL OUTER JOIN pedidos p ON u.id = p.usuario_id;` |
| `UNION`             | Combina os resultados de duas ou mais consultas.                                            | `SELECT nome FROM usuarios UNION SELECT nome FROM clientes;`                         |
| `UNION ALL`         | Combina os resultados de duas ou mais consultas, incluindo duplicados.                      | `SELECT nome FROM usuarios UNION ALL SELECT nome FROM clientes;`                     |
| `CASE`              | Realiza operações condicionais.                                                             | `SELECT nome, CASE WHEN idade > 18 THEN 'Adulto' ELSE 'Menor' END AS Categoria FROM usuarios;` |
| `COALESCE`          | Retorna o primeiro valor não nulo de uma lista.                                             | `SELECT COALESCE(email, 'sem_email') AS Email FROM usuarios;`                        |
| `NULLIF`            | Retorna `NULL` se dois valores forem iguais, caso contrário, retorna o primeiro valor.       | `SELECT NULLIF(idade, 18) AS Idade FROM usuarios;`                                   |
| `LIKE`              | Realiza busca baseada em padrões.                                                           | `SELECT * FROM usuarios WHERE nome LIKE 'J%';`                                       |
| `IN`                | Verifica se um valor está dentro de uma lista de valores.                                   | `SELECT * FROM usuarios WHERE cidade IN ('São Paulo', 'Rio de Janeiro');`            |
| `BETWEEN`           | Filtra valores dentro de um intervalo.                                                      | `SELECT * FROM usuarios WHERE idade BETWEEN 18 AND 30;`                              |
| `EXISTS`            | Retorna verdadeiro se uma subconsulta retorna registros.                                    | `SELECT * FROM usuarios WHERE EXISTS (SELECT 1 FROM pedidos WHERE usuarios.id = pedidos.usuario_id);` |
| `NOT`               | Inverte uma condição lógica.                                                               | `SELECT * FROM usuarios WHERE NOT idade < 18;`                                       |
| `PRIMARY KEY`       | Define uma chave primária para identificar registros.                                       | `CREATE TABLE usuarios (id INT PRIMARY KEY, nome VARCHAR(50));`                      |
| `FOREIGN KEY`       | Define uma chave estrangeira para manter relações entre tabelas.                            | `ALTER TABLE pedidos ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id);` |
| `CHECK`             | Define uma condição que os dados devem atender.                                             | `CREATE TABLE usuarios (id INT, idade INT CHECK (idade >= 18));`                     |
| `DEFAULT`           | Define um valor padrão para uma coluna.                                                     | `CREATE TABLE usuarios (id INT, status VARCHAR(10) DEFAULT 'ativo');`                |
| `INDEX`             | Cria ou remove índices para acelerar a recuperação de dados.                                | `CREATE INDEX idx_nome ON usuarios (nome);`                                          |
| `VIEW`              | Cria uma visualização baseada em uma consulta SQL.                                          | `CREATE VIEW vw_usuarios_ativos AS SELECT * FROM usuarios WHERE status = 'ativo';`   |
| `WITH`              | Define uma consulta comum (CTE).                                                            | `WITH UsuariosComPedidos AS (SELECT usuario_id FROM pedidos) SELECT * FROM usuarios WHERE id IN (SELECT usuario_id FROM UsuariosComPedidos);` |
| `ROW_NUMBER()`      | Retorna o número da linha dentro de uma partição.                                           | `SELECT ROW_NUMBER() OVER (ORDER BY idade) AS NumLinha, nome FROM usuarios;`         |
| `RANK()`            | Retorna a classificação de um valor em uma partição.                                        | `SELECT RANK() OVER (ORDER BY idade) AS Ranking, nome FROM usuarios;`                |
| `DENSE_RANK()`      | Similar a `RANK`, mas sem lacunas.                                                          | `SELECT DENSE_RANK() OVER (ORDER BY idade) AS Ranking, nome FROM usuarios;`          |
| `NTILE()`           | Divide o conjunto de resultados em um número especificado de grupos.                       | `SELECT NTILE(4) OVER (ORDER BY idade) AS Quartil, nome FROM usuarios;`              |
| `OVER`              | Define como funções de janela (ex.: `ROW_NUMBER`) são aplicadas.                            | `SELECT SUM(salario) OVER (PARTITION BY departamento) AS TotalDepto FROM funcionarios;` |
| `IS NULL`           | Verifica se um valor é nulo.                                                               | `SELECT * FROM usuarios WHERE email IS NULL;`                                        |
| `IS NOT NULL`       | Verifica se um valor não é nulo.                                                           | `SELECT * FROM usuarios WHERE email IS NOT NULL;`                                    |
