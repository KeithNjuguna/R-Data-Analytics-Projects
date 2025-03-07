> data <- read.csv(file.chose())
Error in file.chose() : could not find function "file.chose"
> data <- read.csv(file.choose())
> summary(data)
     price               area          bedrooms       bathrooms    
 Min.   : 1750000   Min.   : 1650   Min.   :1.000   Min.   :1.000  
 1st Qu.: 3430000   1st Qu.: 3600   1st Qu.:2.000   1st Qu.:1.000  
 Median : 4340000   Median : 4600   Median :3.000   Median :1.000  
 Mean   : 4766729   Mean   : 5151   Mean   :2.965   Mean   :1.286  
 3rd Qu.: 5740000   3rd Qu.: 6360   3rd Qu.:3.000   3rd Qu.:2.000  
 Max.   :13300000   Max.   :16200   Max.   :6.000   Max.   :4.000  
    stories        mainroad          guestroom           basement        
 Min.   :1.000   Length:545         Length:545         Length:545        
 1st Qu.:1.000   Class :character   Class :character   Class :character  
 Median :2.000   Mode  :character   Mode  :character   Mode  :character  
 Mean   :1.806                                                           
 3rd Qu.:2.000                                                           
 Max.   :4.000                                                           
 hotwaterheating    airconditioning       parking         prefarea        
 Length:545         Length:545         Min.   :0.0000   Length:545        
 Class :character   Class :character   1st Qu.:0.0000   Class :character  
 Mode  :character   Mode  :character   Median :0.0000   Mode  :character  
                                       Mean   :0.6936                     
                                       3rd Qu.:1.0000                     
                                       Max.   :3.0000                     
 furnishingstatus  
 Length:545        
 Class :character  
 Mode  :character  
                   
                   
                   
> library(ggplot2)
> ggplot(data,aes(x = area, y = price))+ geom_point()
> model <- lm(price ~ area + bedrooms + bathrooms, data = data)
> summary(model)

Call:
lm(formula = price ~ area + bedrooms + bathrooms, data = data)

Residuals:
     Min       1Q   Median       3Q      Max 
-3920346  -868531   -78624   716209  6263373 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -173171.61  264559.57  -0.655    0.513    
area            378.76      27.16  13.948  < 2e-16 ***
bedrooms     406820.03   84457.88   4.817  1.9e-06 ***
bathrooms   1386049.50  124989.23  11.089  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1343000 on 541 degrees of freedom
Multiple R-squared:  0.4871,    Adjusted R-squared:  0.4842 
F-statistic: 171.3 on 3 and 541 DF,  p-value: < 2.2e-16

> model <- lm(price ~ area + num_bedrooms + num_bathrooms, data = data)
> predictions <- predict(model , newdata = data)
> summary(predictions)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
 2721926  3730950  4491564  4766729  5561696 12155034 
