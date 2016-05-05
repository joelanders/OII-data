# GET /
+ Response 200 (application/json)
    + Attributes (Cryptocat)

# Data Structures

# Cryptocat

- id: `app-2` (required)
- name: Cryptocat
- os
- oses (array)
- type: `source-repository`
- `vcs-url`: `https://github.com/cryptocat/cryptocat.git`
- manifest (object)
    - kind: npm
    - deps: lib1 lib2
- builds (array)
    - (object)
        - id : blah
        - type: server
        - checksum: abcde
        - `metadata` (object)
            - `id`: `blah`
            - submitter: joe
    - (object)
        - id : blah
        - type: webapp
        - checksum: abcde
        - `metadata` (object)
            - `id`: `blah`
            - submitter: joe
- `app-type`: web
- dependencies (array)
- `infra` (array):
    - (object)
        - `id`: 01
        - `name`: `cryptocat-backend-server``
