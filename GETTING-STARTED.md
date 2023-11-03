#### THIS PAGE IS UNDER CONSTRUCTION
# Getting Started
So you just got your brand new Lenovo Legion Go. Here is a guide on what you should do to get the most out of your new device!

## Need more internal storage?
Read more about upgrading the internal SSD [here](GUIDES/UPGRADING-THE-SSD.md).

## Debloating
While the Legion Go doesn't come with any bloatware (other than the McAfee option in the setup), Windows still has a ton of bloatware you might not want.

### Chris Titus Tech's Windows Utility
The CTT Debloat tool is very useful, it is also open source and the code can be found [here](https://github.com/ChrisTitusTech/winutil).

1. Open Powershell as an Administrator
2. Enter the following command: `irm christitus.com/win | iex`

## Games not working in fullscreen?
This is a common issue that is happening to many owners, this is due to the screen being portrait. To resolve this issue, some people have suggested to use [Magpie or DxWnd](SOFTWARE.md)

## Updating Drivers
As of the 3rd of November 2023, Lenovo has not provided driver updates for the AMD chipset and is still running an update from July. Because of this, you may encounter problems while trying to start games like Starfield.

### AMD Official Drivers (Unlocking AMD Adrenaline)
| [![How To Install NEW Lenovo Legion GO Graphics Drivers](https://img.youtube.com/vi/ALtmBXpxA-M/0.jpg)](https://www.youtube.com/watch?v=ALtmBXpxA-M "How To Install NEW Lenovo Legion GO Graphics Drivers") |
|--------------|
| [How To Install NEW Lenovo Legion GO Graphics Drivers](https://www.youtube.com/watch?v=ALtmBXpxA-M) |

### Lenovo Official Drivers
https://legiongolife.com/legion-go-graphic-drivers-31-0-22011-1008

## Changing VRAM
1. Turn off the Legion Go.
2. While off hold the Volume Up button and Power button at the same time until the NOVA button menu screen appears.
3. Click BIOS Setup
4. Now you should be in the Legion Go BIOS screen, click More Setting at the bottom right of the screen.
5. Now select Configuration, scroll down to UMA Frame Buffer Size.

*source: https://legiongolife.com/legion-go-3gb-vram-heres-how-you-change-it*

## Disabling Core Isolation
As some people have pointed out on the ROG Ally (and now the Legion Go), Core Isolation slows down the handheld devices. It is recommended that you turn off this feature in order to gain a performance boost. Keep in mind that this feature is for your security and turning this off may leave your device vulnerable to attacks, however, that is unlikely on a gaming device like this.

You can see the guide on how to turn it off [here](https://legiongolife.com/improve-legion-go-performance-windows-services)

## Improving Audio
Audio on the Legion Go isn't that good compared to an ROG Ally. While you can't totally improve them since its due to the hardware, you can still fine-tune settings in the **Realtek Audio Console** that comes on your Legion Go.
