#' Set up initial parameters for labdataR
#' 
#' @param key Access key, primary or secondary, for calling Azure Functions
#' @param uri HTTPS URI to the Cosmos DB
#' @param dbName String name of CosmosDB Database target
#' @param collName String name of CosmosDB Collection target
#' @return Environment variable is created for usage in all other functions
#' @keywords environment cosmos key uri
#' @export
#' @examples
#' labdataAuth("KeY123","https://yourcosmosdb.documents.azure.com","SampleDB","SampleCollection")


labdataAuth <- function(key, uri) {

    # Access key assignment
    assign("key", key, envir = envLabdata)

    # URI for the Azure Function
    assign("uri", uri, envir = envLabdata)

}

envLabdata <- new.env(parent = emptyenv())