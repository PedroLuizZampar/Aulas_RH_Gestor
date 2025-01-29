SELECT * FROM [NOTAS FISCAIS]

SELECT * FROM [ITENS NOTAS FISCAIS]

SELECT PROD.SABOR, YEAR(NF.[DATA]) AS ANO, SUM(ITEM.[PRE�O] * ITEM.QUANTIDADE) AS FATURAMENTO
FROM [TABELA DE PRODUTOS] PROD INNER JOIN [ITENS NOTAS FISCAIS] ITEM
ON PROD.[CODIGO DO PRODUTO] = ITEM.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF
ON NF.NUMERO = ITEM.NUMERO
WHERE YEAR(NF.[DATA]) = 2016
GROUP BY PROD.SABOR, YEAR(NF.[DATA])
ORDER BY PROD.SABOR