This RESTFul Web application stores iotlab project sensors measurements.  
Below a descrition of how to actually consume the API.

Curl utility is used to show as an example how to use the API without  
the API but overall this has to be done through scripts.

## Insert a measurement

    curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"measurement":{"experiment_id":"32","resource_id":"3232","measurement_value":"321",
    "unit_type":"string"}}' http://129.194.70.52:9000/measurements

## Get measurements by experiment_id

    curl -v -X GET  
    129.194.70.52:9000/measurements/get_measurement_by_experiment_id.json?experiment_id=4

## Get measurements by resource_id

    curl -v -X GET  
    129.194.70.52:9000/measurements/get_measurement_by_resource_id?resource_id=2

## Get measurements by experiment_id \&\& resource_id

    curl -v -X GET  
    129.194.70.52:9000/measurements/get_measurement_by_experimentresource?experiment_id=32&resource_id=3232

## Get measurements by created before

    curl -v -X GET  
    129.194.70.52:9000/measurements/get_measurements_before?date=Thu%20May%2012%2017:35:54%20CEST%202015

## Get measurements by created after

    curl -v -X GET  
    129.194.70.52:9000/measurements/get_measurements_after?date=Thu%20May%2012%2017:35:54%20CEST%202015

Make sure the **mongod** instance on the server is running. Even if  
**sudo service mongod start** command has been executed, this doesn't  
necessarily mean that the db is working.
