# October ISO

October ISO is the official repository for generating installation ISO files for October Linux.

It works with `archiso` (via `mkarchiso`) so generation is intended to be done on Arch Linux or Arch-based 
systems. The script requires `sudo` and network access.

## Quickstart

To generate a new release ISO with the latest release of the installer, you can run:
```bash
git clone https://github.com/october-os/october-iso.git
cd october-iso
./mkiso.sh release
```

This will fetch the latest installer release and generate a new ISO file in the `latest-release` directory.

## Generating a new ISO

To generate a new ISO, run the script `mkiso.sh`.

- Without arguments, it will create a `build` directory with a development ISO inside. This activates
the virtiofs mount for development and adds the `installer` directory for it.
- With the argument `release`, it fetches the latest installer release and it generates a new ISO in the 
`latest-release` directory with the installer bundled inside. 
This also removes all the development specific things from the ISO.

## Repository structure

### `archiso`

The `archiso` directory is where the ISO profile resides. 

Files in `archiso/installer-profile` are necessary for the configuration of the ISO as well as `airootfs` that 
is considered the root of the ISO.

### `docs/packages`

`docs/packages` is the directory with the official package lists that are used by the installer on top
of the base Arch packages.

- `base.md` are packages in the official package repositories
- `aur.md` are AUR packages.
