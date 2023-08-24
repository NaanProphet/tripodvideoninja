---
layout: single
title: Overclocking the Nintendo Switch for Online Play
subtitle: Minimizing Ban Risk
date:   2023-06-14 10:56:00 Z
categories: misc
---

### To Hack or not to Hack

Toeing the line between performance tuning a jailbroken gaming console and still phoning home online to Nintendo.

I enjoy playing Overcooked on the Nintendo Switch. Unfortunately after realizing how smoother and quicker the game runs on other consoles, I wanted to find a way to bring that same experience to my Switch—and not get banned. Here's how I did it.

*Note: this isn't exactly a post about editing, but it's still related to GPUs and graphics, right?*

### Objectives

1. Overclock the CPU/GPU/Memory so that performance of various games is improved
2. Continue to play online with friends/family
3. Continue to use Nintendo Save Data Cloud
4. Prevent the Switch from getting banned
5. Prevent my Nintendo Online account from getting banned

### Terminology

* RCM = Recovery Mode (of the Tegra chip)
* CFW = Custom Fimware
* eMMC/sysNAND = the internal system memory, terms are loosely used interchangeably
* emuMMC/emuNAND = emulated system memory, terms are loosley used interchangeably
	* This is written to an SD card, since SD card contents are never readable by Nintendo for privacy
* HOS = Horizon, the internal name for the stock Nintendo firmware

### Corollaries

1. The Switch will not be used for game piracy. This immediately lowers ban risk. **䷏ Buy games.**
2. Game cheats/mods (when applied to certain games) can leave their trace behind in save files. When these are seen by Nintendo they can eventually cause a ban.[^6] **䷏ No game cheats or mods** to prevent any accidental pushes.
4. Install CFW to the internal sysNAND to play online. This is to ensure the device always contacts Nintendo's servers with its original signature and serial number. Note: writing CFW to the internal memory by itself does not trigger a ban.[^5] **䷏ Install CFW to the internal sysNAND.**
5. Simply using `sys-clk` to overclock the Switch does not result in bans, even during online play.[^4] **䷏ Overclocking is not a bannable activity.**
5. If an ADDITIONAL emuNAND partition is desired (for cheats/mods), absolutely make sure Nintendo's servers are blocked and never contacted on the emuNAND. Otherwise when Nintendo sees the emulated signature and compares it to the stock signature (assuming the stock Switch has already gone online at least once), it will trigger a ban. **䷏ CFW on an external emuNAND must never, ever contact the internet.**
6. Never mix same gave files from your emuNAND and sysNAND, especially if there are mods/cheats in the emuNAND. This is largely uncharted and full of unnecessary risk. **䷏ Isolate the emuNAND as an completely separate entity with its own save files.**
6. There are two types of bans: device bans and account bans. Unless you cheat online, at worst only the device will be banned but your Nintendo Online account will still be fine. **䷏ Play fair; never cheat online.** (Contradiction: people cheating online <https://projectpokemon.org/home/forums/topic/63032-is-it-possible-to-transfer-your-save-file-from-a-non-hacked-switch-to-a-hacked-one-edit-it-and-then-put-it-back-to-my-non-hacked-switch-safely/>)
7. All guides emphasize the importance of creating an initial backup of the eMMC/sysNAND, but few discuss restoring it. With time, the original backup will age and likely be on older firmware. If you suddenly need to restore the original backup and the firmware versions are different, it is a red flag and Nintendo will trigger a ban.[^3] **䷏ Take regular, frequent backups of the internal eMMC/sysNAND in case the need to restore it ever arises.**
8. NAND backups (and even key backups) are not traceable by Nintendo and pose no ban risk.
8. The Switch's internal device logs are not wiped even during a factory reset. This means if
9. Just don't install homebrew like an app that appears on your home page.

You can turn on automatic save backup on the sysNAND. https://www.reddit.com/r/SwitchPirates/comments/119xzbz/question_about_turning_on_automatic_save_backup/


### Specifics

1. [Hekate](https://github.com/CTCaer/hekate/releases) is the bootloader, and [Atmosphère](https://github.com/Atmosphere-NX/Atmosphere/releases) is the CFW. RCM is used to enter the bootloader, and the bootloder is used to launch the CFW.
2. There are two ways to load Atmosphère from Hekate: (a) the "side-chain"  approach using `payload` or (b) using Hekate's launch configs using `ff0`.[^1][^2] The latter is better because Hekate has specific flags used to force sysNAND vs emuNAND whereas the side-chain approach can accidentally boot into sysNAND.[^5]
3. One of the community recommendations to prevent your device from getting banned is to always remember to launch games WITHOUT cheats/mods by holding the `R` trigger when selecting a game. This seems rather brittle and easy to forget, especially for others sharing the console. Instead, simply omit the cheat module [EdiZon-SE](https://github.com/tomvita/EdiZon-SE) from the SD card, and just to be safe, disable automatic loading of cheats in the `/atmosphere/system_settings.ini` file.[^6]

### Guides

There are few chief resources, sometimes with contradictory instructions/recommendations.

* <https://switch.homebrew.guide>
* <https://rentry.org/SwitchHackingIsEasy>
* <https://nh-server.github.io/switch-guide/>

### Customized Playbook

Since my goals are slightly different than most online guides, here is my own cocktail of instructions.

1. Factory reset the Switch
2. Set it up like normal (connect to WiFi, Nintendo Account, etc.)
3. Connect to the eShop (make sure the console starts unbanned!)
3. DISABLE cloud save
4. DISABLE WiFi
6. Enter RCM
7. On the computer, insert the new SD card and format it as FAT. This works even with 256 GB cards. (https://gamefaqs.gamespot.com/boards/189706-nintendo-switch/77705543 and https://www.reddit.com/r/NintendoSwitch/comments/ekzbdo/exfat_vs_fat_32_whats_safest/). Then copy the contents of `bootloader` onto the root of the SD card.
5. Boot into Hekate using `hekate_ctcaer_6.0.5.bin`
6. Make backups (15 mins). Connect USB storage mode `Tools > USB Tools > SD Card` in Hekate, and copy backup to computer (15 mins). Probably would be faster if plugged directly.
7. While still in USB mode, copy `Lockpick_RCM.bin` (into `bootloader/payloads`. Dump the keys. I got some errors but it still look like it wrote https://gbatemp.net/threads/just-make-a-backup-with-lockpickrcm-for-the-first-time-am-i-missing-something.555308/. (Is my SD card not formatted well?)
6. Format the SD card using Hektate. (This is because it prepares it for performance.[^7])
7. Setup date/time using the touchscreen, woo!
6. Backup eMMC and keys <https://nh-server.github.io/switch-guide/user_guide/sysnand/making_essential_backups/>
8. Boot CFW into sysNAND

<https://gbatemp.net/threads/questions-about-nand-backups-restores-cfw-and-more-on-switch.564944/>

From https://nh-server.github.io/switch-guide/user_guide/sysnand/sd_preparation/: 
https://vps.suchmeme.nl/git/mudkip/Lockpick_RCM/releases

Format the SD card using Hekate automatically backs up the `bootloader` folder only [this is only if the prompt says so. Otherwise it will backup interesting.]. the `switch` and `backups` folder got wiped. Renames it to `SWITCH SD` woo!

Step 2.

Extract these files into the root of your SD card:
hekate_ctcaer_x.x.x_Nyx_x.x.x.zip
atmosphere-x.x.x-master.zip
SigPatches.zip

Step 3.

Place the file named fusee.bin in your /bootloader/payloads/ folder.
Edit `/bootloader/hekate_ipl.ini`

Original
```
[config]
autoboot=0
autoboot_list=0
bootwait=3
backlight=100
noticker=0
autohosoff=0
autonogc=1
updater2p=0
bootprotect=0
```

New (config is unchanged, just add the stuff at the bottom) slightly customized.
```
[CFW (sysNAND)]
payload=bootloader/payloads/fusee.bin
emummc_force_disable=1
icon=bootloader/res/icon_payload.bmp

[Stock]
fss0=atmosphere/package3
stock=1
emummc_force_disable=1
icon=bootloader/res/icon_switch.bmp
```

Skip exosphere, hosts, and sigpatches because sysNAND will be legit.

Ever since Atmosphere 1.0.0, `fusee-primary` and `fusee-secondary` no longer exist. It was rewritten. https://github.com/Atmosphere-NX/Atmosphere/releases/tag/1.0.0
> fusee-primary.bin -> fusee.bin
> fusee-secondary.bin -> package3
> 

WOW huge time saver. MacOS messing with the USB file system preventing atmosphere to boot with apps.

https://gbatemp.net/threads/tesla-the-nintendo-switch-overlay-menu.557362/page-85#post-10176299

> I finally figured it out! After digging around, I found out that the problem was due to macOS using "." to make files invisible. So, the .overlays didn't copy over as intended. This effected Atmosphere not being able to properly recognize the .overlays folder. The solution I came up with was to use Atmosphere's USB File Transfer and create an .overlay folder using Android File Transfer. I then transferred the overlays (olvEdiZon.ovl, ovlmenu.ovl, and ovlSysmodules.ovl) into the newly created .overlays folder, rebooted Atmosphere, and everything worked as it should!

> Here is the link to the thread on GitHub that helped me figure out what was wrong:
https://github.com/WerWolv/Tesla-Menu/issues/62

> Thanks everyone for your patience and help! I hope this is helpful to any Mac users out there who have also run into this issue.


So... download https://www.android.com/filetransfer/ before.

Also, if it is not working quit DROPBOX crazy right. Thanks https://www.reddit.com/r/GooglePixel/comments/z3d4ok/pixel_7_could_not_connect_to_device_error_usb/


Update: seems like RAM overclocking is not possible with sys-clk. Folks mention using OC-Suite instead https://gbatemp.net/threads/ram-overlocking-not-possible-on-fw16.632244/

https://github.com/hanai3Bi/Switch-OC-Suite

If you overclock your sysNAND too much, be aware the RAM on it can corrupt ("binning") and then it kind of dies. https://www.reddit.com/r/SwitchPirates/comments/13j75zs/if_your_struggling_with_totk_performance_then/

> my understanding is that unstable memory clocks can cause Horizon to corrupt itself. An annoyance at best with emuNAND and a brick if you're daft enough to do it on sysNAND. Caveat emptor.

Stock v1 Erista Unpatched
CPU 1020 MHz
GPU 768 MHz
MEM 1600 MHz

OC-Suite Erista Safe Limits
CPU 1785 MHz (75% increase)
GPU 921 MHz (20% increase)
MEM 1862 MHz (16% increase)

EMC aka MEM (embedded memory controller)


NX was the original codename for the Switch, and was first publicly mentioned in March 2015.
And... a Reddit post guessing about its meaning https://www.reddit.com/r/NintendoNX/comments/53zhc7/the_meaning_of_nintendo_nx/



### References
[^1]: <https://www.reddit.com/r/SwitchPirates/comments/tb2r6c/comment/i057znj/?utm_source=share&utm_medium=web2x&context=3>
[^2]: <https://github.com/CTCaer/hekate/blob/master/README.md#boot-entry-keyvalue-combinations>
[^3]: <https://gbatemp.net/threads/restored-emummc-backup-on-sysmmc-without-realizing.609984/page-2#post-9788164>
[^4]: This is a circuitous thread, but the main mic drop regarding using `sys-clk` online is in this post <https://gbatemp.net/threads/anyone-use-sysclk-for-online-gaming.607565/page-2#post-9769783>
[^5]: <https://www.reddit.com/r/SwitchPirates/comments/rqhjek/accidental_boot_in_cfw_on_sysnand/>
[^6]: Change `dmnt_cheats_enabled_by_default = u8!0x1` to `dmnt_cheats_enabled_by_default = u8!0x0` <https://gbatemp.net/threads/edizon-cheats-are-always-active.535104/>
[^7]: See the FAQ of the Hektate release notes <https://github.com/CTCaer/hekate/releases>