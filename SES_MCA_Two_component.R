#####################################################
#### Iwashita SES categories ########################
#### Author: Peter S. Larson ########################
#### This script creates SES categories from ########
#### using MCA and uses the first two PCs ###########
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
                    dplyr::select(-ID)), funs(factor(.))) ## Convert everything to factors


#### Check for missingness ####

aggr(ses_data_only_asset_columns, numbers = TRUE, prop = c(TRUE, FALSE))

## No missing data, proceed
# apply mca
mca = mca(ses_data_only_asset_columns, nf = 5)

### Plot the results of the MCA to see what it all looks like 

# data frame for ggplot

## Set number of categories for each variable, though in this case there are only two.
cats = apply(ses_data_only_asset_columns , 2, function(x) nlevels(as.factor(x)))

### Put this all into a data frame
mca2_vars_df = data.frame(mca$cs, Variable = rep(names(cats), cats))

# data frame with observation coordinates
mca1_obs_df = data.frame(mca$ind$coord)


# plot to see if what we are doing matches our intuition. Does it?
ggplot(data = mca2_vars_df, 
       aes(x = X1, y = X2, label = rownames(mca2_vars_df))) +
  geom_hline(yintercept = 0, colour = "gray70") +
  geom_vline(xintercept = 0, colour = "gray70") +
  geom_text(aes(colour = Variable)) +
  ggtitle("Loadings for the first two MCA components of Ecodess SES by variable")



#### Add first component back to original data file to get our asset index
ses_data$ses_mca_1 <- mca$rs[,1]

#### Add second component 
ses_data$ses_mca_2 <- mca$rs[,2]

#### Sum both of these ####
ses_data$ses_mca <- ses_data$ses_mca_1 + ses_data$ses_mca_2

#### Cut into categories and rename ####
ses_data$ses_categories <- quantcut(ses_data$ses_mca, 5)
levels(ses_data$ses_categories) <- c("5 (Wealthiest)", "4","3","2", "1 (Poorest)")

## Summarize
summary(ses_data)