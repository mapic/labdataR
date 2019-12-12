# labdataR

R library for use with Azure Functions. 

## Installation

```R
library('devtools')
install_github('mapic/labdataR')
```

## Usage

### Move parameter to new or existing parameter
```R
# import library
library(labdataR)

# get config from config.yml
cl <- config::get("labdata")

# authenticate with azure function
labdataAuth(cl$key, cl$uri)

# set arguments
param.id <- "param_id"      # ID of parameter, eg. c824e2e6-26de-44c0-beee-38c309319b7a
param.code <- "param_code"  # Code of EF/ALS parameter to be moved, eg. Z001CY2X 
param.to.id <- "param_id"   # Code of NGI parameter to move to, eg. c824e2e6-26de-44c0-beee-38c309319b7a

# EITHER move existing ALS/EF parameter to a new NGI parameter
data <- labdataMoveParameter(param.id = param.id, param.code = param.code, debug.auth = TRUE, debug.query = TRUE)

# OR move existing ALS/EF parameter to an existing NGI parameter (when adding param.to.id argument)
data <- labdataMoveParameter(param.id = param.id, param.code = param.code, param.to.id = param.to.id, debug.auth = TRUE, debug.query = TRUE)

# json prettify results
result <- jsonlite::prettify(jsonlite::toJSON(data, auto_unbox = TRUE), 4)

# return results
return(result)
```

### Update parameter
```R
# import library
library(labdataR)

# get config from config.yml
cl <- config::get("labdata")

# auth with azure fn
labdataAuth(cl$key, cl$uri)

# set arguments
param.id <- "param_id"                  # ID of parameter, eg. c824e2e6-26de-44c0-beee-38c309319b7a
param.json <- '{"name" : "new-name"}'   # JSON of keys to update

# move parameter to a new parameter, and update all laborders
data <- labdataUpdateParameter(param.id = param.id, param.json = param.json)

# json prettify results
result <- jsonlite::prettify(jsonlite::toJSON(data, auto_unbox = TRUE), 4)

# return results
return(result)
```

### Mark parameter `human_verified`
```R
# import library
library(labdataR)

# get config from config.yml
cl <- config::get("labdata")

# set arguments
param.id <- "param_id"              # ID of parameter, eg. c824e2e6-26de-44c0-beee-38c309319b7a
param.code <- "param_code"          # Code of EF/ALS parameter to be moved, eg. Z001CY2X 
param.human_verified <- "true"      # Boolean. Default true. Can be "true", "True" or true (or similarly false)

# auth with azure fn
labdataAuth(cl$key, cl$uri)

# move parameter to a new parameter, and update all laborders
data <- labdataMarkVerified(param.id = param.id, param.code = param.code, param.human_verified = param.human_verified, debug.auth = TRUE, debug.query = TRUE)

 # json prettify results
result <- jsonlite::prettify(jsonlite::toJSON(data, auto_unbox = TRUE), 4)

# return results
return(result)
```

## License
[MIT License](https://github.com/mapic/labdataR/blob/master/LICENSE)

Supported by [NGI.no](https://ngi.no).

Based on work by [aaron2012r2](https://github.com/aaron2012r2/cosmosR).