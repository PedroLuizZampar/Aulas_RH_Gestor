# 📚 Anotações sobre a FORMAÇÃO SQL - CURSO 1 - INTRODUÇÃO SQL SERVER

### 📖 Definições
- Um serividor é composto por um ou mais banco de dados. Esses bancos possuem várias entidades básicas, sendo elas:
    - 📄 **Tabela:** possui **campos** (colunas) e **registros** (linhas). Todo campo tem um tipo e todo registro em um campo só poder ser daquele tipo em específico. Para criar uma tabela é preciso estabelecer os campos e os tipos. A quantidade de registros não precisa ser delimitada;
        - 🔐 **Chaves Primárias:** Campos que possuem valores que não podem se repetir em nenhum outro registro no campo a qual pertence. Uma tabela pode ter mais de uma chave primária;
        - 🔑 **Chaves estrangeiras:** Campos ques armazenam o relacionamento entre tabelas, onde os registros de uma tabela devem ser iguais aos da tabela que está sendo realizado o relacionamento, no campo com tipagem de chave estrangeira;
        - 🔎 **Índice:** informa o posicionamento de um valor na tabela através da posição do valor na tabela. **Uma chave primária também é o índice da tabela**;

    - 🗺️ **Esquemas:** Grupo de tabelas dentro de um banco de dados;

    - 👀 **Views:** **Estrutura lógica que armazena consultas** e que podem ser visualizadas em formato de uma única tabela, porém não é uma tabela, pois ela não existe fisicamente. Também é possível fazer views a partir de views;

    - 🎬 **Procedures:** **Funções dentro do banco de dados** usados para visualização e até edição, criação e exclusão de dados;

    - 🔥 **Trigger:** Comando executado a partir de uma ação no banco de dados. **É como uma automação**;

---

### ❔🎲 Tipos de Dados

#### 🔢 ***Numéricos Exatos***

- **BigInt:** números inteiros grandes, com limite de 8 bytes de tamanho;
- **Numeric:** números decimais com precisão e escalas fixos. Tamanho de 5 a 17 bytes, com a precisão podendo chegar a 38 casas;
- **Bit:** aceita valores 1, 0 ou nulo
- **SmallInt:** números inteiros pequenos, com limite de 4 bytes de tamanho;
- **Decimal:** igual ao Numeric
- **SmallMoney:** pequenos valores monetários ou moedas com a sigla da moeda;
- **Int:** números inteiros com limite de 4 bytes de tamanho;
- **Money:** grandes valores monetários ou moedas com a sigla da moeda;

#### 🔢 ***Numéricos aproximados (com ponto flutuante)***

- **Float:** números decimais com tamanho indefinido;
- **Real:** números reais de até 4 bytes;

#### 📅 ***Data e Hora***

- **Data:** armazena a data e vai de `0001-01-01` a `9999-12-31`;
- **DataTimeOffset:** data com hora, minutos e segundos com reconhecimento de fuso horário;
- **DateTime2:** data com hora e minutos expressa de 0 a 24;
- **SmallDate:** data com hora expressa de 0 a 24;
- **DateTime:** data com hora, minutos e segundos expressa de 0 a 24;
- **Time:** hora, minutos e segundos expressa de 0 a 24;

#### 🔠 ***Caracteres***

- **Char:** Cadeia de caracteres não Unicode com valor fixo de 1 a 8000;
- **Varchar:** Cadeia de caracteres não Unicode com valor variável, podendo chegar a 2GB;
- **Texto:** Dados não Unicode de comprimento variável para armazenar dados grandes ou binários;
- **nChar:** Cadeia de caracteres Unicode com valor fixo de 1 a 8000;
- **nVarchar:** Cadeia de caracteres Unicode com valor variável, podendo chegar a 2GB;
- **nTexto:** Dados não Unicode de comprimento variável para armazenar dados grandes ou binários;
> **Unicode:** Fornece um único conjunto de caracteres contendo os idiomas do mundo.

#### 0️⃣1️⃣ ***Caracteres Binários***

- **Binário:** Cadeia de caracteres específico para armazenamento binário;
- **VarBinário:** Mesma coisa que o binário, só que com um armazenamento maior;

---

### Criando a Primeira Tabela

- **Estrutura:** CREATE TABLE [ NOME DA TABELA ] (
    [ NOME DO CAMPO ] [ TIPO DO DADO ]( [ DELIMITAÇÃO DO TAMANHO ] ),
    ...
)

**Exemplo:**
``` SQL
CREATE TABLE TABELA_DE_CLIENTES 
(
	CPF VARCHAR(11),
	NOME VARCHAR(100),
	ENDERECO1 VARCHAR(150),
	ENDERECO2 VARCHAR(150),
	BAIRRO VARCHAR(50),
	CIDADE VARCHAR(50),
	ESTADO VARCHAR(2),
	CEP VARCHAR(8),
	DATA_NASCIMENTO DATE,
	IDADE SMALLINT,
	SEXO VARCHAR(1),
	LIMITE_CREDITO MONEY,
	VOLUME_COMPRA FLOAT,
	PRIMEIRA_COMPRA BIT
)
```

---

### Inserindo Informações em uma Tabela

- **Estrutura:** INSERT INTO [ NOME DA TABELA ] ( [ CAMPO DA TABELA ], ...) VALUES ( [ VALORES ], ...)

**Exemplo:**

``` SQL
INSERT INTO TABELA_DE_PRODUTOS
(
	CODIGO_PRODUTO,
	NOME_PRODUTO,
	EMBALAGEM,
	TAMANHO,
	SABOR,
	PRECO_LISTA
)
VALUES
(
	'1040107', 'Light - 350 ml - Melancia', 'LATA', '350 ML' , 'MELANCIA', 4.56
)
```

---

### Atualizando Informações em uma Tabela

- **Estrutura:** UPDATE [ NOME DA TABELA ] SET [ CAMPO DA TABELA ] = [ VALOR ], ... WHERE [ CLÁUSULA ]

**Exemplo:**

``` SQL
UPDATE TABELA_DE_PRODUTOS SET
EMBALAGEM = 'LATA'
SABOR = 'MELANCIA',
WHERE CODIGO_PRODUTO = 1
```

---

### Excluindo Informações em uma Tabela

- **Estrutura:** DELETE FROM [ NOME DA TABELA ] WHERE [ CLÁUSULA ]

**Exemplo:**

``` SQL
DELETE FROM TABELA_DE_PRODUTOS
WHERE CODIGO_PRODUTO = 1
```

---

### Alterando a estrutura de uma Tabela

- Para fazer isso, usamos o comando **`ALTER TABLE`**. Esse comando pode modificar, alterar ou excluir atributos da estrutura da tabela

**Exemplo:**

``` SQL
-- Configurando campo como chave primária (para isso o campo não pode aceitar valores nulos e seus registros não podem se repetir)

ALTER TABLE TABELA_DE_PRODUTOS
ADD CONSTRAINT PK_PRODUTOS
PRIMARY KEY CLUSTERED (CODIGO_PRODUTO)

-- eu poderia criar uma chave composta adicionando uma vírgula e incluindo outra informação depois de CODIGO_PRODUTO

----------------------------------------------------

-- Alterando um campo para que ele não aceite valores nulos

ALTER TABLE TABELA_DE_PRODUTOS
ALTER COLUMN CODIGO_PRODUTO
VARCHAR(10) NOT NULL

```

---

### Manipulando dados do tipo DATE

> Dados do tipo `DATE` devem ser usados no padrão universal ***('ano-mês-dia')***

**Exemplo:**

``` SQL
INSERT INTO TABELA_DE_CLIENTES
(
    DATA_NASCIMENTO
)
VALUES
(
    '2007-04-16'
)
```

---