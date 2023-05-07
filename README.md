# <b>Desenvolvimento de database no Hive</b>
>MBA Engenharia de Dados FIAP | Turma 25ABD<br>
Repositório para projeto do exercício 2 da matéria de processamento e armazenamento distribuído de dados do MBA de Engenharia de Dados.

O ambiente de Big Data utilizado neste projeto está disponível no seguinte repositório:
- https://github.com/fabiogjardim/bigdata_docker

## <b>1. Bases de dados</b>
As bases de dados utilizadas para construção deste projeto estão disponíveis na pasta "datasets" deste repositório.

## <b>2. Ingestao arquivos para HDFS </b>
Para facilitar a implementação, foi desenvolvido o script "copy_datasets_to_hive_server.sh" que copia os arquivos da pasta "datasets" deste repositório para o container do hive-server através do uso do seguinte comando:
><i>docker cp [origem_arquivo] [id_container]:[destino_arquivo]</i>

Além dos arquivos CSV, no mesmo script também são enviados para o container outros dois arquivos, que são:
- <b>move_datasets_local_to_hdfs.sh:</b> faz a criação das pastas no HDFS para cada arquivo CSV e copia um dos arquivos para dentro de sua pasta.<br>
Os comandos usados são:
><i>hadoop fs -mkdir [nome_diretorio]</i> 

><i>hadoop fs -put [diretorio_origem] [diretorio_destino]</i>

- <b>create_external_tables_query.hql:</b> arquivo com as consultas em SQL de criação das tabelas externas. Este script é lido e todas as consultas para criação do database "adventureworks" e das tabelas externas dentro do database são executadas.<br>
O comando para leitura e execução deste script no hive-server é:
><i>hive -f [nome_arquivo_hql]</i> 

### <b>Step 1:</b> Execução "copy_datasets_to_hive_server.sh"

- Antes de executar este script, é necessário a captura do ID do container correspondente ao hive-server, pois é preciso passar este ID no comando <i>"docker cp"</i>. Para captura do ID, basta executar o comando <i>"docker ps"</i> no terminal de comando.

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/docker_cp_hive_server.png)

- Execução do script

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/execucao_copy_datasets.png)

### <b>Step 2:</b> Execução "move_datasets_local_to_hdfs.sh"

No localhost do hive-server (comando <i>"docker exec -it hive-server bash"</i>) executamos o script e a criação das pastas e arquivos no HDFS é realizada.

- Execução script no localhost

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/execucao_move_datasets.png)

- Distribuição dos arquivos

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/pastas_hdfs.png)

- Exemplo: arquivo "address.csv" dentro de seu respectivo diretório

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/exemplo_arquivo_hdfs.png)

<b>Step 3:</b> Execução de consultas no Hive para criação do database e tabelas externas

- Comando de leitura e execução do arquivo "create_external_tables_query.hql"

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/execucao_create_external_tables.png)

- Database criado com os datasets

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/database_hdfs.png)

- Exemplo: dataset "product"

![image](https://github.com/R-Rostan/fiap_25abd_pd_ex2/blob/main/imgs/exemplo_dataset_hdfs.png)