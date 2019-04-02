# plumber.R
 
#* Echo back the input message
#* @param msg The message to echo
#* @get /test/echo
function(msg=""){
    list(msg = paste0("The message is: '", msg, "'"))
}
 
#* Plot a histogram
#* @png
#* @get /test/plot
function(){
    rand <- rnorm(100)
    hist(rand)
}
 
#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /test/sum
function(a, b){
    as.numeric(a) + as.numeric(b)
}
