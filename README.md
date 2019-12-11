# labdataR

## Installation

```R
install_github('mapic/labdataR')
```

## Usage

```R

library(labdataR)
cl <- config::get("labdata") # fra config.yml

# ...

# authenticate with azure function key and uri
labdataAuth(cl$key, cl$uri)

param.id <- "param_id" # eg. c824e2e6-26de-44c0-beee-38c309319b7a, id of parameter
param.code <- "param_code" # eg. Z001CY2X, code of EF/ALS parameter to be moved

# move parameter to a new parameter
data <- moveParamToNew(param.id, param.code, debug.auth = TRUE, debug.query = TRUE)

 # json prettify results
result <- jsonlite::prettify(jsonlite::toJSON(data, auto_unbox = TRUE), 4)

# return results
return(result)
```
