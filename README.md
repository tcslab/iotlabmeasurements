# README

Make sure the **mongod** instance on the server is running. Even if  
**sudo service mongod start** command has been executed, this doesn't  
necessarily mean that the db is working.

## Insert a measurement

    curl -v -H "Accept: application/json" -H "Content-type:
    application/json" -X POST -d '
    {"measurement":{"experiment_id":"32","resource_id":"3232","measurement_value":"321",
    "unit_type":"string"}}' http://ip:port/measurements
