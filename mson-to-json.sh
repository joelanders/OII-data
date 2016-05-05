#!/bin/bash

set -euv

HERCULE=/usr/bin/hercule
DRAFTER=/usr/local/bin/drafter
REFRACT_FILTER=/usr/local/bin/refract-filter

mson-to-json() {
    $HERCULE $1 \
        | $DRAFTER --format json \
        | $REFRACT_FILTER -j --content_type="application/json";
}

validate-app() {
    ajv validate -d $1  -s schemas/app.json 
}

( mkdir schemas
  cd schemas
  wget "https://code.iilab.org/openintegrity/schema/raw/mson-to-json-ci/entries/app.json" )


for schema_file in `find projects/apps -type f -name "*.md"`; do
    echo $schema_file
    mson-to-json $schema_file > ${schema_file%.*}.json
    validate-app ${schema_file%.*}.json
done


