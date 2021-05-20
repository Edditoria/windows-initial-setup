# About Windows-Initial-Setup

This repo contains some scripts to automate:

- installation of application software and
- do some setup for better experience
- generally useful for household
- after install a new Windows.

If you often install Windows for others and you don't know what exactly s/he needs, you may find this repo useful.

> :warning: **Default branch is now "main" instead of "master"**:
>
> Reasons are simple:
>
> - I change it not because of political correctness about black or white.
> - I'm complaining the **slavery policies on Hong Kongers enforced by CCP**.
> - GitHub and GitLab had set "main" as default branch in all new projects. Change it earlier is better than later.
> - The word "main" is just a better name. The default branch doesn't master on anything.
>
> The "master" branch will keep for some days for your convenience. Please adapt this change in your local repo. Thanks! :pray:


## Usage

Currently there are 2 main commands: `download` and `install`.

1. Download the zip file ([link][zip-link]) and extract it into a folder
1. Close all applications including Microsoft Edge and Internet Explorer
1. Open command prompt with "Run as administrator"
1. Assuming you download and extract the files in Downloads folder, do:

	```
	cd %userprofile%\Downloads\windows-initial-setup-1.0.10\
	```

1. Download all files, no matter which language:

	```
	download
	```

1. Install all applications and settings:

	```
	install [lang]
	```

	- `[lang]` is the language code represents the language of the Windows OS
	- For English, type `install en-US`
	- For Hong Kong, type `install zh-HK`
	- If you only run `install`, it will assume you to `install en-US`


## Applications To Install

| App | Language Depends On | x86-32/-64 | Download Version |
| --- | ------------------- | ---------- | ---------------- |
| 7-Zip                    | repo recipe | x64  | specified |
| Adobe Acrobat Reader DC  | Windows     | x86  | specified |
| Adobe Flash Player NPAPI | Windows     | x86  | latest    |
| CDBurnerXP               | repo recipe | x86  | specified |
| Google Chrome            | Windows     | x64  | latest    |
| Java Runtime (JRE)       | Windows     | both | specified |
| LibreOffice              | repo recipe | x86  | specified |
| VLC Media Player         | repo recipe | x64  | specified |


## Why This Repo

- **Simple**: No package manager. No extra stuff to install. Users will not ask you question.
- ~~**Work in Windows XP**~~ (in future release): Batch scripts based. No need PowerShell.
- **Portable**: You can install things via a USB drive.
- **Offline**: Once the file sources are ready, it does not eat your Internet bandwidth.


## Important Notice

:warning: Currently, it **only work on Windows 10 64-bit**.

This repo works under the following conditions:

- The internet connection has to stable
- Each download only last for 30 minutes. No further notice or warning in current version
- You manually check each installation file are downloaded completely.
	- Probably work if Windows Explorer can display their icons
	- Better if you can validate their file checksum (Planned to automate this)
- Make sure that no program is running before you do `install`
	- Better to reboot the system before you do `install`


This repo is designed under the following assumptions:

- **Design for PC builders who serve common users**: Carefully select applications. Common users only need a PC that is easy to use with simple UI. Don't let the users getting confused.
- **Have a good Windows installed**: Recommend to install Windows using official source, unless you know what you are doing.
- **Minimal Windows Installation**: Most of things should be done by scripts **after** a simple installation. So, you can customize the system according to the needs of the users.
- **Less Storage**: This repo should consume less storage for USB stick. A 32GB USB has better compatibility on old PCs. It is going to store a lot of OS ISOs and utilities for repair cases.
- **Software licensing**: No matter you install software for personal or business use, you and your users are restricted by the license terms of that software, e.g. distribution (you) and user agreement (user) of Oracle Java Runtime Environment.


## To-Do

- [ ] For `download` and `install`, check more for safety before running the core parts
- [ ] Supports zh-TW and zh-CN
- [ ] Supports XP, Vista, 7, 8, 8.1 and 10
- [ ] Documentations about what this repo does and what it doesn't
- [ ] Auto detect OS, architecture and language


## Copyrights and Licenses

Copyright (c) Edditoria. All rights reserved. Code released under the [MIT License](LICENSE.txt). Docs released under [Creative Commons](https://creativecommons.org/licenses/by/4.0/).

As human-readable summary (but not a substitute for the license):

You can use it, share it, modify the code and distribute your work for private and commercial uses. If you like, please share your work to me. :pizza:

Thanks to awesome developers. This project uses some third-party codes and binaries, which have their own licenses:

- **Curl** by Daniel Stenberg and all contributors :beer: [homepage](https://curl.haxx.se/) :beer: [MIT/X derivate license](https://curl.haxx.se/docs/copyright.html)
- **Curl for Windows** by Viktor Szakáts :beer: [homepage](https://github.com/curl/curl-for-win) :beer: [MIT license](https://github.com/curl/curl-for-win/blob/master/LICENSE.md)

I do not own any trademark and copyright of the application software, for example, Adobe, Google, Flash, JRE, etc. Please carefully read their user and distribution terms and agreements, and consult your lawyer especially if you are an OEM builder.


[this-repo]: https://github.com/Edditoria/windows-initial-setup/
[zip-link]: https://github.com/Edditoria/windows-initial-setup/releases/latest
