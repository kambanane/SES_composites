#############################################################################################
#### Create fake data set of assets #########################################################
#### This data set creates a fake asset date set ############################################
#### There are three non-binary variables that we will use to create indicator variables ####
#############################################################################################


library(readr)
library(dplyr)
library(janitor)


### Make some data

ses_data <- as.data.frame(matrix(NA, 1000, 21))
names(ses_data ) <-
  c(
    "wall",
    "floor",
    "toilet",
    "animals",
    "motorcycle",
    "solar",
    "motor",
    "canoe",
    "chainsaw",
    "bicycle",
    "cellphone" ,
    "tv",
    "gasstove"   ,
    "refridgerator",
    "blender"    ,
    "stereo"  ,
    "sewingmachine",
    "dvd",
    "computer"    ,
    "house"  ,
    "land"
  )


ses_data  <- ses_data  %>%
  dplyr::mutate(ID = seq(1:dim(ses_data)[1])) %>%
  dplyr::mutate(wall = sample(
    c('wood', 'cement' , 'brick', 'mud'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .05, .02, .77)
  )) %>%
  dplyr::mutate(floor = sample(
    c('wood', 'cement' , 'dirt'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.05, .02, .93)
  )) %>%
  dplyr::mutate(toilet = sample(
    c('pit latrine', 'open def' , 'vip toilet', 'flush toilet'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .05, .02, .77)
  )) %>%
  dplyr::mutate(animals = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(motorcycle = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(solar = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(motor = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(canoe = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(chainsaw = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(bicycle = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(cellphone = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(tv = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(gasstove = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(refridgerator = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(blender = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(stereo = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(sewingmachine = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(dvd = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(computer = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(house = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) %>%
  dplyr::mutate(land = sample(
    c('Yes', 'No'),
    dim(ses_data)[1],
    replace = TRUE,
    prob = c(.2, .8)
  )) 
  
  
