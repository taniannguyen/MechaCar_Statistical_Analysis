#Import Library 
library(dplyr) 

#Import CSV (MPG Data)
data_table <- read.csv(file='Resources/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#Perform Linear Regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=data_table) 

#Summary- determine P-value and r-squared value
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=data_table)) 

#Import CSV (Suspension Coil)
suspCoil_table <- read.csv(file='Resources/Suspension_Coil.csv',check.names = F,stringsAsFactors = F)

#Summary Stats for suspension coil data
total_summary <- suspCoil_table %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI)) 

#Lot summary Stats for suspension coil data
lot_summary <- suspCoil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

