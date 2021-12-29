#####################################################
#### Iwashita SES categories ########################
#### Author: Peter S. Larson ########################
#### This script creates SES categories from ########
#### from the data that Iwashita sent ###############
#####################################################


#### Get require libraries ####

require(dplyr)
require(readr)
require(janitor)
require(VIM)
require(FactoMineR)
require(ggplot2)
require(MASS)
require(gtools)

#### Set data path and load in data ####

source("ses_make_some_fake_data.R")

## Get the data set but only with the asset columns (no ID)
ses_data_only_asset_columns <- ses_data %>%
  dplyr::select(-ID) %>%
  mutate_at(names(ses_data %>%
                    dplyr::select(-ID)), funs(factor(.))) %>% ## Convert everything to factors
  mutate_at(names(ses_data %>%
                    dplyr::select(-ID)), funs(as.numeric(.)-1)) ## PCA will only accept numeric variables. We not convert our factors to numbers to allow us to use this data. We subtract 1 so that all binary variables are 0 and 1.

#### Check for missingness ####

aggr(ses_data_only_asset_columns,
     numbers = TRUE,
     prop = c(TRUE, FALSE))

## No missing data, proceed. For an example with missing data see the other script.

## Apply the PCA
#pca = mca(ses_data_only_asset_columns, nf = 5)
pca <-
  prcomp(ses_data_only_asset_columns,
         center = TRUE,
         scale. = TRUE)

### Plot the results of the PCA to see what it all looks like
## Biplot provides a plot of the second component against the first.
biplot(pca)

## Use the first component as our SES measure. If we have some reason to, we can always include the second as well. 
#### Add first component back to original data file to get our asset index
ses_data$ses_pca <- pca$x[,1]

#### Cut into categories and rename ####
ses_data$ses_categories_pca <- quantcut(ses_data$ses_pca, 5)
levels(ses_data$ses_categories) <-
  c("5 (Wealthiest)", "4", "3", "2", "1 (Poorest)")

## Summarize
summary(ses_data)