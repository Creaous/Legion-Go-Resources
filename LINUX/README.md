# Linux on the Legion Go

Linux on the Legion Go is a work in progress. Don't expect everything to work.
<br/>
This is not an actual guide, just my own personal fixes and suggestions. Please visit [here](https://github.com/aarron-lee/legion-go-tricks).

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

_It seems like this is unnecessary in the new versions of Nobara, however, I'll still keep it here._

There's a project by Philipp Richter which does this already, you can find it [here](https://gitlab.com/popsulfr/steamos-btrfs). However, I was unable to use it since I don't use an Arch based system on the Legion Go (only on my desktop). To fix this, I created a script that grabs the patches from the above Gitlab repository and then applies them manually. This should work on all kinds of operating systems as long as they have `wget` and `patch` installed.

```bash
curl -sSL https://raw.githubusercontent.com/Creaous/Legion-Go-Resources/main/LINUX/btrfs/patch-for-btrfs.sh | sudo bash
```

## Permissions breaking

After booting into Windows and then back into Steam OS, permissions get messed up due to Windows taking priority over the permissions. To combat this, I have created a script and systemd service that reverts the permissions back to 755 and gives the current user (default: deck) full permissions to the files and directories.

```bash
curl -sSL https://raw.githubusercontent.com/Creaous/Legion-Go-Resources/main/LINUX/perms/fix-permissions.sh | sudo bash
```
