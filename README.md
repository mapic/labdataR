# labdataR

## Installation

```R
install_github('mapic/labdataR')
```

## Usage

```R
# authenticate with azure function key and uri
labdataAuth(cl$key, cl$uri)

# move parameter to a new parameter
data <- moveParamToNew(input$param_id, input$param_code, debug.auth = TRUE, debug.query = TRUE)

 # json prettify results
result <- jsonlite::prettify(jsonlite::toJSON(data, auto_unbox = TRUE), 4)

# return results
return(result)
```
