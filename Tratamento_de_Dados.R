library(reader)
library(dplyr)

getwd()

Dados <- read.csv("direct_normal_means_BA_sedes-munic.csv", sep = ";") #importar base de Dados
Dados <- select(Dados,NAME,STATE,ANNUAL,JAN,FEB,MAR,APR,MAY,JUN,JUL,AUG,SEP,OCT,NOV,DEC) #selecionar colunas
Oeste <- read.csv("Municipios_Oesta_da_Bahia.csv",sep = ";") #importar cidades do Oeste da Bahia

NvDados <- data.frame() 

for (cidade in Oeste$CIDADE){ #filtar cidades do Oeste da Bahia
  NvDados <- rbind(NvDados, filter(Dados,NAME == cidade))
}

cidade <- nrow(Oeste) #Contar quantidade de cidades

Geral <- list('OESTE','BAHIA',sum(NvDados$ANNUAL)/cidade , #Calculo no Oesta da Bahia
              sum(NvDados$JAN)/cidade, sum(NvDados$FEB)/cidade, 
              sum(NvDados$MAR)/cidade, sum(NvDados$APR)/cidade,
              sum(NvDados$MAY)/cidade, sum(NvDados$JUN)/cidade, 
              sum(NvDados$JUL)/cidade, sum(NvDados$AUG)/cidade, 
              sum(NvDados$SEP)/cidade, sum(NvDados$OCT)/cidade,
              sum(NvDados$NOV)/cidade, sum(NvDados$DEC)/cidade)

NvDados <- rbind(NvDados,Geral) #Adiciona Oeste da Bahia a tabela

write.csv(NvDados, file = "Dados_Filtrados.csv") #Criar um arquivo csv