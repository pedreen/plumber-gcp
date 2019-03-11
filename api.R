library(googleAuthR)
library(searchConsoleR)
options(googleAuthR.scopes.selected = "https://www.googleapis.com/auth/webmasters") 

gar_auth_service("client_secret.json")

list_websites()
#* Return the current time
#* @get /teste/time
function(){
   Sys.time()
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @get /teste/sum
function(a, b){
  as.numeric(a) + as.numeric(b)
}

#* Return the current system and user information
#* @get /date
function(){
   Sys.info()
}
