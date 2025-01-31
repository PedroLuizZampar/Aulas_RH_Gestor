# 💡 Principais Comandos SQL

## Comandos Gerais
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

---

## Funções de String

| **Comando**         | **Descrição**                                                                                 | **Exemplo de Uso**                                                                      |
|----------------------|---------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| `LEN`               | Retorna o número de caracteres em uma string (sem contar espaços à direita).                | `SELECT LEN('ChatGPT'); -- Retorna 7`                                                 |
| `DATALENGTH`        | Retorna o tamanho da string em bytes.                                                        | `SELECT DATALENGTH('ChatGPT'); -- Retorna 7 (para VARCHAR)`                          |
| `LEFT`              | Retorna os primeiros N caracteres de uma string.                                             | `SELECT LEFT('ChatGPT', 4); -- Retorna 'Chat'`                                       |
| `RIGHT`             | Retorna os últimos N caracteres de uma string.                                               | `SELECT RIGHT('ChatGPT', 3); -- Retorna 'GPT'`                                       |
| `SUBSTRING`         | Retorna parte de uma string a partir de uma posição específica.                              | `SELECT SUBSTRING('ChatGPT', 2, 3); -- Retorna 'hat'`                                |
| `CHARINDEX`         | Retorna a posição de uma substring dentro de outra string.                                   | `SELECT CHARINDEX('G', 'ChatGPT'); -- Retorna 5`                                     |
| `PATINDEX`          | Retorna a posição da primeira ocorrência de um padrão dentro de uma string.                  | `SELECT PATINDEX('%G%', 'ChatGPT'); -- Retorna 5`                                    |
| `REPLACE`           | Substitui todas as ocorrências de uma substring por outra.                                   | `SELECT REPLACE('ChatGPT', 'GPT', 'Bot'); -- Retorna 'ChatBot'`                      |
| `STUFF`             | Substitui parte de uma string por outra, a partir de uma posição específica.                 | `SELECT STUFF('ChatGPT', 5, 3, 'Bot'); -- Retorna 'ChatBot'`                         |
| `UPPER`             | Converte uma string para maiúsculas.                                                         | `SELECT UPPER('ChatGPT'); -- Retorna 'CHATGPT'`                                      |
| `LOWER`             | Converte uma string para minúsculas.                                                         | `SELECT LOWER('ChatGPT'); -- Retorna 'chatgpt'`                                      |
| `LTRIM`             | Remove espaços em branco à esquerda de uma string.                                           | `SELECT LTRIM('  ChatGPT'); -- Retorna 'ChatGPT'`                                    |
| `RTRIM`             | Remove espaços em branco à direita de uma string.                                            | `SELECT RTRIM('ChatGPT  '); -- Retorna 'ChatGPT'`                                    |
| `FORMAT`            | Formata um valor de acordo com um formato especificado.                                      | `SELECT FORMAT(GETDATE(), 'dd/MM/yyyy'); -- Retorna data formatada`                  |
| `CONCAT`            | Concatena duas ou mais strings.                                                              | `SELECT CONCAT('Chat', 'GPT'); -- Retorna 'ChatGPT'`                                 |
| `CONCAT_WS`         | Concatena strings com um separador definido.                                                 | `SELECT CONCAT_WS('-', '2025', '01', '29'); -- Retorna '2025-01-29'`                 |
| `QUOTENAME`         | Adiciona colchetes ou aspas duplas a uma string.                                             | `SELECT QUOTENAME('ChatGPT'); -- Retorna '[ChatGPT]'`                                |
| `STRING_AGG`        | Concatena valores de uma coluna em uma única string, separados por um delimitador.          | `SELECT STRING_AGG(nome, ', ') FROM usuarios; -- Retorna 'João, Maria, Pedro'`       |
| `ASCII`            | Retorna o valor ASCII do primeiro caractere de uma string.                                   | `SELECT ASCII('A'); -- Retorna 65`                                                   |
| `CHAR`             | Retorna o caractere correspondente a um código ASCII.                                        | `SELECT CHAR(65); -- Retorna 'A'`                                                    |
| `DIFFERENCE`       | Compara o som das palavras e retorna um valor de similaridade.                               | `SELECT DIFFERENCE('Chat', 'Cat'); -- Retorna 4`                                     |
| `NCHAR`           | Retorna o caractere UNICODE correspondente ao código fornecido.                               | `SELECT NCHAR(65); -- Retorna 'A'`                                                   |
| `REPLICATE`       | Repete uma string um número específico de vezes.                                              | `SELECT REPLICATE('A', 5); -- Retorna 'AAAAA'`                                       |
| `REVERSE`        | Retorna a string com os caracteres na ordem inversa.                                          | `SELECT REVERSE('ChatGPT'); -- Retorna 'TPGtahC'`                                   |
| `SOUNDEX`        | Retorna um código fonético da string.                                                          | `SELECT SOUNDEX('Chat'); -- Retorna 'C300'`                                         |
| `SPACE`          | Retorna uma string de espaços em branco do tamanho especificado.                               | `SELECT SPACE(5) + 'ChatGPT'; -- Retorna '     ChatGPT'`                            |
| `STR`            | Converte um número para uma string.                                                            | `SELECT STR(123.45, 6, 2); -- Retorna '123.45'`                                     |
| `STRING_SPLIT`   | Divide uma string com base em um delimitador e retorna os valores como linhas de tabela.      | `SELECT * FROM STRING_SPLIT('A,B,C', ',');`                                         |
| `STRING_ESCAPE`  | Retorna uma string JSON escapada.                                                              | `SELECT STRING_ESCAPE('{"nome": "João"}', 'json');`                                 |
| `TRANSLATE`      | Substitui um ou mais caracteres em uma string por outros caracteres especificados.              | `SELECT TRANSLATE('abc', 'ac', 'xz'); -- Retorna 'xbz'`                            |
| `UNICODE`        | Retorna o código UNICODE do primeiro caractere de uma string.                                  | `SELECT UNICODE('A'); -- Retorna 65`                                                |

---

## Funções de Data

| **Comando**        | **Descrição**                                                                 | **Exemplo de Uso**                                                   |
|--------------------|-----------------------------------------------------------------------------|---------------------------------------------------------------------|
| `GETDATE`         | Retorna a data e hora atuais do servidor.                                   | `SELECT GETDATE(); -- Retorna '2025-01-29 14:30:00.000'`           |
| `SYSDATETIME`     | Retorna a data e hora atuais com mais precisão que `GETDATE()`.             | `SELECT SYSDATETIME(); -- Retorna '2025-01-29 14:30:00.1234567'`   |
| `CURRENT_TIMESTAMP` | Retorna a data e hora atuais, equivalente a `GETDATE()`.                 | `SELECT CURRENT_TIMESTAMP;`                                         |
| `GETUTCDATE`      | Retorna a data e hora atuais no formato UTC.                               | `SELECT GETUTCDATE(); -- Retorna '2025-01-29 17:30:00.000'`        |
| `DATETIME2`       | Tipo de dado que suporta maior precisão para data e hora.                  | `DECLARE @data DATETIME2 = SYSDATETIME();`                         |
| `DATE`            | Tipo de dado que armazena apenas a data sem a hora.                        | `DECLARE @data DATE = GETDATE();`                                  |
| `TIME`            | Tipo de dado que armazena apenas a hora sem a data.                        | `DECLARE @hora TIME = SYSDATETIME();`                              |
| `DATETIMEOFFSET`  | Tipo de dado que inclui o fuso horário junto com a data e hora.            | `DECLARE @data DATETIMEOFFSET = SYSDATETIMEOFFSET();`              |
| `YEAR`           | Retorna o ano de uma data especificada.                                     | `SELECT YEAR('2025-01-29'); -- Retorna 2025`                      |
| `MONTH`          | Retorna o mês de uma data especificada.                                     | `SELECT MONTH('2025-01-29'); -- Retorna 1`                         |
| `DAY`            | Retorna o dia do mês de uma data especificada.                              | `SELECT DAY('2025-01-29'); -- Retorna 29`                          |
| `DATEPART`       | Retorna uma parte específica de uma data.                                  | `SELECT DATEPART(HOUR, GETDATE()); -- Retorna a hora atual`       |
| `DATENAME`       | Retorna uma parte da data como texto.                                      | `SELECT DATENAME(MONTH, GETDATE()); -- Retorna 'Janeiro'`          |
| `EOMONTH`        | Retorna o último dia do mês da data especificada.                         | `SELECT EOMONTH(GETDATE()); -- Retorna '2025-01-31'`              |
| `SWITCHOFFSET`   | Ajusta o fuso horário de um `DATETIMEOFFSET`.                             | `SELECT SWITCHOFFSET(SYSDATETIMEOFFSET(), '-03:00');`             |
| `TODATETIMEOFFSET` | Converte uma data normal para `DATETIMEOFFSET` com um fuso horário.      | `SELECT TODATETIMEOFFSET(GETDATE(), '-03:00');`                   |
| `DATEADD`        | Adiciona ou subtrai um valor de uma parte da data.                         | `SELECT DATEADD(DAY, 10, GETDATE()); -- Adiciona 10 dias`         |
| `DATEDIFF`       | Retorna a diferença entre duas datas em uma unidade específica.           | `SELECT DATEDIFF(DAY, '2025-01-01', '2025-01-29'); -- Retorna 28` |
| `ISDATE`         | Verifica se uma expressão é uma data válida (retorna 1 para verdadeiro).   | `SELECT ISDATE('2025-01-29'); -- Retorna 1`                       |
| `FORMAT`         | Formata uma data de acordo com um padrão especificado.                    | `SELECT FORMAT(GETDATE(), 'dd/MM/yyyy'); -- Retorna '29/01/2025'` |

---

## Funções Matemáticas

| **Comando**        | **Descrição**                                                               | **Exemplo de Uso**                                      |
|--------------------|---------------------------------------------------------------------------|--------------------------------------------------------|
| `ABS`             | Retorna o valor absoluto de um número.                                    | `SELECT ABS(-10); -- Retorna 10`                      |
| `CEILING`         | Retorna o menor número inteiro maior ou igual ao valor especificado.      | `SELECT CEILING(4.2); -- Retorna 5`                   |
| `FLOOR`           | Retorna o maior número inteiro menor ou igual ao valor especificado.      | `SELECT FLOOR(4.8); -- Retorna 4`                     |
| `ROUND`           | Arredonda um número para a precisão especificada.                        | `SELECT ROUND(4.567, 2); -- Retorna 4.57`             |
| `POWER`           | Retorna um número elevado a uma potência específica.                     | `SELECT POWER(2, 3); -- Retorna 8`                    |
| `SQRT`            | Retorna a raiz quadrada de um número.                                    | `SELECT SQRT(16); -- Retorna 4`                       |
| `EXP`             | Retorna o valor de "e" elevado à potência do número especificado.        | `SELECT EXP(1); -- Retorna 2.7182818`                 |
| `LOG`             | Retorna o logaritmo natural (base e) de um número.                       | `SELECT LOG(10); -- Retorna 2.302585`                 |
| `LOG10`           | Retorna o logaritmo de base 10 de um número.                             | `SELECT LOG10(100); -- Retorna 2`                     |
| `PI`              | Retorna o valor de π (pi).                                               | `SELECT PI(); -- Retorna 3.14159265358979`            |
| `RADIANS`         | Converte um valor em graus para radianos.                                | `SELECT RADIANS(180); -- Retorna 3.14159265358979`    |
| `DEGREES`         | Converte um valor em radianos para graus.                               | `SELECT DEGREES(PI()); -- Retorna 180`                |
| `SIGN`            | Retorna o sinal de um número (-1, 0 ou 1).                               | `SELECT SIGN(-10); -- Retorna -1`                     |
| `RAND`            | Retorna um número aleatório entre 0 e 1.                                | `SELECT RAND(); -- Exemplo de saída: 0.834572`        |
| `SIN`             | Retorna o seno de um ângulo especificado em radianos.                   | `SELECT SIN(PI()/2); -- Retorna 1`                    |
| `COS`             | Retorna o cosseno de um ângulo especificado em radianos.                | `SELECT COS(PI()); -- Retorna -1`                     |
| `TAN`             | Retorna a tangente de um ângulo especificado em radianos.               | `SELECT TAN(PI()/4); -- Retorna 1`                    |
| `ASIN`            | Retorna o arco seno de um número.                                       | `SELECT ASIN(1); -- Retorna 1.5707963 (PI/2)`         |
| `ACOS`            | Retorna o arco cosseno de um número.                                    | `SELECT ACOS(0); -- Retorna 1.5707963 (PI/2)`         |
| `ATAN`            | Retorna o arco tangente de um número.                                   | `SELECT ATAN(1); -- Retorna 0.785398 (PI/4)`         |
| `ATN2`           | Retorna o arco tangente de dois valores (X e Y).                        | `SELECT ATN2(1, 1); -- Retorna 0.785398 (PI/4)`      |
| `DIV`            | Realiza a divisão inteira entre dois números.                           | `SELECT 10 / 3; -- Retorna 3 (divisão inteira)`      |
| `MOD`            | Retorna o resto da divisão entre dois números.                          | `SELECT 10 % 3; -- Retorna 1 (resto da divisão)`     |

---

## Funções de Coversão de Dados

| **Comando**       | **Descrição**                                                              | **Exemplo de Uso**                                      |
|-------------------|--------------------------------------------------------------------------|--------------------------------------------------------|
| `CAST`           | Converte um valor para um tipo de dado específico.                       | `SELECT CAST(10 AS FLOAT); -- Retorna 10.0`           |
| `CONVERT`        | Converte um valor para um tipo de dado específico, permitindo formatos.  | `SELECT CONVERT(VARCHAR, GETDATE(), 103); -- Retorna '29/01/2025'` |
| `TRY_CAST`       | Tenta converter um valor e retorna NULL se a conversão falhar.          | `SELECT TRY_CAST('ABC' AS INT); -- Retorna NULL`      |
| `TRY_CONVERT`    | Tenta converter um valor com formato específico e retorna NULL se falhar. | `SELECT TRY_CONVERT(DATE, '2025-01-29'); -- Retorna '2025-01-29'` |
| `PARSE`         | Converte strings formatadas para tipos numéricos ou data.                | `SELECT PARSE('29/01/2025' AS DATE USING 'pt-BR'); -- Retorna '2025-01-29'` |
| `TRY_PARSE`     | Tenta converter strings formatadas para tipos numéricos ou data, retornando NULL se falhar. | `SELECT TRY_PARSE('ABC' AS INT USING 'en-US'); -- Retorna NULL` |
| `STR`           | Converte um número para string, especificando o tamanho e casas decimais. | `SELECT STR(123.456, 6, 2); -- Retorna '123.46'`      |
| `FORMAT`        | Formata um valor numérico ou de data para string personalizada.          | `SELECT FORMAT(1234.56, 'C', 'en-US'); -- Retorna '$1,234.56'` |
| `UNICODE`       | Retorna o código Unicode do primeiro caractere de uma string.            | `SELECT UNICODE('A'); -- Retorna 65`                  |
| `ASCII`         | Retorna o código ASCII do primeiro caractere de uma string.              | `SELECT ASCII('A'); -- Retorna 65`                    |

---

![alt text](<Formação SQL - Curso 2/SQL Server Data Type Conversion Chart.png>)

---

## Funções Parecidas com Outras Funções Usadas na Programação

| **Comando**       | **Descrição**                                                                 | **Exemplo de Uso**                                      |
|-------------------|-----------------------------------------------------------------------------|--------------------------------------------------------|
| `DECLARE`        | Declara uma variável no SQL Server.                                        | `DECLARE @nome VARCHAR(50); SET @nome = 'João';`      |
| `SET`           | Atribui um valor a uma variável.                                           | `SET @idade = 25;`                                    |
| `SELECT INTO`   | Declara e insere dados em uma nova tabela a partir de uma consulta.       | `SELECT * INTO #TempTable FROM usuarios;`             |
| `IF ... ELSE`   | Estrutura condicional para executar comandos baseados em uma condição.   | `IF @idade >= 18 BEGIN PRINT 'Maior de idade'; END ELSE BEGIN PRINT 'Menor de idade'; END` |
| `CASE`         | Expressão condicional para múltiplos valores.                             | `SELECT nome, CASE WHEN idade >= 18 THEN 'Adulto' ELSE 'Menor' END AS Tipo FROM usuarios;` |
| `WHILE`        | Cria um loop enquanto uma condição for verdadeira.                       | `WHILE @contador <= 10 BEGIN PRINT @contador; SET @contador = @contador + 1; END` |
| `BREAK`        | Interrompe um loop imediatamente.                                        | `IF @contador = 5 BREAK;`                             |
| `CONTINUE`     | Pula a iteração atual e avança para a próxima no loop.                  | `IF @contador = 3 CONTINUE;`                          |
| `GOTO`        | Transfere a execução para um marcador específico.                        | `GOTO Fim; PRINT 'Não será executado'; Fim: PRINT 'Fim do código';` |
| `RETURN`      | Sai imediatamente de um bloco de código, como uma stored procedure.      | `IF @idade < 18 RETURN;`                              |
| `TRY ... CATCH` | Captura erros e permite tratamento de exceções.                        | `BEGIN TRY SELECT 1/0; END TRY BEGIN CATCH PRINT 'Erro!'; END CATCH` |
| `BEGIN ... END` | Define um bloco de código.                                             | `BEGIN PRINT 'Início'; PRINT 'Fim'; END`             |
| `WAITFOR DELAY` | Faz uma pausa na execução por um tempo específico.                     | `WAITFOR DELAY '00:00:05'; -- Espera 5 segundos`     |
| `WAITFOR TIME` | Pausa a execução até um horário específico.                            | `WAITFOR TIME '23:59:59';`                           |
| `RAISERROR`   | Gera um erro personalizado.                                             | `RAISERROR ('Erro personalizado!', 16, 1);`          |
| `THROW`       | Lança uma exceção.                                                      | `THROW 50000, 'Erro ocorrido.', 1;`                  |
