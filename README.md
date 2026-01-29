# VeloxOS Profiles

This repository contains the build profiles and custom configuration
used to build **VeloxOS**.

VeloxOS is an independent Linux distribution built using Manjaro build tools
and integrating the CachyOS kernel and repositories.

## Scope

This repository contains **only VeloxOS-specific content**, including:

- Custom overlays (`custom/shared`, `custom/<desktop>/`)
- Package lists
- Configuration files
- Build-time customizations

No third-party source code, binaries, or repositories are mirrored here.

## Base

- Manjaro build tools (manjaro-tools)
- CachyOS kernel and repositories

VeloxOS is **not affiliated with or endorsed by** Manjaro Linux or CachyOS.

## Directory Layout

The `custom/` directory is part of the Manjaro build profile system and is used
to provide VeloxOS-specific overrides for official profiles (e.g. GNOME).

Despite its generic name, all contents inside `custom/` are specific to VeloxOS.

## License

All original content in this repository is licensed under the MIT License.
Third-party components are distributed under their respective licenses.
