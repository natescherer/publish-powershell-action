# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Changed
- GitHub Packages publishing converted to using pure PSResourceGet
- Action pinned to PSResourceGet 0.5.23-beta23

### Fixed
- NuGet repo now unregistered after publishing, thanks to @Galvill (#11)
- Bad examples in README.md
- Publishing modules with requirements now works, and tests added to cover this case (#10)

## [1.0.3] - 2022-11-04
### Fixed
- Publishing to PowerShell Gallery

## [1.0.2] - 2022-10-25
### Fixed
- Publishing of modules in directories that aren't the same name as the module

## [1.0.1] - 2022-10-25
### Fixed
- Adding missing branding for GitHub Marketplace

## [1.0.0] - 2022-10-25
### Added
- Initial release

[Unreleased]: https://github.com/natescherer/publish-powershell-action/compare/v1.0.3..HEAD
[1.0.3]: https://github.com/natescherer/publish-powershell-action/compare/v1.0.2..v1.0.3
[1.0.2]: https://github.com/natescherer/publish-powershell-action/compare/v1.0.1..v1.0.2
[1.0.1]: https://github.com/natescherer/publish-powershell-action/compare/v1.0.0..v1.0.1
[1.0.0]: https://github.com/natescherer/publish-powershell-action/tree/v1.0.0