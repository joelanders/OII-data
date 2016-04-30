# Cryptocat
example of two builds coming from a single source repo
example (not yet shown) of multiple distribution methods
example of optional infrastructure dependencies?

## Properties

- id: app-2 (required)
- name: Cryptocat
- type: source-repository
- vcs_url: https://github.com/cryptocat/cryptocat.git
- manifests (array)
  - (object)
    - type: npm
    - deps: lib1 lib2
- build-artifacts (array)
  - (object)
    - name: cryptocat-server
    - type: server
  - (object)
    - name: cryptocat-client
    - type: webapp
- app-type: web
- infra-deps:
  - cryptocat-backend-server - belongs under cryptocat-client?
