# GET /
+ Response 200 (application/json)
    + Attributes (Signal)

# Data Structures
# Signal

- id: `app-1` (required)
- name: Signal Android (required)
- type: `source-repository` (required)
- `vcs-url`: `https://github.com/WhisperSystems/Signal-Android.git`
- manifests (array)
  - (object)
    - `manifest-type`: maven
    - deps: lib1 lib2
  - (object)
    - `manifest-type`: gradle
    - deps: libx liby
- `build-artifacts` (array)
  - (object)
    - name: `signal-android-phone`
    - type: native-mobile
- `os-families`: android
- `os-versions`: `android-kitkat` `android-lollipop`
- `infra-deps` (array):
  - `internet-infra`
  - `signal-backend-servers`
