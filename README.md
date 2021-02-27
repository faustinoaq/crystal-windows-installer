# Crystal executable on Windows 10

Currently this project is a bat file that execute `crystal` on [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about).

However the final goal of this project is to create a [native](https://github.com/crystal-lang/crystal/pull/3582) Crystal installer for Windows.

## Prerequisites

This project requires:

- [Visual C++ Redistributable for Visual Studio 2015](https://www.microsoft.com/en-us/download/details.aspx?id=48145)
- [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10) (Windows Subsystem for Linux)

## Installation

1. [Install Crystal on the Linux Subsystem on Windows 10](https://crystal-lang.org/install/on_wsl/)
2. Download and execute [crystal-setup-windows-10.exe](https://github.com/faustinoaq/crystal-windows-installer/releases)

![installer](http://i.imgur.com/NJMVrdy.png)

![command](http://i.imgur.com/HonJ4mE.png)

## Release Notes

See [Changelog](https://github.com/faustinoaq/crystal-windows-installer/blob/master/CHANGELOG.md)

## Contributing

- Fork it https://github.com/faustinoaq/crystal-windows-installer/fork
- Create your feature branch git checkout -b my-new-feature
- Commit your changes git commit -am 'Add some feature'
- Push to the branch git push origin my-new-feature
- Create a new Pull Request

## Contributors

- [@faustinoaq](https://github.com/faustinoaq) Faustino Aguilar - creator, maintainer
