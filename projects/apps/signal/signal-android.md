# GET /
+ Response 200 (application/json)
    + Attributes (Signal)

# Data Structures

# Signal

- id: `signal-android` (required)
- name: Signal Android (required)
- type: app (required)
- source: `https://github.com/WhisperSystems/Signal-Android.git`
- tracker: `https://github.com/WhisperSystems/Signal-Android/issues`
- manifest (object)
  - type: gradle (required)
  - `_meta`: (_meta)
- dependencies (array)
  - (object)
    - `_id`: `me.leolin:ShortcutBadger:1.1.0-WS1` (required)
    - type: binary (required)
    - checksum: 3142d017234bfa0cdd69ccded7cc5ea63f13b97574803c8c616c9bbeaad33ad9
- builds (array)
  - (object)
    - name: `signal-android-phone.apk`
    - type: apk
    - checksum: 23118A45E8CF30200D6AE1DFEF689893952FA6A5
    - `_meta`: (_meta)
- os: android (required)
- oses (array)
  - (object)
    - `_id`: android-lollypop
    - family: android
    - version: lollypop 
  - (object)
    - `_id`: android-kitkat
    - family: android
    - version: kitkat
- infra (array)
  - (object)
    - `_id`: `internet-infra`
  - (object)
    - `_id`: `signal-backend-servers`

# _meta

:[](../../../schema/_meta/index.md)

