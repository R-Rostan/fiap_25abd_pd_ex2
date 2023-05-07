# <b>Desenvolvimento de database no Hive</b>
<i>MBA Engenharia de Dados FIAP | Turma 25ABD<br>
Repositório para projeto do exercício 2 da matéria de processamento e armazenamento distribuído de dados do MBA de Engenharia de Dados.</i><br><br>

O ambiente de Big Data utilizado neste projeto está disponível no seguinte repositório:
- https://github.com/fabiogjardim/bigdata_docker

## <b>1. Bases de dados</b>
As bases de dados utilizadas para construção deste projeto estão disponíveis na pasta "datasets" deste repositório.

## <b>2. Ingestao arquivos para HDFS </b>
Para facilitar a implementação, foi desenvolvido o script "copy_datasets_to_hive_server.sh" que copia os arquivos da pasta "datasets" deste repositório para o container do hive-server através do uso do seguinte comando:
><i>docker cp [origem_arquivo] [id_container]:[destino_arquivo]</i>

Além dos arquivos CSV, no mesmo script também são enviados para o container outros dois arquivos, que são:

<b>1) move_datasets_local_to_hdfs.sh:</b> faz a criação das pastas no HDFS para cada arquivo CSV e os copia para dentro de sua pasta. Os comandos utilizados neste script são:
><i>hadoop fs -mkdir [nome_diretorio]</i> 

><i>hadoop fs -put [diretorio_origem] [diretorio_destino]</i>

<b>2) create_external_tables_query.hql:</b> arquivo com as consultas em SQL de criação das tabelas externas. Este script é lido e todas as consultas para criação do database "adventureworks" e das tabelas externas dentro do database são executadas. O comando utilizado para leitura e execução deste script no hive-server é:
><i>hive -f [nome_arquivo_hql]</i>

## <b>3. Criação do database e external tables</b>

### <b>Screenshots</b>
### Execução "copy_datasets_to_hive_server.sh"

- Antes de executar este script, é necessário a captura do ID do container correspondente ao hive-server, pois é preciso passar este ID no comando <i>"docker cp"</i>. Para captura do ID, basta executar o comando <i>"docker ps"</i> no terminal de comando.

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/docker_cp_hive_server.png)

- Execução do script

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/execucao_copy_datasets.png)

### Execução "move_datasets_local_to_hdfs.sh"

No localhost do hive-server (comando <i>"docker exec -it hive-server bash"</i>) executamos o script e a criação das pastas e arquivos no HDFS é realizada.

- Execução script no localhost

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/execucao_move_datasets.png)

- Distribuição dos arquivos

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/pastas_hdfs.png)

- Exemplo: arquivo "address.csv" dentro de seu respectivo diretório

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/exemplo_arquivo_hdfs.png)

### Execução de consultas no Hive para criação do database e tabelas externas

- Comando de leitura e execução do arquivo "create_external_tables_query.hql"

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/execucao_create_external_tables.png)

- Database criado com os datasets

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/database_hdfs.png)

- Exemplo: dataset "product"

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/exemplo_dataset_hdfs.png)

## <b>4. Criação das agregações de Produtos e Clientes</b>
Foram incluídos no script "create_external_tables_query.hql" as criações e inserções de dados das agregações de visão de Produtos e Clientes.

### <b>4.1 Agregação de Produtos</b>
Agregação contendo uma visão agrupada por "productid" e os seguintes indicadores:
* ranking_sales_by_productid

   ranking por maior quantidade de produtos vendidos por id e maior quantidade de categorias vendidas para critério de desempate;
   
   <b>KPI: </b>Visando entender a relevância de cada produto e sua representativa de referente aos demais, focamos na criação do ranking de modo a encontrar os melhores produtos a-parti de seus resultados de venda;
   
* ranking_sales_by_productcategoryid

   ranking por maior quantidade de categorias vendidas e maior quantidade de produtos vendidos por id para critério de desempate;
   
   <b>KPI: </b>Visando entender a relevância de cada produto e sua representativa de referente aos demais, focamos na criação do ranking de modo a encontrar os melhores produtos a-parti de seus resultados de vendas agrupados pro categoria;

* net

   valor do lucro líquido por venda de produto. racional: listprice - standardcost;
   
   <b>KPI: </b>Para entender e classificar o ROI de cada produtos calculamos o net entre o valor de tabela de cada produto sobre o valor de custo assim conseguimos direcionar nossas estratégias para produtos com maior rentabilidade histórico;
   
* net_margin

   margem percentual do lucro líquido do produto sobre o custo. racional: (listprice - standardcost)/standardcost;
   
   <b>KPI: </b>Para calcular o retorno esperado para cada produto focamos na criação desta métrica para acompanhar e estimar resultados a parti de um determinado produto;

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/agg_produtos_1.png)

### <b>4.2 Agregação de Clientes</b>
Agregação contendo uma visão agrupada por "customerid" e "city" e os seguintes indicadores:
* sum_total_due

   soma do valor total de faturamento do cliente;
   
   <b>KPI: </b>Visando priorizar os clientes com maior valor de faturamento, criamos esta métrica para auxiliar na segmentação dos clientes;
   
* quartile_invoicing

   classificação por quartil em torno do maior valor total do faturamento do cliente;
   
   <b>KPI: </b>Partindo da métrica criada a-parti do faturamento do cliente, atribuímos um cálculo estatístico para classificação em quartis para podermos agrupar de forma como que conseguimos entender e estudar comportamentos;  
   
* rank_invoicing

   ranking por maior valor total do faturamento do cliente;
   
   <b>KPI: </b>De modo a entender as quebras e concentrações dentro de cada uma das métricas citadas a cima, realizamos a construção do rank para medir e identificar possíveis concentrações de cada cliente;

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/agg_clientes_1.png)

### <b>5 Flattened table</b>
Com base nas agregações de Cliente e Produto além das informações da base de venda, criamos a tabela desnormalizada com os principais KPIs para o monitoramento do negócio.

Através do comando abaixo o script criará a tabela flatten_table com as devidas partições por cidade e a inserção dos dados;
><i>hive -f [nome_arquivo_hql]</i>

Para otimização do modelo, utilizamos como partição a cidade:

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/flatten_particoes.png)

Assim como o quartil para o bucketing:

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/flatten_bucketing.png)

A escolha da cidade como partição se dá pela necessidade de entendermos e direcionarmos esforços para cidades mais performáticas, dessa forma o particionamento pela cidade traria maior desempenho na execução das análises. 
Já o quartil como bucketing nos permite fazer a análise performática de quartis específicos para estudar os comportamentos dos clientes.
