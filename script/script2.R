
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

# facet plots

ggplot(weight_df,
       mapping = aes(x = height, 
                     y = weight)
) + geom_point(size = 0.5, alpha  = 0.75) +
  facet_wrap(~gender, scales = 'fixed')

ggplot(weight_df,
       mapping = aes(x = height, 
                     y = weight)
) + geom_point(size = 0.5, alpha  = 0.75) +
  facet_wrap(~race, scales = 'fixed')

# facet grid
ggplot(weight_df,
       mapping = aes(x = height, 
                     y = weight)
) + geom_point(size = 0.5, alpha  = 0.75) +
  facet_grid(gender~race, scales = 'fixed')

# facet grid
ggplot(weight_df,
       mapping = aes(x = height, 
                     y = weight)
) + geom_point(size = 0.5, alpha  = 0.75) +
  facet_grid(race~gender, scales = 'fixed')



# Line plots --------------------------------------------------------------

nott_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/idvrug23/main/data/nottingham_temp.csv")


ggplot(nott_df,
       mapping = aes(x = month, y = value)
) + geom_point()

# join the lines
# this is not what we want
ggplot(nott_df,
       mapping = aes(x = month, y = value)
) + geom_point() + geom_line()

# join the lines
ggplot(nott_df,
       mapping = aes(x = month, 
                     y = value, 
                     group = year)
) + geom_point() + geom_line()

ggplot(nott_df,
       mapping = aes(x = month, 
                     y = value, 
                     colour = year)
) + geom_point() + geom_line()

ggplot(nott_df,
       mapping = aes(x = month, 
                     y = value, 
                     colour = factor(year))
) + geom_point() + geom_line()

ggplot(nott_df,
       mapping = aes(x = month, 
                     y = value, 
                     group = year,
                     colour = year)
) + geom_point() + geom_line()


# density plots -----------------------------------------------------------

ggplot(weight_df,
       mapping = aes(x = height)
) + geom_density()

# use wider bandwidth of KDE 

ggplot(weight_df,
       mapping = aes(x = height)
) + geom_density(adjust = 2) + 
  geom_rug(size = 0.1, alpha = 0.5)


ggplot(weight_df,
       mapping = aes(x = height, colour = gender, fill = gender)
) + geom_density(adjust = 2) + 
  geom_rug(size = 0.1, alpha = 0.5)



# Heatmap -----------------------------------------------------------------

ggplot(nott_df,
       mapping = aes(x = year, y = month, fill = value)
) + geom_tile() + 
  scale_fill_gradient(low = 'yellow', high = 'red')

ggplot(nott_df,
       mapping = aes(x = year, y = month, fill = value)
) + geom_tile() + 
  scale_fill_gradient(low = 'blue', high = 'red')

# Geospatial map ----------------------------------------------------------

map_data <- read_csv("https://raw.githubusercontent.com/mark-andrews/idvrug23/main/data/local_authority_map_data.csv")
eu_ref <- read_csv("https://raw.githubusercontent.com/mark-andrews/idvrug23/main/data/EU-referendum-result-data.csv")

#  join up the two data sets
ref_mapdata <- inner_join(map_data, eu_ref, by = c('id' = 'Area_Code'))
