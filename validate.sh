#!/bin/bash

set -euv


validate () {
    ../node_modules/.bin/ajv validate -d $1  -s ../schema/entries/app.json 
}

for json_file in `find projects/apps/signal -type f -name "*.json"`; do
    echo $json_file
    validate $json_file
done


