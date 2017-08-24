# Crystal executable on bash on Windows

The goal of this project is to create a Crystal Installer for Windows. Currently Crystal doesn't support Windows, however this installer uses batch files to call Linux binaries avaliables on WSL, inspired by https://github.com/watzon/wsl-proxy.

WSL (Windows Subsystem for Linux) allows you to run Linux inside of Windows 10 without the need for a Virtual Machine.

**This installer doesn't install WSL nor Crystal compiler.**

![installer](http://i.imgur.com/NJMVrdy.png)

It's a batch file that execute `bash -c 'crystal'`, so you need to install [Crystal on WSL](https://crystal-lang.org/docs/installation/on_bash_on_ubuntu_on_windows.html) before run this installer.

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
