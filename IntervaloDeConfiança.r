dados = read.csv('ex1.csv', sep = ",")
dados

t.test(dados$tamanho, conf.level = 0.95)

t.test(dados$tamanho, conf.level = 0.99)

t.test(dados$tamanho, conf.level = 1)

#t.test para variaveis continuas


hist(dados$tamanho)


#prop.test para tanto de cada

prop.test(8, 20, conf.level = 0.95)

prop.test(12, 20, conf.level = 0.95)
