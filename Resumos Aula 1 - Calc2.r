### Aula1 ###

##### soma básica ####

1 + 1

##### funcoes trigonometricas ####

sin(pi/2)
cos(pi)
tan(pi/4)

##### vetores ####

(x = c(1, 2, 3, 4)) #c = concatenar
x+1
(y = c(2:5)) #N:X = de N até X
x+y

##### matriz ####

x
(x = 4)
(x = 1:4)

z = matrix(x, nrow = 2, byrow = F)
z
salvos em x, 2 colunas, ordenada por coluna

z = matrix(x, nrow = 2, byrow = T)
z
#salvos em x, 4 colunas, não ordenada por coluna

solve(z) #transposta
t(z) #inversa
determinant(z)

##### derivada ####

D(expression(x^2), 'x')
D(expression(tan(x)*sin(x)^2), 'x')

##### Integral Definida ####

x
(x = 4)
(x = 1:4)

library(mosaicCalc)
antiD(a*x^2 ~ x)
a*x^2 vai ser integrado em relação(~) a x

##### funcoes ####

funcao = function(x){
  2*x-1
}

funcao(1)

curva de -10 a 10
curve(funcao, -10, 10)

linha h = horiz. v = vert.
abline(h=0, col='purple')

##### raiz ####

#unica raiz
uniroot(funcao, lower=0, upper=4)

#multiplas raizes
library(rootSolve)

funcao2 = function(x){
  2*x^2-3*x-4
}

curve(funcao2, -2, 3) (cria um grafico)
abline(h=0) (cria uma linha)

multiroot(funcao2, start = c(-1,2))
abline(v = c(-0.850, 2.350), col = 2)

#integral definida
integrate(funcao, 0, 2)
