### This guide is not complete, in fact, not finished whatsoever. Please check the repository linked in the credits.

# Linux on the Legion Go
Linux on the Legion Go is a work in progress. Don't expect everything to work.

## Disclaimer
Lenovo provides NO warranty for Linux on the Legion Go. They don't guarantee that Linux will be functional. Using Linux is at your own discretion, as the Legion Go device only *officially* supports Windows.

#### This is a community resource, we are not affliated with Lenovo whatsoever.

## "Supported" operating systems
- [ChimeraOS](https://chimeraos.org)
- [Bazzite Deck Edition](https://bazzite.gg)
- [Nobara Deck Edition](https://nobaraproject.org/download-nobara)

## Quirks
- Steam/QAM/Rear buttons - Fixed with [emulation](https://github.com/antheas/hhd).
- Gyro - Fixed with the emulated controller fix above.
- TDP - Works good with [steam-patch](https://github.com/corando98/steam-patch) installed.
- Controller RGB - Works with [LegionGoRemapper](https://github.com/aarron-lee/LegionGoRemapper/).

## Plugins I use
##### Most of these plugins can be found in the Decky store.
- [LegionGoRemapper](https://github.com/aarron-lee/LegionGoRemapper/)
- [EmuDecky](https://github.com/EmuDeck/EmuDecky)
- [CSS Loader](https://deckthemes.com/download/deck)
- [MetaDeck](https://github.com/EmuDeck/MetaDeck)
- [Pause Games](https://github.com/popsUlfr/SDH-PauseGames)
- [ProtonDB Badges](https://github.com/OMGDuke/protondb-decky)
- [Storage Cleaner](https://github.com/mcarlucci/decky-storage-cleaner)
- [HLTB for Deck](https://github.com/hulkrelax/hltb-for-deck)
- [SteamGridDB](https://github.com/SteamGridDB/decky-steamgriddb)
- [AutoFlatpaks](https://github.com/jurassicplayer/decky-autoflatpaks)
- [Decky Cloud Save](https://github.com/GedasFX/decky-cloud-save)
- Bluetooth

## Btrfs for SD Cards
There's a project by Philipp Richter which does this already, you can find it [here](https://gitlab.com/popsulfr/steamos-btrfs). However, I was unable to use it since I don't use an Arch based system on the Legion Go (only on my desktop). To fix this, I created a script that grabs the patches from the above Gitlab repository and then applies them manually. This should work on all kinds of operating systems as long as they have `wget` and `patch` installed.

```bash
curl -sSL https://raw.githubusercontent.com/Creaous/Legion-Go-Resources/main/LINUX/btrfs/patch-for-btrfs.sh | sudo bash
```

## Permissions breaking
After booting into Windows and then back into Steam OS, permissions get messed up due to Windows taking priority over the permissions. To combat this, I have created a script and systemd service that reverts the permissions back to 755 and gives the current user (default: deck) full permissions to the files and directories.

```bash
curl -sSL https://raw.githubusercontent.com/Creaous/Legion-Go-Resources/main/LINUX/perms/fix-permissions.sh | sudo bash
```

## Credit
Most resources are from [here](https://github.com/aarron-lee/legion-go-tricks) or were adapted from [here](https://github.com/aarron-lee/legion-go-tricks).
You can check that guide for up-to-date resources if something isn't working.

#### I created this directory in the guide repository because I wanted to store my own experiences, not all fixes will be provided here.
