```text
.---.
|   |              _..._
|   |            .'     '.
|   |           .   .-.   .
|   |           |  '   '  |            ____     _____
|   |   _    _  |  |   |  |   _    _  `.   \  .'    /
|   |  | '  / | |  |   |  |  | '  / |   `.  `'    .'
|   | .' | .' | |  |   |  | .' | .' |     '.    .'
|   | /  | /  | |  |   |  | /  | /  |     .'     `.
'---'|   `'.  | |  |   |  ||   `'.  |   .'  .'`.   `.
     '   .'|  '/|  |   |  |'   .'|  '/.'   /    `.   `.
      `-'  `--' '--'   '--' `-'  `--''----'       '----'
```

# LUNUX

> A tiny Linux-like operating system with a questionable name and ambitious goals.

[![Language: Assembly](https://img.shields.io/badge/Language-Assembly-blueviolet)](https://en.wikipedia.org/wiki/Assembly_language)  
[![Status: Early Prototype](https://img.shields.io/badge/Status-Early_Prototype-red)](https://github.com/lun3ux/LuneOS)  
[![Architecture: x86 (16-bit/32-bit)](https://img.shields.io/badge/Arch-x86-informational)]()  


LUNUX is a "linux-inspired" operting system.

LUNUX is currently in the very early stages of development. So please set the bar low.

## Current Functionality

At the moment, LUNUX can:

* Print text to the screen

That is currently about it, but every operating system has to start somewhere...

## Planned Features

Some long-term goals include:

* Vitual memory management
* Keyboard input
* Interrupt handling
* A basic cli
* A filesystem
* Programs and user applications

These features are planned and may change as development continues.

## Installation

### Linux
Etch onto USB, I've been using https://etcher.balena.io/. 
### Windows
Windows support is experimental and may require additional setup. However, You can still etch into a USB, I reccomend using https://rufus.ie/en/.


## Building Requirements

The following packages are currently needed to build LUNUX:

* `nasm`
* `build-essential`
* `bison`
* `flex`
* `libgmp3-dev`
* `libmpc-dev`
* `libmpfr-dev`
* `texinfo`
* `libisl-dev`
* `qemu-system`
* `gcc`

> Some packages may not be required for every build. The full list is included because parts of the project may use them while building development tools such as a cross-compiler.

## Building

From the root of the repository, run:

```bash
make iso run
```

This should start LUNUX in QEMU.

## Windows Support

Linux is currently the easiest and most reliable environment for building LUNUX. (ironic, right?)

If you are using Windows:

```text
        ,     \    /      ,
       / \    )\__/(     / \
      /   \  (_\  /_)   /   \
 ____/_____\__\@  @/___/_____\____
|             |\../|              |
|              \VV/               |
|        Here be dragons!         |
|_________________________________|
 |    /\ /      \\       \ /\    |
 |  /   V        ))       V   \  |
|/     `       //        '     \|
 `              V                '
```

Windows support is experimental and may require additional setup, recommended options include:

* **WSL (Windows Subsystem for Linux)** — recommended for most Windows users
* **Cygwin**
* **MinGW/MSYS2**

WSL is likely the simplest option because it provides a real Linux environment while allowing you to continue using Windows.

You can also just go to the **Releases** page and etch into a USB, instead of building from source.

## Project Status

LUNUX is currently an **alpha-stage hobby project**. It is not ready for daily use, and it should not be installed on real hardware unless you understand the risks.

Development is experimental, and things may break without warning.

## Contributing

Contributions, bug reports, ideas, and feedback are welcome.

Since LUNUX is still in its early stages, the project structure and development workflow may change frequently.

---

**LUNUX:** Like Linux, but with more moons and significantly fewer features.

```
```

