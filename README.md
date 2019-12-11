# labdataR

R library for use with Azure Functions. Supported by [NGI.no](https://ngi.no).

## Installation

```R
install_github('mapic/labdataR')
```

## Usage

```R

# import library
library(labdataR)

# get config from config.yml
cl <- config::get("labdata")


# authenticate with azure function
labdataAuth(cl$key, cl$uri)

param.id <- "param_id"      # ID of parameter, eg. c824e2e6-26de-44c0-beee-38c309319b7a, id of parameter
param.code <- "param_code"  # Code of EF/ALS parameter to be moved, eg. Z001CY2X 

# move existing ALS/EF parameter to a new NGI parameter
data <- moveParamToNew(param.id, param.code, debug.auth = TRUE, debug.query = TRUE)

# json prettify results
result <- jsonlite::prettify(jsonlite::toJSON(data, auto_unbox = TRUE), 4)

# return results
return(result)
```
