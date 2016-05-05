#!/bin/bash

set -eu

HERCULE=/usr/local/bin/hercule
DRAFTER=/usr/local/bin/drafter
REFRACT_FILTER=/usr/local/bin/refract-filter

path-to-obj-name() {
    file=$(basename $1) # strips the path part
    name=${file%.*} # strips the extension
}

# takes an argument that's the object name like App or Signal
print_header() { cat <<-EOF
# GET /
+ Response 200 (application/json)
    + Attributes (Dummy)

# Data Structures

# Dummy
EOF
}

# we include all the header files in every document
print_footer() {
    for f in $( find ../schema/_meta -name "*.md" ); do
        printf "\n:[]($f)\n"
    done
}

mson-to-json() {
    ( print_header $(path-to-obj-name $1) && cat $1 && print_footer ) \
        | $HERCULE \
        | $DRAFTER --format json \
        | $REFRACT_FILTER -j --content_type="application/json";
}

validate-app() {
    ../node_modules/.bin/ajv validate -d $1  -s schemas/app.json 
}

#( mkdir schemas
#  cd schemas
#  wget "https://code.iilab.org/openintegrity/schema/raw/mson-to-json-ci/entries/app.json" )


for schema_file in `find projects/apps -type f -name "*.md"`; do
    echo $schema_file
    mson-to-json $schema_file > ${schema_file%.*}.json
    validate-app ${schema_file%.*}.json
done


