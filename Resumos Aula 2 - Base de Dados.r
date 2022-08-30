##Aula2##

##### base de dados ####

#idade = c(18, 20, 23, 25)
#sexo = c("M", "F", "F", "M")

#dados = data.frame(idade,sexo)
#dados


#####leitura de dados com .csv####

dados1 = read.csv('dados_plot.csv', sep = ",", dec = ",", header = T)

#####Nova Variável####

dados1$classe = c('a', 'a', 'b', 'b')

#####informações dos dados####

dados1$variavel
dim(dados1) #mostra a dimensao da base de dados
names(dados1) #mostra os nomes das colunas
head(dados1, 1) #mosra a linha selecionada

#####dados1[LINHAS, COLUNA]####

dados1[1,1] #linha 1, coluna 1
dados1[1,3] #linha 1, coluna 3
dados1[4,1] #linha 4, coluna 1
dados1[,1] #imprime toda a coluna 1 
dados1[1,] #imprime toda linha 1
#dados1[4,3] = "c" -> atualiza o valor do ponto 4,3 para "c"

#####condição####



