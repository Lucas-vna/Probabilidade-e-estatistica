dados = read.csv('dados_ex3.csv', sep = ",", dec = ",", header = T)
dados

library(ggplot2)

table(dados$Produtos)

#criando o gráfico de barras/colunas
ggplot(dados, aes(x = Produtos, fill = Produtos)) + geom_bar(col = 'black') + 
  scale_fill_brewer(palette="Dark2")

#1)Qual o produto mais utilizado?
# Produto 'a'

#2)Qual o produto menos utilizado?
# roduto 'd'
