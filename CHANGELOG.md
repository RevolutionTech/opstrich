# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

### Changed
- Upgraded poetry to 1.1.4

## [0.2.0] - 2020-11-26

### Added
- `package.bump` invoke task to bump the version of a package, then commit, tag, and push the updated version

## [0.1.0] - 2020-11-26

### Added
- Initial `check` invoke tasks including `pyupgrade`, `isort`, `black`, `migrations`, and `all` (which runs all of the checks)
- `openssl` invoke tasks `encrypt` and `decrypt` for encrypting/decrypting files using `DECRYPT_PASSWORD`
- Python 3.8 support
- `Dockerfile` used as parent for Zappa projects using SQLite
