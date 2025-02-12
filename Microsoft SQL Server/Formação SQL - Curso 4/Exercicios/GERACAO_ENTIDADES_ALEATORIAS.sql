
-- ESSA FUN��O GERA UMA POSI��O ALEAT�RIA EM UMA TABELA INFORMADA COMO PAR�METRO PARA JUNTARMOS DADOS ALEAT�RIOS PARA CRIA��O DE NOVAS NOTAS FISCAIS

CREATE FUNCTION ENTIDADE_ALEATORIA (@TIPO VARCHAR(20)) RETURNS VARCHAR(20) -- CRIANDO FUN��O (VARI�VEL TIPO: INFORMA A ENTIDADE QUE SER� GERADA)
AS
BEGIN
	DECLARE @ENTIDADE_ALEATORIO VARCHAR(20) -- VARI�VEL PARA ARMAZENAR O ID DA ENTIDADE
	DECLARE @TABELA TABLE (CODIGO VARCHAR(20)) -- VARI�VEL DO TIPO TABELA

	DECLARE @VAL_INICIAL INT -- VALOR ALEAT�RIO INICIAL
	DECLARE @VAL_FINAL INT -- VALOR ALEAT�RIO FINAL
	DECLARE @ALEATORIO INT -- N�MERO ALEAT�RIO GERADO
	DECLARE @CONT INT -- CONTADOR

	IF @TIPO = 'CLIENTE' -- SE O TIPO FOR CLIENTE
		BEGIN
			INSERT INTO @TABELA (CODIGO) SELECT CPF FROM [TABELA DE CLIENTES] -- INSERE A CONSULTA DE CLIENTES NA VARI�VEL DE TABELA
		END
	IF @TIPO = 'VENDEDOR' -- SE O TIPO FOR VENDEDOR
		BEGIN
			INSERT INTO @TABELA (CODIGO) SELECT MATRICULA FROM [TABELA DE VENDEDORES] -- INSERE A CONSULTA DE VENDEDORES NA VARI�VEL DE TABELA
		END
	IF @TIPO = 'PRODUTO' -- SE O TIPO FOR CLIENTE
		BEGIN
			INSERT INTO @TABELA (CODIGO) SELECT [CODIGO DO PRODUTO] FROM [TABELA DE PRODUTOS] -- INSERE A CONSULTA DE PRODUTOS NA VARI�VEL DE TABELA
		END

	SET @VAL_INICIAL = 1 -- VALOR INICIAL PARA ALEAT�RIO COME�A EM 1
	SELECT @VAL_FINAL = COUNT(*) + 1 FROM @TABELA -- VALOR FINAL � IGUAL A QUANTIDADE DE REGISTROS NA VARI�VEL DE TABELA + 1 PRA AJUSTAR
	SET @ALEATORIO = dbo.NUMERO_ALEATORIO(@VAL_INICIAL, @VAL_FINAL) -- GERA O N�MERO ALEAT�RIO USANDO A FUN��O CRIADA
	SET @CONT = 1 -- CONTADOR COME�A EM 1

	DECLARE CURSOR1 CURSOR FOR SELECT CODIGO FROM @TABELA -- DECLARA O CURSOR COMO A CONSULTA DA VARI�VEL DE TABELA

	OPEN CURSOR1 -- ABRE O CURSOR

	FETCH NEXT FROM CURSOR1 INTO @ENTIDADE_ALEATORIO -- VERIFICA O PRIMEIRO REGISTRO

	WHILE @CONT < @ALEATORIO -- ENQUANTO O CONTADOR FOR MENOR DO QUE O N�MERO ALEAT�RIO
	BEGIN
		FETCH NEXT FROM CURSOR1 INTO @ENTIDADE_ALEATORIO -- VAI PARA O PR�XIMO REGISTRO
		SET @CONT += 1 -- INCREMENTA NO CONTADOR
	END

	CLOSE CURSOR1 -- FECHA O CURSOR
	DEALLOCATE CURSOR1 -- DELETA O CURSOR

	RETURN @ENTIDADE_ALEATORIO -- RETORNA O IDENTIFICADOR ALEAT�RIO PARA ENTIDADE SOLICITADA
END

--------------------------------------------------------------------------------------------------------------

SELECT DBO.ENTIDADE_ALEATORIA('CLIENTE')
SELECT DBO.ENTIDADE_ALEATORIA('VENDEDOR')
SELECT DBO.ENTIDADE_ALEATORIA('PRODUTO')