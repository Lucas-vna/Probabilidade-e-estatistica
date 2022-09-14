dados = read.csv('dados_ex2.csv', sep = ",", dec = ",", header = T)
dados

#1)Determine a resistência média por tipo de bloco
mean(dados$A) #Bloco A

mean(dados$B) #Bloco B

mean(dados$B) #Bloco C

mean(dados$D) #Bloco D


#2)Faça umb bloxplot das resistências por tipo
library(ggplot2)

ggplot(dados, aes(x=A, y=A,fill='Resistência')) + geom_boxplot()  

ggplot(dados, aes(x=B, y=B,fill='Resistência')) + geom_boxplot()  

ggplot(dados, aes(x=C, y=C,fill='Resistência')) + geom_boxplot()  

ggplot(dados, aes(x=D, y=D,fill='Resistência')) + geom_boxplot()  



#3)Interprete!

#O gráfico mostra a resistência do tipo de material e mostrando, ao mesmo tempo,
#sua mediana representada pela linha preta dentro do gráfico



#4)Qual possui maior variabilidade?  CV = varaiabilidade

# Depois de calcular a variabilidade de todos os tipos com a fórmula: sd(dados$nome_var)/mean(dados$nome_var)
# conclui que o tipo D possui a maior variabilidade com 0.2261

sd(dados$A)/mean(dados$A)#CV = 0.2126

sd(dados$B)/mean(dados$B)#CV = 0.0973

sd(dados$C)/mean(dados$C)#CV = 0.1292

sd(dados$D)/mean(dados$D)#CV = 0.2261


