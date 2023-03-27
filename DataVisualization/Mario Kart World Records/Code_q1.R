# importing the library to read the csv file
library(tidyverse)

# reading the file A1_Ex1.csv in tibble X
df <- read_csv("records.csv")
df

# 1. How the three lap, with no shortcut world record develop over time

#filtering the dataset to include records of three lap with no shortcuts race and grouping by track 
q1 <- df %>% 
  filter(type == "Three Lap", shortcut == "No")%>% 
  group_by(track) %>% 
  select(date, time, track)

#plotting graph of three lap with no shortcuts records
plot1 <- ggplot(data=q1, aes(x = date, y = time)) + 
  geom_line() +
  facet_wrap(~track, scales = "free") 

#adding title and adjusting axis
plot1 + ggtitle("How the three lap, with no shortcut world record develop over time") +
  theme(axis.text.x = element_text(angle = 90))



#2. How the WR for Rainbow Road develop over time

#filtering the dataset to include records of rainbow road track grouped by type and shortcut
q2 <- df %>% 
  filter(track == "Rainbow Road")%>% 
  group_by(type, shortcut) %>% 
  select(date, time, type, shortcut) 

#plotting graph to compare records by type and shortcut
plot2 <- ggplot(data= q2 , aes(x = date, y = time,colour=interaction(type, shortcut))) + 
  geom_point()+
  geom_line()

#adding legend name, labels, graph title and subtitle 
plot2 + scale_colour_manual(name = "Race",
                            breaks=c("Single Lap.No","Single Lap.Yes","Three Lap.No",'Three Lap.Yes'),
                            labels=c('Single Lap with no shortcut','Single Lap with shortcut',
                                     'Three Lap with no shortcut', 'Three Lap with shortcut'),
                            values=c("#f8766d","#7cae00","#00bfc4","#c77cff")) +
  ggtitle(label = "How the WR for Rainbow Road develop over time",
          subtitle = "With shortcuts, it is quicker to finish a 3 lap race than completing a single lap!")
  

