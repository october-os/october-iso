# October Linux ISO

October ISO is the official repository for generating installation ISO files for October Linux.

It works with `archiso` so the generation can only be done on an Arch Linux or Arch based OS.

## Quickstart

To generate a new release ISO with the latest release of the installer, you can run:
```bash
git clone https://github.com/october-os/october-iso.git
cd october-iso
./mkiso.sh release
```

This will generate a new ISO file in the `latest-release` directory.

## Generating a new ISO

To generate a new ISO, the script `mkiso.sh` needs to be ran.

If it is ran without arguments, it will create a `build` directory with a development ISO inside.

With the argument `release`, it will generate a new ISO in the `latest-release` directory.

## Repository structure

### `archiso`

The `archiso` directory is where the ISO profile resides. All the files in `archiso/installer-profile` will
be added to the ISO during the build. `archiso/installer-profile/airootfs` is considered the root of the ISO.

### `docs/packages`

`docs/packages` is the directory with the official packages list that are added on top of the core Arch
installation. 
- `base.md` are packages in the official package repositories
- `aur.md` are AUR packages.
