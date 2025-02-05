
DECLARE @CLIENTE VARCHAR(20) -- VARI�VEL PARA ARMAZENAR O C�DIGO DO CLIENTE
DECLARE @VENDEDOR VARCHAR(20) -- VARI�VEL PARA ARMAZENAR O C�DIGO DO VENDEDOR
DECLARE @PRODUTO VARCHAR(20) -- VARI�VEL PARA ARMAZENAR O C�DIGO DO PRODUTO
DECLARE @DATA DATE -- VARI�VEL PARA ARMAZENAR A DATA DA NOTA
DECLARE @NUMERO INT -- VARI�VEL PARA ARMAZENAR O N�MERO DA NOVA NOTA FISCAL
DECLARE @IMPOSTO FLOAT -- VARI�VEL PARA ARMAZENAR O IMPOSTO DA NOTA
DECLARE @NUM_ITENS INT -- VARI�VEL PARA ARMAZENAR O NUMERO DE ITENS DA NOTA
DECLARE @CONT INT -- VARI�VEL PARA ARMAZENAR O CONTADOR DO LOOP
DECLARE @QUANTIDADE INT -- VARI�VEL PARA ARMAZENAR A QUANTIDADE DE CADA ITEM DOS ITENS NA NOTA
DECLARE @PRECO FLOAT -- VARI�VEL PARA ARMAZENAR O PRE�O DOS ITENSA DA NOTA
DECLARE @LISTA_PRODUTOS TABLE (PRODUTO VARCHAR(20)) -- VARI�VEL DO TIPO TABELA PARA ARMAZENAR OS PRODUTOS J� ADICIONADOS
DECLARE @AUXPRODUTO INT -- VARI�VEL PARA VERIFICAR SE O C�DIGO DO ITEM SELECIONADO J� FOI USADO

SET @DATA = '2025-02-05' -- DEFINE A DATA
SET @CLIENTE = DBO.ENTIDADE_ALEATORIA('CLIENTE') -- BUSCA UM CLIENTE ALEATORIO
SET @VENDEDOR = DBO.ENTIDADE_ALEATORIA('VENDEDOR') -- BUSCA UM VENDEDOR ALEATORIO
SELECT @NUMERO = MAX(NUMERO) + 1 FROM [NOTAS FISCAIS] -- ESTABELECE O N�MERO PARA A PR�XIMA NOTA
SET @IMPOSTO = 0.18 -- DEFINE O VALOR DO IMPOSTO
SET @CONT = 1 -- DEFINE O CONTADOR
SET @NUM_ITENS = DBO.NUMERO_ALEATORIO(2, 10) -- NUMERO ALEAT�RIO DE ITENS DIFERENTES NA NOTA

INSERT INTO [NOTAS FISCAIS] (CPF, MATRICULA, [DATA], NUMERO, IMPOSTO)
VALUES (@CLIENTE, @VENDEDOR, @DATA, @NUMERO, @IMPOSTO) -- CRIA A NOVA NOTA FISCAL

WHILE @CONT <= @NUM_ITENS -- ENQUANTO O CONTADOR FOR <= QUE O N�MERO DE PRODUTOS DIFERENTES NA NOTA
BEGIN
	SET @PRODUTO = DBO.ENTIDADE_ALEATORIA('PRODUTO') -- BUSCA UM PRODUTO ALEAT�RIO
	SELECT @AUXPRODUTO = COUNT(*) FROM  @LISTA_PRODUTOS WHERE PRODUTO = @PRODUTO -- VERIFICA SE O PRODUTO J� FOI USADO NESSA NOTA

	IF @AUXPRODUTO = 0 -- SE O PRODUTO AINDA N�O FOI USADO NESSA NOTA
		BEGIN
			SET @QUANTIDADE = DBO.NUMERO_ALEATORIO(5, 100) -- DEFINE UMA QUANTIDADE ALEAT�RIA DESSE PRODUTO
			SELECT @PRECO = [PRE�O DE LISTA] FROM [TABELA DE PRODUTOS] WHERE [CODIGO DO PRODUTO] = @PRODUTO -- BUSCA O PRE�O NA TABELA DE PRODUTOS
	
			INSERT INTO [ITENS NOTAS FISCAIS] (NUMERO, [CODIGO DO PRODUTO], QUANTIDADE, PRE�O)
			VALUES (@NUMERO, @PRODUTO, @QUANTIDADE, @PRECO) -- ADICIONA O NOVO ITEM CRIADO NA TABELA DE ITENS, J� VINCULANDO COM A NOTA

			INSERT INTO @LISTA_PRODUTOS (PRODUTO) VALUES (@PRODUTO) -- ADICIONA O PRODUTO USADO NA LISTA DE PRODUTOS J� UTILIZADOS NA NOTA

			SET @CONT += 1 -- INCREMENTA NO CONTADOR
		END
END