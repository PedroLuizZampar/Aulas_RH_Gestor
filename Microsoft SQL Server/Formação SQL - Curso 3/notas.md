# 📚 Anotações sobre a FORMAÇÃO SQL - CURSO 3 - Manipulação de Dados com Microsoft SQL Server

## Projeto de Banco de Dados
- ### Análise dos requisitos
    - Entendimento das regras de negócio;
    - Efetuar atividades de entrevistas e reuniões;
    - Desenho de modelo mais fiel a realidade;

- ### Modelo conceitual
    - Construção do diagrama de entidade e relacionamento;
    - Estabelecer a cardinalidade das entidades;

- ### Diagrama Entidade-Relacionamento

    >| Cardinalidade       | Notação (Chen) | Notação (UML) | Descrição |
    >|---------------------|---------------|---------------|-----------|
    >| Um para Um (1:1)   | (1,1) - (1,1)  | 1..1 - 1..1   | Uma entidade A está associada a no máximo uma entidade B e vice-versa. |
    >| Um para Muitos (1:N) | (1,1) - (0,N) | 1..1 - 0..*   | Uma entidade A pode se relacionar com várias entidades B, mas uma entidade B só se relaciona com uma A. |
    >| Muitos para Um (N:1) | (0,N) - (1,1) | 0..* - 1..1   | O inverso da cardinalidade 1:N, onde várias entidades A se relacionam com uma única entidade B. |
    >| Muitos para Muitos (M:N) | (0,N) - (0,N) | 0..* - 0..*   | Uma entidade A pode se relacionar com várias entidades B e vice-versa. |


    ### **Exemplo**

    ![alt text](image.png)

---

- ### Atributos das Entidades
    - Estabelece características de cada entidade

    ### **Exemplo**

    ![alt text](image-1.png)

---

- ### Transformar o Diagrama de Entidades em Banco de Dados
    - Transformar cada entidade em uma ou mais tabelas físicas do banco de dados;
    - Cada relação da modelagem será um relacionamento nas tabelas do banco de dados;

    ### **Exemplo**

    ![alt text](image-2.png)

---

- ### Construção do Projeto de Banco de Dados
    - Para essa construção, podemos usar ferramentas CASE (Computer-Aided Software Engineening)
    - **Ex:** Star, UML, Astah, ERWin

---

- ### Parâmetros Principais para a Criação de um Banco de Dados

    ![alt text](image-3.png)

- ### Comando para Deletar um Banco de Dados

    ![alt text](image-4.png)

- ### Criação e Exclusão de Tabelas

    ![alt text](image-5.png)

- ### Criação de Relacionamentos entre Tabelas (Foreign Keys)

    ![alt text](image-6.png)

- ### Inclusão de Dados nas Tabelas

    ![alt text](image-7.png)

- ### Alteração de Dados nas Tabelas

    ![alt text](image-8.png)

    - ##### **UPDATE FROM**
        ![alt text](image-9.png)

    - ##### **MERGE**
        ![alt text](image-10.png)

- ### Exclusão de Dados nas Tabelas

    ![alt text](image-11.png)

- ### BEGIN TRANSACTION, COMMIT E ROLLBACK

    ![alt text](image-12.png)
    ![alt text](image-13.png)

    > ## **COMMIT CONFIRMA AS ALTERAÇÕES**

---

- ### Campos com auto-incremento

    ![alt text](image-14.png)
    ![alt text](image-15.png)

---

- ### TRIGGERs

    ![alt text](image-16.png)

    - #### Sintaxe

        ![alt text](image-17.png)

- ### CHECK

    ![alt text](image-18.png)