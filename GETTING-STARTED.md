# Getting Started

So you just got your brand new Lenovo Legion Go. Here is a guide on what you should do to get the most out of your new device!

## Need more internal storage?

Read more about upgrading the internal SSD [here](GUIDES/UPGRADING-THE-SSD.md).

## Skipping Microsoft account

1. Go to the country selection screen but don't press Next
2. Plug in a keyboard and press SHIFT+F10
3. Type in **_OOBE\\BYPASSNRO_** and it'll reboot.

## Updating drivers

As of Legion Space v1.0.2.7, Lenovo has added the ability to update drivers within Legion Space. You can download Legion Space using the official servers [here](/SOFTWARE.md) (see S3 container section) or [here](https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/legion-series/legion-go-8apu1/downloads/driver-list/component?name=Software+and+Utilities&id=156BE23F-B536-4320-B35C-2F67EBDD9242), the second link is most likely outdated and as of writing is v1.0.2.5. If you wish to follow the old guide, you can visit it [here](/MISC/UPDATES.md).

## Tweaks and setting update frequency

1. Open a Powershell prompt as an Administrator.
2. Type in "irm [christitus.com/win](https://christitus.com/win) | iex"
3. Go to Tweaks and pick Laptop (or any options you want).
4. Apply the tweaks then visit the Updates page.
5. Set the update frequency to "Security".

_(optional) you can set up automatic login if you want_

## Changing VRAM

1. Shut down your Legion Go in Windows.
2. Hold down the Volume Up button.
3. Press the power button (don't hold).
4. Tap "BIOS Setup" on the screeen.
5. Click "More Settings" in the corner.
6. Go to the "Configuration" tab.
7. Select UMA Frame Buffer Size.
8. Set it to the amount of VRAM you want.
9. Tap "Exit" and "Exit Saving Changes".

## Turning off Core Isolation

Some users have reported that turning off Core isolation will give you a performance gain. This will lower your security, but for a device meant for gaming, it should be fine.

1. Search "Core isolation" in the search menu.
2. Turn off "Memory integrity" and reboot.

## Optimizing startup

1. Search "Startup apps" in the search menu.
2. Turn off any apps you don't want.

## Setting OS power mode

1. Open Legion Space (by using the search bar or button).
2. Go to "Settings" (optionally turn off Legion Space startup).
3. Go to "Performance", set the "OS Power Mode" to "Efficiency".

## Setting up Integer Scaling

1. Visit [https://raw.githubusercontent.com/Creaous/Legion-Go-Resources/main/MISC/Scaling.reg](https://raw.githubusercontent.com/Creaous/Legion-Go-Resources/main/MISC/Scaling.reg) in a browser.
2. Press CTRL+S to save the file.
3. Open the file and accept the popup.
4. Reboot your Lenovo Legion Go device.
5. Follow the AMD software guide below.
6. Visit the "Display" under on the "Gaming" tab.
7. Enable "GPU Scaling" and "Integer Scaling".

You can undo that by following 1-3 but use [this](https://raw.githubusercontent.com/Creaous/Legion-Go-Resources/main/MISC/Scaling-Undo.reg) instead of Scaling.reg.

## Installing AMD software

1. Search for "AMD" in your search bar, if not installed, continue.
2. Visit [https://apps.microsoft.com/detail/9NZ1BJQN6BHL](https://apps.microsoft.com/detail/9NZ1BJQN6BHL) in a browser.
3. Accept the popup asking if you want it to open the Microsoft Store.
4. Install the app and wait for it to appear in the start menu.
5. Search for "AMD Settings" in the search bar in your start menu.
6. Ignore the setup that popups and skip it.

(do NOT visit the "Tuning" settings under "Performance" or you'll need to reflash the BIOS)

## Making the audio louder

1. Search for "Realtek Audio Console" and open it, if installed, skip to step 6
2. Visit [https://apps.microsoft.com/detail/9P2B8MCSVPLN](https://apps.microsoft.com/detail/9P2B8MCSVPLN) in a browser.
3. Accept the popup asking if you want it to open the Microsoft Store.
4. Install the app and wait for it to appear in the start menu.
5. Go back to step 1 if it installed successfully.
6. Visit the "Speakers" tab in the left sidebar.
7. Turn all equalizer values up to the maximum.

## Games not working in fullscreen?

This is a common issue that is happening to many owners, this is due to the screen being portrait. To resolve this issue, some people have suggested to use [Magpie or DxWnd](SOFTWARE.md)
