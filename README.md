# Publish PowerShell GitHub Action

[![PowerShell on Windows](https://raw.githubusercontent.com/gist/natescherer/13d7121be73557627d3908f6e5559d9f/raw/4f7747f24063595a285dd33192fe1fd57fe60dee/publish-powershell-action_TestResults_Windows.md_badge.svg)](https://gist.github.com/natescherer/13d7121be73557627d3908f6e5559d9f) [![PowerShell on Linux](https://raw.githubusercontent.com/gist/natescherer/7006cea198e1726f203cde5604179d4b/raw/9aed4cd805da75c33a98968f9980f70fd7a6f7c9/publish-powershell-action_TestResults_Linux.md_badge.svg)](https://gist.github.com/natescherer/7006cea198e1726f203cde5604179d4b) [![PowerShell on macOS](https://raw.githubusercontent.com/gist/natescherer/cbc42445c9b9161db9d83db09927a66c/raw/4e43ee59dd608716106e1b3abbdf7b933b95980a/publish-powershell-action_TestResults_macOS.md_badge.svg)](https://gist.github.com/natescherer/cbc42445c9b9161db9d83db09927a66c)
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

A GitHub Action to publish a PowerShell module or script to GitHub Packages,a NuGet repository, or the PowerShell Gallery.

It is tested and runs on `windows-latest`, `ubuntu-latest`, and `macos-latest`.

## Usage

```yaml
    steps:
      - name: Publish PowerShell Module
        uses: natescherer/update-powershell-metadata-action@v2
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          target: packages
          path: src
```

```yaml
    steps:
      - name: Publish PowerShell Module
        uses: natescherer/update-powershell-metadata-action@v2
        with:
          token: ${{ secrets.NUGET_TOKEN }}
          target: nuget
          path: src
```

```yaml
    steps:
      - name: Publish PowerShell Module
        uses: natescherer/update-powershell-metadata-action@v2
        with:
          token: ${{ secrets.GALLERY_API_KEY }}
          target: gallery
          path: src
```

### Inputs

<!--(inputs-start)-->
<!--(inputs-end)-->

### Outputs

<!--(outputs-start)-->
<!--(outputs-end)-->

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center"><a href="https://www.linkedin.com/in/natescherer01/"><img src="https://avatars.githubusercontent.com/u/376408?v=4?s=100" width="100px;" alt="Nate Scherer"/><br /><sub><b>Nate Scherer</b></sub></a><br /><a href="https://github.com/natescherer/publish-powershell-action/commits?author=natescherer" title="Code">💻</a> <a href="https://github.com/natescherer/publish-powershell-action/commits?author=natescherer" title="Documentation">📖</a> <a href="#infra-natescherer" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://allcontributors.org) specification.
Contributions of any kind are welcome!

## License

This project is licensed under The MIT License - see [LICENSE](LICENSE) for details.
