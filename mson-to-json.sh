#!/bin/bash

set -euv

HERCULE=/usr/local/bin/hercule
DRAFTER=/usr/local/bin/drafter
REFRACT_FILTER=/usr/local/bin/refract-filter

mson-to-json() {
    $HERCULE $1 \
        | $DRAFTER --format json \
        | $REFRACT_FILTER -j --content_type="application/json";
}

validate-app() {
    ../node_modules/.bin/ajv validate -d $1  -s ../schema/entries/app.json 
}

for schema_file in `find projects/apps -type f -name "*.md"`; do
    echo $schema_file
    mson-to-json $schema_file > ${schema_file%.*}.json
    validate-app ${schema_file%.*}.json
done


