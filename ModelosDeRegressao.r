dados1 = read.csv('dados1.csv')
dados2 = read.csv('dados2.csv')
dados3 = read.csv('dados3.csv')

#####TESTE####
x = runif(100,5,80)
y = 10 + 6 * x + rnorm(100,0,20)
dados = data.frame(x,y)

library(manipulate)
library(ggplot2)

manipulate(plot(1:x), x=slider(5,10))
manipulate(
  ggplot(dados, aes(x,y)) + geom_point() + geom_abline(slope=b, intercept=a, col='red') +
    annotate(geom= 'text', x=20, y=500, label='y=a+bx'), a=slider(0,50), b=slider(0,15)
)



#####DADOS 1####
ggplot(dados1, aes(km, tempo)) + geom_point() + geom_smooth()

library(gamlss)

modelo = gamlss(tempo~km-1, data=dados1) #pacote
summary(modelo) #modelo
modelo$mu.fv #resumo
term.plot(modelo) #efeitos
plot(modelo) #residuos


#####DADOS 2####
ggplot(dados2, aes(km, tempo)) + geom_point() + geom_smooth()

modelo = gamlss(tempo~pb(km), data=dados2) #pacote
summary(modelo) #modelo
modelo$mu.fv #resumo (nao interpretar pb)
term.plot(modelo) #efeitos
plot(modelo) #residuos

km=c(1:10)
dadosnovo=data.frame(km)
predict(modelo, newdata=dadosnovo)


#####DADOS 3####

library(GGally)

ggpairs(dados3)

modelo=gamlss(tempo~km + pb(chuva), data=dados3)
summary(modelo)
term.plot(modelo)

km=35
chuva=82
dadosnovo= data.frame(km, chuva)
predict(modelo, newdata= dadosnovo)

