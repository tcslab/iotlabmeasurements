# README

Make sure the **mongod** instance on the server is running. Even if  
**sudo service mongod start** command has been executed, this doesn't  
necessarily mean that the db is working.

## Insert a measurement

    curl -v -H "Accept: application/json" -H "Content-type:
    application/json" -X POST -d '
    {"measurement":{"experiment_id":"32","resource_id":"3232","measurement_value":"321",
    "unit_type":"string"}}' http://ip:port/measurements

## Get measurements by experiment_id

    curl -v -X GET ip:port/measurements/get_measurement_by_experiment_id.json?experiment_id=4

## Get measurements by resource_id

    curl -v -X GET ip:port/measurements/get_measurement_by_resource_id?resource_id=2

## Get measurements by created before

    curl -v -X GET ip:port/measurements/get_measurements_before?date=Thu%20May%2012%2017:35:54%20CEST%202015

## Get measurements by created after

    curl -v -X GET ip:port/measurements/get_measurements_after?date=Thu%20May%2012%2017:35:54%20CEST%202015
