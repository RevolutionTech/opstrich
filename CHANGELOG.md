# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

### Changed
- Bumped invoke from 1.5.0 to 1.6.0
- Bumped isort from 5.8.0 to 5.9.3
- Bumped pyupgrade from 2.11.0 to 2.23.1

## [0.6.0] - 2021-04-02

### Added
- Follow [Conventional Commits](https://www.conventionalcommits.org/) for commit messages produced via `package.bump` invoke task

### Changed
- Bumped isort from 5.7.0 to 5.8.0
- Bumped pyupgrade from 2.10.0 to 2.11.0

## [0.5.0] - 2021-03-14

### Changed
- Require exact versions of linting packages (eg. black, pyupgrade, isort) so that bumping Opstrich results in these packages being bumped
- Bumped pyupgrade from 2.9.0 to 2.10.0

## [0.4.0] - 2021-03-07

### Changed
- Explicitly use sha256 as the default digest for `openssl` invoke tasks
  - Note: This is a backwards-incompatible change and may require re-encrypting files depending on the version of openssl being used
- Switched CI from Travis to Github Actions

## [0.3.1] - 2021-02-02

### Changed
- Fixed `check.all` invoke task to skip migration checks for projects with Django installed but without a `./manage.py` file (ie. reusable Django apps)

## [0.3.0] - 2021-02-01

### Added
- Python 3.6-3.7 support

## [0.2.1] - 2021-02-01

### Changed
- Upgraded poetry to 1.1.4
- Bumped invoke from 1.4.1 to 1.5.0
- Bumped isort from 5.6.4 to 5.7.0
- Bumped pyupgrade from 2.7.4 to 2.9.0

## [0.2.0] - 2020-11-26

### Added
- `package.bump` invoke task to bump the version of a package, then commit, tag, and push the updated version

## [0.1.0] - 2020-11-26

### Added
- Initial `check` invoke tasks including `pyupgrade`, `isort`, `black`, `migrations`, and `all` (which runs all of the checks)
- `openssl` invoke tasks `encrypt` and `decrypt` for encrypting/decrypting files using `DECRYPT_PASSWORD`
- Python 3.8 support
- `Dockerfile` used as parent for Zappa projects using SQLite
