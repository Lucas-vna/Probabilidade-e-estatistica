dados1 = read.csv('ex1.csv')

#MEDIA 1 amostra
#t.test(amostra,alternative = 'two.side', mu=M0,conf.level =0.95) #diferente que M0

#t.test(amostra,alternative ='less', mu=M0,conf.level=0.95) #menor que M0

#t.test(amostra,alternative ='greater', mu=M0,conf.level =0.95) #maior que M0


#ex1
t.test(dados1$tamanho, alternative = 'two.side', mu = 20, conf.level = 0.94) #diferente que M0


#ex2
t.test(dados1$tamanho, alternative = 'less', mu = 18, conf.level = 0.96) #diferente que M0


#ex3
t.test(dados1$tamanho, alternative ='greater', mu = 16,conf.level =0.97) #maior que M0


#HIPOTESES 1 amostra
#prop.test(amostra,alternative = 'two.side', p=p0,conf.level =0.95) #diferente que p0

#prop.test(amostra,alternative = 'less', p=p0,conf.level =0.95) #menor que p0

#prop.test(amostra,alternative = 'greater', p=p0,conf.level =0.95) #maior que p0


#ex1
prop.test(24,50, alternative = 'two.side', p=0.5,conf.level =0.98) #diferente que p0

#ex2
prop.test(24,50,alternative = 'less', p=0.65,conf.level =0.94) #menor que p0

#--------------------------------------------------

dados2 = read.csv('ex2.csv')

#MEDIA 2 amostras independentes
#t.test(amostra1, amostra2, alternative = 'two.side', conf.level =0.95) #diferente que M0

#t.test(amostra1, amostra2,alternative ='less', conf.level=0.95) #menor que M0

#t.test(amostra1, amostra2,alternative ='greater', conf.level =0.95) #maior que M0


#ex1
t.test(dados2$a, dados2$b, alternative = 'two.side',conf.level =0.95) #diferente que M0

#ex2
t.test(dados2$a, dados2$b, alternative = 'less',conf.level =0.95) #diferente que M0

#ex3
t.test(dados2$a, dados2$b, alternative = 'greater',conf.level =0.95) #diferente que M0


#HIPOTESES 2 amostras independentes
#prop.test(c(casos1,casos2),c(n1,n2),alternative ='two.side', conf.level =0.95)

#prop.test(c(casos1,casos2),c(n1,n2),alternative ='less', conf.level =0.95)

#prop.test(c(casos1,casos2),c(n1,n2),alternative ='greater', conf.level =0.95)


#ex1
prop.test(c(20,50),c(30, 80),alternative ='two.side', conf.level =0.95)

#-----------------------------------------------------

dados3 = read.csv('ex3.csv')

#HIPOTESES 2 amostras dependentes
#t.test(amostra1, amostra2, alternative='two.side', conf.level=0.95, paired = T)

#t.test(amostra1, amostra2, alternative='less', conf.level=0.95, paired = T)

#t.test(amostra1, amostra2, alternative='two.side', conf.level=0.95, paired = T)


#ex1
t.test(dados3$antes, dados3$apos, alternative='two.side', conf.level=0.95, paired = T)

