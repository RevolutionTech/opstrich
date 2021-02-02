# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

## [0.3.1]

### Changed
- Fixed `check.all` invoke task to skip migration checks for projects with Django installed but without a `./manage.py` file (ie. reusable Django apps)

## [0.3.0]

### Added
- Python 3.6-3.7 support

## [0.2.1]

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
