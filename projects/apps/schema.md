# App

## Schema

- id: 0-project-schema
  - properties
    - type: {project-src, project-bin}
      - many os/arch builds can come from a common src
      - FIXME: want to eval "app-win" and "app-linux" separately even if they share a src repo ?
    - distribution-method: {*-app-store, webapp, download-bin}
      - how user gets the app
    - deps: (list of libraries)
      - say somewhere how we enumerate these (depends on the project)
    - app-type: {native{-desktop, -mobile}, webapp}
    - os-family: {win, mac, ios, android, gnu/linux} # broadly whis os it runs on
    - os-versions: {win-xp, android-4.4}
    - hw-deps: (fingerprint-reader, cell-baseband)
    - infra-deps: {internet, cell-network, backend-servers}
    - license

<!--
- distribution-method: google-play-store
- distribution-method: webapp
- distribution-method:
  - download-bin
  - microsoft-app-store
- distribution-method:
  - download-bin
  - autoupdate # ?
  - managed-download-bin # gettor?
- distribution-method:
  - ios-app-store
-->