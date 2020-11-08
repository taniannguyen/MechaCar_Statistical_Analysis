#Import Library 
library(dplyr) 

#Import CSV (MPG Data)
data_table <- read.csv(file='Resources/MechaCar_mpg.csv',stringsAsFactors = F, check.names=F)

#Perform Linear Regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=data_table) 

#Summary- determine P-value and r-squared value
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=data_table)) 

#Import CSV (Suspension Coil)
suspCoil_table <- read.csv(file='Resources/Suspension_Coil.csv',stringsAsFactors = F, check.names = F)

#Summary Stats for suspension coil data
total_summary <- suspCoil_table %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI)) 

#Lot summary Stats for suspension coil data
lot_summary <- suspCoil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

#T-test on suspension coils
t.test(suspCoil_table$PSI, mu=1500)

lot1 <- suspCoil_table %>% filter(Manufacturing_Lot=='Lot1')
lot2 <- suspCoil_table %>% filter(Manufacturing_Lot=='Lot2')
lot3 <- suspCoil_table %>% filter(Manufacturing_Lot=='Lot3')

t.test(lot1$PSI, lot2$PSI, mu=1500, paired = T)
t.test(lot2$PSI, lot3$PSI, mu=1500, paired = T)
t.test(lot1$PSI, lot3$PSI, mu=1500, paired = T)
