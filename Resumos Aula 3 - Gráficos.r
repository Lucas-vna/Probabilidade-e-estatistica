##Aula 3##

library(ggplot2)

#####Gráficos de Barrras/Colunas####

#lendo o arquivo como números
dados1 = read.csv('dados_plot.csv')
dados1

head(dados1)
names(dados1) = c('linhas','empresa','rendimento','tamanho', 'vendas', 'palavra', 'fre_palavra') #renomeando
names(dados1)

#criar uma tabela(serve para achar a moda também)
table(dados1$empresa)

#medidas por variavel tapply(valores, por, medida)
tapply(dados1$rendimento, dados1$empresa, mean)

#gpglot(base de dados, eixos(x, y)) + ...
ggplot(dados1, aes(x,y))

#carregando as empresas como eixo x 
ggplot(dados1, aes(x = empresa))

#carregando barras para definir a contagem das empresas - adiciona colunas
ggplot(dados1, aes(x = empresa,)) + geom_bar()

#rotacionando o gráfico - #barra+coord_flip
ggplot(dados1, aes(x = empresa,)) + geom_bar() + coord_flip()

#adiciona legenda e cor (fill =)
ggplot(dados1, aes(x = empresa, fill = empresa)) + geom_bar(col = 'black') 

#nomes eixos e titulos
ggplot(dados1, aes(x = empresa, fill = empresa)) + geom_bar(col = 'black') + 
  labs(title = 'Gráfico Aula 3', x='Empresa', y='Total')

#mudar cor: scale_fill_brewer(palette="Set3) - Cores: Dark2, PuOr, Greys, Paired, Set1, Set2, Set3
ggplot(dados1, aes(x = empresa, fill = empresa)) + geom_bar(col = 'black') + 
  scale_fill_brewer(palette="Dark2")

#método mais rapido para exportar grafico = copiar e colar
#exportar gráfico como formatação word = salvar imagem como

#mudar a cor do fundo: theme_dark() - outros metodos: theme_bw, theme_linedraw, theme_light, theme_minimal
ggplot(dados1, aes(x = empresa, fill = empresa)) + geom_bar(col = 'white') + 
  scale_fill_brewer(palette="Dark2") + theme_dark() 

#colunas agrupadas(add nova variavel em fill)
ggplot(dados1, aes(x = empresa, fill = tamanho)) + geom_bar(col = 'white') + theme_dark() 

#dividir grafico por variavel: facet_wrap(~tamanho)
ggplot(dados1, aes(x = empresa, fill = empresa)) + geom_bar(col = 'white') + 
  theme_dark() + facet_wrap(~tamanho)


#####Gráficos de Linhas/Pontos####

#pontos + geom_point()
ggplot(dados1, aes(rendimento,vendas)) + geom_point()

#tendencia (geom_smooth)
ggplot(dados1, aes(rendimento,vendas)) + geom_point() + geom_smooth()

#cor(col =) #remover smooth
ggplot(dados1, aes(rendimento, vendas, col=empresa)) + geom_point()

#tendencia por empresa (col=empresa + smooth)
ggplot(dados1, aes(rendimento, vendas, col=empresa)) + geom_point() + geom_smooth()

#remover desvio padrao (smooth(SE=F))
ggplot(dados1, aes(rendimento, vendas, col=empresa)) + geom_point() + geom_smooth(se=F)

#tendencia por empresa separados(facet_wrap)
ggplot(dados1, aes(rendimento, vendas, col=empresa)) + geom_point() + geom_smooth(se=F) + facet_wrap(~empresa) + theme_dark()


#####Gráficos de Pizza####

#criar uma bsae de dados como uma nova tabela
table(dados1$empresa)
dados2 = as.data.frame(table(dados1$empresa))

#mudar o nome da primeira variavel
names(dados2)[1] = 'empresa'
names(dados2)

#criar as % e % acumuladas
dados3 = dados2

#round = arredondar #sum = soma #,3 = em 3 casas decimais 
dados3$Freq = round(dados3$Freq/sum(dados3$Freq),3)
dados3$cum = cumsum(dados3$Freq)

#criando o grafico
ggplot(dados3, aes(x ="", y=Freq, fill=empresa)) + geom_bar(width=1, stat='identity') + coord_polar("y", start=0) +
  geom_text(aes(y=cum-0.2, label=Freq), color="black")

#criando grafico de donuts add: x=2 e xlim()
ggplot(dados3, aes(x=2, y=Freq, fill=empresa)) + geom_bar(width=1, stat='identity') + coord_polar("y", start=0) +
  geom_text(aes(y=cum-0.2, label=Freq), color="black") + theme_void() + xlim(0.5, 2.5)


#####Histograma####

#parecido com grafico de barras, mas para variavel numerica acontinua
ggplot(dados,aes(rendimento)) + geom_histogram()

#numero de grupos: (bins)
ggplot(dados,aes(rendimento)) + geom_histogram(bins=5)

#cor: fill
ggplot(dados1,aes(rendimento)) + geom_histogram(bins=5, fill='black')

#aes(fill=empresa)
ggplot(dados1,aes(rendimento)) + geom_histogram(aes(fill=empresa), bins=5)

#####Densidade####

#histograma cmo linha e propabilidade
ggplot(dados1, aes(rendimento)) + geom_density()

#grafico por empresa - aes(fill=factor(empresa))
ggplot(dados1, aes(rendimento)) + geom_density(aes(fill=factor(empresa))

#transparencia - (alpha=)                                            
ggplot(dados1, aes(rendimento)) + geom_density(aes(fill=factor(empresa)), alpha=0.5)
                                              
#####Box Plot####  

#por empresa
ggplot(dados1,aes(x=empresa, y=rendimento)) + geom_boxplot()

#adicionando cor
ggplot(dados1,aes(x=empresa, y=rendimento, fill=empresa)) + geom_boxplot()

#comparando por tamanho
ggplot(dados1,aes(x=empresa, y=rendimento, fill=empresa)) + 
                    geom_boxplot() + facet_wrap(~tamanho)

#####Violino####

#mesma ideia do histograma
ggplot(dados1, aes(x=empresa, y=rendimento, fill=empresa)) + geom_violin()

#####Tree Map####

library(treemapify)

ggplot(dados1, aes(area=Freq, fill=empresa)) + geom_treemap()
                                               
#rendimento medio por tamanhoXempresa (Ga, Gb..., Pa, Pb)
dados1$interacao = interaction(dados1$tamanho, dados1$empresa)
dados4=as.data.frame(tapply(dados1$rendimento, dados1$interacao, mean))
dados4
dados4$nomes=labels(dados4[[1]])
names(dados4)[1] = 'total'
dados4

#retira os nomes com total = NA
dados4 = dados4[-c(5,6,12),]

ggplot(dados4, aes(area=total, fill=nomes)) + geom_treemap()

#####Nuvem de Letras####

#dados com palavras
dados4=dados1[,6:7] 
dados4
library(wordcloud2)
wordcloud2(data=dados4, size=1.6)

#####Plots Animados####

#pontos e linhas
library(gganimate)
library(gifski)
library(png)

ggplot(dados1,aes(x=rendimento,vendas,col=empresa))+
  geom_line()+geom_point()

g=ggplot(dados1,aes(x=rendimento,vendas,col=empresa))+
  geom_line()+geom_point()

g+transition_reveal(rendimento)

animate(g,renderer=gifski_renderer())

#barras e colunas
ggplot(dados1,aes(x=empresa,fill=empresa))+geom_bar()+theme_light()

ggplot(dados1,aes(x=empresa,fill=empresa))+geom_bar()+theme_light()+
  transition_states(empresa)+shadow_mark()

animate(g,renderer=gifski_renderer())

ggplot(dados1,aes(x=empresa,fill=empresa))+geom_bar()+theme_light()+
  transition_states(empresa)+shadow_mark()+enter_grow()+ enter_fade()

animate(g,renderer=gifski_renderer())

#####Animado Dispersao####

library(gapminder) #dados
head(gapminder)

#ralacao entre renda x vida
ggplot(gapminder, aes(gdpPercap, lifeExp)) +geom_point() + theme_bw()

#colorir por continente
ggplot(gapminder, aes(gdpPercap, lifeExp, col = continent)) +geom_point() +
  theme_bw()

#tamanho do ponto de acordo com a populacao
ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = continent)) +
  geom_point() + theme_bw()

#arrumar nomes eixos
ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = continent)) +
  geom_point() + theme_bw() +
  labs(title ='Ano: {frame_time}', x ='Renda per capita', y ='Expectativa de vida')

grafico=ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = continent)) +
  geom_point() + theme_bw() +
  labs(title ='Ano: {frame_time}', x ='Renda per capita', y ='Expectativa de vida') +
  transition_time(year)

animate(grafico, renderer=gifski_renderer())



