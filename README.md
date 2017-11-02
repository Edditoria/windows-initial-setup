# About This Repo

This repo contains some scripts to automate:

- installation of application software and
- do some setup for better experience
- generally useful for household
- after install a new Windows.

If you often install Windows for others and you don't know what exactly s/he needs, you may find this repo useful.

> This repo is not ready to serve. Please stay tune.

# Why This Repo (*Planning*)

- **Simple**: No package manager. No extra stuff to install. Users will not ask you question.
- **Work in Windows XP**: Batch scripts based. No need PowerShell.
- **Portable**: You can install things via a USB drive.
- **Offline**: Once the file sources are ready, it does not eat your Internet bandwidth.

# How This Repo Works

\#todo


# Notice

This is a personal repo that may not meet your need. Please read the codes and modify for your usage.

This repo is setup under the following assumptions:

- **Build for common users**: Carefully select applications. Common users only need a PC that is easy to use with simple UI. Don't let the users getting confused.
- **Have a good Windows installed**: Recommend to install Windows using official source, unless you know what you are doing.
- **Minimal Windows Installation**: Most of things should be done by scripts **after** a simple installation. So, you can customize the system according to the needs of the users.
- **Less Storage**: This repo should consume less storage for USB stick. A 32GB USB has better compatibility on old PCs. It is going to store a lot of OS ISOs and utilities for repair cases.
- **Software licensing**: No matter you install software for personal or business use, you and your users are restricted by the license terms of that software, e.g. distribution (you) and user agreement (user) of Oracle Java Runtime Environment.

# Usage

This repo is still evolving. I call the commands `dirty_download` and `dirty_install`.

By default, it will install all applications in en-US for en-US Windows.

```batch
dirty_download

dirty_install
```

Since I build for Hong Kong users, it can install all applications in zh-HK for zh-HK Windows.

```batch
dirty_download

dirty_install zh-HK
```

# Applications To Install

| App | Language Depends On |
| --- | ------------------- |
| 7-Zip                    | repo recipe |
| Adobe Acrobat Reader DC  | Windows (TBC) |
| Adobe Flash Player NPAPI | Windows |
| CDBurnerXP               | repo recipe |
| Google Chrome            | Windows (TBC) |
| Java Runtime (JRE)       | Windows |
| LibreOffice              | repo recipe |
| VLC Media Player         | repo recipe |

# To-Do

- [ ] More test and fix bugs in `dirty_download` and `dirty_install`
- [ ] Supports zh-TW and zh-CN
- [ ] Supports XP, Vista, 7, 8, 8.1 and 10
- [ ] Auto detect OS and language
