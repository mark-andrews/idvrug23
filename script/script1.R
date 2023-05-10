library(tidyverse)



# Introducing ggplot ------------------------------------------------------


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

# A line plot with points
ggplot(data_df,
       mapping = aes(x = var1, y = var2)
) + geom_line() + geom_point()


# Add a colour mapping as well
ggplot(data_df,
       mapping = aes(x = var1, y = var2, colour = var3)
) + geom_point()


# Add a colour mapping as well
ggplot(data_df,
       mapping = aes(x = var1, y = var2, colour = var3)
) + geom_point()



# Add a shape mapping as well
ggplot(data_df,
       mapping = aes(x = var1, y = var2, shape = var3)
) + geom_point()

# Add a shape mapping as well
# and change size of points
ggplot(data_df,
       mapping = aes(x = var1, y = var2, shape = var3)
) + geom_point(size = 0.5)

# override a mapping with a setting
ggplot(data_df,
       mapping = aes(x = var1, y = var2, colour = var3)
) + geom_point(colour = 'red')

# change shape and colour mapping
ggplot(data_df,
       mapping = aes(x = var1, y = var2, shape = var3, colour = var3)
) + geom_point(size = 2.5)


#  colour mapping with a line plot
# Add a colour mapping as well
ggplot(data_df,
       mapping = aes(x = var1, y = var2, colour = var3)
) + geom_line()



# the same code as previous, but less verbose, less explicit
ggplot(data_df,
       aes(var1, var2, colour = var3)
) + geom_line()



# Histograms --------------------------------------------------------------

# Get a real data set
weight_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/idvrug23/main/data/weight.csv")


# histogram where binwidth is 5cm
ggplot(weight_df,
       mapping = aes(x = height)
) + geom_histogram(colour = 'white', binwidth = 5)



# histogram where binwidth is 2cm
ggplot(weight_df,
       mapping = aes(x = height)
) + geom_histogram(colour = 'white', binwidth = 2)
