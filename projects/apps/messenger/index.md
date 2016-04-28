# Android Messenger
example of permissions dependencies
example of hardware dependencies

## Properties

- id: app-3
- name: Android Messenger
- os-family:
  - id: 3-android-os
- hw-deps (array)
  - (object)
    - name: gsm-baseband
    - id: XXX
- android-permissions-deps
  - phone book
  - microphone
  - GPS
- infra-deps (array)
  - (object)
    - name: gsm-network
    - id: XXY - link to gsm-network document

## Metrics

 - (GSMMap - [data.json](../../metrics/1_sources/gsmmap/data.json)
 - 