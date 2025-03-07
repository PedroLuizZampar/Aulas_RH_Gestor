# Diferenças entre Banco de Dados Local e Banco de Dados Gerenciado

## 1. Definição
- **Banco de Dados Local**: Instalado e mantido em um servidor próprio ou máquina local, exigindo gerenciamento manual.
- **Banco de Dados Gerenciado**: Hospedado na nuvem por um provedor, que cuida de manutenção, backups, escalabilidade e segurança.

## 2. Comparação

| Característica          | Banco de Dados Local  | Banco de Dados Gerenciado |
|------------------------|----------------------|--------------------------|
| **Instalação**         | Manual, feita pelo usuário | Automatizada pelo provedor |
| **Manutenção**         | Responsabilidade da equipe interna | Feita pelo provedor |
| **Escalabilidade**     | Limitada ao hardware local | Fácil, pode ser escalado sob demanda |
| **Segurança**         | Depende da equipe interna | Padrões altos de segurança do provedor |
| **Backup**            | Deve ser feito manualmente | Automático e gerenciado |
| **Performance**       | Depende da infraestrutura local | Otimizado pelo provedor |
| **Custo**            | Alto (infraestrutura + manutenção) | Pode ser mais barato a longo prazo |
| **Acesso**           | Restrito à rede local (salvo configuração de VPN) | Acessível de qualquer lugar |
| **Configuração**      | Totalmente customizável | Limitada às opções do provedor |

## 3. Quando Usar Cada Um?

- **Banco de Dados Local**:
  - Quando há necessidade de controle total sobre configurações e dados.
  - Para sistemas que não podem depender de internet para operar.
  - Se há recursos internos para gerenciamento e segurança.

- **Banco de Dados Gerenciado**:
  - Para aplicações escaláveis e acessíveis globalmente.
  - Se a equipe quer focar no desenvolvimento sem se preocupar com infraestrutura.
  - Quando segurança, backups e manutenção devem ser terceirizados.

## 4. Exemplos de Serviços Gerenciados

- **AWS RDS** (Amazon)
- **Google Cloud SQL**
- **Azure SQL Database**
- **MongoDB Atlas**
- **Firebase Firestore**

---

# História do SQL Server, Versões e Edições

## 1. História do SQL Server

O **SQL Server** é um sistema de gerenciamento de banco de dados relacional (RDBMS) desenvolvido pela **Microsoft**, lançado inicialmente em 1989. Ele foi criado em parceria com a **Sybase** e a **Ashton-Tate**, mas a partir da versão **SQL Server 7.0 (1998)**, a Microsoft assumiu o desenvolvimento de forma independente.

Desde então, o SQL Server evoluiu, incorporando recursos de **segurança, escalabilidade, analytics e integração com a nuvem**.

---

## 2. Principais Versões do SQL Server

| Versão | Ano de Lançamento | Principais Novidades |
|--------|------------------|----------------------|
| **SQL Server 1.0** | 1989 | Primeira versão, baseada no Sybase SQL Server |
| **SQL Server 6.5** | 1996 | Suporte a transações distribuídas e GUI melhorada |
| **SQL Server 7.0** | 1998 | Primeira versão totalmente desenvolvida pela Microsoft |
| **SQL Server 2000** | 2000 | Introdução do suporte a XML e maior integração com Windows |
| **SQL Server 2005** | 2005 | Implementação do **SQL CLR**, **SSIS**, **SSAS** e **SSRS** |
| **SQL Server 2008** | 2008 | Novos tipos de dados (geoespacial, hierárquico) e FileStream |
| **SQL Server 2012** | 2012 | **AlwaysOn Availability Groups** e índice colunar |
| **SQL Server 2014** | 2014 | **In-Memory OLTP** para melhor performance |
| **SQL Server 2016** | 2016 | Suporte a JSON, criptografia Always Encrypted e R Services |
| **SQL Server 2017** | 2017 | Suporte a Linux e integração com Python |
| **SQL Server 2019** | 2019 | Big Data Clusters e PolyBase melhorado |
| **SQL Server 2022** | 2022 | Integração aprimorada com Azure e melhor desempenho |

---

## 3. Edições do SQL Server

O **SQL Server** possui diferentes edições para atender a diversas necessidades de negócio:

| Edição | Descrição |
|--------|----------|
| **Enterprise** | Versão mais completa, com suporte total a alta disponibilidade, segurança avançada e big data |
| **Standard** | Voltada para médias empresas, com recursos essenciais de banco de dados e analytics |
| **Express** | Versão gratuita com limitações de recursos (máx. 10 GB por banco), ideal para aprendizado e pequenas aplicações |
| **Developer** | Igual à versão Enterprise, mas apenas para desenvolvimento e testes |
| **Web** | Otimizada para hospedagem em aplicações web com custos reduzidos |
| **Azure SQL Database** | Versão gerenciada na nuvem, com escalabilidade automática |

---

## 4. Conclusão

O **SQL Server** é um dos bancos de dados mais robustos do mercado, com evolução constante para suportar **alta performance, segurança e integração com a nuvem**. Com diversas edições, ele atende desde pequenas aplicações até grandes corporações.

---

# Infraestrutura para SQL Server

## 1. Hardware

| Componente | Recomendação |
|------------|-------------|
| **Processador (CPU)** | **Mínimo:** 2 núcleos de 2 GHz (**Recomendado:** Xeon ou AMD EPYC, com suporte a múltiplos threads) |
| **Memória RAM** | **Mínimo:** 4 GB (**Recomendado:** 16 GB ou mais, dependendo da carga) |
| **Armazenamento (Discos)** | **SSD recomendado** para melhor desempenho; mínimo **6 GB**, expansível conforme necessidade |
| **Placa de Rede** | 1 Gbps ou superior para ambientes críticos |
| **Controladora RAID** | RAID 1 para logs, RAID 10 para dados (evitar RAID 5 para bancos de alta carga) |

---

## 2. Sistema Operacional (SO)

| Requisito | Descrição |
|-----------|----------|
| **Sistemas Suportados** | **Windows Server 2016, 2019, 2022** (Recomendado) ou **Linux (Ubuntu, Red Hat, SUSE)** |
| **.NET Framework** | **.NET 4.6 ou superior** para alguns recursos do SQL Server |
| **Powershell** | **Versão 5.1 ou superior** para automação |
| **Atualizações** | Manter sempre atualizado com **patches de segurança** |

---

## 3. Instância do SQL Server

| Configuração | Descrição |
|-------------|----------|
| **Modo de Autenticação** | **Windows Authentication** (mais seguro) ou **Mixed Mode** |
| **Número de Instâncias** | Pode ter múltiplas instâncias no mesmo servidor, cada uma com sua configuração |
| **Portas de Comunicação** | Padrão **1433 (TCP/IP)**, pode ser personalizada |
| **Configuração de Memória** | Ajustar uso de RAM para não consumir 100% dos recursos do servidor |
| **Configuração de CPU** | Definir afinidade de CPU para otimizar desempenho |
| **TempDB** | Criar múltiplos arquivos para balancear carga de escrita |

---

## 4. Databases (Bancos de Dados)

| Elemento | Configuração |
|----------|-------------|
| **Tipos de Banco** | OLTP (transacional) e OLAP (analítico) |
| **Configuração de Collation** | Definir antes da criação do banco (ex: **SQL_Latin1_General_CP1_CI_AS**) |
| **Tamanho Inicial** | Evitar crescimento automático frequente, definir tamanho inicial adequado |
| **Recovery Model** | **Full, Simple ou Bulk-Logged**, dependendo da necessidade |
| **Índices** | Criar índices para otimizar consultas |
| **Filestream** | Ativar se precisar armazenar arquivos binários no banco |

---

## 5. Arquivos do SQL Server

| Tipo de Arquivo | Extensão | Função |
|----------------|----------|--------|
| **Primary Data File** | `.mdf` | Armazena dados principais do banco |
| **Secondary Data File** | `.ndf` | Usado para dividir carga em múltiplos discos |
| **Transaction Log** | `.ldf` | Registra transações para recuperação e integridade |
| **Filestream Data** | `varbinary(MAX)` | Armazena arquivos binários diretamente no banco |

**Melhores Práticas:**
- Manter **arquivos .mdf e .ldf em discos separados** para melhor performance.
- Configurar **growth automático** de forma controlada (ex: 512 MB por vez em vez de porcentagem).
- **Evitar fragmentação**, fazendo reindexação periódica.

---

## 6. Objetos do SQL Server

| Objeto | Descrição |
|--------|----------|
| **Tabelas** | Estruturas que armazenam os dados |
| **Índices** | Melhoram a velocidade das consultas |
| **Views** | Consultas armazenadas que podem simplificar acesso aos dados |
| **Stored Procedures** | Blocos de código SQL reutilizáveis |
| **Triggers** | Executam ações automáticas em eventos do banco |
| **Functions** | Funções customizadas para processamento de dados |
| **Schemas** | Organização lógica dos objetos do banco |

---

## 7. Backup e Recuperação

| Tipo de Backup | Descrição |
|---------------|----------|
| **Full Backup** | Cópia completa do banco de dados |
| **Differential Backup** | Copia apenas as alterações desde o último backup full |
| **Transaction Log Backup** | Captura logs de transações para recuperação ponto a ponto |
| **Automação de Backup** | Configurar Jobs no SQL Server Agent para agendamento |
| **Local de Armazenamento** | Backup local + cópia externa (cloud, storage externo) |

---

## 8. Alta Disponibilidade e Performance

| Tecnologia | Benefício |
|-----------|----------|
| **Always On Availability Groups** | Replica bancos de dados para servidores secundários |
| **Failover Cluster** | Permite continuidade do serviço em caso de falha |
| **Log Shipping** | Replica logs para um servidor secundário |
| **Replication** | Replica dados entre múltiplos servidores |
| **In-Memory OLTP** | Melhora performance armazenando dados diretamente na memória |
| **Partitioning** | Divide tabelas grandes para otimizar consultas |

---

## 9. Segurança e Controle de Acesso

| Item | Configuração |
|------|-------------|
| **Usuários e Permissões** | Definir acessos específicos por roles |
| **TDE (Transparent Data Encryption)** | Ativar criptografia de dados em repouso |
| **TLS para Conexões** | Configurar SSL/TLS para proteger comunicações |
| **Auditoria** | Monitorar atividades suspeitas no banco |

---

## 10. Monitoramento e Manutenção

| Ferramenta | Função |
|------------|--------|
| **SQL Server Profiler** | Analisar consultas e gargalos |
| **Extended Events** | Monitoramento avançado de eventos do SQL Server |
| **Database Engine Tuning Advisor** | Sugestões para otimização de índices |
| **PerfMon (Windows Performance Monitor)** | Monitoramento de CPU, memória e disco |
| **DMVs (Dynamic Management Views)** | Verificar estatísticas internas do banco |

---

## 11. Virtualização e Nuvem (Opcional)

- O SQL Server pode rodar em **máquinas virtuais (Hyper-V, VMware, Proxmox)**.
- Suporte a **Cloud Computing** com **Azure SQL, AWS RDS for SQL Server, Google Cloud SQL**.
- Replicação e armazenamento **híbrido** (on-premises + cloud).

---

## 12. Conclusão

Para ter um **SQL Server** eficiente e seguro, é essencial considerar:
1. **Hardware robusto e configuração adequada do sistema operacional**.
2. **Gerenciamento eficiente das instâncias e bancos de dados**.
3. **Configuração de arquivos e otimização de armazenamento**.
4. **Controle rigoroso de segurança e acessos**.
5. **Monitoramento contínuo e manutenção preventiva**.

Uma boa infraestrutura garante **performance, escalabilidade e confiabilidade** no ambiente SQL Server.

---

# Instância do SQL Server

## 1. O que é uma Instância?

Uma **instância** do SQL Server é um ambiente isolado de banco de dados dentro de um mesmo servidor. Cada instância possui sua própria **configuração, processos, usuários, bancos de dados e recursos**.

O SQL Server pode operar com:
- **Instância Padrão** (Default Instance) → A primeira instância no servidor, acessada apenas pelo nome do host.
- **Instâncias Nomeadas** (Named Instances) → Instâncias adicionais no mesmo servidor, cada uma com seu próprio nome e configuração.

---

## 2. Estrutura de uma Instância

Cada instância do SQL Server contém os seguintes componentes principais:

| Componente | Descrição |
|------------|----------|
| **SQL Server Database Engine** | Gerencia os bancos de dados e processa consultas SQL |
| **SQL Server Agent** | Automatiza tarefas e jobs agendados |
| **SQL Server Browser** | Gerencia conexões em servidores com múltiplas instâncias |
| **TempDB** | Banco temporário compartilhado entre os bancos da instância |
| **Master Database** | Contém as informações de configuração da instância |
| **Model Database** | Modelo para novos bancos de dados |
| **MSDB Database** | Armazena informações de jobs e históricos |

---

## 3. Tipos de Instâncias

### 🔹 **Instância Padrão (Default Instance)**
- Criada automaticamente na instalação do SQL Server.
- Acessada usando **o nome do servidor** (Exemplo: `SERVER01`).
- Porta padrão: **1433**.

### 🔹 **Instância Nomeada (Named Instance)**
- Criada manualmente, permitindo rodar **múltiplas instâncias no mesmo servidor**.
- Acessada usando **`Servidor\NomeInstancia`** (Exemplo: `SERVER01\SQLDEV`).
- Cada instância nomeada pode usar **portas diferentes**.

### 🔹 **Instância LocalDB**
- Versão leve do SQL Server usada para **desenvolvimento**.
- Executa localmente sem necessidade de configuração.
- Criada automaticamente com o Visual Studio (`(localdb)\MSSQLLocalDB`).

---

## 4. Configuração da Instância

### 🔹 **Autenticação**
- **Windows Authentication** (Mais seguro)
- **Mixed Mode** (Windows + SQL Server Authentication)

### 🔹 **Configuração de Memória**
- Definir **memória mínima e máxima** para evitar que o SQL Server consuma todos os recursos do sistema.

### 🔹 **Portas de Comunicação**
- **1433** → Porta padrão para instância padrão.
- **Dinâmica** → Usada por instâncias nomeadas (pode ser configurada manualmente).

### 🔹 **Configuração de CPU**
- Afinidade de CPU pode ser ajustada para otimizar desempenho.

### 🔹 **TempDB**
- Criar múltiplos arquivos para balancear carga e melhorar performance.

---

## 5. Vantagens de Usar Múltiplas Instâncias

| Vantagem | Descrição |
|----------|----------|
| **Isolamento** | Cada instância opera separadamente, sem interferir nas outras. |
| **Segurança** | Diferentes permissões e acessos por instância. |
| **Otimização de Recursos** | Alocação individual de memória, CPU e discos. |
| **Ambientes Separados** | Permite rodar ambientes **DEV, TEST e PROD** no mesmo servidor. |

---

## 6. Como Criar uma Nova Instância?

1. **Abrir o Instalador do SQL Server**
2. Escolher **Nova Instalação ou Adicionar Recursos**
3. Selecionar **Instância Nomeada** e definir um nome único
4. Configurar:
   - Modo de Autenticação
   - Diretórios de Armazenamento
   - Memória e CPU
5. Concluir a instalação e acessar a instância via **SSMS** ou **SQLCMD**.

---

## 7. Como Conectar a uma Instância?

| Cliente | Comando de Conexão |
|---------|--------------------|
| **SSMS (SQL Server Management Studio)** | `SERVER01\SQLDEV` |
| **SQLCMD (Prompt de Comando)** | `sqlcmd -S SERVER01\SQLDEV -U sa -P senha` |
| **String de Conexão (Aplicação .NET)** | `"Server=SERVER01\SQLDEV;Database=MeuBanco;User Id=sa;Password=senha;"` |

---

## 8. Monitoramento da Instância

| Ferramenta | Uso |
|------------|-----|
| **SQL Server Profiler** | Analisar desempenho de queries |
| **Activity Monitor** | Ver processos em execução |
| **Performance Monitor (PerfMon)** | Monitorar uso de CPU, memória e disco |
| **DMVs (Dynamic Management Views)** | Obter estatísticas detalhadas |

---

## 9. Manutenção da Instância

| Tarefa | Comando SQL |
|--------|------------|
| **Listar todas as instâncias disponíveis** | `SELECT @@SERVERNAME;` |
| **Verificar bancos de dados ativos** | `SELECT name FROM sys.databases;` |
| **Verificar versão do SQL Server** | `SELECT @@VERSION;` |
| **Configurar porta fixa** | Alterar nas configurações do SQL Server Configuration Manager |

---

## 10. Conclusão

A configuração de uma **instância do SQL Server** é crucial para **segurança, desempenho e escalabilidade**. Empresas podem rodar múltiplas instâncias no mesmo servidor para diferentes propósitos, como **produção, testes e desenvolvimento**.

---

