#' Logistic Regression By Health Status
#'
#' @description
#' A function that takes a data frame and various variables and computed logistic regression models and returns the one with the lowest AIC.
#'
#' @details
#' This function takes the variables provided and creates every possible regression model given health (alive or dead) as the response. Then it compares all these models and returns the one with the lowest AIC. The limit of this function is three variables max.
#'
#' @param df the data frame
#' @param x the first variable in the logistic regression model, if not provided null is default
#' @param y the second variable in the logistic regression model, if not provided null is default
#' @param z the third variable in the logistic regression model, if not provided null is default
#'
#' @returns The best logistic regression model, the one with the lowest AIC.
#' @export
#' @import dplyr
#' @import tidyr
#'
#' @examples logistic_reg_health(data21, "species", "dbh")
#' logistic_reg_health(data24, "species")
#'
logistic_reg_health <- function(df, x=NULL, y= NULL, z= NULL){
  df2 <- df
  #Step One: create the null model

  #if(x == NULL & y == NULL & z== NULL){
    #returns null model
  #}

  #if(x != NULL){
    #create model with just x
    #add to list of all models
  #}

  #if(y != NULL){
  #create model with just y
  #add to list of all models
  #}

  #if(z != NULL){
  #create model with just z
  #add to list of all models
  #}

  #if(x != NULL & y !=NULL){
  #create model with x and y
  #add to list of all models
  #}

  #if(x != NULL & z !=NULL){
  #create model with x and z
  #add to list of all models
  #}

  #if(y != NULL & z !=NULL){
  #create model with y and z
  #add to list of all models
  #}

  #if(x != NULL & y !=NULL & z !=NULL ){
  #create model with x, y, and z
  #add to list of all models
  #}

  #compare the AIC in the list of all models
  #return the model with the lowest AIC

}
