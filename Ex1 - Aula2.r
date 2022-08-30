dados2 = read.csv('Exercício1 - Aula2.csv', sep = ",", dec = ",", header = T)
dados2

imc = function(peso, altura){
  
  peso/altura^2
  
}

dados2$IMC = imc(dados2$Peso, dados2$Altura)

dados2$Classe_IMC = ifelse(dados2$IMC<19, "IMC Baixo", "IMC Normal")
