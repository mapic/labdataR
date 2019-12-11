#' POST a HTTP to Azure Functions, in order to clean up parameters in Labdata
#' 
#' @param param.id The ID of the parameter you wish to move. Required.
#' @param param.json The JSON of the parameter changes you wish to make. Required.
#' @param debug.auth Logical value for getting verbose output of auth header being constructed. Defaults to false.
#' @param debug.query Logical value for getting verbose output of HTTP response, printing all headers. Defaults to false.
#' @param content.response Logical value to determine whether to retrieve full response or just the documents
#' @return Prints status code of HTTP POST, and returns full HTTP response or just the content
#' @keywords labdata parameter move new azure function post
#' @export
#' @examples
#' labdataUpdateParameter(param.id = 'abc', param.json = '{"name" : "new-name"}', debug.query = TRUE)

labdataUpdateParameter <- function(param.id = "", param.json = "", debug.auth = FALSE, debug.query = FALSE, content.response = TRUE) {

    require(digest)
    require(base64enc)
    require(httr)
    require(jsonlite)
    require(stringr)

    # Use the current time to create a proper auth header
    current.time <- Sys.time()

    # Coerce current time to proper format
    ms.date.string <- tolower(format(current.time, "%a, %d %b %Y %H:%M:%S %Z", tz = "GMT"))

    # Create POST URI for posting query to collection
    post.uri  <- paste0(envLabdata$uri, "?code=", envLabdata$key)

    # type of operation
    operation <- "update-param"
    
    # JSON body as list
    json.body <- list(
        operation = operation,
        param_id = param.id,
        param_json = param.json
    )

    # Geneerate POST request
    raw.response <- POST(post.uri, add_headers(.headers = c("x-ms-version" = "2017-02-22", "x-ms-date" = ms.date.string, "Content-Type" = "application/json")), body = json.body, encode = "json", verbose())

    # Send the status code of the POST to the console
    if (debug.query == TRUE) {
        print(paste("Status Code is", raw.response$status_code, sep = " "))
    }
    
    # Debug flag for viewing headers upon troubleshooting
    if (debug.query == TRUE) {
        print("*** Headers of Response ***")
        print(raw.response$headers)
        print('*** Response Content ***')
        print(readBin(raw.response$content, "character"))
    }

    # Check content response flag; act accordingly
    if (content.response == FALSE) {
        raw.response
    } else if (content.response == TRUE) {
        char.response <- readContent(raw.response)
        char.response
    } else {
        print("Invalid content response option specified. Logical value required.")
    }

}
