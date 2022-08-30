dados1 = read.csv('dados_plot.csv', sep = ",", dec = ",", header = T)
dados1

#arrumar nome variável
name(dados1)
names(dados1) = c('linhas','empresa','rendimento','tamanho', 'vendas', 'palavra', 'fre_palavra')
head(dados1)
