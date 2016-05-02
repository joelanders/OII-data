# GET /
+ Response 200 (application/json)
    + Attributes (Cryptocat)

# Data Structures

# Cryptocat

- id: `app-2` (required)
- name: Cryptocat
- type: `source-repository`
- `vcs-url`: `https://github.com/cryptocat/cryptocat.git`
- manifest (object)
    - type: npm
    - deps: lib1 lib2
- builds (array)
    - (object)
        - name: cryptocat-server
        - type: server
        - checksum: abcde
    - (object)
        - name: cryptocat-client
        - type: webapp
        - checksum: abcde
- `app-type`: web
- `infra` (array):
    - `cryptocat-backend-server`
