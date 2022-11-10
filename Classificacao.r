library(datasets)

data("iris")
head(iris)
table(iris$Species)


library(ggplot2)

names(iris)
ggplot(iris, aes(Petal.Length, Petal.Width, col=Species)) + geom_point()


library(randomForest)

modelo=randomForest(Species~Petal.Length, data=iris)
predict(modelo)
table(iris$Species, predict(modelo))

#calcula a diagonal = acertos
diag(table(iris$Species, predict(modelo))) #acertos

#acuracia -> acertos por classe
diag(table(iris$Species, predict(modelo)))/table(iris$Species)

#acuracia do modelo -> porcentagem de acerto do modelo
sum(diag(table(iris$Species, predict(modelo))))/length(iris$Species)

cores=ifelse(iris$Species==predict(modelo), iris$Species, 'erro')
iris$cores=cores
ggplot(iris, aes(Petal.Length, Petal.Width,col=cores)) + geom_point()

#####com mais variaveis####
modelo=randomForest(Species~., data=iris)
table(iris$Species, predict(modelo))
sum(diag(table(iris$Species, predict(modelo))))/length(iris$Species)

#####previsao e teste####
set.seed(222)#fixar semente
split=sample(2,nrow(iris), replace= T, prob= c(0.7, 0.3))
split
train= iris[split==1,]
test= iris[split==2,]

#criando modelo de base de dados
modelo=randomForest(Species~., data=train)
p=predict(modelo, newdata=test)
table(test$Species, p)

#porcentagem de acerto do modelo
sum(diag(table(test$Species, p)))/length(test$Species)

importance(modelo)
varImpPlot(modelo, sort=T, main="importancia")











