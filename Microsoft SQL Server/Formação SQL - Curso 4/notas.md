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
    ---
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
    ---
    ![alt text](image-11.png)

---

- ### Funções
    ![alt text](image-12.png)
    ---
    ![alt text](image-13.png)
    ---
    ![alt text](image-14.png)
    ---
    ![alt text](image-15.png)
    ---
    ![alt text](image-16.png)
    ---
    ![alt text](image-17.png)
    ---
    ![alt text](image-18.png)
    ---
    ![alt text](image-19.png)

    ---

- ### Stored Procedures
    ![alt text](image-20.png)
    ---
    ![alt text](image-22.png)
    ---
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
    ---
    ![alt text](image-31.png)

    - #### TRY-CATCH
        ![alt text](image-32.png)

- ### Cursor
    ![alt text](image-33.png)
    ---
    ![alt text](image-34.png)

- ### Criando números aleatórios
    ![alt text](image-35.png)

    ---

    # [EXERCÍCIO PROPOSTO](/Microsoft%20SQL%20Server/Formação%20SQL%20Curso%204/Exercicios/GERACAO_ENTIDADES_ALEATORIAS.sql)

    ``` SQL
    -- ESSA FUNÇÃO GERA UMA POSIÇÃO ALEATÓRIA EM UMA TABELA INFORMADA COMO PARÂMETRO PARA JUNTARMOS DADOS ALEATÓRIOS PARA CRIAÇÃO DE NOVAS NOTAS FISCAIS

    CREATE FUNCTION ENTIDADE_ALEATORIA (@TIPO VARCHAR(20)) RETURNS VARCHAR(20) -- CRIANDO FUNÇÃO (VARIÁVEL TIPO: INFORMA A ENTIDADE QUE SERÁ GERADA)
    AS
    BEGIN
        DECLARE @ENTIDADE_ALEATORIO VARCHAR(20) -- VARIÁVEL PARA ARMAZENAR O ID DA ENTIDADE
        DECLARE @TABELA TABLE (CODIGO VARCHAR(20)) -- VARIÁVEL DO TIPO TABELA

        DECLARE @VAL_INICIAL INT -- VALOR ALEATÓRIO INICIAL
        DECLARE @VAL_FINAL INT -- VALOR ALEATÓRIO FINAL
        DECLARE @ALEATORIO INT -- NÚMERO ALEATÓRIO GERADO
        DECLARE @CONT INT -- CONTADOR

        IF @TIPO = 'CLIENTE' -- SE O TIPO FOR CLIENTE
            BEGIN
                INSERT INTO @TABELA (CODIGO) SELECT CPF FROM [TABELA DE CLIENTES] -- INSERE A CONSULTA DE CLIENTES NA VARIÁVEL DE TABELA
            END
        IF @TIPO = 'VENDEDOR' -- SE O TIPO FOR VENDEDOR
            BEGIN
                INSERT INTO @TABELA (CODIGO) SELECT MATRICULA FROM [TABELA DE VENDEDORES] -- INSERE A CONSULTA DE VENDEDORES NA VARIÁVEL DE TABELA
            END
        IF @TIPO = 'PRODUTO' -- SE O TIPO FOR CLIENTE
            BEGIN
                INSERT INTO @TABELA (CODIGO) SELECT [CODIGO DO PRODUTO] FROM [TABELA DE PRODUTOS] -- INSERE A CONSULTA DE PRODUTOS NA VARIÁVEL DE TABELA
            END

        SET @VAL_INICIAL = 1 -- VALOR INICIAL PARA ALEATÓRIO COMEÇA EM 1
        SELECT @VAL_FINAL = COUNT(*) + 1 FROM @TABELA -- VALOR FINAL É IGUAL A QUANTIDADE DE REGISTROS NA VARIÁVEL DE TABELA + 1 PRA AJUSTAR
        SET @ALEATORIO = dbo.NUMERO_ALEATORIO(@VAL_INICIAL, @VAL_FINAL) -- GERA O NÚMERO ALEATÓRIO USANDO A FUNÇÃO CRIADA
        SET @CONT = 1 -- CONTADOR COMEÇA EM 1

        DECLARE CURSOR1 CURSOR FOR SELECT CODIGO FROM @TABELA -- DECLARA O CURSOR COMO A CONSULTA DA VARIÁVEL DE TABELA

        OPEN CURSOR1 -- ABRE O CURSOR

        FETCH NEXT FROM CURSOR1 INTO @ENTIDADE_ALEATORIO -- VERIFICA O PRIMEIRO REGISTRO

        WHILE @CONT < @ALEATORIO -- ENQUANTO O CONTADOR FOR MENOR DO QUE O NÚMERO ALEATÓRIO
        BEGIN
            FETCH NEXT FROM CURSOR1 INTO @ENTIDADE_ALEATORIO -- VAI PARA O PRÓXIMO REGISTRO
            SET @CONT += 1 -- INCREMENTA NO CONTADOR
        END

        CLOSE CURSOR1 -- FECHA O CURSOR
        DEALLOCATE CURSOR1 -- DELETA O CURSOR

        RETURN @ENTIDADE_ALEATORIO -- RETORNA O IDENTIFICADOR ALEATÓRIO PARA ENTIDADE SOLICITADA
    END
    ```

- ## Gerando Novas Notas Fiscais

    # [EXERCÍCIO PROPOSTO](/Microsoft%20SQL%20Server/Formação%20SQL%20Curso%204/Exercicios/GERACAO_NOVAS_NOTAS_FISCAIS.sql)

    ``` SQL
    DECLARE @CLIENTE VARCHAR(20) -- VARIÁVEL PARA ARMAZENAR O CÓDIGO DO CLIENTE
    DECLARE @VENDEDOR VARCHAR(20) -- VARIÁVEL PARA ARMAZENAR O CÓDIGO DO VENDEDOR
    DECLARE @PRODUTO VARCHAR(20) -- VARIÁVEL PARA ARMAZENAR O CÓDIGO DO PRODUTO
    DECLARE @DATA DATE -- VARIÁVEL PARA ARMAZENAR A DATA DA NOTA
    DECLARE @NUMERO INT -- VARIÁVEL PARA ARMAZENAR O NÚMERO DA NOVA NOTA FISCAL
    DECLARE @IMPOSTO FLOAT -- VARIÁVEL PARA ARMAZENAR O IMPOSTO DA NOTA
    DECLARE @NUM_ITENS INT -- VARIÁVEL PARA ARMAZENAR O NUMERO DE ITENS DA NOTA
    DECLARE @CONT INT -- VARIÁVEL PARA ARMAZENAR O CONTADOR DO LOOP
    DECLARE @QUANTIDADE INT -- VARIÁVEL PARA ARMAZENAR A QUANTIDADE DE CADA ITEM DOS ITENS NA NOTA
    DECLARE @PRECO FLOAT -- VARIÁVEL PARA ARMAZENAR O PREÇO DOS ITENSA DA NOTA
    DECLARE @LISTA_PRODUTOS TABLE (PRODUTO VARCHAR(20)) -- VARIÁVEL DO TIPO TABELA PARA ARMAZENAR OS PRODUTOS JÁ ADICIONADOS
    DECLARE @AUXPRODUTO INT -- VARIÁVEL PARA VERIFICAR SE O CÓDIGO DO ITEM SELECIONADO JÁ FOI USADO

    SET @DATA = '2025-02-05' -- DEFINE A DATA
    SET @CLIENTE = DBO.ENTIDADE_ALEATORIA('CLIENTE') -- BUSCA UM CLIENTE ALEATORIO
    SET @VENDEDOR = DBO.ENTIDADE_ALEATORIA('VENDEDOR') -- BUSCA UM VENDEDOR ALEATORIO
    SELECT @NUMERO = MAX(NUMERO) + 1 FROM [NOTAS FISCAIS] -- ESTABELECE O NÚMERO PARA A PRÓXIMA NOTA
    SET @IMPOSTO = 0.18 -- DEFINE O VALOR DO IMPOSTO
    SET @CONT = 1 -- DEFINE O CONTADOR
    SET @NUM_ITENS = DBO.NUMERO_ALEATORIO(2, 10) -- NUMERO ALEATÓRIO DE ITENS DIFERENTES NA NOTA

    INSERT INTO [NOTAS FISCAIS] (CPF, MATRICULA, [DATA], NUMERO, IMPOSTO)
    VALUES (@CLIENTE, @VENDEDOR, @DATA, @NUMERO, @IMPOSTO) -- CRIA A NOVA NOTA FISCAL

    WHILE @CONT <= @NUM_ITENS -- ENQUANTO O CONTADOR FOR <= QUE O NÚMERO DE PRODUTOS DIFERENTES NA NOTA
    BEGIN
        SET @PRODUTO = DBO.ENTIDADE_ALEATORIA('PRODUTO') -- BUSCA UM PRODUTO ALEATÓRIO
        SELECT @AUXPRODUTO = COUNT(*) FROM  @LISTA_PRODUTOS WHERE PRODUTO = @PRODUTO -- VERIFICA SE O PRODUTO JÁ FOI USADO NESSA NOTA

        IF @AUXPRODUTO = 0 -- SE O PRODUTO AINDA NÃO FOI USADO NESSA NOTA
            BEGIN
                SET @QUANTIDADE = DBO.NUMERO_ALEATORIO(5, 100) -- DEFINE UMA QUANTIDADE ALEATÓRIA DESSE PRODUTO
                SELECT @PRECO = [PREÇO DE LISTA] FROM [TABELA DE PRODUTOS] WHERE [CODIGO DO PRODUTO] = @PRODUTO -- BUSCA O PREÇO NA TABELA DE PRODUTOS
        
                INSERT INTO [ITENS NOTAS FISCAIS] (NUMERO, [CODIGO DO PRODUTO], QUANTIDADE, PREÇO)
                VALUES (@NUMERO, @PRODUTO, @QUANTIDADE, @PRECO) -- ADICIONA O NOVO ITEM CRIADO NA TABELA DE ITENS, JÁ VINCULANDO COM A NOTA

                INSERT INTO @LISTA_PRODUTOS (PRODUTO) VALUES (@PRODUTO) -- ADICIONA O PRODUTO USADO NA LISTA DE PRODUTOS JÁ UTILIZADOS NA NOTA

                SET @CONT += 1 -- INCREMENTA NO CONTADOR
            END
    END
    ```