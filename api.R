#* Return the current time
#* @get /demoR
function(){
   Sys.time()
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @get /sum
function(a, b){
  as.numeric(a) + as.numeric(b)
}

#* Return the current system and user information
#* @get /demoR
function(){
   Sys.info()
}
