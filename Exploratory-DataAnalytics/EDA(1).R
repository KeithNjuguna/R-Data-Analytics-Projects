> > # Creating a dataset
> data <- data.frame(
+   Product_ID = c(101, 102, 103, 104, 105),
+   Product_Name = c("Widget A", "Widget B", "Widget C", "Widget D", "Widget E"),
+   Category = c("Electronics", "Electronics", "Apparel", "Apparel", "Home Goods"),
+   Units_Sold = c(50, 30, 100, 20, 15),
+   Price_Per_Unit = c(25.00, 30.00, 10.00, 40.00, 60.00),
+   Revenue = c(1250.00, 900.00, 1000.00, 800.00, 900.00),
+   Region = c("East", "West", "East", "North", "South")
+ )
> 
> library(ggplot2)
> # Summarizing revenue per category
> agg_data <- aggregate(Revenue ~ Category, data, sum)
> 
> # Bar plot
> ggplot(agg_data, aes(x = Category, y = Revenue, fill = Category)) +
+   geom_bar(stat = "identity") +
+   theme_minimal() +
+   labs(title = "Total Revenue by Category", x = "Category", y = "Revenue")
> # units sold per region
> agg_units <- aggregate(Units_Sold ~ Region, data, sum)
> 
> # Pie chart
> pie(agg_units$Units_Sold, labels = agg_units$Region, 
+     main = "Units Sold Distribution by Region", col = rainbow(length(agg_units$Region)))
> # Scatter plot
> ggplot(data, aes(x = Price_Per_Unit, y = Units_Sold)) +
+   geom_point(color = "blue") +
+   theme_minimal() +
+   labs(title = "Price vs Units Sold", x = "Price Per Unit", y = "Units Sold")
Error in UseMethod("depth") : 
  no applicable method for 'depth' applied to an object of class "NULL"
> > # Line chart
> ggplot(data, aes(x = Product_ID, y = Revenue, group = 1)) +
+   geom_line(color = "green") +
+   geom_point() +
+   theme_minimal() +
+   labs(title = "Revenue Trend", x = "Product ID", y = "Revenue")
> # Box plot
> ggplot(data, aes(x = Category, y = Price_Per_Unit, fill = Category)) +
+   geom_boxplot() +
+   theme_minimal() +
+   labs(title = "Price Variation by Category", x = "Category", y = "Price Per Unit")
Error: VECTOR_ELT() can only be applied to a 'list', not a 'integer'
Error in length(height) : 
  VECTOR_ELT() can only be applied to a 'list', not a 'double'
Error in diff.default(xscale) : 
  VECTOR_ELT() can only be applied to a 'list', not a 'double'
> > > > mean_price <- mean(data$Price_Per_Unit)
> print(mean_price)
[1] 33
> median_units <- median(data$Units_Sold)
> print(median_units)
[1] 30
> total_revenue <- sum(data$Revenue)
> print(total_revenue)
[1] 4850
> variance_units <- var(data$Units_Sold)
> print(variance_units)
[1] 1195
> std_dev_revenue <- sd(data$Revenue)
> print(std_dev_revenue)
[1] 171.7556
> range_price <- range(data$Price_Per_Unit)
> print(range_price)
[1] 10 60
> # Adding a new column for Discount Percentage
> data$Discount_Percentage <- c(10, 5, 15, 20, 8)
> 
> # View the updated dataset
> print(data)
  Product_ID Product_Name    Category Units_Sold Price_Per_Unit Revenue Region Discount_Percentage
1        101     Widget A Electronics         50             25    1250   East                  10
2        102     Widget B Electronics         30             30     900   West                   5
3        103     Widget C     Apparel        100             10    1000   East                  15
4        104     Widget D     Apparel         20             40     800  North                  20
5        105     Widget E  Home Goods         15             60     900  South                   8
> # Calculating the discount for each product
> data$Discount_Amount <- (data$Price_Per_Unit * data$Units_Sold) * (data$Discount_Percentage / 100)
> 
> # View the updated dataset with the new column
> print(data)
  Product_ID Product_Name    Category Units_Sold Price_Per_Unit Revenue Region Discount_Percentage Discount_Amount
1        101     Widget A Electronics         50             25    1250   East                  10             125
2        102     Widget B Electronics         30             30     900   West                   5              45
3        103     Widget C     Apparel        100             10    1000   East                  15             150
4        104     Widget D     Apparel         20             40     800  North                  20             160
5        105     Widget E  Home Goods         15             60     900  South                   8              72
> 
