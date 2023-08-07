# 2022-LFSR-Fibonacci

# Trabalho Prático 2

```
Introdução aos Sistemas Lógicos
Igor Joaquim da Silva Costa - 2021032218
```
# 1. Introdução

Oproblema propostofoiimplementar 3 LFSRdeFibonaccieusá-losemconjunto
com o Vernam Cypher para fazer a cifragem da logo da UFMG.
Paraisso,foiutilizadaalinguagemdedescriçãoesimulaçãodehardwareverilogpara
construir 3 tipos de registradores LFSR, um de 7 bits, outro de 11 bits e outro de 16 bits.

# 2. Método

## 2.1 Registradores e tesbench

Primeiramente, é válido dizerque todo registrador foi implementado de maneira
análoga.Paraaconstruçãodocomponente,foitomadaadecisãoderepresentá-locomoum
arrayderegistradoresbinárioschamadomemory,queéaestruturaresponsávelporguardaro
estadodoregistradoremumperíododetempoespecífico.Acadasubidadoclock,osvalores
de memorysãoatualizadoscombasenafunçãoPolinômioderealimentaçãoespecífica.A
saída também é um registrador de N bits, para facilitar a geração de gráficos.
Paraserealizarotestbench,foiutilizadaalógicadeciclos.Cadaregistradorpossui
umavariávelciclosdefinida, quedefinequantos períodos declocko circuitoirásimular,
conformeonecessário.Asaídadoregistradorde 7 e 11 bitssãoosnúmerosjáconvertidosem
decimal,parafacilitaraplotagemdosgráficos,nocasodoregistradorde 16 bits,apenasé
armazenado o ultimo bit.

## 2.2 Plotagens e bitmap

Para os gráficos e o bitmap, foi usado o matplotlib com a saída gerada pela execução
do design.sv, onde cada número é a representação decimal do estado do registrador em algum
ciclo do clock. Para o bitmap, foram escolhidas dimensões arbitrárias para gerar a imagem.


# 3. Arquivos importantes

Cada registrador possui uma pasta específica com seu testbench e design salvos. Para
cada pasta de registrador, existe um arquivo plot.py, responsável por gerar os respectivos
gráficos.
O arquivo de testbench fora de qualquer pasta corresponde ao codigo disponibilizado
para realizar a cifragem da imagem, ele deve ser compilado junto ao arquivo LSFR.sv para
cada respectivo registrador, a fim de criar o lfsr_output do registrador esperado. O arquivo
criabits.py serve para transformar a imagem do brasão em bits e o arquivo
converte_imagem.py tranforma os dados binários do lfsr_output de volta em imagem.
Existe um comando no Makefile chamado “all”, que cria todas as imagens cifradas
para cada registrador implementado.

## 4.Imagens

4.1 Plotagem de ciclos



4.2 Imagens Cifradas


# 5. Conclusão

Duranteotrabalho,foramtomadasdiversasdecisõesqueserviramparaexperimentar
comoésimularumsistemaemhardware,tantonapartedeimplementação,usandooVerilog,
quantonapartededebugação.Alémdisso,tornou-sesucintoopoderquetécnicasdecifragem
possuem, principalmente quando combinadas com técnicas que usam geração de dados
aleatórios como chave, como é o caso dos LFSR de período médio e longo.
Comovistonosgráficos,aimplementaçãodosLFSRocorreucomêxito,garantidasas
propriedades de pseudo-aleatoriedade e ciclicidade que os registradores de cifragem
necessitam.
Porfim,conclui-sequeotrabalhoserviucomoumexemplodecomoosconteúdos
aprendidosna disciplinapodemser úteisnavidatécnicadeumprofissionaldeciênciada
computação,umavezqueimplementarcircuitosespecíficosparaalgumfimemumprojeto
podesermaiseficientequeimplementaramesmafuncionalidadeemsoftware,comoéocaso
do Vernam Cypher.


