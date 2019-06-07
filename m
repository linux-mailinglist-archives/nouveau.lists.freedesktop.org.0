Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D085395DE
	for <lists+nouveau@lfdr.de>; Fri,  7 Jun 2019 21:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120BC89EBD;
	Fri,  7 Jun 2019 19:37:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 94F0189F03
 for <nouveau@lists.freedesktop.org>; Fri,  7 Jun 2019 19:37:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 912E072167; Fri,  7 Jun 2019 19:37:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 07 Jun 2019 19:37:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: brian@interlinx.bc.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-100567-8800-HVYvKPuuIO@http.bugs.freedesktop.org/>
In-Reply-To: <bug-100567-8800@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1038789075=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1038789075==
Content-Type: multipart/alternative; boundary="15599362543.b54c85Fc.17075"
Content-Transfer-Encoding: 7bit


--15599362543.b54c85Fc.17075
Date: Fri, 7 Jun 2019 19:37:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #33 from Brian J. Murrell <brian@interlinx.bc.ca> ---
Seems I just hit this also on Fedora 30:

[714357.060052] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[714357.060066] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recove=
ry
[714357.060078] nouveau 0000:01:00.0: fifo: channel 12: killed
[714357.060097] nouveau 0000:01:00.0: fifo: engine 5: scheduled for recovery
[714357.060101] nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
[714357.060582] nouveau 0000:01:00.0: Xorg[9580]: channel 12 killed!

# uname -r
5.0.17-300.fc30.x86_64

# cat /home/brian/.local/share/xorg/Xorg.0.log
[  1090.508] (--) Log file renamed from
"/home/brian/.local/share/xorg/Xorg.pid-9580.log" to
"/home/brian/.local/share/xorg/Xorg.0.log"
[  1090.509]=20
X.Org X Server 1.20.4
X Protocol Version 11, Revision 0
[  1090.509] Build Operating System:  4.20.13-200.fc29.x86_64=20
[  1090.509] Current Operating System: Linux bmurrell-mobl.amr.corp.intel.c=
om
5.0.17-300.fc30.x86_64 #1 SMP Mon May 20 15:36:26 UTC 2019 x86_64
[  1090.509] Kernel command line:
BOOT_IMAGE=3D(hd0,gpt2)/vmlinuz-5.0.17-300.fc30.x86_64
root=3D/dev/mapper/fedora_rootvol-fedora_root ro
resume=3D/dev/mapper/fedora_rootvol-swap rd.lvm.lv=3Dfedora_rootvol/fedora_=
root
rd.luks.uuid=3Dluks-8737d036-edd5-4ffd-9922-35785f0d199d
rd.lvm.lv=3Dfedora_rootvol/swap rd.lvm.lv=3Dfedora_rootvol/fedora_usr
libata.allow_tpm=3D1 rhgb
[  1090.509] Build Date: 29 March 2019  05:04:12AM
[  1090.509] Build ID: xorg-x11-server 1.20.4-3.fc30=20
[  1090.509] Current version of pixman: 0.38.0
[  1090.509]    Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
[  1090.509] Markers: (--) probed, (**) from config file, (=3D=3D) default =
setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[  1090.510] (=3D=3D) Log file: "/home/brian/.local/share/xorg/Xorg.0.log",=
 Time:
Thu May 30 09:17:11 2019
[  1090.510] (=3D=3D) Using config directory: "/etc/X11/xorg.conf.d"
[  1090.510] (=3D=3D) Using system config directory "/usr/share/X11/xorg.co=
nf.d"
[  1090.511] (=3D=3D) No Layout section.  Using the first Screen section.
[  1090.511] (=3D=3D) No screen section available. Using defaults.
[  1090.511] (**) |-->Screen "Default Screen Section" (0)
[  1090.511] (**) |   |-->Monitor "<default monitor>"
[  1090.512] (=3D=3D) No monitor specified for screen "Default Screen Secti=
on".
        Using a default monitor configuration.
[  1090.512] (=3D=3D) Automatically adding devices
[  1090.512] (=3D=3D) Automatically enabling devices
[  1090.512] (=3D=3D) Automatically adding GPU devices
[  1090.512] (=3D=3D) Automatically binding GPU devices
[  1090.513] (=3D=3D) Max clients allowed: 256, resource mask: 0x1fffff
[  1090.513] (=3D=3D) FontPath set to:
        catalogue:/etc/X11/fontpath.d,
        built-ins
[  1090.513] (=3D=3D) ModulePath set to "/usr/lib64/xorg/modules"
[  1090.513] (II) The server relies on udev to provide the list of input
devices.
        If no devices become available, reconfigure udev or disable
AutoAddDevices.
[  1090.513] (II) Loader magic: 0x561ee52f6e00
[  1090.513] (II) Module ABI versions:
[  1090.513]    X.Org ANSI C Emulation: 0.4
[  1090.513]    X.Org Video Driver: 24.0
[  1090.513]    X.Org XInput driver : 24.1
[  1090.513]    X.Org Server Extension : 10.0
[  1090.513] (++) using VT number 2

[  1090.514] (II) systemd-logind: took control of session
/org/freedesktop/login1/session/_39
[  1090.515] (II) xfree86: Adding drm device (/dev/dri/card0)
[  1090.516] (II) systemd-logind: got fd for /dev/dri/card0 226:0 fd 14 pau=
sed
0
[  1090.518] (--) PCI:*(1@0:0:0) 10de:13b6:103c:8277 rev 162, Mem @
0xe3000000/16777216, 0xa0000000/268435456, 0xb0000000/33554432, I/O @
0x00005000/128, BIOS @ 0x????????/65536
[  1090.519] (II) LoadModule: "glx"
[  1090.519] (II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
[  1090.520] (II) Module glx: vendor=3D"X.Org Foundation"
[  1090.520]    compiled for 1.20.4, module version =3D 1.0.0
[  1090.520]    ABI class: X.Org Server Extension, version 10.0
[  1090.636] (=3D=3D) Matched modesetting as autoconfigured driver 0
[  1090.636] (=3D=3D) Matched fbdev as autoconfigured driver 1
[  1090.636] (=3D=3D) Matched vesa as autoconfigured driver 2
[  1090.636] (=3D=3D) Assigned the driver to the xf86ConfigLayout
[  1090.636] (II) LoadModule: "modesetting"
[  1090.636] (II) Loading /usr/lib64/xorg/modules/drivers/modesetting_drv.so
[  1090.636] (II) Module modesetting: vendor=3D"X.Org Foundation"
[  1090.636]    compiled for 1.20.4, module version =3D 1.20.4
[  1090.636]    Module class: X.Org Video Driver
[  1090.636]    ABI class: X.Org Video Driver, version 24.0
[  1090.636] (II) LoadModule: "fbdev"
[  1090.636] (II) Loading /usr/lib64/xorg/modules/drivers/fbdev_drv.so
[  1090.636] (II) Module fbdev: vendor=3D"X.Org Foundation"
[  1090.636]    compiled for 1.20.3, module version =3D 0.5.0
[  1090.636]    Module class: X.Org Video Driver
[  1090.636]    ABI class: X.Org Video Driver, version 24.0
[  1090.636] (II) LoadModule: "vesa"
[  1090.636] (II) Loading /usr/lib64/xorg/modules/drivers/vesa_drv.so
[  1090.637] (II) Module vesa: vendor=3D"X.Org Foundation"
[  1090.637]    compiled for 1.20.4, module version =3D 2.4.0
[  1090.637]    Module class: X.Org Video Driver
[  1090.637]    ABI class: X.Org Video Driver, version 24.0
[  1090.637] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[  1090.637] (II) FBDEV: driver for framebuffer: fbdev
[  1090.637] (II) VESA: driver for VESA chipsets: vesa
[  1090.637] xf86EnableIOPorts: failed to set IOPL for I/O (Operation not
permitted)
[  1090.637] (II) modeset(0): using drv /dev/dri/card0
[  1090.637] (WW) Falling back to old probe method for fbdev
[  1090.637] (II) Loading sub module "fbdevhw"
[  1090.637] (II) LoadModule: "fbdevhw"
[  1090.637] (II) Loading /usr/lib64/xorg/modules/libfbdevhw.so
[  1090.637] (II) Module fbdevhw: vendor=3D"X.Org Foundation"
[  1090.637]    compiled for 1.20.4, module version =3D 0.0.2
[  1090.637]    ABI class: X.Org Video Driver, version 24.0
[  1090.637] (EE) open /dev/fb0: Permission denied
[  1090.637] (WW) VGA arbiter: cannot open kernel arbiter, no multi-card
support
[  1090.637] (II) modeset(0): Creating default Display subsection in Screen
section
        "Default Screen Section" for depth/fbbpp 24/32
[  1090.637] (=3D=3D) modeset(0): Depth 24, (=3D=3D) framebuffer bpp 32
[  1090.637] (=3D=3D) modeset(0): RGB weight 888
[  1090.637] (=3D=3D) modeset(0): Default visual is TrueColor
[  1090.637] (II) Loading sub module "glamoregl"
[  1090.637] (II) LoadModule: "glamoregl"
[  1090.638] (II) Loading /usr/lib64/xorg/modules/libglamoregl.so
[  1090.642] (II) Module glamoregl: vendor=3D"X.Org Foundation"
[  1090.642]    compiled for 1.20.4, module version =3D 1.0.1
[  1090.642]    ABI class: X.Org ANSI C Emulation, version 0.4
[  1090.719] (II) modeset(0): glamor X acceleration enabled on NV117
[  1090.719] (II) modeset(0): glamor initialized
[  1090.751] (II) modeset(0): Output DP-1 has no monitor section
[  1090.783] (II) modeset(0): Output DP-2 has no monitor section
[  1090.815] (II) modeset(0): Output DP-3 has no monitor section
[  1090.836] (II) modeset(0): Output eDP-1 has no monitor section
[  1090.869] (II) modeset(0): EDID for output DP-1
[  1090.901] (II) modeset(0): EDID for output DP-2
[  1090.933] (II) modeset(0): EDID for output DP-3
[  1090.954] (II) modeset(0): EDID for output eDP-1
[  1090.954] (II) modeset(0): Manufacturer: LGD  Model: 57e  Serial#: 0
[  1090.954] (II) modeset(0): Year: 2016  Week: 0
[  1090.954] (II) modeset(0): EDID Version: 1.4
[  1090.954] (II) modeset(0): Digital Display Input
[  1090.954] (II) modeset(0): 6 bits per channel
[  1090.954] (II) modeset(0): Digital interface is DisplayPort
[  1090.954] (II) modeset(0): Max Image Size [cm]: horiz.: 34  vert.: 19
[  1090.954] (II) modeset(0): Gamma: 2.20
[  1090.954] (II) modeset(0): DPMS capabilities: StandBy Suspend Off
[  1090.955] (II) modeset(0): Supported color encodings: RGB 4:4:4 YCrCb 4:=
4:4=20
[  1090.955] (II) modeset(0): First detailed timing is preferred mode
[  1090.955] (II) modeset(0): Preferred mode is native pixel format and ref=
resh
rate
[  1090.955] (II) modeset(0): redX: 0.640 redY: 0.345   greenX: 0.335 green=
Y:
0.625
[  1090.955] (II) modeset(0): blueX: 0.150 blueY: 0.052   whiteX: 0.313 whi=
teY:
0.329
[  1090.955] (II) modeset(0): Manufacturer's mask: 0
[  1090.955] (II) modeset(0): Supported detailed timing:
[  1090.955] (II) modeset(0): clock: 138.7 MHz   Image Size:  344 x 194 mm
[  1090.955] (II) modeset(0): h_active: 1920  h_sync: 1968  h_sync_end 2000
h_blank_end 2080 h_border: 0
[  1090.955] (II) modeset(0): v_active: 1080  v_sync: 1083  v_sync_end 1088
v_blanking: 1111 v_border: 0
[  1090.955] (II) modeset(0): Supported detailed timing:
[  1090.955] (II) modeset(0): clock: 138.7 MHz   Image Size:  344 x 194 mm
[  1090.955] (II) modeset(0): h_active: 1920  h_sync: 1968  h_sync_end 2000
h_blank_end 2080 h_border: 0
[  1090.955] (II) modeset(0): v_active: 1080  v_sync: 1083  v_sync_end 1088
v_blanking: 1111 v_border: 0
[  1090.955] (II) modeset(0): Unknown vendor-specific block 2
[  1090.955] (II) modeset(0): EDID (in hex):
[  1090.955] (II) modeset(0):   00ffffffffffff0030e47e0500000000
[  1090.955] (II) modeset(0):   001a010495221378eadc95a35855a026
[  1090.955] (II) modeset(0):   0d505400000001010101010101010101
[  1090.955] (II) modeset(0):   0101010101012e3680a070381f403020
[  1090.955] (II) modeset(0):   350058c21000001a2e3680a070381f40
[  1090.955] (II) modeset(0):   3020350058c21000001a000000000000
[  1090.955] (II) modeset(0):   00000000000000000000000000000002
[  1090.955] (II) modeset(0):   000833ff0a3c961e163696000000001c
[  1090.955] (II) modeset(0): Printing probed modes for output eDP-1
[  1090.955] (II) modeset(0): Modeline "1920x1080"x60.0  138.70  1920 1968 =
2000
2080  1080 1083 1088 1111 +hsync -vsync (66.7 kHz eP)
[  1090.955] (II) modeset(0): Modeline "1920x1080"x120.0  356.38  1920 2080
2288 2656  1080 1081 1084 1118 doublescan -hsync +vsync (134.2 kHz d)
[  1090.955] (II) modeset(0): Modeline "1920x1080"x119.9  266.50  1920 1944
1960 2000  1080 1081 1084 1111 doublescan +hsync -vsync (133.2 kHz d)
[  1090.955] (II) modeset(0): Modeline "1920x1080"x60.0  173.00  1920 2048 =
2248
2576  1080 1083 1088 1120 -hsync +vsync (67.2 kHz d)
[  1090.955] (II) modeset(0): Modeline "1920x1080"x59.9  138.50  1920 1968 =
2000
2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz d)
[  1090.955] (II) modeset(0): Modeline "1680x1050"x60.0  146.36  1680 1784 =
1960
2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[  1090.955] (II) modeset(0): Modeline "1680x1050"x60.0  146.25  1680 1784 =
1960
2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz d)
[  1090.955] (II) modeset(0): Modeline "1680x1050"x59.9  119.00  1680 1728 =
1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz d)
[  1090.955] (II) modeset(0): Modeline "1400x1050"x60.0  122.00  1400 1488 =
1640
1880  1050 1052 1064 1082 +hsync +vsync (64.9 kHz d)
[  1090.955] (II) modeset(0): Modeline "1400x1050"x60.0  121.79  1400 1488 =
1632
1864  1050 1053 1057 1089 -hsync +vsync (65.3 kHz)
[  1090.955] (II) modeset(0): Modeline "1600x900"x120.0  246.00  1600 1728 =
1900
2200  900 901 904 932 doublescan -hsync +vsync (111.8 kHz d)
[  1090.955] (II) modeset(0): Modeline "1600x900"x119.9  186.50  1600 1624 =
1640
1680  900 901 904 926 doublescan +hsync -vsync (111.0 kHz d)
[  1090.955] (II) modeset(0): Modeline "1600x900"x59.9  118.25  1600 1696 1=
856
2112  900 903 908 934 -hsync +vsync (56.0 kHz d)
[  1090.955] (II) modeset(0): Modeline "1600x900"x59.8   97.50  1600 1648 1=
680
1760  900 903 908 926 +hsync -vsync (55.4 kHz d)
[  1090.955] (II) modeset(0): Modeline "1280x1024"x59.9  109.10  1280 1368 =
1496
1712  1024 1027 1034 1063 -hsync +vsync (63.7 kHz)
[  1090.955] (II) modeset(0): Modeline "1280x1024"x60.0  108.00  1280 1328 =
1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz d)
[  1090.955] (II) modeset(0): Modeline "1400x900"x60.0  103.50  1400 1480 1=
624
1848  900 903 913 934 -hsync +vsync (56.0 kHz d)
[  1090.955] (II) modeset(0): Modeline "1400x900"x59.9   86.50  1400 1448 1=
480
1560  900 903 913 926 +hsync -vsync (55.4 kHz d)
[  1090.955] (II) modeset(0): Modeline "1280x960"x60.0  108.00  1280 1376 1=
488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz d)
[  1090.955] (II) modeset(0): Modeline "1280x960"x60.0  101.34  1280 1360 1=
488
1696  960 963 967 996 -hsync +vsync (59.8 kHz)
[  1090.955] (II) modeset(0): Modeline "1440x810"x120.0  198.12  1440 1548 =
1704
1968  810 811 814 839 doublescan -hsync +vsync (100.7 kHz d)
[  1090.955] (II) modeset(0): Modeline "1440x810"x119.9  151.88  1440 1464 =
1480
1520  810 811 814 833 doublescan +hsync -vsync (99.9 kHz d)
[  1090.955] (II) modeset(0): Modeline "1368x768"x59.9   85.25  1368 1440 1=
576
1784  768 771 781 798 -hsync +vsync (47.8 kHz d)
[  1090.955] (II) modeset(0): Modeline "1368x768"x59.9   72.25  1368 1416 1=
448
1528  768 771 781 790 +hsync -vsync (47.3 kHz d)
[  1090.955] (II) modeset(0): Modeline "1280x800"x120.0  174.25  1280 1380 =
1516
1752  800 801 804 829 doublescan -hsync +vsync (99.5 kHz d)
[  1090.955] (II) modeset(0): Modeline "1280x800"x119.9  134.25  1280 1304 =
1320
1360  800 801 804 823 doublescan +hsync -vsync (98.7 kHz d)
[  1090.955] (II) modeset(0): Modeline "1280x800"x59.8   83.50  1280 1352 1=
480
1680  800 803 809 831 -hsync +vsync (49.7 kHz d)
[  1090.955] (II) modeset(0): Modeline "1280x800"x59.9   71.00  1280 1328 1=
360
1440  800 803 809 823 +hsync -vsync (49.3 kHz d)
[  1090.955] (II) modeset(0): Modeline "1152x864"x60.0   81.77  1152 1216 1=
336
1520  864 867 871 897 -hsync +vsync (53.8 kHz)
[  1090.955] (II) modeset(0): Modeline "1280x720"x120.0  156.12  1280 1376 =
1512
1744  720 721 724 746 doublescan -hsync +vsync (89.5 kHz d)
[  1090.955] (II) modeset(0): Modeline "1280x720"x120.0  120.75  1280 1304 =
1320
1360  720 721 724 740 doublescan +hsync -vsync (88.8 kHz d)
[  1090.955] (II) modeset(0): Modeline "1280x720"x59.9   74.50  1280 1344 1=
472
1664  720 723 728 748 -hsync +vsync (44.8 kHz d)
[  1090.955] (II) modeset(0): Modeline "1280x720"x59.7   63.75  1280 1328 1=
360
1440  720 723 728 741 +hsync -vsync (44.3 kHz d)
[  1090.955] (II) modeset(0): Modeline "1024x768"x120.1  133.47  1024 1100 =
1212
1400  768 768 770 794 doublescan -hsync +vsync (95.3 kHz d)
[  1090.955] (II) modeset(0): Modeline "1024x768"x60.0   65.00  1024 1048 1=
184
1344  768 771 777 806 -hsync -vsync (48.4 kHz d)
[  1090.955] (II) modeset(0): Modeline "1024x768"x59.9   63.53  1024 1072 1=
176
1328  768 771 775 798 -hsync +vsync (47.8 kHz)
[  1090.956] (II) modeset(0): Modeline "960x720"x120.0  117.00  960 1024 11=
28
1300  720 720 722 750 doublescan -hsync +vsync (90.0 kHz d)
[  1090.956] (II) modeset(0): Modeline "928x696"x120.1  109.15  928 976 1088
1264  696 696 698 719 doublescan -hsync +vsync (86.4 kHz d)
[  1090.956] (II) modeset(0): Modeline "896x672"x120.0  102.40  896 960 1060
1224  672 672 674 697 doublescan -hsync +vsync (83.7 kHz d)
[  1090.956] (II) modeset(0): Modeline "1024x576"x119.9   98.50  1024 1092 =
1200
1376  576 577 580 597 doublescan -hsync +vsync (71.6 kHz d)
[  1090.956] (II) modeset(0): Modeline "1024x576"x119.9   78.38  1024 1048 =
1064
1104  576 577 580 592 doublescan +hsync -vsync (71.0 kHz d)
[  1090.956] (II) modeset(0): Modeline "1024x576"x59.9   46.50  1024 1064 1=
160
1296  576 579 584 599 -hsync +vsync (35.9 kHz d)
[  1090.956] (II) modeset(0): Modeline "1024x576"x59.8   42.00  1024 1072 1=
104
1184  576 579 584 593 +hsync -vsync (35.5 kHz d)
[  1090.956] (II) modeset(0): Modeline "960x600"x119.9   96.62  960 1028 11=
28
1296  600 601 604 622 doublescan -hsync +vsync (74.6 kHz d)
[  1090.956] (II) modeset(0): Modeline "960x600"x120.0   77.00  960 984 1000
1040  600 601 604 617 doublescan +hsync -vsync (74.0 kHz d)
[  1090.956] (II) modeset(0): Modeline "960x540"x119.9   86.50  960 1024 11=
24
1288  540 541 544 560 doublescan -hsync +vsync (67.2 kHz d)
[  1090.956] (II) modeset(0): Modeline "960x540"x120.0   69.25  960 984 1000
1040  540 541 544 555 doublescan +hsync -vsync (66.6 kHz d)
[  1090.956] (II) modeset(0): Modeline "960x540"x59.6   40.75  960 992 1088
1216  540 543 548 562 -hsync +vsync (33.5 kHz d)
[  1090.956] (II) modeset(0): Modeline "960x540"x59.8   37.25  960 1008 1040
1120  540 543 548 556 +hsync -vsync (33.3 kHz d)
[  1090.956] (II) modeset(0): Modeline "800x600"x120.0   81.00  800 832 928
1080  600 600 602 625 doublescan +hsync +vsync (75.0 kHz d)
[  1090.956] (II) modeset(0): Modeline "800x600"x60.3   40.00  800 840 968 =
1056
 600 601 605 628 +hsync +vsync (37.9 kHz d)
[  1090.956] (II) modeset(0): Modeline "800x600"x60.0   38.31  800 832 912 =
1024
 600 603 607 624 -hsync +vsync (37.4 kHz)
[  1090.956] (II) modeset(0): Modeline "800x600"x56.2   36.00  800 824 896 =
1024
 600 601 603 625 +hsync +vsync (35.2 kHz d)
[  1090.956] (II) modeset(0): Modeline "840x525"x120.0   73.12  840 892 980
1120  525 526 529 544 doublescan -hsync +vsync (65.3 kHz d)
[  1090.956] (II) modeset(0): Modeline "840x525"x119.8   59.50  840 864 880=
 920
 525 526 529 540 doublescan +hsync -vsync (64.7 kHz d)
[  1090.956] (II) modeset(0): Modeline "864x486"x59.9   32.50  864 888 968 =
1072
 486 489 494 506 -hsync +vsync (30.3 kHz d)
[  1090.956] (II) modeset(0): Modeline "864x486"x59.6   30.50  864 912 944 =
1024
 486 489 494 500 +hsync -vsync (29.8 kHz d)
[  1090.956] (II) modeset(0): Modeline "700x525"x120.0   61.00  700 744 820=
 940
 525 526 532 541 doublescan +hsync +vsync (64.9 kHz d)
[  1090.956] (II) modeset(0): Modeline "800x450"x119.9   59.12  800 848 928
1056  450 451 454 467 doublescan -hsync +vsync (56.0 kHz d)
[  1090.956] (II) modeset(0): Modeline "800x450"x119.6   48.75  800 824 840=
 880
 450 451 454 463 doublescan +hsync -vsync (55.4 kHz d)
[  1090.956] (II) modeset(0): Modeline "640x512"x120.0   54.00  640 664 720=
 844
 512 512 514 533 doublescan +hsync +vsync (64.0 kHz d)
[  1090.956] (II) modeset(0): Modeline "700x450"x119.9   51.75  700 740 812=
 924
 450 451 456 467 doublescan -hsync +vsync (56.0 kHz d)
[  1090.956] (II) modeset(0): Modeline "700x450"x119.8   43.25  700 724 740=
 780
 450 451 456 463 doublescan +hsync -vsync (55.4 kHz d)
[  1090.956] (II) modeset(0): Modeline "640x480"x120.0   54.00  640 688 744=
 900
 480 480 482 500 doublescan +hsync +vsync (60.0 kHz d)
[  1090.956] (II) modeset(0): Modeline "640x480"x59.9   25.18  640 656 752 =
800=20
480 490 492 525 -hsync -vsync (31.5 kHz d)
[  1090.956] (II) modeset(0): Modeline "640x480"x59.9   23.98  640 664 720 =
800=20
480 483 487 500 -hsync +vsync (30.0 kHz)
[  1090.956] (II) modeset(0): Modeline "720x405"x59.5   22.50  720 744 808 =
896=20
405 408 413 422 -hsync +vsync (25.1 kHz d)
[  1090.956] (II) modeset(0): Modeline "720x405"x59.0   21.75  720 768 800 =
880=20
405 408 413 419 +hsync -vsync (24.7 kHz d)
[  1090.956] (II) modeset(0): Modeline "720x400"x60.0   22.41  720 744 808 =
896=20
400 403 413 417 -hsync +vsync (25.0 kHz)
[  1090.956] (II) modeset(0): Modeline "684x384"x119.8   42.62  684 720 788=
 892
 384 385 390 399 doublescan -hsync +vsync (47.8 kHz d)
[  1090.956] (II) modeset(0): Modeline "684x384"x119.7   36.12  684 708 724=
 764
 384 385 390 395 doublescan +hsync -vsync (47.3 kHz d)
[  1090.956] (II) modeset(0): Modeline "640x400"x119.8   41.75  640 676 740=
 840
 400 401 404 415 doublescan -hsync +vsync (49.7 kHz d)
[  1090.956] (II) modeset(0): Modeline "640x400"x120.0   35.50  640 664 680=
 720
 400 401 404 411 doublescan +hsync -vsync (49.3 kHz d)
[  1090.956] (II) modeset(0): Modeline "640x400"x60.0   20.00  640 664 720 =
800=20
400 403 409 417 -hsync +vsync (25.0 kHz)
[  1090.956] (II) modeset(0): Modeline "640x360"x119.7   37.25  640 672 736=
 832
 360 361 364 374 doublescan -hsync +vsync (44.8 kHz d)
[  1090.956] (II) modeset(0): Modeline "640x360"x119.7   31.88  640 664 680=
 720
 360 361 364 370 doublescan +hsync -vsync (44.3 kHz d)
[  1090.956] (II) modeset(0): Modeline "640x360"x59.8   18.00  640 664 720 =
800=20
360 363 368 376 -hsync +vsync (22.5 kHz d)
[  1090.956] (II) modeset(0): Modeline "640x360"x59.3   17.75  640 688 720 =
800=20
360 363 368 374 +hsync -vsync (22.2 kHz d)
[  1090.956] (II) modeset(0): Modeline "640x350"x59.8   17.52  640 664 720 =
800=20
350 353 363 366 -hsync +vsync (21.9 kHz)
[  1090.956] (II) modeset(0): Modeline "512x384"x120.0   32.50  512 524 592=
 672
 384 385 388 403 doublescan -hsync -vsync (48.4 kHz d)
[  1090.956] (II) modeset(0): Modeline "512x288"x120.0   23.25  512 532 580=
 648
 288 289 292 299 doublescan -hsync +vsync (35.9 kHz d)
[  1090.956] (II) modeset(0): Modeline "512x288"x119.8   21.00  512 536 552=
 592
 288 289 292 296 doublescan +hsync -vsync (35.5 kHz d)
[  1090.956] (II) modeset(0): Modeline "480x270"x119.3   20.38  480 496 544=
 608
 270 271 274 281 doublescan -hsync +vsync (33.5 kHz d)
[  1090.956] (II) modeset(0): Modeline "480x270"x119.6   18.62  480 504 520=
 560
 270 271 274 278 doublescan +hsync -vsync (33.3 kHz d)
[  1090.956] (II) modeset(0): Modeline "400x300"x120.6   20.00  400 420 484=
 528
 300 300 302 314 doublescan +hsync +vsync (37.9 kHz d)
[  1090.956] (II) modeset(0): Modeline "400x300"x112.7   18.00  400 412 448=
 512
 300 300 301 312 doublescan +hsync +vsync (35.2 kHz d)
[  1090.956] (II) modeset(0): Modeline "432x243"x119.8   16.25  432 444 484=
 536
 243 244 247 253 doublescan -hsync +vsync (30.3 kHz d)
[  1090.956] (II) modeset(0): Modeline "432x243"x119.1   15.25  432 456 472=
 512
 243 244 247 250 doublescan +hsync -vsync (29.8 kHz d)
[  1090.956] (II) modeset(0): Modeline "320x240"x120.1   12.59  320 328 376=
 400
 240 245 246 262 doublescan -hsync -vsync (31.5 kHz d)
[  1090.956] (II) modeset(0): Modeline "360x202"x119.0   11.25  360 372 404=
 448
 202 204 206 211 doublescan -hsync +vsync (25.1 kHz d)
[  1090.956] (II) modeset(0): Modeline "360x202"x118.3   10.88  360 384 400=
 440
 202 204 206 209 doublescan +hsync -vsync (24.7 kHz d)
[  1090.956] (II) modeset(0): Modeline "320x180"x119.7    9.00  320 332 360=
 400
 180 181 184 188 doublescan -hsync +vsync (22.5 kHz d)
[  1090.956] (II) modeset(0): Modeline "320x180"x118.6    8.88  320 344 360=
 400
 180 181 184 187 doublescan +hsync -vsync (22.2 kHz d)
[  1090.956] (II) modeset(0): Output DP-1 disconnected
[  1090.956] (II) modeset(0): Output DP-2 disconnected
[  1090.956] (II) modeset(0): Output DP-3 disconnected
[  1090.956] (II) modeset(0): Output eDP-1 connected
[  1090.956] (II) modeset(0): Using exact sizes for initial modes
[  1090.956] (II) modeset(0): Output eDP-1 using initial mode 1920x1080 +0+0
[  1090.956] (=3D=3D) modeset(0): Using gamma correction (1.0, 1.0, 1.0)
[  1090.956] (=3D=3D) modeset(0): DPI set to (96, 96)
[  1090.956] (II) Loading sub module "fb"
[  1090.956] (II) LoadModule: "fb"
[  1090.956] (II) Loading /usr/lib64/xorg/modules/libfb.so
[  1090.956] (II) Module fb: vendor=3D"X.Org Foundation"
[  1090.956]    compiled for 1.20.4, module version =3D 1.0.0
[  1090.956]    ABI class: X.Org ANSI C Emulation, version 0.4
[  1090.956] (II) UnloadModule: "fbdev"
[  1090.956] (II) Unloading fbdev
[  1090.956] (II) UnloadSubModule: "fbdevhw"
[  1090.957] (II) Unloading fbdevhw
[  1090.957] (II) UnloadModule: "vesa"
[  1090.957] (II) Unloading vesa
[  1090.968] (=3D=3D) modeset(0): Backing store enabled
[  1090.968] (=3D=3D) modeset(0): Silken mouse enabled
[  1090.971] (II) modeset(0): Initializing kms color map for depth 24, 8 bp=
c.
[  1090.971] (=3D=3D) modeset(0): DPMS enabled
[  1090.972] (II) modeset(0): [DRI2] Setup complete
[  1090.972] (II) modeset(0): [DRI2]   DRI driver: nouveau
[  1090.972] (II) modeset(0): [DRI2]   VDPAU driver: nouveau
[  1090.972] (II) Initializing extension Generic Event Extension
[  1090.972] (II) Initializing extension SHAPE
[  1090.972] (II) Initializing extension MIT-SHM
[  1090.972] (II) Initializing extension XInputExtension
[  1090.972] (II) Initializing extension XTEST
[  1090.972] (II) Initializing extension BIG-REQUESTS
[  1090.972] (II) Initializing extension SYNC
[  1090.972] (II) Initializing extension XKEYBOARD
[  1090.972] (II) Initializing extension XC-MISC
[  1090.972] (II) Initializing extension XFIXES
[  1090.972] (II) Initializing extension RENDER
[  1090.973] (II) Initializing extension RANDR
[  1090.973] (II) Initializing extension COMPOSITE
[  1090.973] (II) Initializing extension DAMAGE
[  1090.973] (II) Initializing extension MIT-SCREEN-SAVER
[  1090.973] (II) Initializing extension DOUBLE-BUFFER
[  1090.973] (II) Initializing extension RECORD
[  1090.973] (II) Initializing extension DPMS
[  1090.973] (II) Initializing extension Present
[  1090.973] (II) Initializing extension DRI3
[  1090.973] (II) Initializing extension X-Resource
[  1090.973] (II) Initializing extension XVideo
[  1090.973] (II) Initializing extension XVideo-MotionCompensation
[  1090.973] (II) Initializing extension SELinux
[  1090.974] (II) SELinux: Disabled by boolean
[  1090.974] (II) Initializing extension GLX
[  1090.976] (II) AIGLX: Loaded and initialized nouveau
[  1090.976] (II) GLX: Initialized DRI2 GL provider for screen 0
[  1090.976] (II) Initializing extension XFree86-VidModeExtension
[  1090.977] (II) Initializing extension XFree86-DGA
[  1090.977] (II) Initializing extension XFree86-DRI
[  1090.977] (II) Initializing extension DRI2
[  1090.978] (II) modeset(0): Damage tracking initialized
[  1090.978] (II) modeset(0): Setting screen physical size to 508 x 285
[  1091.005] (II) config/udev: Adding input device Power Button
(/dev/input/event2)
[  1091.005] (**) Power Button: Applying InputClass "evdev keyboard catchal=
l"
[  1091.005] (**) Power Button: Applying InputClass "libinput keyboard
catchall"
[  1091.005] (**) Power Button: Applying InputClass "system-keyboard"
[  1091.005] (II) LoadModule: "libinput"
[  1091.005] (II) Loading /usr/lib64/xorg/modules/input/libinput_drv.so
[  1091.009] (II) Module libinput: vendor=3D"X.Org Foundation"
[  1091.009]    compiled for 1.20.3, module version =3D 0.28.2
[  1091.009]    Module class: X.Org XInput Driver
[  1091.009]    ABI class: X.Org XInput driver, version 24.1
[  1091.009] (II) Using input driver 'libinput' for 'Power Button'
[  1091.010] (II) systemd-logind: got fd for /dev/input/event2 13:66 fd 26
paused 0
[  1091.010] (**) Power Button: always reports core events
[  1091.010] (**) Option "Device" "/dev/input/event2"
[  1091.010] (**) Option "_source" "server/udev"
[  1091.011] (II) event2  - Power Button: is tagged by udev as: Keyboard
[  1091.011] (II) event2  - Power Button: device is a keyboard
[  1091.011] (II) event2  - Power Button: device removed
[  1091.011] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input2/event2"
[  1091.011] (II) XINPUT: Adding extended input device "Power Button" (type:
KEYBOARD, id 6)
[  1091.011] (**) Option "xkb_layout" "us"
[  1091.012] (II) event2  - Power Button: is tagged by udev as: Keyboard
[  1091.012] (II) event2  - Power Button: device is a keyboard
[  1091.012] (II) config/udev: Adding input device Video Bus
(/dev/input/event6)
[  1091.012] (**) Video Bus: Applying InputClass "evdev keyboard catchall"
[  1091.012] (**) Video Bus: Applying InputClass "libinput keyboard catchal=
l"
[  1091.012] (**) Video Bus: Applying InputClass "system-keyboard"
[  1091.012] (II) Using input driver 'libinput' for 'Video Bus'
[  1091.013] (II) systemd-logind: got fd for /dev/input/event6 13:70 fd 29
paused 0
[  1091.013] (**) Video Bus: always reports core events
[  1091.013] (**) Option "Device" "/dev/input/event6"
[  1091.013] (**) Option "_source" "server/udev"
[  1091.013] (II) event6  - Video Bus: is tagged by udev as: Keyboard
[  1091.013] (II) event6  - Video Bus: device is a keyboard
[  1091.013] (II) event6  - Video Bus: device removed
[  1091.014] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:06/LNXVIDEO:00=
/input/input12/event6"
[  1091.014] (II) XINPUT: Adding extended input device "Video Bus" (type:
KEYBOARD, id 7)
[  1091.014] (**) Option "xkb_layout" "us"
[  1091.014] (II) event6  - Video Bus: is tagged by udev as: Keyboard
[  1091.014] (II) event6  - Video Bus: device is a keyboard
[  1091.015] (II) config/udev: Adding input device Lid Switch
(/dev/input/event1)
[  1091.015] (II) No input driver specified, ignoring this device.
[  1091.015] (II) This device may have been added with another device file.
[  1091.015] (II) config/udev: Adding input device Sleep Button
(/dev/input/event0)
[  1091.015] (**) Sleep Button: Applying InputClass "evdev keyboard catchal=
l"
[  1091.015] (**) Sleep Button: Applying InputClass "libinput keyboard
catchall"
[  1091.015] (**) Sleep Button: Applying InputClass "system-keyboard"
[  1091.015] (II) Using input driver 'libinput' for 'Sleep Button'
[  1091.016] (II) systemd-logind: got fd for /dev/input/event0 13:64 fd 30
paused 0
[  1091.016] (**) Sleep Button: always reports core events
[  1091.016] (**) Option "Device" "/dev/input/event0"
[  1091.016] (**) Option "_source" "server/udev"
[  1091.016] (II) event0  - Sleep Button: is tagged by udev as: Keyboard
[  1091.016] (II) event0  - Sleep Button: device is a keyboard
[  1091.017] (II) event0  - Sleep Button: device removed
[  1091.017] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input0/event0"
[  1091.017] (II) XINPUT: Adding extended input device "Sleep Button" (type:
KEYBOARD, id 8)
[  1091.017] (**) Option "xkb_layout" "us"
[  1091.017] (II) event0  - Sleep Button: is tagged by udev as: Keyboard
[  1091.017] (II) event0  - Sleep Button: device is a keyboard
[  1091.018] (II) config/udev: Adding input device HP HD Camera: HP HD Came=
ra
(/dev/input/event11)
[  1091.018] (**) HP HD Camera: HP HD Camera: Applying InputClass "evdev
keyboard catchall"
[  1091.018] (**) HP HD Camera: HP HD Camera: Applying InputClass "libinput
keyboard catchall"
[  1091.018] (**) HP HD Camera: HP HD Camera: Applying InputClass
"system-keyboard"
[  1091.018] (II) Using input driver 'libinput' for 'HP HD Camera: HP HD
Camera'
[  1091.019] (II) systemd-logind: got fd for /dev/input/event11 13:75 fd 31
paused 0
[  1091.019] (**) HP HD Camera: HP HD Camera: always reports core events
[  1091.019] (**) Option "Device" "/dev/input/event11"
[  1091.019] (**) Option "_source" "server/udev"
[  1091.020] (II) event11 - HP HD Camera: HP HD Camera: is tagged by udev a=
s:
Keyboard
[  1091.020] (II) event11 - HP HD Camera: HP HD Camera: device is a keyboard
[  1091.020] (II) event11 - HP HD Camera: HP HD Camera: device removed
[  1091.020] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/input/input17/e=
vent11"
[  1091.020] (II) XINPUT: Adding extended input device "HP HD Camera: HP HD
Camera" (type: KEYBOARD, id 9)
[  1091.020] (**) Option "xkb_layout" "us"
[  1091.021] (II) event11 - HP HD Camera: HP HD Camera: is tagged by udev a=
s:
Keyboard
[  1091.021] (II) event11 - HP HD Camera: HP HD Camera: device is a keyboard
[  1091.021] (II) config/udev: Adding input device HDA Intel PCH Mic
(/dev/input/event8)
[  1091.021] (II) No input driver specified, ignoring this device.
[  1091.021] (II) This device may have been added with another device file.
[  1091.022] (II) config/udev: Adding input device HDA Intel PCH Headphone
(/dev/input/event9)
[  1091.022] (II) No input driver specified, ignoring this device.
[  1091.022] (II) This device may have been added with another device file.
[  1091.022] (II) config/udev: Adding input device AT Translated Set 2 keyb=
oard
(/dev/input/event3)
[  1091.022] (**) AT Translated Set 2 keyboard: Applying InputClass "evdev
keyboard catchall"
[  1091.022] (**) AT Translated Set 2 keyboard: Applying InputClass "libinp=
ut
keyboard catchall"
[  1091.022] (**) AT Translated Set 2 keyboard: Applying InputClass
"system-keyboard"
[  1091.022] (II) Using input driver 'libinput' for 'AT Translated Set 2
keyboard'
[  1091.023] (II) systemd-logind: got fd for /dev/input/event3 13:67 fd 32
paused 0
[  1091.023] (**) AT Translated Set 2 keyboard: always reports core events
[  1091.023] (**) Option "Device" "/dev/input/event3"
[  1091.023] (**) Option "_source" "server/udev"
[  1091.024] (II) event3  - AT Translated Set 2 keyboard: is tagged by udev=
 as:
Keyboard
[  1091.024] (II) event3  - AT Translated Set 2 keyboard: device is a keybo=
ard
[  1091.024] (II) event3  - AT Translated Set 2 keyboard: device removed
[  1091.024] (**) Option "config_info"
"udev:/sys/devices/platform/i8042/serio0/input/input3/event3"
[  1091.024] (II) XINPUT: Adding extended input device "AT Translated Set 2
keyboard" (type: KEYBOARD, id 10)
[  1091.024] (**) Option "xkb_layout" "us"
[  1091.025] (II) event3  - AT Translated Set 2 keyboard: is tagged by udev=
 as:
Keyboard
[  1091.025] (II) event3  - AT Translated Set 2 keyboard: device is a keybo=
ard
[  1091.026] (II) config/udev: Adding input device PS/2 Generic Mouse
(/dev/input/event4)
[  1091.026] (**) PS/2 Generic Mouse: Applying InputClass "evdev pointer
catchall"
[  1091.026] (**) PS/2 Generic Mouse: Applying InputClass "libinput pointer
catchall"
[  1091.026] (II) Using input driver 'libinput' for 'PS/2 Generic Mouse'
[  1091.026] (II) systemd-logind: got fd for /dev/input/event4 13:68 fd 33
paused 0
[  1091.027] (**) PS/2 Generic Mouse: always reports core events
[  1091.027] (**) Option "Device" "/dev/input/event4"
[  1091.027] (**) Option "_source" "server/udev"
[  1091.027] (II) event4  - PS/2 Generic Mouse: is tagged by udev as: Mouse
[  1091.027] (II) event4  - PS/2 Generic Mouse: device is a pointer
[  1091.028] (II) event4  - PS/2 Generic Mouse: device removed
[  1091.028] (**) Option "config_info"
"udev:/sys/devices/platform/i8042/serio2/input/input9/event4"
[  1091.028] (II) XINPUT: Adding extended input device "PS/2 Generic Mouse"
(type: MOUSE, id 11)
[  1091.028] (**) Option "AccelerationScheme" "none"
[  1091.028] (**) PS/2 Generic Mouse: (accel) selected scheme none/0
[  1091.028] (**) PS/2 Generic Mouse: (accel) acceleration factor: 2.000
[  1091.028] (**) PS/2 Generic Mouse: (accel) acceleration threshold: 4
[  1091.028] (II) event4  - PS/2 Generic Mouse: is tagged by udev as: Mouse
[  1091.028] (II) event4  - PS/2 Generic Mouse: device is a pointer
[  1091.029] (II) config/udev: Adding input device PS/2 Generic Mouse
(/dev/input/mouse0)
[  1091.029] (II) No input driver specified, ignoring this device.
[  1091.029] (II) This device may have been added with another device file.
[  1091.029] (II) config/udev: Adding input device SynPS/2 Synaptics TouchP=
ad
(/dev/input/event5)
[  1091.029] (**) SynPS/2 Synaptics TouchPad: Applying InputClass "evdev
touchpad catchall"
[  1091.029] (**) SynPS/2 Synaptics TouchPad: Applying InputClass "libinput
touchpad catchall"
[  1091.029] (II) Using input driver 'libinput' for 'SynPS/2 Synaptics
TouchPad'
[  1091.030] (II) systemd-logind: got fd for /dev/input/event5 13:69 fd 34
paused 0
[  1091.030] (**) SynPS/2 Synaptics TouchPad: always reports core events
[  1091.030] (**) Option "Device" "/dev/input/event5"
[  1091.030] (**) Option "_source" "server/udev"
[  1091.031] (II) event5  - SynPS/2 Synaptics TouchPad: is tagged by udev a=
s:
Touchpad
[  1091.038] (II) event5  - SynPS/2 Synaptics TouchPad: device is a touchpad
[  1091.038] (II) event5  - SynPS/2 Synaptics TouchPad: device removed
[  1091.038] (**) Option "config_info"
"udev:/sys/devices/platform/i8042/serio3/input/input10/event5"
[  1091.038] (II) XINPUT: Adding extended input device "SynPS/2 Synaptics
TouchPad" (type: TOUCHPAD, id 12)
[  1091.038] (**) Option "AccelerationScheme" "none"
[  1091.038] (**) SynPS/2 Synaptics TouchPad: (accel) selected scheme none/0
[  1091.038] (**) SynPS/2 Synaptics TouchPad: (accel) acceleration factor:
2.000
[  1091.038] (**) SynPS/2 Synaptics TouchPad: (accel) acceleration threshol=
d: 4
[  1091.039] (II) event5  - SynPS/2 Synaptics TouchPad: is tagged by udev a=
s:
Touchpad
[  1091.045] (II) event5  - SynPS/2 Synaptics TouchPad: device is a touchpad
[  1091.045] (II) config/udev: Adding input device SynPS/2 Synaptics TouchP=
ad
(/dev/input/mouse1)
[  1091.045] (II) No input driver specified, ignoring this device.
[  1091.045] (II) This device may have been added with another device file.
[  1091.046] (II) config/udev: Adding input device ST LIS3LV02DL Accelerome=
ter
(/dev/input/event12)
[  1091.046] (II) No input driver specified, ignoring this device.
[  1091.046] (II) This device may have been added with another device file.
[  1091.046] (II) config/udev: Adding input device ST LIS3LV02DL Accelerome=
ter
(/dev/input/js0)
[  1091.046] (II) No input driver specified, ignoring this device.
[  1091.046] (II) This device may have been added with another device file.
[  1091.049] (II) config/udev: Adding input device HP Wireless hotkeys
(/dev/input/event7)
[  1091.049] (**) HP Wireless hotkeys: Applying InputClass "evdev keyboard
catchall"
[  1091.049] (**) HP Wireless hotkeys: Applying InputClass "libinput keyboa=
rd
catchall"
[  1091.049] (**) HP Wireless hotkeys: Applying InputClass "system-keyboard"
[  1091.049] (II) Using input driver 'libinput' for 'HP Wireless hotkeys'
[  1091.049] (II) systemd-logind: got fd for /dev/input/event7 13:71 fd 35
paused 0
[  1091.049] (**) HP Wireless hotkeys: always reports core events
[  1091.049] (**) Option "Device" "/dev/input/event7"
[  1091.049] (**) Option "_source" "server/udev"
[  1091.050] (II) event7  - HP Wireless hotkeys: is tagged by udev as: Keyb=
oard
[  1091.050] (II) event7  - HP Wireless hotkeys: device is a keyboard
[  1091.050] (II) event7  - HP Wireless hotkeys: device removed
[  1091.050] (**) Option "config_info"
"udev:/sys/devices/virtual/input/input13/event7"
[  1091.050] (II) XINPUT: Adding extended input device "HP Wireless hotkeys"
(type: KEYBOARD, id 13)
[  1091.050] (**) Option "xkb_layout" "us"
[  1091.050] (II) event7  - HP Wireless hotkeys: is tagged by udev as: Keyb=
oard
[  1091.050] (II) event7  - HP Wireless hotkeys: device is a keyboard
[  1091.051] (II) config/udev: Adding input device HP WMI hotkeys
(/dev/input/event10)
[  1091.051] (**) HP WMI hotkeys: Applying InputClass "evdev keyboard catch=
all"
[  1091.051] (**) HP WMI hotkeys: Applying InputClass "libinput keyboard
catchall"
[  1091.051] (**) HP WMI hotkeys: Applying InputClass "system-keyboard"
[  1091.051] (II) Using input driver 'libinput' for 'HP WMI hotkeys'
[  1091.051] (II) systemd-logind: got fd for /dev/input/event10 13:74 fd 36
paused 0
[  1091.051] (**) HP WMI hotkeys: always reports core events
[  1091.051] (**) Option "Device" "/dev/input/event10"
[  1091.051] (**) Option "_source" "server/udev"
[  1091.052] (II) event10 - HP WMI hotkeys: is tagged by udev as: Keyboard
Switch
[  1091.052] (II) event10 - HP WMI hotkeys: device is a keyboard
[  1091.052] (II) event10 - HP WMI hotkeys: device removed
[  1091.052] (**) Option "config_info"
"udev:/sys/devices/virtual/input/input14/event10"
[  1091.052] (II) XINPUT: Adding extended input device "HP WMI hotkeys" (ty=
pe:
KEYBOARD, id 14)
[  1091.052] (**) Option "xkb_layout" "us"
[  1091.052] (II) event10 - HP WMI hotkeys: is tagged by udev as: Keyboard
Switch
[  1091.052] (II) event10 - HP WMI hotkeys: device is a keyboard
[  1091.686] (II) modeset(0): EDID vendor "LGD", prod id 1406
[  1091.686] (II) modeset(0): Printing DDC gathered Modelines:
[  1091.686] (II) modeset(0): Modeline "1920x1080"x0.0  138.70  1920 1968 2=
000
2080  1080 1083 1088 1111 +hsync -vsync (66.7 kHz eP)
[  1093.552] (II) modeset(0): EDID vendor "LGD", prod id 1406
[  1093.552] (II) modeset(0): Printing DDC gathered Modelines:
[  1093.552] (II) modeset(0): Modeline "1920x1080"x0.0  138.70  1920 1968 2=
000
2080  1080 1083 1088 1111 +hsync -vsync (66.7 kHz eP)
[  3810.468] (II) modeset(0): EDID vendor "LGD", prod id 1406
[  3810.468] (II) modeset(0): Printing DDC gathered Modelines:
[  3810.468] (II) modeset(0): Modeline "1920x1080"x0.0  138.70  1920 1968 2=
000
2080  1080 1083 1088 1111 +hsync -vsync (66.7 kHz eP)
[  3822.257] (II) config/udev: Adding input device Plantronics DSP55 Adapter
(/dev/input/event13)
[  3822.258] (**) Plantronics DSP55 Adapter: Applying InputClass "evdev
keyboard catchall"
[  3822.258] (**) Plantronics DSP55 Adapter: Applying InputClass "libinput
keyboard catchall"
[  3822.258] (**) Plantronics DSP55 Adapter: Applying InputClass
"system-keyboard"
[  3822.258] (II) Using input driver 'libinput' for 'Plantronics DSP55 Adap=
ter'
[  3822.270] (II) systemd-logind: got fd for /dev/input/event13 13:77 fd 107
paused 0
[  3822.270] (**) Plantronics DSP55 Adapter: always reports core events
[  3822.270] (**) Option "Device" "/dev/input/event13"
[  3822.270] (**) Option "_source" "server/udev"
[  3822.271] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[  3822.271] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard
[  3822.271] (II) event13 - Plantronics DSP55 Adapter: device removed
[  3822.271] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.3/0003:047F:D055.=
0002/input/input19/event13"
[  3822.271] (II) XINPUT: Adding extended input device "Plantronics DSP55
Adapter" (type: KEYBOARD, id 15)
[  3822.271] (**) Option "xkb_layout" "us"
[  3822.273] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[  3822.273] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard
[ 92625.201] (II) config/udev: removing device Plantronics DSP55 Adapter
[ 92625.201] (**) Option "fd" "107"
[ 92625.201] (II) event13 - Plantronics DSP55 Adapter: device removed
[ 92625.202] (II) UnloadModule: "libinput"
[ 92625.203] (II) systemd-logind: releasing fd for 13:77
[ 99767.777] (II) modeset(0): EDID vendor "LGD", prod id 1406
[ 99767.777] (II) modeset(0): Printing DDC gathered Modelines:
[ 99767.777] (II) modeset(0): Modeline "1920x1080"x0.0  138.70  1920 1968 2=
000
2080  1080 1083 1088 1111 +hsync -vsync (66.7 kHz eP)
[134116.000] (II) modeset(0): Disabling kernel dirty updates, not required.
[446526.734] (II) config/udev: Adding input device Plantronics DSP55 Adapter
(/dev/input/event13)
[446526.735] (**) Plantronics DSP55 Adapter: Applying InputClass "evdev
keyboard catchall"
[446526.735] (**) Plantronics DSP55 Adapter: Applying InputClass "libinput
keyboard catchall"
[446526.735] (**) Plantronics DSP55 Adapter: Applying InputClass
"system-keyboard"
[446526.735] (II) Using input driver 'libinput' for 'Plantronics DSP55 Adap=
ter'
[446526.752] (II) systemd-logind: got fd for /dev/input/event13 13:77 fd 115
paused 0
[446526.752] (**) Plantronics DSP55 Adapter: always reports core events
[446526.752] (**) Option "Device" "/dev/input/event13"
[446526.752] (**) Option "_source" "server/udev"
[446526.755] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[446526.755] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard
[446526.755] (II) event13 - Plantronics DSP55 Adapter: device removed
[446526.755] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.3/0003:047F:D055.=
0006/input/input20/event13"
[446526.755] (II) XINPUT: Adding extended input device "Plantronics DSP55
Adapter" (type: KEYBOARD, id 15)
[446526.755] (**) Option "xkb_layout" "us"
[446526.757] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[446526.757] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard
[461669.974] (II) config/udev: removing device Plantronics DSP55 Adapter
[461669.974] (**) Option "fd" "115"
[461669.974] (II) event13 - Plantronics DSP55 Adapter: device removed
[461669.978] (II) UnloadModule: "libinput"
[461669.978] (II) systemd-logind: releasing fd for 13:77
[608174.860] (II) config/udev: Adding input device Plantronics DSP55 Adapter
(/dev/input/event13)
[608174.860] (**) Plantronics DSP55 Adapter: Applying InputClass "evdev
keyboard catchall"
[608174.860] (**) Plantronics DSP55 Adapter: Applying InputClass "libinput
keyboard catchall"
[608174.860] (**) Plantronics DSP55 Adapter: Applying InputClass
"system-keyboard"
[608174.860] (II) Using input driver 'libinput' for 'Plantronics DSP55 Adap=
ter'
[608174.880] (II) systemd-logind: got fd for /dev/input/event13 13:77 fd 118
paused 0
[608174.880] (**) Plantronics DSP55 Adapter: always reports core events
[608174.880] (**) Option "Device" "/dev/input/event13"
[608174.880] (**) Option "_source" "server/udev"
[608174.882] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[608174.882] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard
[608174.882] (II) event13 - Plantronics DSP55 Adapter: device removed
[608174.882] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.3/0003:047F:D055.=
0008/input/input21/event13"
[608174.882] (II) XINPUT: Adding extended input device "Plantronics DSP55
Adapter" (type: KEYBOARD, id 15)
[608174.882] (**) Option "xkb_layout" "us"
[608174.884] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[608174.884] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard
[648775.980] (II) config/udev: removing device Plantronics DSP55 Adapter
[648775.980] (**) Option "fd" "118"
[648775.980] (II) event13 - Plantronics DSP55 Adapter: device removed
[648775.985] (II) UnloadModule: "libinput"
[648775.985] (II) systemd-logind: releasing fd for 13:77
[701838.899] (II) config/udev: Adding input device Plantronics DSP55 Adapter
(/dev/input/event13)
[701838.900] (**) Plantronics DSP55 Adapter: Applying InputClass "evdev
keyboard catchall"
[701838.900] (**) Plantronics DSP55 Adapter: Applying InputClass "libinput
keyboard catchall"
[701838.900] (**) Plantronics DSP55 Adapter: Applying InputClass
"system-keyboard"
[701838.900] (II) Using input driver 'libinput' for 'Plantronics DSP55 Adap=
ter'
[701838.913] (II) systemd-logind: got fd for /dev/input/event13 13:77 fd 101
paused 0
[701838.913] (**) Plantronics DSP55 Adapter: always reports core events
[701838.913] (**) Option "Device" "/dev/input/event13"
[701838.913] (**) Option "_source" "server/udev"
[701838.915] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[701838.915] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard
[701838.915] (II) event13 - Plantronics DSP55 Adapter: device removed
[701838.915] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.3/0003:047F:D055.=
0009/input/input22/event13"
[701838.915] (II) XINPUT: Adding extended input device "Plantronics DSP55
Adapter" (type: KEYBOARD, id 15)
[701838.915] (**) Option "xkb_layout" "us"
[701838.917] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[701838.917] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard

Although there is probably nothing new and/or useful here and given the lac=
k of
movement, I guess I will just go back to the nvidia driver, unfortunately.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15599362543.b54c85Fc.17075
Date: Fri, 7 Jun 2019 19:37:34 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c33">Comme=
nt # 33</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
brian&#64;interlinx.bc.ca" title=3D"Brian J. Murrell &lt;brian&#64;interlin=
x.bc.ca&gt;"> <span class=3D"fn">Brian J. Murrell</span></a>
</span></b>
        <pre>Seems I just hit this also on Fedora 30:

[714357.060052] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[714357.060066] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recove=
ry
[714357.060078] nouveau 0000:01:00.0: fifo: channel 12: killed
[714357.060097] nouveau 0000:01:00.0: fifo: engine 5: scheduled for recovery
[714357.060101] nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
[714357.060582] nouveau 0000:01:00.0: Xorg[9580]: channel 12 killed!

# uname -r
5.0.17-300.fc30.x86_64

# cat /home/brian/.local/share/xorg/Xorg.0.log
[  1090.508] (--) Log file renamed from
&quot;/home/brian/.local/share/xorg/Xorg.pid-9580.log&quot; to
&quot;/home/brian/.local/share/xorg/Xorg.0.log&quot;
[  1090.509]=20
X.Org X Server 1.20.4
X Protocol Version 11, Revision 0
[  1090.509] Build Operating System:  4.20.13-200.fc29.x86_64=20
[  1090.509] Current Operating System: Linux bmurrell-mobl.amr.corp.intel.c=
om
5.0.17-300.fc30.x86_64 #1 SMP Mon May 20 15:36:26 UTC 2019 x86_64
[  1090.509] Kernel command line:
BOOT_IMAGE=3D(hd0,gpt2)/vmlinuz-5.0.17-300.fc30.x86_64
root=3D/dev/mapper/fedora_rootvol-fedora_root ro
resume=3D/dev/mapper/fedora_rootvol-swap rd.lvm.lv=3Dfedora_rootvol/fedora_=
root
rd.luks.uuid=3Dluks-8737d036-edd5-4ffd-9922-35785f0d199d
rd.lvm.lv=3Dfedora_rootvol/swap rd.lvm.lv=3Dfedora_rootvol/fedora_usr
libata.allow_tpm=3D1 rhgb
[  1090.509] Build Date: 29 March 2019  05:04:12AM
[  1090.509] Build ID: xorg-x11-server 1.20.4-3.fc30=20
[  1090.509] Current version of pixman: 0.38.0
[  1090.509]    Before reporting problems, check <a href=3D"http://wiki.x.o=
rg">http://wiki.x.org</a>
        to make sure that you have the latest version.
[  1090.509] Markers: (--) probed, (**) from config file, (=3D=3D) default =
setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[  1090.510] (=3D=3D) Log file: &quot;/home/brian/.local/share/xorg/Xorg.0.=
log&quot;, Time:
Thu May 30 09:17:11 2019
[  1090.510] (=3D=3D) Using config directory: &quot;/etc/X11/xorg.conf.d&qu=
ot;
[  1090.510] (=3D=3D) Using system config directory &quot;/usr/share/X11/xo=
rg.conf.d&quot;
[  1090.511] (=3D=3D) No Layout section.  Using the first Screen section.
[  1090.511] (=3D=3D) No screen section available. Using defaults.
[  1090.511] (**) |--&gt;Screen &quot;Default Screen Section&quot; (0)
[  1090.511] (**) |   |--&gt;Monitor &quot;&lt;default monitor&gt;&quot;
[  1090.512] (=3D=3D) No monitor specified for screen &quot;Default Screen =
Section&quot;.
        Using a default monitor configuration.
[  1090.512] (=3D=3D) Automatically adding devices
[  1090.512] (=3D=3D) Automatically enabling devices
[  1090.512] (=3D=3D) Automatically adding GPU devices
[  1090.512] (=3D=3D) Automatically binding GPU devices
[  1090.513] (=3D=3D) Max clients allowed: 256, resource mask: 0x1fffff
[  1090.513] (=3D=3D) FontPath set to:
        catalogue:/etc/X11/fontpath.d,
        built-ins
[  1090.513] (=3D=3D) ModulePath set to &quot;/usr/lib64/xorg/modules&quot;
[  1090.513] (II) The server relies on udev to provide the list of input
devices.
        If no devices become available, reconfigure udev or disable
AutoAddDevices.
[  1090.513] (II) Loader magic: 0x561ee52f6e00
[  1090.513] (II) Module ABI versions:
[  1090.513]    X.Org ANSI C Emulation: 0.4
[  1090.513]    X.Org Video Driver: 24.0
[  1090.513]    X.Org XInput driver : 24.1
[  1090.513]    X.Org Server Extension : 10.0
[  1090.513] (++) using VT number 2

[  1090.514] (II) systemd-logind: took control of session
/org/freedesktop/login1/session/_39
[  1090.515] (II) xfree86: Adding drm device (/dev/dri/card0)
[  1090.516] (II) systemd-logind: got fd for /dev/dri/card0 226:0 fd 14 pau=
sed
0
[  1090.518] (--) PCI:*(1&#64;0:0:0) 10de:13b6:103c:8277 rev 162, Mem &#64;
0xe3000000/16777216, 0xa0000000/268435456, 0xb0000000/33554432, I/O &#64;
0x00005000/128, BIOS &#64; 0x????????/65536
[  1090.519] (II) LoadModule: &quot;glx&quot;
[  1090.519] (II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
[  1090.520] (II) Module glx: vendor=3D&quot;X.Org Foundation&quot;
[  1090.520]    compiled for 1.20.4, module version =3D 1.0.0
[  1090.520]    ABI class: X.Org Server Extension, version 10.0
[  1090.636] (=3D=3D) Matched modesetting as autoconfigured driver 0
[  1090.636] (=3D=3D) Matched fbdev as autoconfigured driver 1
[  1090.636] (=3D=3D) Matched vesa as autoconfigured driver 2
[  1090.636] (=3D=3D) Assigned the driver to the xf86ConfigLayout
[  1090.636] (II) LoadModule: &quot;modesetting&quot;
[  1090.636] (II) Loading /usr/lib64/xorg/modules/drivers/modesetting_drv.so
[  1090.636] (II) Module modesetting: vendor=3D&quot;X.Org Foundation&quot;
[  1090.636]    compiled for 1.20.4, module version =3D 1.20.4
[  1090.636]    Module class: X.Org Video Driver
[  1090.636]    ABI class: X.Org Video Driver, version 24.0
[  1090.636] (II) LoadModule: &quot;fbdev&quot;
[  1090.636] (II) Loading /usr/lib64/xorg/modules/drivers/fbdev_drv.so
[  1090.636] (II) Module fbdev: vendor=3D&quot;X.Org Foundation&quot;
[  1090.636]    compiled for 1.20.3, module version =3D 0.5.0
[  1090.636]    Module class: X.Org Video Driver
[  1090.636]    ABI class: X.Org Video Driver, version 24.0
[  1090.636] (II) LoadModule: &quot;vesa&quot;
[  1090.636] (II) Loading /usr/lib64/xorg/modules/drivers/vesa_drv.so
[  1090.637] (II) Module vesa: vendor=3D&quot;X.Org Foundation&quot;
[  1090.637]    compiled for 1.20.4, module version =3D 2.4.0
[  1090.637]    Module class: X.Org Video Driver
[  1090.637]    ABI class: X.Org Video Driver, version 24.0
[  1090.637] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[  1090.637] (II) FBDEV: driver for framebuffer: fbdev
[  1090.637] (II) VESA: driver for VESA chipsets: vesa
[  1090.637] xf86EnableIOPorts: failed to set IOPL for I/O (Operation not
permitted)
[  1090.637] (II) modeset(0): using drv /dev/dri/card0
[  1090.637] (WW) Falling back to old probe method for fbdev
[  1090.637] (II) Loading sub module &quot;fbdevhw&quot;
[  1090.637] (II) LoadModule: &quot;fbdevhw&quot;
[  1090.637] (II) Loading /usr/lib64/xorg/modules/libfbdevhw.so
[  1090.637] (II) Module fbdevhw: vendor=3D&quot;X.Org Foundation&quot;
[  1090.637]    compiled for 1.20.4, module version =3D 0.0.2
[  1090.637]    ABI class: X.Org Video Driver, version 24.0
[  1090.637] (EE) open /dev/fb0: Permission denied
[  1090.637] (WW) VGA arbiter: cannot open kernel arbiter, no multi-card
support
[  1090.637] (II) modeset(0): Creating default Display subsection in Screen
section
        &quot;Default Screen Section&quot; for depth/fbbpp 24/32
[  1090.637] (=3D=3D) modeset(0): Depth 24, (=3D=3D) framebuffer bpp 32
[  1090.637] (=3D=3D) modeset(0): RGB weight 888
[  1090.637] (=3D=3D) modeset(0): Default visual is TrueColor
[  1090.637] (II) Loading sub module &quot;glamoregl&quot;
[  1090.637] (II) LoadModule: &quot;glamoregl&quot;
[  1090.638] (II) Loading /usr/lib64/xorg/modules/libglamoregl.so
[  1090.642] (II) Module glamoregl: vendor=3D&quot;X.Org Foundation&quot;
[  1090.642]    compiled for 1.20.4, module version =3D 1.0.1
[  1090.642]    ABI class: X.Org ANSI C Emulation, version 0.4
[  1090.719] (II) modeset(0): glamor X acceleration enabled on NV117
[  1090.719] (II) modeset(0): glamor initialized
[  1090.751] (II) modeset(0): Output DP-1 has no monitor section
[  1090.783] (II) modeset(0): Output DP-2 has no monitor section
[  1090.815] (II) modeset(0): Output DP-3 has no monitor section
[  1090.836] (II) modeset(0): Output eDP-1 has no monitor section
[  1090.869] (II) modeset(0): EDID for output DP-1
[  1090.901] (II) modeset(0): EDID for output DP-2
[  1090.933] (II) modeset(0): EDID for output DP-3
[  1090.954] (II) modeset(0): EDID for output eDP-1
[  1090.954] (II) modeset(0): Manufacturer: LGD  Model: 57e  Serial#: 0
[  1090.954] (II) modeset(0): Year: 2016  Week: 0
[  1090.954] (II) modeset(0): EDID Version: 1.4
[  1090.954] (II) modeset(0): Digital Display Input
[  1090.954] (II) modeset(0): 6 bits per channel
[  1090.954] (II) modeset(0): Digital interface is DisplayPort
[  1090.954] (II) modeset(0): Max Image Size [cm]: horiz.: 34  vert.: 19
[  1090.954] (II) modeset(0): Gamma: 2.20
[  1090.954] (II) modeset(0): DPMS capabilities: StandBy Suspend Off
[  1090.955] (II) modeset(0): Supported color encodings: RGB 4:4:4 YCrCb 4:=
4:4=20
[  1090.955] (II) modeset(0): First detailed timing is preferred mode
[  1090.955] (II) modeset(0): Preferred mode is native pixel format and ref=
resh
rate
[  1090.955] (II) modeset(0): redX: 0.640 redY: 0.345   greenX: 0.335 green=
Y:
0.625
[  1090.955] (II) modeset(0): blueX: 0.150 blueY: 0.052   whiteX: 0.313 whi=
teY:
0.329
[  1090.955] (II) modeset(0): Manufacturer's mask: 0
[  1090.955] (II) modeset(0): Supported detailed timing:
[  1090.955] (II) modeset(0): clock: 138.7 MHz   Image Size:  344 x 194 mm
[  1090.955] (II) modeset(0): h_active: 1920  h_sync: 1968  h_sync_end 2000
h_blank_end 2080 h_border: 0
[  1090.955] (II) modeset(0): v_active: 1080  v_sync: 1083  v_sync_end 1088
v_blanking: 1111 v_border: 0
[  1090.955] (II) modeset(0): Supported detailed timing:
[  1090.955] (II) modeset(0): clock: 138.7 MHz   Image Size:  344 x 194 mm
[  1090.955] (II) modeset(0): h_active: 1920  h_sync: 1968  h_sync_end 2000
h_blank_end 2080 h_border: 0
[  1090.955] (II) modeset(0): v_active: 1080  v_sync: 1083  v_sync_end 1088
v_blanking: 1111 v_border: 0
[  1090.955] (II) modeset(0): Unknown vendor-specific block 2
[  1090.955] (II) modeset(0): EDID (in hex):
[  1090.955] (II) modeset(0):   00ffffffffffff0030e47e0500000000
[  1090.955] (II) modeset(0):   001a010495221378eadc95a35855a026
[  1090.955] (II) modeset(0):   0d505400000001010101010101010101
[  1090.955] (II) modeset(0):   0101010101012e3680a070381f403020
[  1090.955] (II) modeset(0):   350058c21000001a2e3680a070381f40
[  1090.955] (II) modeset(0):   3020350058c21000001a000000000000
[  1090.955] (II) modeset(0):   00000000000000000000000000000002
[  1090.955] (II) modeset(0):   000833ff0a3c961e163696000000001c
[  1090.955] (II) modeset(0): Printing probed modes for output eDP-1
[  1090.955] (II) modeset(0): Modeline &quot;1920x1080&quot;x60.0  138.70  =
1920 1968 2000
2080  1080 1083 1088 1111 +hsync -vsync (66.7 kHz eP)
[  1090.955] (II) modeset(0): Modeline &quot;1920x1080&quot;x120.0  356.38 =
 1920 2080
2288 2656  1080 1081 1084 1118 doublescan -hsync +vsync (134.2 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1920x1080&quot;x119.9  266.50 =
 1920 1944
1960 2000  1080 1081 1084 1111 doublescan +hsync -vsync (133.2 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1920x1080&quot;x60.0  173.00  =
1920 2048 2248
2576  1080 1083 1088 1120 -hsync +vsync (67.2 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1920x1080&quot;x59.9  138.50  =
1920 1968 2000
2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1680x1050&quot;x60.0  146.36  =
1680 1784 1960
2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[  1090.955] (II) modeset(0): Modeline &quot;1680x1050&quot;x60.0  146.25  =
1680 1784 1960
2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1680x1050&quot;x59.9  119.00  =
1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1400x1050&quot;x60.0  122.00  =
1400 1488 1640
1880  1050 1052 1064 1082 +hsync +vsync (64.9 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1400x1050&quot;x60.0  121.79  =
1400 1488 1632
1864  1050 1053 1057 1089 -hsync +vsync (65.3 kHz)
[  1090.955] (II) modeset(0): Modeline &quot;1600x900&quot;x120.0  246.00  =
1600 1728 1900
2200  900 901 904 932 doublescan -hsync +vsync (111.8 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1600x900&quot;x119.9  186.50  =
1600 1624 1640
1680  900 901 904 926 doublescan +hsync -vsync (111.0 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1600x900&quot;x59.9  118.25  1=
600 1696 1856
2112  900 903 908 934 -hsync +vsync (56.0 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1600x900&quot;x59.8   97.50  1=
600 1648 1680
1760  900 903 908 926 +hsync -vsync (55.4 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1280x1024&quot;x59.9  109.10  =
1280 1368 1496
1712  1024 1027 1034 1063 -hsync +vsync (63.7 kHz)
[  1090.955] (II) modeset(0): Modeline &quot;1280x1024&quot;x60.0  108.00  =
1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1400x900&quot;x60.0  103.50  1=
400 1480 1624
1848  900 903 913 934 -hsync +vsync (56.0 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1400x900&quot;x59.9   86.50  1=
400 1448 1480
1560  900 903 913 926 +hsync -vsync (55.4 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1280x960&quot;x60.0  108.00  1=
280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1280x960&quot;x60.0  101.34  1=
280 1360 1488
1696  960 963 967 996 -hsync +vsync (59.8 kHz)
[  1090.955] (II) modeset(0): Modeline &quot;1440x810&quot;x120.0  198.12  =
1440 1548 1704
1968  810 811 814 839 doublescan -hsync +vsync (100.7 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1440x810&quot;x119.9  151.88  =
1440 1464 1480
1520  810 811 814 833 doublescan +hsync -vsync (99.9 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1368x768&quot;x59.9   85.25  1=
368 1440 1576
1784  768 771 781 798 -hsync +vsync (47.8 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1368x768&quot;x59.9   72.25  1=
368 1416 1448
1528  768 771 781 790 +hsync -vsync (47.3 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1280x800&quot;x120.0  174.25  =
1280 1380 1516
1752  800 801 804 829 doublescan -hsync +vsync (99.5 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1280x800&quot;x119.9  134.25  =
1280 1304 1320
1360  800 801 804 823 doublescan +hsync -vsync (98.7 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1280x800&quot;x59.8   83.50  1=
280 1352 1480
1680  800 803 809 831 -hsync +vsync (49.7 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1280x800&quot;x59.9   71.00  1=
280 1328 1360
1440  800 803 809 823 +hsync -vsync (49.3 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1152x864&quot;x60.0   81.77  1=
152 1216 1336
1520  864 867 871 897 -hsync +vsync (53.8 kHz)
[  1090.955] (II) modeset(0): Modeline &quot;1280x720&quot;x120.0  156.12  =
1280 1376 1512
1744  720 721 724 746 doublescan -hsync +vsync (89.5 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1280x720&quot;x120.0  120.75  =
1280 1304 1320
1360  720 721 724 740 doublescan +hsync -vsync (88.8 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1280x720&quot;x59.9   74.50  1=
280 1344 1472
1664  720 723 728 748 -hsync +vsync (44.8 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1280x720&quot;x59.7   63.75  1=
280 1328 1360
1440  720 723 728 741 +hsync -vsync (44.3 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1024x768&quot;x120.1  133.47  =
1024 1100 1212
1400  768 768 770 794 doublescan -hsync +vsync (95.3 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1024x768&quot;x60.0   65.00  1=
024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz d)
[  1090.955] (II) modeset(0): Modeline &quot;1024x768&quot;x59.9   63.53  1=
024 1072 1176
1328  768 771 775 798 -hsync +vsync (47.8 kHz)
[  1090.956] (II) modeset(0): Modeline &quot;960x720&quot;x120.0  117.00  9=
60 1024 1128
1300  720 720 722 750 doublescan -hsync +vsync (90.0 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;928x696&quot;x120.1  109.15  9=
28 976 1088
1264  696 696 698 719 doublescan -hsync +vsync (86.4 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;896x672&quot;x120.0  102.40  8=
96 960 1060
1224  672 672 674 697 doublescan -hsync +vsync (83.7 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;1024x576&quot;x119.9   98.50  =
1024 1092 1200
1376  576 577 580 597 doublescan -hsync +vsync (71.6 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;1024x576&quot;x119.9   78.38  =
1024 1048 1064
1104  576 577 580 592 doublescan +hsync -vsync (71.0 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;1024x576&quot;x59.9   46.50  1=
024 1064 1160
1296  576 579 584 599 -hsync +vsync (35.9 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;1024x576&quot;x59.8   42.00  1=
024 1072 1104
1184  576 579 584 593 +hsync -vsync (35.5 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;960x600&quot;x119.9   96.62  9=
60 1028 1128
1296  600 601 604 622 doublescan -hsync +vsync (74.6 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;960x600&quot;x120.0   77.00  9=
60 984 1000
1040  600 601 604 617 doublescan +hsync -vsync (74.0 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;960x540&quot;x119.9   86.50  9=
60 1024 1124
1288  540 541 544 560 doublescan -hsync +vsync (67.2 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;960x540&quot;x120.0   69.25  9=
60 984 1000
1040  540 541 544 555 doublescan +hsync -vsync (66.6 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;960x540&quot;x59.6   40.75  96=
0 992 1088
1216  540 543 548 562 -hsync +vsync (33.5 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;960x540&quot;x59.8   37.25  96=
0 1008 1040
1120  540 543 548 556 +hsync -vsync (33.3 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;800x600&quot;x120.0   81.00  8=
00 832 928
1080  600 600 602 625 doublescan +hsync +vsync (75.0 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;800x600&quot;x60.3   40.00  80=
0 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;800x600&quot;x60.0   38.31  80=
0 832 912 1024
 600 603 607 624 -hsync +vsync (37.4 kHz)
[  1090.956] (II) modeset(0): Modeline &quot;800x600&quot;x56.2   36.00  80=
0 824 896 1024
 600 601 603 625 +hsync +vsync (35.2 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;840x525&quot;x120.0   73.12  8=
40 892 980
1120  525 526 529 544 doublescan -hsync +vsync (65.3 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;840x525&quot;x119.8   59.50  8=
40 864 880 920
 525 526 529 540 doublescan +hsync -vsync (64.7 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;864x486&quot;x59.9   32.50  86=
4 888 968 1072
 486 489 494 506 -hsync +vsync (30.3 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;864x486&quot;x59.6   30.50  86=
4 912 944 1024
 486 489 494 500 +hsync -vsync (29.8 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;700x525&quot;x120.0   61.00  7=
00 744 820 940
 525 526 532 541 doublescan +hsync +vsync (64.9 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;800x450&quot;x119.9   59.12  8=
00 848 928
1056  450 451 454 467 doublescan -hsync +vsync (56.0 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;800x450&quot;x119.6   48.75  8=
00 824 840 880
 450 451 454 463 doublescan +hsync -vsync (55.4 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;640x512&quot;x120.0   54.00  6=
40 664 720 844
 512 512 514 533 doublescan +hsync +vsync (64.0 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;700x450&quot;x119.9   51.75  7=
00 740 812 924
 450 451 456 467 doublescan -hsync +vsync (56.0 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;700x450&quot;x119.8   43.25  7=
00 724 740 780
 450 451 456 463 doublescan +hsync -vsync (55.4 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;640x480&quot;x120.0   54.00  6=
40 688 744 900
 480 480 482 500 doublescan +hsync +vsync (60.0 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;640x480&quot;x59.9   25.18  64=
0 656 752 800=20
480 490 492 525 -hsync -vsync (31.5 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;640x480&quot;x59.9   23.98  64=
0 664 720 800=20
480 483 487 500 -hsync +vsync (30.0 kHz)
[  1090.956] (II) modeset(0): Modeline &quot;720x405&quot;x59.5   22.50  72=
0 744 808 896=20
405 408 413 422 -hsync +vsync (25.1 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;720x405&quot;x59.0   21.75  72=
0 768 800 880=20
405 408 413 419 +hsync -vsync (24.7 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;720x400&quot;x60.0   22.41  72=
0 744 808 896=20
400 403 413 417 -hsync +vsync (25.0 kHz)
[  1090.956] (II) modeset(0): Modeline &quot;684x384&quot;x119.8   42.62  6=
84 720 788 892
 384 385 390 399 doublescan -hsync +vsync (47.8 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;684x384&quot;x119.7   36.12  6=
84 708 724 764
 384 385 390 395 doublescan +hsync -vsync (47.3 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;640x400&quot;x119.8   41.75  6=
40 676 740 840
 400 401 404 415 doublescan -hsync +vsync (49.7 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;640x400&quot;x120.0   35.50  6=
40 664 680 720
 400 401 404 411 doublescan +hsync -vsync (49.3 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;640x400&quot;x60.0   20.00  64=
0 664 720 800=20
400 403 409 417 -hsync +vsync (25.0 kHz)
[  1090.956] (II) modeset(0): Modeline &quot;640x360&quot;x119.7   37.25  6=
40 672 736 832
 360 361 364 374 doublescan -hsync +vsync (44.8 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;640x360&quot;x119.7   31.88  6=
40 664 680 720
 360 361 364 370 doublescan +hsync -vsync (44.3 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;640x360&quot;x59.8   18.00  64=
0 664 720 800=20
360 363 368 376 -hsync +vsync (22.5 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;640x360&quot;x59.3   17.75  64=
0 688 720 800=20
360 363 368 374 +hsync -vsync (22.2 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;640x350&quot;x59.8   17.52  64=
0 664 720 800=20
350 353 363 366 -hsync +vsync (21.9 kHz)
[  1090.956] (II) modeset(0): Modeline &quot;512x384&quot;x120.0   32.50  5=
12 524 592 672
 384 385 388 403 doublescan -hsync -vsync (48.4 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;512x288&quot;x120.0   23.25  5=
12 532 580 648
 288 289 292 299 doublescan -hsync +vsync (35.9 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;512x288&quot;x119.8   21.00  5=
12 536 552 592
 288 289 292 296 doublescan +hsync -vsync (35.5 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;480x270&quot;x119.3   20.38  4=
80 496 544 608
 270 271 274 281 doublescan -hsync +vsync (33.5 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;480x270&quot;x119.6   18.62  4=
80 504 520 560
 270 271 274 278 doublescan +hsync -vsync (33.3 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;400x300&quot;x120.6   20.00  4=
00 420 484 528
 300 300 302 314 doublescan +hsync +vsync (37.9 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;400x300&quot;x112.7   18.00  4=
00 412 448 512
 300 300 301 312 doublescan +hsync +vsync (35.2 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;432x243&quot;x119.8   16.25  4=
32 444 484 536
 243 244 247 253 doublescan -hsync +vsync (30.3 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;432x243&quot;x119.1   15.25  4=
32 456 472 512
 243 244 247 250 doublescan +hsync -vsync (29.8 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;320x240&quot;x120.1   12.59  3=
20 328 376 400
 240 245 246 262 doublescan -hsync -vsync (31.5 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;360x202&quot;x119.0   11.25  3=
60 372 404 448
 202 204 206 211 doublescan -hsync +vsync (25.1 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;360x202&quot;x118.3   10.88  3=
60 384 400 440
 202 204 206 209 doublescan +hsync -vsync (24.7 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;320x180&quot;x119.7    9.00  3=
20 332 360 400
 180 181 184 188 doublescan -hsync +vsync (22.5 kHz d)
[  1090.956] (II) modeset(0): Modeline &quot;320x180&quot;x118.6    8.88  3=
20 344 360 400
 180 181 184 187 doublescan +hsync -vsync (22.2 kHz d)
[  1090.956] (II) modeset(0): Output DP-1 disconnected
[  1090.956] (II) modeset(0): Output DP-2 disconnected
[  1090.956] (II) modeset(0): Output DP-3 disconnected
[  1090.956] (II) modeset(0): Output eDP-1 connected
[  1090.956] (II) modeset(0): Using exact sizes for initial modes
[  1090.956] (II) modeset(0): Output eDP-1 using initial mode 1920x1080 +0+0
[  1090.956] (=3D=3D) modeset(0): Using gamma correction (1.0, 1.0, 1.0)
[  1090.956] (=3D=3D) modeset(0): DPI set to (96, 96)
[  1090.956] (II) Loading sub module &quot;fb&quot;
[  1090.956] (II) LoadModule: &quot;fb&quot;
[  1090.956] (II) Loading /usr/lib64/xorg/modules/libfb.so
[  1090.956] (II) Module fb: vendor=3D&quot;X.Org Foundation&quot;
[  1090.956]    compiled for 1.20.4, module version =3D 1.0.0
[  1090.956]    ABI class: X.Org ANSI C Emulation, version 0.4
[  1090.956] (II) UnloadModule: &quot;fbdev&quot;
[  1090.956] (II) Unloading fbdev
[  1090.956] (II) UnloadSubModule: &quot;fbdevhw&quot;
[  1090.957] (II) Unloading fbdevhw
[  1090.957] (II) UnloadModule: &quot;vesa&quot;
[  1090.957] (II) Unloading vesa
[  1090.968] (=3D=3D) modeset(0): Backing store enabled
[  1090.968] (=3D=3D) modeset(0): Silken mouse enabled
[  1090.971] (II) modeset(0): Initializing kms color map for depth 24, 8 bp=
c.
[  1090.971] (=3D=3D) modeset(0): DPMS enabled
[  1090.972] (II) modeset(0): [DRI2] Setup complete
[  1090.972] (II) modeset(0): [DRI2]   DRI driver: nouveau
[  1090.972] (II) modeset(0): [DRI2]   VDPAU driver: nouveau
[  1090.972] (II) Initializing extension Generic Event Extension
[  1090.972] (II) Initializing extension SHAPE
[  1090.972] (II) Initializing extension MIT-SHM
[  1090.972] (II) Initializing extension XInputExtension
[  1090.972] (II) Initializing extension XTEST
[  1090.972] (II) Initializing extension BIG-REQUESTS
[  1090.972] (II) Initializing extension SYNC
[  1090.972] (II) Initializing extension XKEYBOARD
[  1090.972] (II) Initializing extension XC-MISC
[  1090.972] (II) Initializing extension XFIXES
[  1090.972] (II) Initializing extension RENDER
[  1090.973] (II) Initializing extension RANDR
[  1090.973] (II) Initializing extension COMPOSITE
[  1090.973] (II) Initializing extension DAMAGE
[  1090.973] (II) Initializing extension MIT-SCREEN-SAVER
[  1090.973] (II) Initializing extension DOUBLE-BUFFER
[  1090.973] (II) Initializing extension RECORD
[  1090.973] (II) Initializing extension DPMS
[  1090.973] (II) Initializing extension Present
[  1090.973] (II) Initializing extension DRI3
[  1090.973] (II) Initializing extension X-Resource
[  1090.973] (II) Initializing extension XVideo
[  1090.973] (II) Initializing extension XVideo-MotionCompensation
[  1090.973] (II) Initializing extension SELinux
[  1090.974] (II) SELinux: Disabled by boolean
[  1090.974] (II) Initializing extension GLX
[  1090.976] (II) AIGLX: Loaded and initialized nouveau
[  1090.976] (II) GLX: Initialized DRI2 GL provider for screen 0
[  1090.976] (II) Initializing extension XFree86-VidModeExtension
[  1090.977] (II) Initializing extension XFree86-DGA
[  1090.977] (II) Initializing extension XFree86-DRI
[  1090.977] (II) Initializing extension DRI2
[  1090.978] (II) modeset(0): Damage tracking initialized
[  1090.978] (II) modeset(0): Setting screen physical size to 508 x 285
[  1091.005] (II) config/udev: Adding input device Power Button
(/dev/input/event2)
[  1091.005] (**) Power Button: Applying InputClass &quot;evdev keyboard ca=
tchall&quot;
[  1091.005] (**) Power Button: Applying InputClass &quot;libinput keyboard
catchall&quot;
[  1091.005] (**) Power Button: Applying InputClass &quot;system-keyboard&q=
uot;
[  1091.005] (II) LoadModule: &quot;libinput&quot;
[  1091.005] (II) Loading /usr/lib64/xorg/modules/input/libinput_drv.so
[  1091.009] (II) Module libinput: vendor=3D&quot;X.Org Foundation&quot;
[  1091.009]    compiled for 1.20.3, module version =3D 0.28.2
[  1091.009]    Module class: X.Org XInput Driver
[  1091.009]    ABI class: X.Org XInput driver, version 24.1
[  1091.009] (II) Using input driver 'libinput' for 'Power Button'
[  1091.010] (II) systemd-logind: got fd for /dev/input/event2 13:66 fd 26
paused 0
[  1091.010] (**) Power Button: always reports core events
[  1091.010] (**) Option &quot;Device&quot; &quot;/dev/input/event2&quot;
[  1091.010] (**) Option &quot;_source&quot; &quot;server/udev&quot;
[  1091.011] (II) event2  - Power Button: is tagged by udev as: Keyboard
[  1091.011] (II) event2  - Power Button: device is a keyboard
[  1091.011] (II) event2  - Power Button: device removed
[  1091.011] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input2/event2&quot;
[  1091.011] (II) XINPUT: Adding extended input device &quot;Power Button&q=
uot; (type:
KEYBOARD, id 6)
[  1091.011] (**) Option &quot;xkb_layout&quot; &quot;us&quot;
[  1091.012] (II) event2  - Power Button: is tagged by udev as: Keyboard
[  1091.012] (II) event2  - Power Button: device is a keyboard
[  1091.012] (II) config/udev: Adding input device Video Bus
(/dev/input/event6)
[  1091.012] (**) Video Bus: Applying InputClass &quot;evdev keyboard catch=
all&quot;
[  1091.012] (**) Video Bus: Applying InputClass &quot;libinput keyboard ca=
tchall&quot;
[  1091.012] (**) Video Bus: Applying InputClass &quot;system-keyboard&quot;
[  1091.012] (II) Using input driver 'libinput' for 'Video Bus'
[  1091.013] (II) systemd-logind: got fd for /dev/input/event6 13:70 fd 29
paused 0
[  1091.013] (**) Video Bus: always reports core events
[  1091.013] (**) Option &quot;Device&quot; &quot;/dev/input/event6&quot;
[  1091.013] (**) Option &quot;_source&quot; &quot;server/udev&quot;
[  1091.013] (II) event6  - Video Bus: is tagged by udev as: Keyboard
[  1091.013] (II) event6  - Video Bus: device is a keyboard
[  1091.013] (II) event6  - Video Bus: device removed
[  1091.014] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:06/LNXVID=
EO:00/input/input12/event6&quot;
[  1091.014] (II) XINPUT: Adding extended input device &quot;Video Bus&quot=
; (type:
KEYBOARD, id 7)
[  1091.014] (**) Option &quot;xkb_layout&quot; &quot;us&quot;
[  1091.014] (II) event6  - Video Bus: is tagged by udev as: Keyboard
[  1091.014] (II) event6  - Video Bus: device is a keyboard
[  1091.015] (II) config/udev: Adding input device Lid Switch
(/dev/input/event1)
[  1091.015] (II) No input driver specified, ignoring this device.
[  1091.015] (II) This device may have been added with another device file.
[  1091.015] (II) config/udev: Adding input device Sleep Button
(/dev/input/event0)
[  1091.015] (**) Sleep Button: Applying InputClass &quot;evdev keyboard ca=
tchall&quot;
[  1091.015] (**) Sleep Button: Applying InputClass &quot;libinput keyboard
catchall&quot;
[  1091.015] (**) Sleep Button: Applying InputClass &quot;system-keyboard&q=
uot;
[  1091.015] (II) Using input driver 'libinput' for 'Sleep Button'
[  1091.016] (II) systemd-logind: got fd for /dev/input/event0 13:64 fd 30
paused 0
[  1091.016] (**) Sleep Button: always reports core events
[  1091.016] (**) Option &quot;Device&quot; &quot;/dev/input/event0&quot;
[  1091.016] (**) Option &quot;_source&quot; &quot;server/udev&quot;
[  1091.016] (II) event0  - Sleep Button: is tagged by udev as: Keyboard
[  1091.016] (II) event0  - Sleep Button: device is a keyboard
[  1091.017] (II) event0  - Sleep Button: device removed
[  1091.017] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input0/eve=
nt0&quot;
[  1091.017] (II) XINPUT: Adding extended input device &quot;Sleep Button&q=
uot; (type:
KEYBOARD, id 8)
[  1091.017] (**) Option &quot;xkb_layout&quot; &quot;us&quot;
[  1091.017] (II) event0  - Sleep Button: is tagged by udev as: Keyboard
[  1091.017] (II) event0  - Sleep Button: device is a keyboard
[  1091.018] (II) config/udev: Adding input device HP HD Camera: HP HD Came=
ra
(/dev/input/event11)
[  1091.018] (**) HP HD Camera: HP HD Camera: Applying InputClass &quot;evd=
ev
keyboard catchall&quot;
[  1091.018] (**) HP HD Camera: HP HD Camera: Applying InputClass &quot;lib=
input
keyboard catchall&quot;
[  1091.018] (**) HP HD Camera: HP HD Camera: Applying InputClass
&quot;system-keyboard&quot;
[  1091.018] (II) Using input driver 'libinput' for 'HP HD Camera: HP HD
Camera'
[  1091.019] (II) systemd-logind: got fd for /dev/input/event11 13:75 fd 31
paused 0
[  1091.019] (**) HP HD Camera: HP HD Camera: always reports core events
[  1091.019] (**) Option &quot;Device&quot; &quot;/dev/input/event11&quot;
[  1091.019] (**) Option &quot;_source&quot; &quot;server/udev&quot;
[  1091.020] (II) event11 - HP HD Camera: HP HD Camera: is tagged by udev a=
s:
Keyboard
[  1091.020] (II) event11 - HP HD Camera: HP HD Camera: device is a keyboard
[  1091.020] (II) event11 - HP HD Camera: HP HD Camera: device removed
[  1091.020] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/input/inpu=
t17/event11&quot;
[  1091.020] (II) XINPUT: Adding extended input device &quot;HP HD Camera: =
HP HD
Camera&quot; (type: KEYBOARD, id 9)
[  1091.020] (**) Option &quot;xkb_layout&quot; &quot;us&quot;
[  1091.021] (II) event11 - HP HD Camera: HP HD Camera: is tagged by udev a=
s:
Keyboard
[  1091.021] (II) event11 - HP HD Camera: HP HD Camera: device is a keyboard
[  1091.021] (II) config/udev: Adding input device HDA Intel PCH Mic
(/dev/input/event8)
[  1091.021] (II) No input driver specified, ignoring this device.
[  1091.021] (II) This device may have been added with another device file.
[  1091.022] (II) config/udev: Adding input device HDA Intel PCH Headphone
(/dev/input/event9)
[  1091.022] (II) No input driver specified, ignoring this device.
[  1091.022] (II) This device may have been added with another device file.
[  1091.022] (II) config/udev: Adding input device AT Translated Set 2 keyb=
oard
(/dev/input/event3)
[  1091.022] (**) AT Translated Set 2 keyboard: Applying InputClass &quot;e=
vdev
keyboard catchall&quot;
[  1091.022] (**) AT Translated Set 2 keyboard: Applying InputClass &quot;l=
ibinput
keyboard catchall&quot;
[  1091.022] (**) AT Translated Set 2 keyboard: Applying InputClass
&quot;system-keyboard&quot;
[  1091.022] (II) Using input driver 'libinput' for 'AT Translated Set 2
keyboard'
[  1091.023] (II) systemd-logind: got fd for /dev/input/event3 13:67 fd 32
paused 0
[  1091.023] (**) AT Translated Set 2 keyboard: always reports core events
[  1091.023] (**) Option &quot;Device&quot; &quot;/dev/input/event3&quot;
[  1091.023] (**) Option &quot;_source&quot; &quot;server/udev&quot;
[  1091.024] (II) event3  - AT Translated Set 2 keyboard: is tagged by udev=
 as:
Keyboard
[  1091.024] (II) event3  - AT Translated Set 2 keyboard: device is a keybo=
ard
[  1091.024] (II) event3  - AT Translated Set 2 keyboard: device removed
[  1091.024] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/platform/i8042/serio0/input/input3/event3&quot;
[  1091.024] (II) XINPUT: Adding extended input device &quot;AT Translated =
Set 2
keyboard&quot; (type: KEYBOARD, id 10)
[  1091.024] (**) Option &quot;xkb_layout&quot; &quot;us&quot;
[  1091.025] (II) event3  - AT Translated Set 2 keyboard: is tagged by udev=
 as:
Keyboard
[  1091.025] (II) event3  - AT Translated Set 2 keyboard: device is a keybo=
ard
[  1091.026] (II) config/udev: Adding input device PS/2 Generic Mouse
(/dev/input/event4)
[  1091.026] (**) PS/2 Generic Mouse: Applying InputClass &quot;evdev point=
er
catchall&quot;
[  1091.026] (**) PS/2 Generic Mouse: Applying InputClass &quot;libinput po=
inter
catchall&quot;
[  1091.026] (II) Using input driver 'libinput' for 'PS/2 Generic Mouse'
[  1091.026] (II) systemd-logind: got fd for /dev/input/event4 13:68 fd 33
paused 0
[  1091.027] (**) PS/2 Generic Mouse: always reports core events
[  1091.027] (**) Option &quot;Device&quot; &quot;/dev/input/event4&quot;
[  1091.027] (**) Option &quot;_source&quot; &quot;server/udev&quot;
[  1091.027] (II) event4  - PS/2 Generic Mouse: is tagged by udev as: Mouse
[  1091.027] (II) event4  - PS/2 Generic Mouse: device is a pointer
[  1091.028] (II) event4  - PS/2 Generic Mouse: device removed
[  1091.028] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/platform/i8042/serio2/input/input9/event4&quot;
[  1091.028] (II) XINPUT: Adding extended input device &quot;PS/2 Generic M=
ouse&quot;
(type: MOUSE, id 11)
[  1091.028] (**) Option &quot;AccelerationScheme&quot; &quot;none&quot;
[  1091.028] (**) PS/2 Generic Mouse: (accel) selected scheme none/0
[  1091.028] (**) PS/2 Generic Mouse: (accel) acceleration factor: 2.000
[  1091.028] (**) PS/2 Generic Mouse: (accel) acceleration threshold: 4
[  1091.028] (II) event4  - PS/2 Generic Mouse: is tagged by udev as: Mouse
[  1091.028] (II) event4  - PS/2 Generic Mouse: device is a pointer
[  1091.029] (II) config/udev: Adding input device PS/2 Generic Mouse
(/dev/input/mouse0)
[  1091.029] (II) No input driver specified, ignoring this device.
[  1091.029] (II) This device may have been added with another device file.
[  1091.029] (II) config/udev: Adding input device SynPS/2 Synaptics TouchP=
ad
(/dev/input/event5)
[  1091.029] (**) SynPS/2 Synaptics TouchPad: Applying InputClass &quot;evd=
ev
touchpad catchall&quot;
[  1091.029] (**) SynPS/2 Synaptics TouchPad: Applying InputClass &quot;lib=
input
touchpad catchall&quot;
[  1091.029] (II) Using input driver 'libinput' for 'SynPS/2 Synaptics
TouchPad'
[  1091.030] (II) systemd-logind: got fd for /dev/input/event5 13:69 fd 34
paused 0
[  1091.030] (**) SynPS/2 Synaptics TouchPad: always reports core events
[  1091.030] (**) Option &quot;Device&quot; &quot;/dev/input/event5&quot;
[  1091.030] (**) Option &quot;_source&quot; &quot;server/udev&quot;
[  1091.031] (II) event5  - SynPS/2 Synaptics TouchPad: is tagged by udev a=
s:
Touchpad
[  1091.038] (II) event5  - SynPS/2 Synaptics TouchPad: device is a touchpad
[  1091.038] (II) event5  - SynPS/2 Synaptics TouchPad: device removed
[  1091.038] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/platform/i8042/serio3/input/input10/event5&quot;
[  1091.038] (II) XINPUT: Adding extended input device &quot;SynPS/2 Synapt=
ics
TouchPad&quot; (type: TOUCHPAD, id 12)
[  1091.038] (**) Option &quot;AccelerationScheme&quot; &quot;none&quot;
[  1091.038] (**) SynPS/2 Synaptics TouchPad: (accel) selected scheme none/0
[  1091.038] (**) SynPS/2 Synaptics TouchPad: (accel) acceleration factor:
2.000
[  1091.038] (**) SynPS/2 Synaptics TouchPad: (accel) acceleration threshol=
d: 4
[  1091.039] (II) event5  - SynPS/2 Synaptics TouchPad: is tagged by udev a=
s:
Touchpad
[  1091.045] (II) event5  - SynPS/2 Synaptics TouchPad: device is a touchpad
[  1091.045] (II) config/udev: Adding input device SynPS/2 Synaptics TouchP=
ad
(/dev/input/mouse1)
[  1091.045] (II) No input driver specified, ignoring this device.
[  1091.045] (II) This device may have been added with another device file.
[  1091.046] (II) config/udev: Adding input device ST LIS3LV02DL Accelerome=
ter
(/dev/input/event12)
[  1091.046] (II) No input driver specified, ignoring this device.
[  1091.046] (II) This device may have been added with another device file.
[  1091.046] (II) config/udev: Adding input device ST LIS3LV02DL Accelerome=
ter
(/dev/input/js0)
[  1091.046] (II) No input driver specified, ignoring this device.
[  1091.046] (II) This device may have been added with another device file.
[  1091.049] (II) config/udev: Adding input device HP Wireless hotkeys
(/dev/input/event7)
[  1091.049] (**) HP Wireless hotkeys: Applying InputClass &quot;evdev keyb=
oard
catchall&quot;
[  1091.049] (**) HP Wireless hotkeys: Applying InputClass &quot;libinput k=
eyboard
catchall&quot;
[  1091.049] (**) HP Wireless hotkeys: Applying InputClass &quot;system-key=
board&quot;
[  1091.049] (II) Using input driver 'libinput' for 'HP Wireless hotkeys'
[  1091.049] (II) systemd-logind: got fd for /dev/input/event7 13:71 fd 35
paused 0
[  1091.049] (**) HP Wireless hotkeys: always reports core events
[  1091.049] (**) Option &quot;Device&quot; &quot;/dev/input/event7&quot;
[  1091.049] (**) Option &quot;_source&quot; &quot;server/udev&quot;
[  1091.050] (II) event7  - HP Wireless hotkeys: is tagged by udev as: Keyb=
oard
[  1091.050] (II) event7  - HP Wireless hotkeys: device is a keyboard
[  1091.050] (II) event7  - HP Wireless hotkeys: device removed
[  1091.050] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/virtual/input/input13/event7&quot;
[  1091.050] (II) XINPUT: Adding extended input device &quot;HP Wireless ho=
tkeys&quot;
(type: KEYBOARD, id 13)
[  1091.050] (**) Option &quot;xkb_layout&quot; &quot;us&quot;
[  1091.050] (II) event7  - HP Wireless hotkeys: is tagged by udev as: Keyb=
oard
[  1091.050] (II) event7  - HP Wireless hotkeys: device is a keyboard
[  1091.051] (II) config/udev: Adding input device HP WMI hotkeys
(/dev/input/event10)
[  1091.051] (**) HP WMI hotkeys: Applying InputClass &quot;evdev keyboard =
catchall&quot;
[  1091.051] (**) HP WMI hotkeys: Applying InputClass &quot;libinput keyboa=
rd
catchall&quot;
[  1091.051] (**) HP WMI hotkeys: Applying InputClass &quot;system-keyboard=
&quot;
[  1091.051] (II) Using input driver 'libinput' for 'HP WMI hotkeys'
[  1091.051] (II) systemd-logind: got fd for /dev/input/event10 13:74 fd 36
paused 0
[  1091.051] (**) HP WMI hotkeys: always reports core events
[  1091.051] (**) Option &quot;Device&quot; &quot;/dev/input/event10&quot;
[  1091.051] (**) Option &quot;_source&quot; &quot;server/udev&quot;
[  1091.052] (II) event10 - HP WMI hotkeys: is tagged by udev as: Keyboard
Switch
[  1091.052] (II) event10 - HP WMI hotkeys: device is a keyboard
[  1091.052] (II) event10 - HP WMI hotkeys: device removed
[  1091.052] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/virtual/input/input14/event10&quot;
[  1091.052] (II) XINPUT: Adding extended input device &quot;HP WMI hotkeys=
&quot; (type:
KEYBOARD, id 14)
[  1091.052] (**) Option &quot;xkb_layout&quot; &quot;us&quot;
[  1091.052] (II) event10 - HP WMI hotkeys: is tagged by udev as: Keyboard
Switch
[  1091.052] (II) event10 - HP WMI hotkeys: device is a keyboard
[  1091.686] (II) modeset(0): EDID vendor &quot;LGD&quot;, prod id 1406
[  1091.686] (II) modeset(0): Printing DDC gathered Modelines:
[  1091.686] (II) modeset(0): Modeline &quot;1920x1080&quot;x0.0  138.70  1=
920 1968 2000
2080  1080 1083 1088 1111 +hsync -vsync (66.7 kHz eP)
[  1093.552] (II) modeset(0): EDID vendor &quot;LGD&quot;, prod id 1406
[  1093.552] (II) modeset(0): Printing DDC gathered Modelines:
[  1093.552] (II) modeset(0): Modeline &quot;1920x1080&quot;x0.0  138.70  1=
920 1968 2000
2080  1080 1083 1088 1111 +hsync -vsync (66.7 kHz eP)
[  3810.468] (II) modeset(0): EDID vendor &quot;LGD&quot;, prod id 1406
[  3810.468] (II) modeset(0): Printing DDC gathered Modelines:
[  3810.468] (II) modeset(0): Modeline &quot;1920x1080&quot;x0.0  138.70  1=
920 1968 2000
2080  1080 1083 1088 1111 +hsync -vsync (66.7 kHz eP)
[  3822.257] (II) config/udev: Adding input device Plantronics DSP55 Adapter
(/dev/input/event13)
[  3822.258] (**) Plantronics DSP55 Adapter: Applying InputClass &quot;evdev
keyboard catchall&quot;
[  3822.258] (**) Plantronics DSP55 Adapter: Applying InputClass &quot;libi=
nput
keyboard catchall&quot;
[  3822.258] (**) Plantronics DSP55 Adapter: Applying InputClass
&quot;system-keyboard&quot;
[  3822.258] (II) Using input driver 'libinput' for 'Plantronics DSP55 Adap=
ter'
[  3822.270] (II) systemd-logind: got fd for /dev/input/event13 13:77 fd 107
paused 0
[  3822.270] (**) Plantronics DSP55 Adapter: always reports core events
[  3822.270] (**) Option &quot;Device&quot; &quot;/dev/input/event13&quot;
[  3822.270] (**) Option &quot;_source&quot; &quot;server/udev&quot;
[  3822.271] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[  3822.271] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard
[  3822.271] (II) event13 - Plantronics DSP55 Adapter: device removed
[  3822.271] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.3/0003:047F:=
D055.0002/input/input19/event13&quot;
[  3822.271] (II) XINPUT: Adding extended input device &quot;Plantronics DS=
P55
Adapter&quot; (type: KEYBOARD, id 15)
[  3822.271] (**) Option &quot;xkb_layout&quot; &quot;us&quot;
[  3822.273] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[  3822.273] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard
[ 92625.201] (II) config/udev: removing device Plantronics DSP55 Adapter
[ 92625.201] (**) Option &quot;fd&quot; &quot;107&quot;
[ 92625.201] (II) event13 - Plantronics DSP55 Adapter: device removed
[ 92625.202] (II) UnloadModule: &quot;libinput&quot;
[ 92625.203] (II) systemd-logind: releasing fd for 13:77
[ 99767.777] (II) modeset(0): EDID vendor &quot;LGD&quot;, prod id 1406
[ 99767.777] (II) modeset(0): Printing DDC gathered Modelines:
[ 99767.777] (II) modeset(0): Modeline &quot;1920x1080&quot;x0.0  138.70  1=
920 1968 2000
2080  1080 1083 1088 1111 +hsync -vsync (66.7 kHz eP)
[134116.000] (II) modeset(0): Disabling kernel dirty updates, not required.
[446526.734] (II) config/udev: Adding input device Plantronics DSP55 Adapter
(/dev/input/event13)
[446526.735] (**) Plantronics DSP55 Adapter: Applying InputClass &quot;evdev
keyboard catchall&quot;
[446526.735] (**) Plantronics DSP55 Adapter: Applying InputClass &quot;libi=
nput
keyboard catchall&quot;
[446526.735] (**) Plantronics DSP55 Adapter: Applying InputClass
&quot;system-keyboard&quot;
[446526.735] (II) Using input driver 'libinput' for 'Plantronics DSP55 Adap=
ter'
[446526.752] (II) systemd-logind: got fd for /dev/input/event13 13:77 fd 115
paused 0
[446526.752] (**) Plantronics DSP55 Adapter: always reports core events
[446526.752] (**) Option &quot;Device&quot; &quot;/dev/input/event13&quot;
[446526.752] (**) Option &quot;_source&quot; &quot;server/udev&quot;
[446526.755] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[446526.755] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard
[446526.755] (II) event13 - Plantronics DSP55 Adapter: device removed
[446526.755] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.3/0003:047F:=
D055.0006/input/input20/event13&quot;
[446526.755] (II) XINPUT: Adding extended input device &quot;Plantronics DS=
P55
Adapter&quot; (type: KEYBOARD, id 15)
[446526.755] (**) Option &quot;xkb_layout&quot; &quot;us&quot;
[446526.757] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[446526.757] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard
[461669.974] (II) config/udev: removing device Plantronics DSP55 Adapter
[461669.974] (**) Option &quot;fd&quot; &quot;115&quot;
[461669.974] (II) event13 - Plantronics DSP55 Adapter: device removed
[461669.978] (II) UnloadModule: &quot;libinput&quot;
[461669.978] (II) systemd-logind: releasing fd for 13:77
[608174.860] (II) config/udev: Adding input device Plantronics DSP55 Adapter
(/dev/input/event13)
[608174.860] (**) Plantronics DSP55 Adapter: Applying InputClass &quot;evdev
keyboard catchall&quot;
[608174.860] (**) Plantronics DSP55 Adapter: Applying InputClass &quot;libi=
nput
keyboard catchall&quot;
[608174.860] (**) Plantronics DSP55 Adapter: Applying InputClass
&quot;system-keyboard&quot;
[608174.860] (II) Using input driver 'libinput' for 'Plantronics DSP55 Adap=
ter'
[608174.880] (II) systemd-logind: got fd for /dev/input/event13 13:77 fd 118
paused 0
[608174.880] (**) Plantronics DSP55 Adapter: always reports core events
[608174.880] (**) Option &quot;Device&quot; &quot;/dev/input/event13&quot;
[608174.880] (**) Option &quot;_source&quot; &quot;server/udev&quot;
[608174.882] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[608174.882] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard
[608174.882] (II) event13 - Plantronics DSP55 Adapter: device removed
[608174.882] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.3/0003:047F:=
D055.0008/input/input21/event13&quot;
[608174.882] (II) XINPUT: Adding extended input device &quot;Plantronics DS=
P55
Adapter&quot; (type: KEYBOARD, id 15)
[608174.882] (**) Option &quot;xkb_layout&quot; &quot;us&quot;
[608174.884] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[608174.884] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard
[648775.980] (II) config/udev: removing device Plantronics DSP55 Adapter
[648775.980] (**) Option &quot;fd&quot; &quot;118&quot;
[648775.980] (II) event13 - Plantronics DSP55 Adapter: device removed
[648775.985] (II) UnloadModule: &quot;libinput&quot;
[648775.985] (II) systemd-logind: releasing fd for 13:77
[701838.899] (II) config/udev: Adding input device Plantronics DSP55 Adapter
(/dev/input/event13)
[701838.900] (**) Plantronics DSP55 Adapter: Applying InputClass &quot;evdev
keyboard catchall&quot;
[701838.900] (**) Plantronics DSP55 Adapter: Applying InputClass &quot;libi=
nput
keyboard catchall&quot;
[701838.900] (**) Plantronics DSP55 Adapter: Applying InputClass
&quot;system-keyboard&quot;
[701838.900] (II) Using input driver 'libinput' for 'Plantronics DSP55 Adap=
ter'
[701838.913] (II) systemd-logind: got fd for /dev/input/event13 13:77 fd 101
paused 0
[701838.913] (**) Plantronics DSP55 Adapter: always reports core events
[701838.913] (**) Option &quot;Device&quot; &quot;/dev/input/event13&quot;
[701838.913] (**) Option &quot;_source&quot; &quot;server/udev&quot;
[701838.915] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[701838.915] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard
[701838.915] (II) event13 - Plantronics DSP55 Adapter: device removed
[701838.915] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.3/0003:047F:=
D055.0009/input/input22/event13&quot;
[701838.915] (II) XINPUT: Adding extended input device &quot;Plantronics DS=
P55
Adapter&quot; (type: KEYBOARD, id 15)
[701838.915] (**) Option &quot;xkb_layout&quot; &quot;us&quot;
[701838.917] (II) event13 - Plantronics DSP55 Adapter: is tagged by udev as:
Keyboard
[701838.917] (II) event13 - Plantronics DSP55 Adapter: device is a keyboard

Although there is probably nothing new and/or useful here and given the lac=
k of
movement, I guess I will just go back to the nvidia driver, unfortunately.<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15599362543.b54c85Fc.17075--

--===============1038789075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1038789075==--
