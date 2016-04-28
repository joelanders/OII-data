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

################# assorted ideas
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

################## Apps / Projects

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
- os-families: android
- os-versions: android-kitkat android-lollipop
- infra-deps:
  - internet-infra
  - signal-backend-servers


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


# Skype Windows
example of closed source

## Properties

- id: app-4
- name: Skype Windows
- type: binary
- distribution-methods
  - manual-download
  - windows-app-store
- source-available: no
- dynamic-library-deps: libA libB
- infra-deps:
  - internet-infra
  - skype-backend-servers


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
  

############################## Operating Systems

# Android OS

## Properties

- id: os-1
- name: Android
- type: os-family
- license: partly-free
- hardware-compatibilities: phones tablets
- hardware-dependencies:
- can-provide-from-hardware
  - gps
  - microphone
- can-provide-from-infrastructure
  - gsm-network
  - internet


# Apple iOS
example of OS that runs on limited hw platforms

## Properties

- id: os-2
- name: iOS
- type: os-family
- license: mostly-unfree
- hardware-compatibilities
  - apple phones
  - apple tablets
  - apple iPod Touches
- can-provide-from-hardware
  - trusted hsm thing
  - bluetooth (some chat apps don't use internet)
- can-provide-from-infrastructure
  - gsm-network
  - cell-data-network
  - internet
  - LAN (some chat apps might work over a LAN)


# GNU/Linux
example of OS that runs on wide range of hardware

## Properties

- id: os-3
- name: os-family
- license: free
- hardware: lots
- can-provide-from-hardware: lots

############################# Hardware

# Android Phone
example of Android OS hw with internet+cell

## Properties

- id: hw-1
- name: Android Phone
- type: hardware
- hardware-categories: smartphone
- supported-operating-systems
  - Android OS
  - GNU/Linux
- can-provide-from-infrastructure
  - id: 8-internet-infra
  - id: 9-gsm-infra


# iPhone
example of iOS hw with internet+cell

## Properties

- id: hw-2
- type: hardware
- hardware-categories: smartphone
- supported-operating-systems
  - iOS
- can-provide-from-infrastructure
  - id: 9-gsm-infra
  - id: 8-internet-infra


# iPod Touch
example of iOS hardware with internet and no cell
FIXME it's more like a tablet than an mp3 player

## Properties

- id: hw-3
- type: hardware
- hardware-categories: mp3-player
- supported-operating-systems
  - iOS
- can-provide-from-infrastructure
  - id: 8-internet-infra


# PC
example of hw that many OSs can run on
example of multiple hardware categories

## Properties

- id: hw-4
- type: hardware
- hardware-categories
  - laptop
  - desktop
  - server
- supported-operating-systems
  - GNU/Linux
  - Mac OSX
  - Windows Desktop
  - Windows Server
- can-provide-from-infrastructure
  - internet


# GSM Feature Phone
example of hardware with GSM but no Internet

## Properties

- id: hw-5
- type: hardware
- hardware-categories
  - feature-phone
- supported-operating-systems: symbian
- can-provide-from-infrastructure
  - gsm
- can-provide-from-hardware
  - gps

################################ Infrastructure

# Internet
example of non-privately-reproducible infrastructure

## Properties

- id: infra-1
- name: Internet
- type: infra
- privately-reproducible: no


# GSM Network
example of somewhat-privately-reproducible infrastructure (for ueber nerds)

## Properties

- id: infra-2
- name: GSM network
- type: infra
- deps:
  - (subsystems of gsm netowrk. i'm thinking of the people who
     brought enough subsystems back up during the Egyptian
     revolution to restore access)?


# Signal Backend Servers
example of closed-source backend (true?)

## Properties

- id: infra-3
- name: signal backend servers
- type: infra


# Jabber Server
example of somewhat-privately-reproducible infra (modulo federation)

## Properties

- id: infra-4
- name: jabber server
- type: infra
- privately-reproducible: kind-of


# Privately Hosted Cloud Software
example of fully-privately-reproducible infra
example of dependencies on other infrastructure

## Properties

- id: infra-5
- name: privately hosted cloud software
- type: infra
- privately-reproducible: yes
- infra-deps: internet


# Satellite TV
example of not-easily-blocked infrastructure

## Properties

- id: infra-6
- name: Satellite TV
- type: infra
- privately-reproducible: no
- ease-of-blocking: hard (http://www.wired.com/2016/04/ingenious-way-iranians-using-satellite-tv-beam-banned-data/)


# Wireless Local Area Network
example of hard-to-block privately-reproducible infrastructure

## Properties

- id: infra-7
- name: Wireless LAN
