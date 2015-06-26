This RESTFul Web application stores iotlab project sensors measurements.  
Below a descrition of how to actually consume the API.

Curl utility is used to show as an example how to use the API without  
the API but overall this has to be done through scripts.

## Get all measurements

    curl -v -X GET  
    iotlabmongo.iotlab.eu/measurements.json

## Insert a measurement

    curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"measurement":{"experiment_id":"32","resource_id":"3232","measurement_value":"321",
    "unit_type":"string"}}' http://iotlabmongo.iotlab.eu/measurements

## Get measurements by experiment_id and/or resource_id

    curl -v -X GET  
    iotlabmongo.iotlab.eu/measurements/get_measurement_by_experimentresource?experiment_id=32&resource_id=3232

    curl -v -X GET  
    iotlabmongo.iotlab.eu/measurements/get_measurement_by_experimentresource?experiment_id=32

    curl -v -X GET  
    iotlabmongo.iotlab.eu/measurements/get_measurement_by_experimentresource?resource_id=3232

## Get measurements by created before

    curl -v -X GET  
    iotlabmongo.iotlab.eu/measurements/get_measurements_before?date=Thu%20May%2012%2017:35:54%20CEST%202015

## Get measurements by created after

    curl -v -X GET  
    iotlabmongo.iotlab.eu/measurements/get_measurements_after?date=Thu%20May%2012%2017:35:54%20CEST%202015

## Get the last measurement and if resource_id is provided get the last measurement with that measurement id

    curl -v -X GET  
    iotlabmongo.iotlab.eu/measurements/get_measurements_last

## Get the maximum sensor value for a given experiment and resource

    curl -v -X GET  
    iotlabmongo.iotlab.eu/measurements/get_max?experiment_id=1&resource_id=519

## Get the minimum sensor value for a given experiment and resource

    curl -v -X GET  
    iotlabmongo.iotlab.eu/measurements/get_min?experiment_id=1&resource_id=519

## Get the average sensor value for a given experiment and resource

    curl -v -X GET  
    iotlabmongo.iotlab.eu/measurements/get_average?experiment_id=1&resource_id=519

## Get the availability status of a resource. Allows to verify if a resource is either available or not

    curl -v -X GET  
    iotlabmongo.iotlab.eu/measurements/is_resource_availabile?resource_id=43
    

Make sure the **mongod** instance on the server is running. Even if  
**sudo service mongod start** command has been executed, this doesn't  
necessarily mean that the db is working.
