#Import package
library(readr)
#Import Dataset
college.data.raw <- read_csv("2016 Metro Data - College and Grad Students.csv")

#Take useful data out of the dataset
id<-college.data.raw$id
total.over.15<-college.data.raw$total.over.15
students.over.15<-college.data.raw$total.over.15 - college.data.raw$male.other - college.data.raw$female.other
students.ratio<-students.over.15/total.over.15

#Merge data
college.data<-data.frame(id,total.over.15,students.over.15,students.ratio)

#Divide places into college towns(>14.5%) and not college towns(<4.5%)
college.towns<-college.data[college.data$students.ratio>0.145,]
not.college.towns<-college.data[college.data$students.ratio<0.045,]
