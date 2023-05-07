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

   ranking por maior quantidade de produtos vendidos por id e maior quantidade de categorias vendidas para critério de desempate
* ranking_sales_by_productcategoryid
   ranking por maior quantidade de categorias vendidas e maior quantidade de produtos vendidos por id para critério de desempate
* net
   valor do lucro líquido por venda de produto. racional: listprice - standardcost
* net_margin
   margem percentual do lucro líquido do produto sobre o custo. racional: (listprice - standardcost)/standardcost

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/agg_produtos_1.png)

### <b>4.2 Agregação de Clientes</b>
Agregação contendo uma visão agrupada por "customerid" e "city" e os seguintes indicadores:
* sum_total_due
   soma do valor total de faturamento do cliente
* quartile_invoicing
   classificação por quartil em torno do maior valor total do faturamento do cliente
* rank_invoicing
   ranking por maior valor total do faturamento do cliente

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/agg_clientes_1.png)
