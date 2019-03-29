#* Return the current time
#* @get /teste/time
function(){
   Sys.time()
}

#* Echo back the input
#* @param msg The first number to add
#* @get /teste/echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

#* Return the current system and user information
#* @get /teste/info
function(){
   Sys.info()
}
