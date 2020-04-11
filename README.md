<!-- markdownlint-disable MD012 MD022 MD024 MD041 -->

[![Maintainability](https://api.codeclimate.com/v1/badges/ee6c3e7d7223a3abfe4b/maintainability)](https://codeclimate.com/github/SCT-devTeam/SCT-Mobile/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/ee6c3e7d7223a3abfe4b/test_coverage)](https://codeclimate.com/github/SCT-devTeam/SCT-Mobile/test_coverage)

# SCT-Mobile

- [SCT-Mobile](#sct-mobile)
  - [Introduction](#introduction)
  - [Includes](#includes)
  - [Demo](#demo)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Steps](#steps)
  - [Roadmap](#roadmap)
  - [Project architecture](#project-architecture)


&nbsp; <!-- break line -->


## Introduction

SCT² is an open source project whose goal is for everyone to have a simple, fast and automated software to manage their business.

⚠ The project is still under development. ⚠

**This cross-platform mobile application need an [instance of the backend](https://github.com/SCT-devTeam/SCT-Backend/) to work.**


&nbsp; <!-- break line -->


## Includes

This project use [Flutter](https://github.com/laravel/laravel) to be cross-platform compatible

<!-- TODO: Add all links to the package used in the pubspec -->


&nbsp; <!-- break line -->


## Demo

We have configured 2 instances of SCT² so that you can test before installing it in your home.

One instance connected to the `master` branch (stable | slow ring) available at <https://sct-backend-prod.herokuapp.com>

One instance connected to the `dev` branch (beta | fast ring) available at <https://sct-backend-dev.herokuapp.com>

> They are hosted by Heroku for free so they can be in sleep mode when you try to acces to it. The first page loading can be a bit slow

Use theses login credentials to connect you, or by scan the QR code accessible in the backoffice
  email: `a@aa.co`
  password: `azER&é34az`


&nbsp; <!-- break line -->


## Getting Started

### Prerequisites

To use the application you need some tools to build the app:

- [Android Studio](https://developer.android.com/studio/)
- [Flutter](https://flutter.dev/docs/get-started/install)


### Steps

1. After [cloning](x-github-client://openRepo/https://github.com/SCT-devTeam/SCT-Backend) the project or [downloading it](https://github.com/SCT-devTeam/SCT-Backend/archive/master.zip) in `.zip` you have to check the installation section juste below.
2. Open Android Studio and clic on the play button at the top right corner to build the app on your phone
3. **You're done** ✨
   The application will start after few minutes. You can close Android studio, the app is installed on your device

> ⚠ These steps are for test perpose, don't use it in production ! ⚠


&nbsp; <!-- break line -->


## Roadmap

Please check `[Unreleased]` tag in [changelog](CHANGELOG.md) to read what's next.


&nbsp; <!-- break line -->


## Project architecture

I use my own project architecture to be able to separate source code and compile one.

<!-- PHP language gives the best syntax color -->
```php
📦SCT-Mobile
 ┣ 📂android
 ┃ ┗ 📜 '> All android project files'
 ┣ 📂assets
 ┃ ┣ 📂fonts
 ┃ ┃ ┗ 📜 '> All fonts used in the application'
 ┃ ┗ 📂images
 ┃   ┗ 📜 '> All ipctures used in the application'
 ┣ 📂build
 ┣ 📂gen
 ┣ 📂ios
 ┃ ┗ 📜 '> All ios project files'
 ┣ 📂lib
 ┃ ┣ 📂core
 ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┗ 📂models
 ┃ ┃ ┃ ┃ ┗ 📜 '> All data models used in the application'
 ┃ ┃ ┗ 📂viewmodels
 ┃ ┃ ┃ ┗ 📜 '> All view models used in the application'
 ┃ ┣ 📂ui
 ┃ ┃ ┣ 📂screens
 ┃ ┃ ┃ ┗ 📜 '> All screens used in the application'
 ┃ ┃ ┣ 📂shared
 ┃ ┃ ┃ ┗ 📜 '> All shared widgets used in the application'
 ┃ ┃ ┗ 📂widgets
 ┃ ┃ ┃ ┗ 📜 '> All other widgets used in the application'
 ┃ ┗ 📜main.dart
 ┣ 📂test
 ┃ ┗ 📜 '> All test of the application'
 ┣ 📜.flutter-plugins
 ┣ 📜.flutter-plugins-dependencies
 ┣ 📜.gitignore
 ┣ 📜.markdownlint.json
 ┣ 📜.metadata
 ┣ 📜.packages
 ┣ 📜CHANGELOG.md
 ┣ 📜LICENSE.md
 ┣ 📜pubspec.lock
 ┣ 📜pubspec.yaml
 ┗ 📜README.md
```
