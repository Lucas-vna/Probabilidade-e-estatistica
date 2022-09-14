dados = read.csv('dados_ex1.csv', sep = ",", dec = ",", header = T)
dados

#1)definir tempo médio e mediano da entrega

#tempo médio
mean(dados$Tempo)
mean(dados$Distância)

#mediana
median(dados$Tempo)
median(dados$Distância)

#2)Faça um gráfico mostrando a relação entre Distância e Tempo (tempo no eixo X,use função smooth)
library(ggplot2)

ggplot(dados1, aes(x=Tempo, y=Distância, col=Tempo)) + geom_point() + geom_smooth(se=F) + theme_dark()
 
 
#3)Se o entregador demorou 85 minutos, qual foi a distância aproximada?
#Distância aproximado é 13,10
