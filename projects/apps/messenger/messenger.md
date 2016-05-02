# GET /
+ Response 200 (application/json)
    + Attributes (Messenger)

# Data Structures

# Messenger

- id: `android-messenger` (required)
- name: Android Messenger (required)
- `hw-deps` (array)
    - (object)
        - name: gsm-baseband
        - id: XXX
- `android-permissions-deps` (array)
    - phone book
    - microphone
    - GPS
- `infra-deps` (array)
    - (object)
        - name: `gsm-network`
        - id: XXY
- metrics (array)
    - `(GSMMap - [data.json](../../metrics/1_sources/gsmmap/data.json) [FIXME]`
