# Tor Browser
example of multi-platform source repo

## Properties

- id: app-5
- name: Tor Browser
- type: source-repository
- build-artifacts (array)
  - (object)
    - name: Tor Browser Windows
    - type: native-desktop
  - (object)
    - name: Tor Browser Linux 32-bit
- infra-deps (array)
  - (object)
    - name: unblocked bridge or guard
  - (object)
    - name: directory authorities