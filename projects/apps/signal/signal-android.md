# Signal Android
example of 1-1 source repo to build artifact
example of infrastructure dependencies
example (artificial) of multiple manifests (not necessary?)

## Properties

- id: app-1 (required)
- name: Signal Android
- type: source-repository
- vcs_url: https://github.com/WhisperSystems/Signal-Android.git
- manifests (array)
  - (object)
    - manifest-type: maven
    - deps: lib1 lib2
  - (object)
    - manifest-type: gradle
    - deps: libx liby
- build-artifacts (array)
  - (object)
    - name: signal-android-phone
    - type: native-mobile
- os-families: 
  - android
- os-versions: 
  - android-kitkat
  - android-lollipop
- infra-deps:
  - internet-infra
  - signal-backend-servers
