#' Set up initial parameters for labdataR
#' 
#' @param key Access key, primary or secondary, for calling Azure Functions
#' @param uri HTTPS URI to the Azure Function
#' @return Environment variable is created for usage in all other functions
#' @keywords environment azure function key uri
#' @export
#' @examples
#' labdataAuth("KeY123","https://your-azure-function-uri.com")


labdataAuth <- function(key, uri) {

    # Access key assignment
    assign("key", key, envir = envLabdata)

    # URI for the Azure Function
    assign("uri", uri, envir = envLabdata)

}

envLabdata <- new.env(parent = emptyenv())