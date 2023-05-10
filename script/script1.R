library(tidyverse)

data_df <- tibble(var1 = c(1, 3, 7, 11),
                  var2 = c(5, 7, 10, 12),
                  var3 = c('a', 'b', 'a', 'b')
)

# A scatterplot of points
ggplot(data_df,
       mapping = aes(x = var1, y = var2)
) + geom_point()

# A line plot
ggplot(data_df,
       mapping = aes(x = var1, y = var2)
) + geom_line()

# A line plot
ggplot(data_df,
       mapping = aes(x = var1, y = var2)
) + geom_line() + geom_point()


# Add a colour mapping as well
ggplot(data_df,
       mapping = aes(x = var1, y = var2, colour = var3)
) + geom_point()
