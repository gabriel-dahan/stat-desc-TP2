rm(list = ls())

#--- 1.
titanic1 <- read.csv('./test_files/titanic_client1.csv')
titanic2 <- read.csv('./test_files/titanic_client2.csv')
titanic3 <- read.csv('./test_files/titanic_client3.csv')
titanic_place <- readxl::read_xlsx('./test_files/titanic_place.xlsx')

#--- 2.
titanic <- rbind(titanic1, titanic2, titanic3)

#--- 3.
library(dplyr)

titanic %>% 
  select(c('id', 'Civilite', 'Age')) %>%
  arrange(desc(titanic$Age)) %>%
  slice(1)

titanic_place <- titanic_place %>%
  mutate(Classe = as.character(Classe), Prix = as.numeric(Prix)) %>%
  select(c('id', 'Classe', 'Prix', 'Survie'))

#--- 4.
any(duplicated(titanic))

titanic <- titanic %>% distinct()

#--- 5.
titanicJoin <- titanic %>% inner_join(titanic_place, by = 'id')

#--- 6.
titanicJoin[is.na(titanicJoin$Age),] %>% count()

titanic_svm <- titanicJoin %>% filter(!is.na(.$Age))

#--- 7.
titanic_appur <- titanicJoin %>% filter(!if_any(names(.), is.na))
titanic_appur <- na.omit(titanicJoin)

#--- 8.
titanic_appur$Sexe <- factor(
  ifelse(titanic_appur$Civilite %in% c('Mr', 'ColM', 'Major', 'Rev', 'DrM', 'Master'), 'Homme', 'Femme')
)

#--- 9.
summary(titanic_appur$Prix)

#--- 10.
saveRDS(titanic_appur, './out/titanic_appur.rds')



