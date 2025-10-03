rm(list = ls())
library(dplyr)

#--- 1.
titanic_appur <- readRDS('./test_files/titanic_appur.rds')

#--- 2.
# VAI (Valeur Ajoutée Inférieure) : Q1 - 3/2 (Q3 - Q1)
# VAS (Valeur Ajoutée Supérieure) : Q3 + 3/2 (Q3 - Q1)

s <- summary(titanic_appur$Prix)

Q1 <- as.numeric(s[2])
Q3 <- as.numeric(s[5])

VAI <- Q1 - 3/2 * (Q3 - Q1)
VAS <- Q3 + 3/2 * (Q3 - Q1)

titanic_appur %>% filter(VAI > Prix | Prix > VAS)

#--- 3.
with(titanic_appur, boxplot(Prix ~ Classe))

# On retrouve les valeurs extrêmes, la médiane, les quartiles, ainsi que la VAI/VAS

#--- 4.
with(titanic_appur, vioplot::vioplot(Prix ~ Classe))

# Dans cette représentation, on voit où sont regroupées les valeurs les plus nombreuses : 
#   la largeur du violon indique le nombre de personnes concernées.

#--- 5.
# ...

#--- 6.

prop <- titanic_appur %>% 
  arrange(desc(Prix)) %>%
  head(100) %>% 
  count(sexe == "Homme")




