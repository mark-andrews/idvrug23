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



# histogram where binwidth is 2.5cm
ggplot(weight_df,
       mapping = aes(x = height)
) + geom_histogram(colour = 'white', binwidth = 2.5)

# histogram where we have 50 bins
ggplot(weight_df,
       mapping = aes(x = height)
) + geom_histogram(colour = 'white', bins = 50)

# histogram with binwidth 2.5, and separate histogram
# for Male and Female
# Stacked histogram: the default
ggplot(weight_df,
       mapping = aes(x = height, fill = gender)
) + geom_histogram(colour = 'white', binwidth = 2.5)


# histogram with binwidth 2.5, and separate histogram
# for Male and Female
# Dodged histogram
ggplot(weight_df,
       mapping = aes(x = height, fill = gender)
) + geom_histogram(colour = 'white', 
                   binwidth = 2.5, 
                   position = 'dodge')


# histogram with binwidth 2.5, and separate histogram
# for Male and Female
# Identity histogram
ggplot(weight_df,
       mapping = aes(x = height, fill = gender)
) + geom_histogram(colour = 'white', 
                   binwidth = 2.5, 
                   position = 'identity')

# histogram with binwidth 2.5, and separate histogram
# for Male and Female
# Identity histogram
# No fill; different colours
ggplot(weight_df,
       mapping = aes(x = height, colour = gender)
) + geom_histogram(binwidth = 2.5, 
                   fill = NA,
                   position = 'identity')

# histogram with binwidth 2.5, and separate histogram
# for Male and Female
# Identity histogram
# with transparent fill colour
ggplot(weight_df,
       mapping = aes(x = height, fill = gender)
) + geom_histogram(colour = 'white', 
                   binwidth = 2.5, 
                   position = 'identity',
                   alpha = 0.75)


# histogram with binwidth 2.5, and separate histogram
# for Male and Female
# Filled histogram
ggplot(weight_df,
       mapping = aes(x = height, fill = gender)
) + geom_histogram(colour = 'white', 
                   binwidth = 2.5, 
                   position = 'fill')



# Bar plots ---------------------------------------------------------------

# Get Titanic data
titanic_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/idvrug23/main/data/TitanicSurvival.csv")

# bar plot
ggplot(titanic_df,
       mapping = aes(x = passengerClass)
) + geom_bar()

# stacked bar plot
ggplot(titanic_df,
       mapping = aes(x = passengerClass, fill = survived)
) + geom_bar(position = 'stack')

# filled bar plot
ggplot(titanic_df,
       mapping = aes(x = passengerClass, fill = survived)
) + geom_bar(position = 'fill')


# dodged bar plot
ggplot(titanic_df,
       mapping = aes(x = passengerClass, fill = survived)
) + geom_bar(position = 'dodge')

# identity bar plot
ggplot(titanic_df,
       mapping = aes(x = passengerClass, fill = survived)
) + geom_bar(position = 'identity', alpha = 0.75)
