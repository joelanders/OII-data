#!/bin/bash

set -euv

HERCULE=/usr/local/bin/hercule
DRAFTER=/usr/local/bin/drafter
REFRACT_FILTER=/usr/local/bin/refract-filter

# input (filename) -> hercule -> drafter -> refract-filter -> output (stdout)
mson-to-json() {
    $HERCULE $1 \
        | $DRAFTER --format json \
        | $REFRACT_FILTER -j --content_type="application/json";
}

for schema_file in `find projects/apps/signal -type f -name "*.md"`; do
    echo $schema_file
    mson-to-json $schema_file > ${schema_file%.*}.json
done


