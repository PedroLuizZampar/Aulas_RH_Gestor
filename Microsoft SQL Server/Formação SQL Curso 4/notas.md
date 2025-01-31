# 📚 Anotações sobre a FORMAÇÃO SQL - CURSO 4 - T-SQL com Microsoft SQL Server

## Especificidades do Transact SQL

- ### Declaração de Variáveis
    ![alt text](image.png)

- ### Estruturas condicionais (IF e ELSE)
    ![alt text](image-1.png)

- ### Estruturas de Fluxo
    ![alt text](image-2.png)

- ### Execução de Loops
    ![alt text](image-3.png)

---

- ### Declarando Variáveis
    ![alt text](image-5.png)
    ![alt text](image-6.png)

---

- ### Controle de Fluxo
    ![alt text](image-7.png)

    - #### **Exemplo**
        ![alt text](image-8.png)

---

- ### While
    - #### **Exemplo**
        ![alt text](image-9.png)

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

---

- ### Tabelas Temporárias
    ![alt text](image-10.png)
    ![alt text](image-11.png)

---

- ### Funções
    ![alt text](image-12.png)
    ![alt text](image-13.png)
    ![alt text](image-14.png)
    ![alt text](image-15.png)
    ![alt text](image-16.png)
    ![alt text](image-17.png)
    ![alt text](image-18.png)
    ![alt text](image-19.png)

    ---

- ### Stored Procedures
    ![alt text](image-20.png)
    ![alt text](image-22.png)
    ![alt text](image-23.png)

    ---

    - ### Catálogo de Stored Procedures
        ![alt text](image-4.png)

    ---

    - #### Diferença entre Sotres Procedures e Funções
        ![alt text](image-21.png)

    ---

    - #### **Exemplo**
        ![alt text](image-24.png)

    ---

    - #### SP + TRIGGER
        ![alt text](image-25.png)

    ---

    - #### Criando Tipos de Dados
        ![alt text](image-27.png)

    ---

    - #### SP com Interface - Entrada Escalar
        ![alt text](image-29.png)

    ---

    - #### SP com Interface - Entrada Tabela
        ![alt text](image-28.png)

    ---

    - #### SP com Parâmetros de Saída
        ![alt text](image-26.png)

    ---

- ### Tratamento de Erros
    ![alt text](image-30.png)
    ![alt text](image-31.png)

    - #### TRY-CATCH
        ![alt text](image-32.png)

