# Publish PowerShell GitHub Action

[![PowerShell on Windows](https://gist.github.
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

This Action defines the following formal inputs.

<!--(inputs-start)-->
<!--(inputs-end)-->

### Outputs

This Action defines the following formal outputs.

<!--(outputs-start)-->
<!--(outputs-end)-->

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://allcontributors.org) specification.
Contributions of any kind are welcome!

## License

This project is licensed under The MIT License - see [LICENSE](LICENSE) for details.
