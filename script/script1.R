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

# plus a rug 
ggplot(weight_df,
       mapping = aes(x = height)
) + geom_histogram(colour = 'white', bins = 50) +
  geom_rug(size = 0.1, alpha = 0.25)

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


# Tukey boxplot -----------------------------------------------------------

swiss_df <- swiss %>% rownames_to_column('province') %>%
  mutate(is_catholic = Catholic > 50)

ggplot(swiss_df,
       mapping = aes(x = Fertility)
) + geom_boxplot()

# boxplot
ggplot(swiss_df,
       mapping = aes(x = '', y = Fertility)
) + geom_boxplot(width = 0.25)

# box and jitter plot
ggplot(swiss_df,
       mapping = aes(x = '', y = Fertility)
) + geom_boxplot(width = 0.25) + 
  geom_jitter(width = 0.05, size = 0.5, alpha = 0.5)

# box and jitter plot
ggplot(swiss_df,
       mapping = aes(x = '', y = Fertility)
) + geom_boxplot(width = 0.25, outlier.shape = NA) + 
  geom_jitter(width = 0.05, size = 0.75, alpha = 0.75)


# separate boxplots for is_catholic true and false
ggplot(swiss_df,
       mapping = aes(x = is_catholic, y = Fertility)
) + geom_boxplot(width = 0.25, outlier.shape = NA) + 
  geom_jitter(width = 0.05, size = 0.75, alpha = 0.75)

# same boxplot with notches 
ggplot(swiss_df,
       mapping = aes(x = is_catholic, y = Fertility)
) + geom_boxplot(width = 0.25, outlier.shape = NA, notch = TRUE) + 
  geom_jitter(width = 0.05, size = 0.75, alpha = 0.75)

# Boxplots with two grouping variables


# for starters, just `supp` on x axis
ggplot(ToothGrowth,
       mapping = aes(x = supp, y = len)
) + geom_boxplot()

# use `dose` as x-axis
ggplot(ToothGrowth,
       mapping = aes(x = dose, y = len, group = dose)
) + geom_boxplot()

# let's use both `supp` and `dose`
ggplot(ToothGrowth,
       mapping = aes(x = dose, y = len, 
                     group = interaction(dose,supp), 
                     colour = supp)
) + geom_boxplot()



# barplot versions of grouped boxplot ---------------------------------

# note the use of geom_col not geom_bar
ggplot(ToothGrowth,
       mapping = aes(x = dose, y = len, fill = supp) 
) + geom_col(position = 'dodge')

# add error bars?

# first calculate mean and upper and lower lims
group_by(ToothGrowth, supp, dose) %>% 
  summarise(avg = mean(len),
            upper = mean(len) + sd(len)/sqrt(n()),
            lower = mean(len) - sd(len)/sqrt(n())
  ) %>%
  ggplot(ToothGrowth,
         mapping = aes(x = factor(dose), 
                       y = avg, 
                       fill = supp,
                       ymin = lower,
                       ymax = upper)
  ) + geom_col(position = 'dodge') +
  geom_errorbar(width=.2,position=position_dodge(.9))


# Scatterplot -------------------------------------------------------------

# basic scatterplot
ggplot(weight_df,
       mapping = aes(x = height, y = weight)
) + geom_point(size = 0.5, alpha  = 0.75)

# scatterplot with colour coding
ggplot(weight_df,
       mapping = aes(x = height, y = weight, colour = gender)
) + geom_point(size = 0.5, alpha  = 0.75)

# scatterplot with colour coding
# and a rug plot
ggplot(weight_df,
       mapping = aes(x = height, y = weight, colour = gender)
) + geom_point(size = 0.5, alpha  = 0.75) +
  geom_rug(size = 0.1, alpha = 0.5)

# marginal plots on scatterplots
library(ggExtra)

p1 <- ggplot(weight_df,
             mapping = aes(x = height, 
                           y = weight, 
                           colour = gender)
) + geom_point(size = 0.5, alpha  = 0.75)

ggMarginal(p1)

p2 <- ggplot(weight_df,
             mapping = aes(x = height, 
                           y = weight, 
                           colour = gender)
) + geom_point(size = 0.5, alpha  = 0.75) +
  geom_rug(size = 0.1, alpha = 0.25) + 
  theme_classic() +
  theme(legend.position = 'bottom')


ggMarginal(p2, 
           type = 'histogram',
           groupFill = TRUE,
           groupColour = TRUE,
           position = 'identity',
           bins = 50,
           alpha = 0.5)
           

# add scatterplot smoother; loess smoother
ggplot(swiss_df,
       mapping = aes(x = Examination, y = Fertility)
) + geom_point() + geom_smooth()

# add scatterplot smoother; lm smoother
ggplot(swiss_df,
       mapping = aes(x = Examination, y = Fertility)
) + geom_point() + geom_smooth(method = 'lm')


# add scatterplot smoother; lm smoother, no conf int
ggplot(swiss_df,
       mapping = aes(x = Examination, y = Fertility)
) + geom_point() + geom_smooth(method = 'lm', se = FALSE)


# using a larger data set
ggplot(weight_df,
       mapping = aes(x = height, y = weight)
) + geom_point() + geom_smooth(method = 'gam')

# using colours for gender
ggplot(weight_df,
       mapping = aes(x = height, y = weight, colour = gender)
) + geom_point(size = 0.1, alpha = 0.25) + 
  geom_smooth(method = 'lm', fullrange = TRUE)

# labelling the points in the scatterplot

ggplot(swiss_df,
       mapping = aes(x = Examination, 
                     y = Fertility, 
                     label = province)
) + geom_text()

# using ggrepel
library(ggrepel)

ggplot(swiss_df,
       mapping = aes(x = Examination, 
                     y = Fertility, 
                     label = province)
) + geom_text_repel()

ggplot(swiss_df,
       mapping = aes(x = Examination, 
                     y = Fertility, 
                     label = province)
) + geom_label_repel()

ggplot(swiss_df,
       mapping = aes(x = Examination, 
                     y = Fertility, 
                     colour = is_catholic,
                     label = province)
) + geom_label_repel()


