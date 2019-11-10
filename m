Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826E9F61E1
	for <lists+nouveau@lfdr.de>; Sun, 10 Nov 2019 01:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41EB6E44E;
	Sun, 10 Nov 2019 00:01:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D8BA66E44E
 for <nouveau@lists.freedesktop.org>; Sun, 10 Nov 2019 00:01:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C067B720E2; Sun, 10 Nov 2019 00:01:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 10 Nov 2019 00:01:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: 7.7 (2012.06)
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: mszpak@wp.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-112239-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 112239] New: nouveau hangs video with TU116 -
 regression in kernel 5.3
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
Content-Type: multipart/mixed; boundary="===============1089741147=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1089741147==
Content-Type: multipart/alternative; boundary="15733440700.b67fE4.17887"
Content-Transfer-Encoding: 7bit


--15733440700.b67fE4.17887
Date: Sun, 10 Nov 2019 00:01:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112239

            Bug ID: 112239
           Summary: nouveau hangs video with TU116 - regression in kernel
                    5.3
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: mszpak@wp.pl
        QA Contact: xorg-team@lists.x.org

My GeForce GTX 1660 Ti mobile (NV168/TU116) in Hyperbook NH5/Clevo NH55RCQ
worked "fine" with some applied workarounds with kernel 5.2
(https://bugs.freedesktop.org/show_bug.cgi?id=3D110830#c14), however, with
upgrade to 5.3 it started to hang video on the NVidia card state switch. In
fact, I don't use it to render the output (is DynOff by default), but I can=
not
disable it in BIOS and when I open/close a laptop lid it is temporarily wak=
en
up to get back to sleep after a few seconds. It works that way in 5.2, but =
in
5.3 it "hangs video" on the consequtive switch (occasionally also during the
first X/gdm setup).

The key related errors in the system log:
> kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 []
(a lot of)

> kernel: nouveau 0000:01:00.0: fifo: fault 01 [VIRT_WRITE] at 000000000000=
2000 engine c0 [BAR2] client 08 [HUB/HOST_CPU_NB] reason 02 [PTE] on channe=
l -1 [017fedf000 unknown]
(every few seconds)

> kernel: nouveau 0000:01:00.0: DRM: failed to idle channel 0 [DRM]
> kernel: nouveau 0000:01:00.0: i2c: aux 0007: begin idle timeout ffffffff
> kernel: nouveau 0000:01:00.0: tmr: stalled at ffffffffffffffff
> kernel: ------------[ cut here ]------------
> kernel: nouveau 0000:01:00.0: timeout
> kernel: WARNING: CPU: 10 PID: 384 at drivers/gpu/drm/nouveau/nvkm/subdev/=
bar/g84.c:35 g84_bar_flush+0xcf/> 0xe0 [nouveau]
(and the end)


On boot (here with self rebuilt kernel-core-5.4.0-0.rc6.git0.1.fc30.x86_64 =
on
Fedora 30, but the errors are similar with 5.3) I see:

> Nov 1000:26:12 foobar kernel: Linux version 5.4.0-0.rc6.git0.1.fc30.x86_6=
4 (me@foobar) (gcc version 9.2.1 20190827 (Red Hat 9.2.1-1) (GCC)) #1 SMP S=
at Nov 9 18:47:45 CET 2019
...
> Nov 1000:26:12 foobar kernel: fb0: switching to inteldrmfb from EFI VGA
> Nov 1000:26:12 foobar kernel: Console: switching to colour dummy device 8=
0x25
> Nov 1000:26:12 foobar kernel: i915 0000:00:02.0: vgaarb: deactivate vga c=
onsole
> Nov 1000:26:12 foobar kernel: [drm] Supports vblank timestamp caching Rev=
 2 (21.10.2013).
> Nov 1000:26:12 foobar kernel: [drm] Driver supports precise vblank timest=
amp query.
> Nov 1000:26:12 foobar kernel: i915 0000:00:02.0: vgaarb: changed VGA deco=
des: olddecodes=3Dio+mem,decodes=3Dnone:owns=3Dio+mem
> Nov 1000:26:12 foobar kernel: [drm] Finished loading DMC firmware i915/kb=
l_dmc_ver1_04.bin (v1.4)
> Nov 1000:26:12 foobar kernel: MXM: GUID detected in BIOS
> Nov 1000:26:12 foobar kernel: ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument=
 #4 type mismatch - Found [Buffer], ACPI requires [Package] (20190816/nsarg=
uments-59)
> Nov 1000:26:12 foobar kernel: ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Arg=
ument #4 type mismatch - Found [Buffer], ACPI requires [Package] (20190816/=
nsarguments-59)
> Nov 1000:26:12 foobar kernel: pci 0000:01:00.0: optimus capabilities: ena=
bled, status dynamic power, hda bios codec supported
> Nov 1000:26:12 foobar kernel: VGA switcheroo: detected Optimus DSM method=
 \_SB_.PCI0.PEG0.PEGP handle
> Nov 1000:26:12 foobar kernel: nouveau: detected PR support, will not use =
DSM
> Nov 1000:26:12 foobar kernel: nouveau 0000:01:00.0: enabling device (0106=
 -> 0107)
> Nov 1000:26:12 foobar kernel: nouveau 0000:01:00.0: NVIDIA TU116 (168000a=
1)
...
> Nov 1000:26:13 foobar kernel: [drm] Initialized i915 1.6.0 20190822 for 0=
000:00:02.0 on minor 0
> Nov 1000:26:13 foobar kernel: logitech-djreceiver 0003:046D:C52F.0002: hi=
ddev96,hidraw1: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:00=
:14.0-1/input1
> Nov 1000:26:13 foobar kernel: logitech-djreceiver 0003:046D:C52F.0002: de=
vice of type QUAD or eQUAD (0x03) connected on slot 1
> Nov 1000:26:13 foobar kernel: input: Logitech Wireless Mouse PID:101f Mou=
se as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:046D:C52F.0002=
/0003:046D:101F.0005/input/input17
> Nov 1000:26:13 foobar kernel: input: Logitech Wireless Mouse PID:101f Con=
sumer Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:046=
D:C52F.0002/0003:046D:101F.0005/input/input18
> Nov 1000:26:13 foobar kernel: hid-generic 0003:046D:101F.0005: input,hidr=
aw4: USB HID v1.11 Mouse [Logitech Wireless Mouse PID:101f] on usb-0000:00:=
14.0-1/input1:1
> Nov 1000:26:13 foobar kernel: psmouse serio2: synaptics: queried max coor=
dinates: x [..5658], y [..4722]
> Nov 1000:26:13 foobar kernel: ACPI: Video Device [PEGP] (multi-head: no  =
rom: yes  post: no)
> Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: bios: version 90.16.2=
6.00.11
> Nov 1000:26:13 foobar kernel: input: Video Bus as /devices/LNXSYSTM:00/LN=
XSYBUS:00/PNP0A08:00/device:00/LNXVIDEO:00/input/input22
> Nov 1000:26:13 foobar kernel: ACPI: Video Device [GFX0] (multi-head: yes =
 rom: no  post: no)
> Nov 1000:26:13 foobar kernel: input: Video Bus as /devices/LNXSYSTM:00/LN=
XSYBUS:00/PNP0A08:00/LNXVIDEO:01/input/input23
> Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: fb: 6144 MiB GDDR6
> Nov 1000:26:13 foobar kernel: psmouse serio2: synaptics: queried min coor=
dinates: x [1284..], y [1130..]
> Nov 1000:26:13 foobar kernel: psmouse serio2: synaptics: Your touchpad (P=
NP: PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi ar=
e not used, you might want to try setting psmouse.synaptics_intertouch to 1=
 and report t>
> Nov 1000:26:13 foobar kernel: vga_switcheroo: enabled
> Nov 1000:26:13 foobar kernel: [TTM] Zone  kernel: Available graphics memo=
ry: 8047486 KiB
> Nov 1000:26:13 foobar kernel: [TTM] Zone   dma32: Available graphics memo=
ry: 2097152 KiB
> Nov 1000:26:13 foobar kernel: [TTM] Initializing pool allocator
> Nov 1000:26:13 foobar kernel: [TTM] Initializing DMA pool allocator
> Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: VRAM: 6144 MiB
> Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: GART: 536870912 =
MiB
> Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: BIT table 'A' no=
t found
> Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: BIT table 'L' no=
t found
> Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: TMDS table versi=
on 2.0
> Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: DCB version 4.1
> Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: DCB outp 00: 020=
02f52 00020010
> Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: DCB outp 01: 048=
14f76 04600010
> Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: DCB outp 02: 048=
14f72 00020010
> Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: DCB conn 02: 000=
10261
> Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: DCB conn 04: 010=
00446
> Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: failed to create=
 kernel channel, -22
> Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: MM: using COPY f=
or buffer copies
> Nov 1000:26:13 foobar kernel: [drm] Supports vblank timestamp caching Rev=
 2 (21.10.2013).
> Nov 1000:26:13 foobar kernel: [drm] Driver supports precise vblank timest=
amp query.
> Nov 1000:26:13 foobar kernel: [drm] Cannot find any crtc or sizes
> Nov 1000:26:13 foobar kernel: [drm] Initialized nouveau 1.3.1 20120801 fo=
r 0000:01:00.0 on minor 1
> Nov 1000:26:13 foobar kernel: [drm] Cannot find any crtc or sizes
> Nov 1000:26:13 foobar kernel: [drm] Cannot find any crtc or sizes
> Nov 1000:26:13 foobar kernel: psmouse serio2: synaptics: Touchpad model: =
1, fw: 9.16, id: 0x1e2a1, caps: 0xf00123/0x840300/0x2e800/0x500000, board i=
d: 3429, fw id: 2840755
> Nov 1000:26:13 foobar kernel: input: SynPS/2 Synaptics TouchPad as /devic=
es/platform/i8042/serio2/input/input10
> Nov 1000:26:13 foobar kernel: fbcon: i915drmfb (fb0) is primary device
> Nov 1000:26:13 foobar kernel: Console: switching to colour frame buffer d=
evice 240x75
> Nov 1000:26:13 foobar kernel: i915 0000:00:02.0: fb0: i915drmfb frame buf=
fer device


> Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: fault 09 [PHYS_=
WRITE] at 000000017fef0000 engine c0 [BAR2] client 08 [HUB/HOST_CPU_NB] rea=
son 0d [REGION_VIOLATION] on channel -1 [0000000000 unknown]
> Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: fault 09 [PHYS_=
WRITE] at 000000017fef0000 engine c0 [BAR2] client 08 [HUB/HOST_CPU_NB] rea=
son 0d [REGION_VIOLATION] on channel -1 [0000000000 unknown]
> Nov 1000:26:28 foobar kernel: snd_hda_intel 0000:01:00.1: Disabling MSI
> Nov 1000:26:28 foobar kernel: snd_hda_intel 0000:01:00.1: Handle vga_swit=
cheroo audio client
> Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 =
[]
> Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: fault 01 [VIRT_=
WRITE] at 000000000028b000 engine c0 [BAR2] client 08 [HUB/HOST_CPU_NB] rea=
son 04 [UNBOUND_INST_BLOCK] on channel -1 [0000000000 unknown]
> Nov 1000:26:28 foobar kernel: ieee80211 phy0: Selected rate control algor=
ithm 'iwl-mvm-rs'
> Nov 1000:26:28 foobar kernel: thermal thermal_zone3: failed to read out t=
hermal zone (-61)
> Nov 1000:26:28 foobar kernel: usb usb3: root hub lost power or was reset
> Nov 1000:26:28 foobar kernel: usb usb4: root hub lost power or was reset
> Nov 1000:26:28 foobar systemd-udevd[1143]: Using default interface naming=
 scheme 'v240'.
> Nov 1000:26:28 foobar systemd-udevd[1143]: link_config: autonegotiation i=
s unset or enabled, the speed and duplex are not writable.
> Nov 1000:26:28 foobar kernel: iwlwifi 0000:00:14.3 wlp0s20f3: renamed fro=
m wlan0
> Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 =
[]
> Nov 1000:26:28 foobar wireless[1394]: setting regulatory domain to PL bas=
ed on timezone (Europe/Warsaw)
> Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 =
[]
> Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 =
[]
> Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 =
[]
> Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 =
[]

"nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 []" happens number of times per
second, "fifo: fault 01 [VIRT_WRITE]" once a few seconds.

On the Nvidia card state switch (here I opened a lid) I observe something l=
ike
that:

> Nov 1000:27:20 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 =
[]
> Nov 1000:27:20 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 =
[]
> Nov 1000:27:20 foobar systemd-logind[1719]: Lid opened.
> Nov 1000:27:20 foobar /usr/libexec/gdm-x-session[2441]: (II) modeset(0): =
Allocate new frame buffer 3840x1200 stride
> Nov 1000:27:20 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 =
[]
> Nov 1000:27:20 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 =
[]
...
> Nov 1000:27:21 foobar /usr/libexec/gdm-x-session[2441]: (II) modeset(0): =
EDID vendor "SAM", prod id 1415
> Nov 1000:27:21 foobar /usr/libexec/gdm-x-session[2441]: (II) modeset(0): =
Using hsync ranges from config file
...
> Nov 1000:27:41 foobar kernel: nouveau 0000:01:00.0: DRM: failed to idle c=
hannel 0 [DRM]
> Nov 1000:27:41 foobar kernel: nouveau 0000:01:00.0: i2c: aux 0007: begin =
idle timeout ffffffff
> Nov 1000:27:44 foobar tracker-store[2907]: OK
> Nov 1000:27:44 foobar systemd[2370]: tracker-store.service: Succeeded.
> Nov 1000:27:47 foobar kernel: nouveau 0000:01:00.0: tmr: stalled at fffff=
fffffffffff
> Nov 1000:27:47 foobar kernel: ------------[ cut here ]------------
> Nov 1000:27:47 foobar kernel: nouveau 0000:01:00.0: timeout
> Nov 1000:27:47 foobar kernel: WARNING: CPU: 0 PID: 1085 at drivers/gpu/dr=
m/nouveau/nvkm/subdev/bar/g84.c:35 g84_bar_flush+0xcf/0xe0 [nouveau]
> Nov 1000:27:47 foobar kernel: Modules linked in: ccm rfcomm xt_CHECKSUM x=
t_MASQUERADE tun bridge stp llc nf_conntrack_netbios_ns nf_conntrack_broadc=
ast xt_CT ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv=
4 xt_conntrac>
> Nov 1000:27:47 foobar kernel:  libarc4 snd_hda_codec videobuf2_v4l2 btint=
el videobuf2_common iwlwifi kvm snd_hda_core snd_hwdep snd_seq snd_seq_devi=
ce irqbypass videodev mei_hdcp bluetooth intel_cstate iTCO_wdt mc iTCO_vend=
or_support sn>
> Nov 1000:27:47 foobar kernel: CPU: 0 PID: 1085 Comm: kworker/0:4 Tainted:=
 G           OE     5.4.0-0.rc6.git0.1.fc30.x86_64 #1
> Nov 1000:27:47 foobar kernel: Hardware name: Blue Technology Sp. z o.o. N=
H5_NH7/NH5_NH7, BIOS 1.07.03TBT 11/16/2018
> Nov 1000:27:47 foobar kernel: Workqueue: pm pm_runtime_work
> Nov 1000:27:47 foobar kernel: RIP: 0010:g84_bar_flush+0xcf/0xe0 [nouveau]
> Nov 1000:27:47 foobar kernel: Code: 8b 40 10 48 8b 78 10 4c 8b 6f 50 4d 8=
5 ed 75 03 4c 8b 2f e8 33 05 f0 e7 4c 89 ea 48 c7 c7 a4 74 92 c0 48 89 c6 e=
8 3f b4 96 e7 <0f> 0b eb a7 e8 58 b1 96 e7 0f 1f 84 00 00 00 00 00 0f 1f 44=
 00 00
> Nov 1000:27:47 foobar kernel: RSP: 0018:ffffaa40c06cb640 EFLAGS: 00010086
> Nov 1000:27:47 foobar kernel: RAX: 0000000000000000 RBX: ffff95f1d47dfc00=
 RCX: 0000000000000006
> Nov 1000:27:47 foobar kernel: RDX: 0000000000000007 RSI: 0000000000000082=
 RDI: ffff95f1e0217900
> Nov 1000:27:47 foobar kernel: RBP: ffff95f1dd6e6748 R08: 0000000000000001=
 R09: 00000000000016f2
> Nov 1000:27:47 foobar kernel: R10: 000000000000cc44 R11: 0000000000000003=
 R12: 0000000000000246
> Nov 1000:27:47 foobar kernel: R13: ffff95f1dcd96050 R14: 0000000000000000=
 R15: ffff95f18c17a0c0
> Nov 1000:27:47 foobar kernel: FS:  0000000000000000(0000) GS:ffff95f1e020=
0000(0000) knlGS:0000000000000000
> Nov 1000:27:47 foobar kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
> Nov 1000:27:47 foobar kernel: CR2: 00007f792a718e20 CR3: 000000040a60a003=
 CR4: 00000000003606f0
> Nov 1000:27:47 foobar kernel: Call Trace:
> Nov 1000:27:47 foobar kernel:  nv50_instobj_release+0x2f/0xc0 [nouveau]
> Nov 1000:27:47 foobar kernel:  nvkm_vmm_iter.constprop.0+0x2bc/0x810 [nou=
veau]
> Nov 1000:27:47 foobar kernel:  ? gp100_vmm_join+0x20/0x20 [nouveau]
> Nov 1000:27:47 foobar kernel:  nvkm_vmm_map+0x136/0x360 [nouveau]
> Nov 1000:27:47 foobar kernel:  ? gp100_vmm_join+0x20/0x20 [nouveau]
> Nov 1000:27:47 foobar kernel:  nvkm_mem_map_dma+0x56/0x80 [nouveau]
> Nov 1000:27:47 foobar kernel:  nvkm_uvmm_mthd+0x66a/0x780 [nouveau]
> Nov 1000:27:47 foobar kernel:  nvkm_ioctl+0xde/0x180 [nouveau]
> Nov 1000:27:47 foobar kernel:  nvif_object_mthd+0x104/0x130 [nouveau]
> Nov 1000:27:47 foobar kernel:  nvif_vmm_map+0x115/0x130 [nouveau]
> Nov 1000:27:47 foobar kernel:  nouveau_mem_map+0x8d/0x100 [nouveau]
> Nov 1000:27:47 foobar kernel:  nouveau_vma_map+0x44/0x70 [nouveau]
> Nov 1000:27:47 foobar kernel:  nouveau_bo_move_ntfy+0xcd/0xe0 [nouveau]
> Nov 1000:27:47 foobar kernel:  ttm_bo_handle_move_mem+0xd2/0x5a0 [ttm]
> Nov 1000:27:47 foobar kernel:  ttm_bo_evict+0x16f/0x1f0 [ttm]
> Nov 1000:27:47 foobar kernel:  ? __drm_legacy_pci_free+0x66/0x90 [drm]
> Nov 1000:27:47 foobar kernel:  ttm_mem_evict_first+0x273/0x360 [ttm]
> Nov 1000:27:47 foobar kernel:  ttm_bo_force_list_clean+0xa4/0x170 [ttm]
> Nov 1000:27:47 foobar kernel:  nouveau_do_suspend+0x80/0x170 [nouveau]
> Nov 1000:27:47 foobar kernel:  nouveau_pmops_runtime_suspend+0x40/0xa0 [n=
ouveau]
> Nov 1000:27:47 foobar kernel:  pci_pm_runtime_suspend+0x58/0x140
> Nov 1000:27:47 foobar kernel:  ? __switch_to_asm+0x40/0x70
> Nov 1000:27:47 foobar kernel:  ? pci_pm_thaw_noirq+0xa0/0xa0
> Nov 1000:27:47 foobar kernel:  __rpm_callback+0xc1/0x140
> Nov 1000:27:47 foobar kernel:  ? pci_pm_thaw_noirq+0xa0/0xa0
> Nov 1000:27:47 foobar kernel:  rpm_callback+0x1f/0x70
> Nov 1000:27:47 foobar kernel:  rpm_suspend+0x10a/0x5a0
> Nov 1000:27:47 foobar kernel:  ? __switch_to_asm+0x34/0x70
> Nov 1000:27:47 foobar kernel:  pm_runtime_work+0x86/0x90
> Nov 1000:27:47 foobar kernel:  process_one_work+0x1b0/0x350
> Nov 1000:27:47 foobar kernel:  worker_thread+0x50/0x3b0
> Nov 1000:27:47 foobar kernel:  kthread+0xfb/0x130
> Nov 1000:27:47 foobar kernel:  ? process_one_work+0x350/0x350
> Nov 1000:27:47 foobar kernel:  ? kthread_park+0x90/0x90
> Nov 1000:27:47 foobar kernel:  ret_from_fork+0x35/0x40
> Nov 1000:27:47 foobar kernel: ---[ end trace e70ebf987c8ad925 ]---
> Nov 1000:27:47 foobar kernel: nouveau 0000:01:00.0: tmr: stalled at fffff=
fffffffffff
> Nov 1000:27:47 foobar kernel: ------------[ cut here ]------------
> Nov 1000:27:47 foobar kernel: nouveau 0000:01:00.0: timeout
> Nov 1000:27:47 foobar kernel: WARNING: CPU: 0 PID: 1085 at drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmmtu102.c:44 tu102_vmm_flush+0x128/0x140 [nouvea=
u]
> Nov 1000:27:47 foobar kernel: Modules linked in: ccm rfcomm xt_CHECKSUM x=
t_MASQUERADE tun bridge stp llc nf_conntrack_netbios_ns nf_conntrack_broadc=
ast xt_CT ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv=
4 xt_conntrac>
> Nov 1000:27:47 foobar kernel:  libarc4 snd_hda_codec videobuf2_v4l2 btint=
el videobuf2_common iwlwifi kvm snd_hda_core snd_hwdep snd_seq snd_seq_devi=
ce irqbypass videodev mei_hdcp bluetooth intel_cstate iTCO_wdt mc iTCO_vend=
or_support sn>
> Nov 1000:27:47 foobar kernel: CPU: 0 PID: 1085 Comm: kworker/0:4 Tainted:=
 G        W  OE     5.4.0-0.rc6.git0.1.fc30.x86_64 #1
> Nov 1000:27:47 foobar kernel: Hardware name: Blue Technology Sp. z o.o. N=
H5_NH7/NH5_NH7, BIOS 1.07.03TBT 11/16/2018
> Nov 1000:27:47 foobar kernel: Workqueue: pm pm_runtime_work
> Nov 1000:27:47 foobar kernel: RIP: 0010:tu102_vmm_flush+0x128/0x140 [nouv=
eau]
> Nov 1000:27:47 foobar kernel: Code: 8b 40 10 48 8b 78 10 4c 8b 67 50 4d 8=
5 e4 75 03 4c 8b 27 e8 ca 19 eb e7 4c 89 e2 48 c7 c7 dc 8e 92 c0 48 89 c6 e=
8 d6 c8 91 e7 <0f> 0b eb aa e8 ef c5 91 e7 66 66 2e 0f 1f 84 00 00 00 00 00=
 0f 1f
> Nov 1000:27:47 foobar kernel: RSP: 0018:ffffaa40c06cb678 EFLAGS: 00010286
> Nov 1000:27:47 foobar kernel: RAX: 0000000000000000 RBX: ffff95f1d47dfc00=
 RCX: 0000000000000006
> Nov 1000:27:47 foobar kernel: RDX: 0000000000000007 RSI: 0000000000000092=
 RDI: ffff95f1e0217900
> Nov 1000:27:47 foobar kernel: RBP: ffff95f1dce73220 R08: 0000000000000001=
 R09: 000000000000172b
> Nov 1000:27:47 foobar kernel: R10: 000000000000e120 R11: 0000000000000003=
 R12: ffff95f1dcd96050
> Nov 1000:27:47 foobar kernel: R13: ffff95f1d457f200 R14: 0000000000000000=
 R15: ffff95f18c17a0c0
> Nov 1000:27:47 foobar kernel: FS:  0000000000000000(0000) GS:ffff95f1e020=
0000(0000) knlGS:0000000000000000
> Nov 1000:27:47 foobar kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
> Nov 1000:27:47 foobar kernel: CR2: 00007f792a718e20 CR3: 000000040a60a003=
 CR4: 00000000003606f0
> Nov 1000:27:47 foobar kernel: Call Trace:
> Nov 1000:27:47 foobar kernel:  nvkm_vmm_iter.constprop.0+0x34b/0x810 [nou=
veau]
> Nov 1000:27:47 foobar kernel:  ? gp100_vmm_join+0x20/0x20 [nouveau]

repeated (the stacktrace) a few times. Attached in a more complete form. Th=
e ""
are no longer visible.

On the consecutive laptop lid close the video hangs) - the music is still
playing, but caps lock doesn't turn on a led on my keyboard). In logs, afte=
r a
call trace I see "kernel: [TTM] Buffer eviction failed":

> Nov 1000:28:14 foobar systemd-logind[1719]: Lid closed.
...
> Nov 1000:28:15 foobar /usr/libexec/gdm-x-session[2441]: (II) modeset(0): =
Allocate new frame buffer 1920x1200 stride
> Nov 1000:28:16 foobar /usr/libexec/gdm-x-session[2441]: (II) modeset(0): =
EDID vendor "CMN", prod id 5608
> Nov 1000:28:16 foobar /usr/libexec/gdm-x-session[2441]: (II) modeset(0): =
Printing DDC gathered Modelines:
> Nov 1000:28:16 foobar /usr/libexec/gdm-x-session[2441]: (II) modeset(0): =
Modeline "1920x1080"x0.0  152.84  1920 2000 2054 2250  1080 1086 1094 1132 =
-hsync -vsync (67.9 kHz eP)
> Nov 1000:28:16 foobar /usr/libexec/gdm-x-session[2441]: (II) modeset(0): =
EDID vendor "SAM", prod id 1415
...
> Nov 1000:28:18 foobar kernel: nouveau 0000:01:00.0: tmr: stalled at fffff=
fffffffffff
> Nov 1000:28:18 foobar kernel: ------------[ cut here ]------------
> Nov 1000:28:18 foobar kernel: nouveau 0000:01:00.0: timeout
> Nov 1000:28:18 foobar kernel: WARNING: CPU: 0 PID: 1085 at drivers/gpu/dr=
m/nouveau/nvkm/subdev/bar/g84.c:35 g84_bar_flush+0xcf/0xe0 [nouveau]
> Nov 1000:28:18 foobar kernel: Modules linked in: ccm rfcomm xt_CHECKSUM x=
t_MASQUERADE tun bridge stp llc nf_conntrack_netbios_ns nf_conntrack_broadc=
ast xt_CT ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv=
4 xt_conntrac>
> Nov 1000:28:18 foobar kernel:  libarc4 snd_hda_codec videobuf2_v4l2 btint=
el videobuf2_common iwlwifi kvm snd_hda_core snd_hwdep snd_seq snd_seq_devi=
ce irqbypass videodev mei_hdcp bluetooth intel_cstate iTCO_wdt mc iTCO_vend=
or_support sn>
> Nov 1000:28:18 foobar kernel: CPU: 0 PID: 1085 Comm: kworker/0:4 Tainted:=
 G        W  OE     5.4.0-0.rc6.git0.1.fc30.x86_64 #1
> Nov 1000:28:18 foobar kernel: Hardware name: Blue Technology Sp. z o.o. N=
H5_NH7/NH5_NH7, BIOS 1.07.03TBT 11/16/2018
> Nov 1000:28:18 foobar kernel: Workqueue: pm pm_runtime_work
> Nov 1000:28:18 foobar kernel: RIP: 0010:g84_bar_flush+0xcf/0xe0 [nouveau]
...
> Nov 1000:28:18 foobar kernel: ---[ end trace e70ebf987c8ad92c ]---
> Nov 1000:28:18 foobar kernel: [TTM] Buffer eviction failed
> Nov 1000:28:19 foobar abrt-dump-journal-oops[1695]: abrt-dump-journal-oop=
s: Found oopses: 2
> Nov 1000:28:19 foobar abrt-dump-journal-oops[1695]: abrt-dump-journal-oop=
s: Creating problem directories
> Nov 1000:28:19 foobar abrt-server[10758]: Package 'kernel-core' isn't sig=
ned with proper key
> Nov 1000:28:19 foobar abrt-server[10758]: 'post-create' on '/var/spool/ab=
rt/oops-2019-11-10-00:28:19-1695-0' exited with 1
> Nov 1000:28:19 foobar abrt-server[10758]: Deleting problem directory '/va=
r/spool/abrt/oops-2019-11-10-00:28:19-1695-0'
> Nov 1000:28:20 foobar abrt-server[10761]: Package 'kernel-core' isn't sig=
ned with proper key
> Nov 1000:28:20 foobar abrt-server[10761]: 'post-create' on '/var/spool/ab=
rt/oops-2019-11-10-00:28:19-1695-1' exited with 1
> Nov 1000:28:20 foobar abrt-server[10761]: Deleting problem directory '/va=
r/spool/abrt/oops-2019-11-10-00:28:19-1695-1'
> Nov 1000:28:21 foobar abrt-dump-journal-oops[1695]: Reported 2 kernel oop=
ses to Abrt
> Nov 1000:28:33 foobar kernel: nouveau 0000:01:00.0: DRM: failed to idle c=
hannel 0 [DRM]
> Nov 1000:28:33 foobar kernel: BUG: unable to handle page fault for addres=
s: ffffaa41c0386ffc
> Nov 1000:28:33 foobar kernel: #PF: supervisor write access in kernel mode
> Nov 1000:28:33 foobar kernel: #PF: error_code(0x0002) - not-present page
> Nov 1000:28:33 foobar kernel: PGD 45e550067 P4D 45e550067 PUD 0=20
> Nov 1000:28:33 foobar kernel: Oops: 0002 [#1] SMP PTI
> Nov 1000:28:33 foobar kernel: CPU: 0 PID: 1085 Comm: kworker/0:4 Tainted:=
 G        W  OE     5.4.0-0.rc6.git0.1.fc30.x86_64 #1
> Nov 1000:28:33 foobar kernel: Hardware name: Blue Technology Sp. z o.o. N=
H5_NH7/NH5_NH7, BIOS 1.07.03TBT 11/16/2018
> Nov 1000:28:33 foobar kernel: Workqueue: pm pm_runtime_work
> Nov 1000:28:33 foobar kernel: RIP: 0010:evo_wait+0x5a/0x130 [nouveau]
...
> Nov 1000:28:40 foobar gsd-xsettings[2815]: Failed to get current display =
configuration state: Timeout was reached


> $ lspci | grep VGA
> 00:02.0 VGA compatible controller: Intel Corporation UHD Graphics 630 (Mo=
bile)
> 01:00.0 VGA compatible controller: NVIDIA Corporation TU116M [GeForce GTX=
 1660 Ti Mobile] (rev a1)


I've seen similar issue, however, in that case it is a regression - it work=
ed
fine with kernel 5.2 (tested since RC1 to 5.2.18) and it's broken in 5.3
(tested with 5.3.1 to 5.3.8 and 5.4.0-rc6).

I'm not sure which commit broke it (building the kernel takes some time), b=
ut
having some candidates I could try to verify before/after it occurs or not.


Btw, I'm looking for potential workarounds (better than sticking to 5.2.18)=
. I
don't use NVidia to render the output, so I could blacklist nouveau and use
bbswitch to keep NVidia card off. However, it would make testing newer kern=
el
versions somehow harder. Maybe I can disable something in nouveau to keep t=
he
card off and still do not suffer from the errors above?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15733440700.b67fE4.17887
Date: Sun, 10 Nov 2019 00:01:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau hangs video with TU116 - regression in kernel 5.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112239">112239</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau hangs video with TU116 - regression in kernel 5.3
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mszpak&#64;wp.pl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>My GeForce GTX 1660 Ti mobile (NV168/TU116) in Hyperbook NH5/C=
levo NH55RCQ
worked &quot;fine&quot; with some applied workarounds with kernel 5.2
(<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"show_bug.cgi?id=3D110830#c14">https://bugs.freedesktop.org/show_=
bug.cgi?id=3D110830#c14</a>), however, with
upgrade to 5.3 it started to hang video on the NVidia card state switch. In
fact, I don't use it to render the output (is DynOff by default), but I can=
not
disable it in BIOS and when I open/close a laptop lid it is temporarily wak=
en
up to get back to sleep after a few seconds. It works that way in 5.2, but =
in
5.3 it &quot;hangs video&quot; on the consequtive switch (occasionally also=
 during the
first X/gdm setup).

The key related errors in the system log:
<span class=3D"quote">&gt; kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR =
08 []</span >
(a lot of)

<span class=3D"quote">&gt; kernel: nouveau 0000:01:00.0: fifo: fault 01 [VI=
RT_WRITE] at 0000000000002000 engine c0 [BAR2] client 08 [HUB/HOST_CPU_NB] =
reason 02 [PTE] on channel -1 [017fedf000 unknown]</span >
(every few seconds)

<span class=3D"quote">&gt; kernel: nouveau 0000:01:00.0: DRM: failed to idl=
e channel 0 [DRM]
&gt; kernel: nouveau 0000:01:00.0: i2c: aux 0007: begin idle timeout ffffff=
ff
&gt; kernel: nouveau 0000:01:00.0: tmr: stalled at ffffffffffffffff
&gt; kernel: ------------[ cut here ]------------
&gt; kernel: nouveau 0000:01:00.0: timeout
&gt; kernel: WARNING: CPU: 10 PID: 384 at drivers/gpu/drm/nouveau/nvkm/subd=
ev/bar/g84.c:35 g84_bar_flush+0xcf/&gt; 0xe0 [nouveau]</span >
(and the end)


On boot (here with self rebuilt kernel-core-5.4.0-0.rc6.git0.1.fc30.x86_64 =
on
Fedora 30, but the errors are similar with 5.3) I see:

<span class=3D"quote">&gt; Nov 1000:26:12 foobar kernel: Linux version 5.4.=
0-0.rc6.git0.1.fc30.x86_64 (me&#64;foobar) (gcc version 9.2.1 20190827 (Red=
 Hat 9.2.1-1) (GCC)) #1 SMP Sat Nov 9 18:47:45 CET 2019</span >
...
<span class=3D"quote">&gt; Nov 1000:26:12 foobar kernel: fb0: switching to =
inteldrmfb from EFI VGA
&gt; Nov 1000:26:12 foobar kernel: Console: switching to colour dummy devic=
e 80x25
&gt; Nov 1000:26:12 foobar kernel: i915 0000:00:02.0: vgaarb: deactivate vg=
a console
&gt; Nov 1000:26:12 foobar kernel: [drm] Supports vblank timestamp caching =
Rev 2 (21.10.2013).
&gt; Nov 1000:26:12 foobar kernel: [drm] Driver supports precise vblank tim=
estamp query.
&gt; Nov 1000:26:12 foobar kernel: i915 0000:00:02.0: vgaarb: changed VGA d=
ecodes: olddecodes=3Dio+mem,decodes=3Dnone:owns=3Dio+mem
&gt; Nov 1000:26:12 foobar kernel: [drm] Finished loading DMC firmware i915=
/kbl_dmc_ver1_04.bin (v1.4)
&gt; Nov 1000:26:12 foobar kernel: MXM: GUID detected in BIOS
&gt; Nov 1000:26:12 foobar kernel: ACPI Warning: \_SB.PCI0.GFX0._DSM: Argum=
ent #4 type mismatch - Found [Buffer], ACPI requires [Package] (20190816/ns=
arguments-59)
&gt; Nov 1000:26:12 foobar kernel: ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: =
Argument #4 type mismatch - Found [Buffer], ACPI requires [Package] (201908=
16/nsarguments-59)
&gt; Nov 1000:26:12 foobar kernel: pci 0000:01:00.0: optimus capabilities: =
enabled, status dynamic power, hda bios codec supported
&gt; Nov 1000:26:12 foobar kernel: VGA switcheroo: detected Optimus DSM met=
hod \_SB_.PCI0.PEG0.PEGP handle
&gt; Nov 1000:26:12 foobar kernel: nouveau: detected PR support, will not u=
se DSM
&gt; Nov 1000:26:12 foobar kernel: nouveau 0000:01:00.0: enabling device (0=
106 -&gt; 0107)
&gt; Nov 1000:26:12 foobar kernel: nouveau 0000:01:00.0: NVIDIA TU116 (1680=
00a1)</span >
...
<span class=3D"quote">&gt; Nov 1000:26:13 foobar kernel: [drm] Initialized =
i915 1.6.0 20190822 for 0000:00:02.0 on minor 0
&gt; Nov 1000:26:13 foobar kernel: logitech-djreceiver 0003:046D:C52F.0002:=
 hiddev96,hidraw1: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000=
:00:14.0-1/input1
&gt; Nov 1000:26:13 foobar kernel: logitech-djreceiver 0003:046D:C52F.0002:=
 device of type QUAD or eQUAD (0x03) connected on slot 1
&gt; Nov 1000:26:13 foobar kernel: input: Logitech Wireless Mouse PID:101f =
Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:046D:C52F.0=
002/0003:046D:101F.0005/input/input17
&gt; Nov 1000:26:13 foobar kernel: input: Logitech Wireless Mouse PID:101f =
Consumer Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:=
046D:C52F.0002/0003:046D:101F.0005/input/input18
&gt; Nov 1000:26:13 foobar kernel: hid-generic 0003:046D:101F.0005: input,h=
idraw4: USB HID v1.11 Mouse [Logitech Wireless Mouse PID:101f] on usb-0000:=
00:14.0-1/input1:1
&gt; Nov 1000:26:13 foobar kernel: psmouse serio2: synaptics: queried max c=
oordinates: x [..5658], y [..4722]
&gt; Nov 1000:26:13 foobar kernel: ACPI: Video Device [PEGP] (multi-head: n=
o  rom: yes  post: no)
&gt; Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: bios: version 90.1=
6.26.00.11
&gt; Nov 1000:26:13 foobar kernel: input: Video Bus as /devices/LNXSYSTM:00=
/LNXSYBUS:00/PNP0A08:00/device:00/LNXVIDEO:00/input/input22
&gt; Nov 1000:26:13 foobar kernel: ACPI: Video Device [GFX0] (multi-head: y=
es  rom: no  post: no)
&gt; Nov 1000:26:13 foobar kernel: input: Video Bus as /devices/LNXSYSTM:00=
/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:01/input/input23
&gt; Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: fb: 6144 MiB GDDR6
&gt; Nov 1000:26:13 foobar kernel: psmouse serio2: synaptics: queried min c=
oordinates: x [1284..], y [1130..]
&gt; Nov 1000:26:13 foobar kernel: psmouse serio2: synaptics: Your touchpad=
 (PNP: PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi=
 are not used, you might want to try setting psmouse.synaptics_intertouch t=
o 1 and report t&gt;
&gt; Nov 1000:26:13 foobar kernel: vga_switcheroo: enabled
&gt; Nov 1000:26:13 foobar kernel: [TTM] Zone  kernel: Available graphics m=
emory: 8047486 KiB
&gt; Nov 1000:26:13 foobar kernel: [TTM] Zone   dma32: Available graphics m=
emory: 2097152 KiB
&gt; Nov 1000:26:13 foobar kernel: [TTM] Initializing pool allocator
&gt; Nov 1000:26:13 foobar kernel: [TTM] Initializing DMA pool allocator
&gt; Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: VRAM: 6144 MiB
&gt; Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: GART: 5368709=
12 MiB
&gt; Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: BIT table 'A'=
 not found
&gt; Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: BIT table 'L'=
 not found
&gt; Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: TMDS table ve=
rsion 2.0
&gt; Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: DCB version 4=
.1
&gt; Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: DCB outp 00: =
02002f52 00020010
&gt; Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: DCB outp 01: =
04814f76 04600010
&gt; Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: DCB outp 02: =
04814f72 00020010
&gt; Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: DCB conn 02: =
00010261
&gt; Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: DCB conn 04: =
01000446
&gt; Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: failed to cre=
ate kernel channel, -22
&gt; Nov 1000:26:13 foobar kernel: nouveau 0000:01:00.0: DRM: MM: using COP=
Y for buffer copies
&gt; Nov 1000:26:13 foobar kernel: [drm] Supports vblank timestamp caching =
Rev 2 (21.10.2013).
&gt; Nov 1000:26:13 foobar kernel: [drm] Driver supports precise vblank tim=
estamp query.
&gt; Nov 1000:26:13 foobar kernel: [drm] Cannot find any crtc or sizes
&gt; Nov 1000:26:13 foobar kernel: [drm] Initialized nouveau 1.3.1 20120801=
 for 0000:01:00.0 on minor 1
&gt; Nov 1000:26:13 foobar kernel: [drm] Cannot find any crtc or sizes
&gt; Nov 1000:26:13 foobar kernel: [drm] Cannot find any crtc or sizes
&gt; Nov 1000:26:13 foobar kernel: psmouse serio2: synaptics: Touchpad mode=
l: 1, fw: 9.16, id: 0x1e2a1, caps: 0xf00123/0x840300/0x2e800/0x500000, boar=
d id: 3429, fw id: 2840755
&gt; Nov 1000:26:13 foobar kernel: input: SynPS/2 Synaptics TouchPad as /de=
vices/platform/i8042/serio2/input/input10
&gt; Nov 1000:26:13 foobar kernel: fbcon: i915drmfb (fb0) is primary device
&gt; Nov 1000:26:13 foobar kernel: Console: switching to colour frame buffe=
r device 240x75
&gt; Nov 1000:26:13 foobar kernel: i915 0000:00:02.0: fb0: i915drmfb frame =
buffer device</span >


<span class=3D"quote">&gt; Nov 1000:26:28 foobar kernel: nouveau 0000:01:00=
.0: fifo: fault 09 [PHYS_WRITE] at 000000017fef0000 engine c0 [BAR2] client=
 08 [HUB/HOST_CPU_NB] reason 0d [REGION_VIOLATION] on channel -1 [000000000=
0 unknown]
&gt; Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: fault 09 [PH=
YS_WRITE] at 000000017fef0000 engine c0 [BAR2] client 08 [HUB/HOST_CPU_NB] =
reason 0d [REGION_VIOLATION] on channel -1 [0000000000 unknown]
&gt; Nov 1000:26:28 foobar kernel: snd_hda_intel 0000:01:00.1: Disabling MSI
&gt; Nov 1000:26:28 foobar kernel: snd_hda_intel 0000:01:00.1: Handle vga_s=
witcheroo audio client
&gt; Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR =
08 []
&gt; Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: fault 01 [VI=
RT_WRITE] at 000000000028b000 engine c0 [BAR2] client 08 [HUB/HOST_CPU_NB] =
reason 04 [UNBOUND_INST_BLOCK] on channel -1 [0000000000 unknown]
&gt; Nov 1000:26:28 foobar kernel: ieee80211 phy0: Selected rate control al=
gorithm 'iwl-mvm-rs'
&gt; Nov 1000:26:28 foobar kernel: thermal thermal_zone3: failed to read ou=
t thermal zone (-61)
&gt; Nov 1000:26:28 foobar kernel: usb usb3: root hub lost power or was res=
et
&gt; Nov 1000:26:28 foobar kernel: usb usb4: root hub lost power or was res=
et
&gt; Nov 1000:26:28 foobar systemd-udevd[1143]: Using default interface nam=
ing scheme 'v240'.
&gt; Nov 1000:26:28 foobar systemd-udevd[1143]: link_config: autonegotiatio=
n is unset or enabled, the speed and duplex are not writable.
&gt; Nov 1000:26:28 foobar kernel: iwlwifi 0000:00:14.3 wlp0s20f3: renamed =
from wlan0
&gt; Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR =
08 []
&gt; Nov 1000:26:28 foobar wireless[1394]: setting regulatory domain to PL =
based on timezone (Europe/Warsaw)
&gt; Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR =
08 []
&gt; Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR =
08 []
&gt; Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR =
08 []
&gt; Nov 1000:26:28 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR =
08 []</span >

&quot;nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 []&quot; happens number of=
 times per
second, &quot;fifo: fault 01 [VIRT_WRITE]&quot; once a few seconds.

On the Nvidia card state switch (here I opened a lid) I observe something l=
ike
that:

<span class=3D"quote">&gt; Nov 1000:27:20 foobar kernel: nouveau 0000:01:00=
.0: fifo: SCHED_ERROR 08 []
&gt; Nov 1000:27:20 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR =
08 []
&gt; Nov 1000:27:20 foobar systemd-logind[1719]: Lid opened.
&gt; Nov 1000:27:20 foobar /usr/libexec/gdm-x-session[2441]: (II) modeset(0=
): Allocate new frame buffer 3840x1200 stride
&gt; Nov 1000:27:20 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR =
08 []
&gt; Nov 1000:27:20 foobar kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR =
08 []</span >
...
<span class=3D"quote">&gt; Nov 1000:27:21 foobar /usr/libexec/gdm-x-session=
[2441]: (II) modeset(0): EDID vendor &quot;SAM&quot;, prod id 1415
&gt; Nov 1000:27:21 foobar /usr/libexec/gdm-x-session[2441]: (II) modeset(0=
): Using hsync ranges from config file</span >
...
<span class=3D"quote">&gt; Nov 1000:27:41 foobar kernel: nouveau 0000:01:00=
.0: DRM: failed to idle channel 0 [DRM]
&gt; Nov 1000:27:41 foobar kernel: nouveau 0000:01:00.0: i2c: aux 0007: beg=
in idle timeout ffffffff
&gt; Nov 1000:27:44 foobar tracker-store[2907]: OK
&gt; Nov 1000:27:44 foobar systemd[2370]: tracker-store.service: Succeeded.
&gt; Nov 1000:27:47 foobar kernel: nouveau 0000:01:00.0: tmr: stalled at ff=
ffffffffffffff
&gt; Nov 1000:27:47 foobar kernel: ------------[ cut here ]------------
&gt; Nov 1000:27:47 foobar kernel: nouveau 0000:01:00.0: timeout
&gt; Nov 1000:27:47 foobar kernel: WARNING: CPU: 0 PID: 1085 at drivers/gpu=
/drm/nouveau/nvkm/subdev/bar/g84.c:35 g84_bar_flush+0xcf/0xe0 [nouveau]
&gt; Nov 1000:27:47 foobar kernel: Modules linked in: ccm rfcomm xt_CHECKSU=
M xt_MASQUERADE tun bridge stp llc nf_conntrack_netbios_ns nf_conntrack_bro=
adcast xt_CT ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_=
ipv4 xt_conntrac&gt;
&gt; Nov 1000:27:47 foobar kernel:  libarc4 snd_hda_codec videobuf2_v4l2 bt=
intel videobuf2_common iwlwifi kvm snd_hda_core snd_hwdep snd_seq snd_seq_d=
evice irqbypass videodev mei_hdcp bluetooth intel_cstate iTCO_wdt mc iTCO_v=
endor_support sn&gt;
&gt; Nov 1000:27:47 foobar kernel: CPU: 0 PID: 1085 Comm: kworker/0:4 Taint=
ed: G           OE     5.4.0-0.rc6.git0.1.fc30.x86_64 #1
&gt; Nov 1000:27:47 foobar kernel: Hardware name: Blue Technology Sp. z o.o=
. NH5_NH7/NH5_NH7, BIOS 1.07.03TBT 11/16/2018
&gt; Nov 1000:27:47 foobar kernel: Workqueue: pm pm_runtime_work
&gt; Nov 1000:27:47 foobar kernel: RIP: 0010:g84_bar_flush+0xcf/0xe0 [nouve=
au]
&gt; Nov 1000:27:47 foobar kernel: Code: 8b 40 10 48 8b 78 10 4c 8b 6f 50 4=
d 85 ed 75 03 4c 8b 2f e8 33 05 f0 e7 4c 89 ea 48 c7 c7 a4 74 92 c0 48 89 c=
6 e8 3f b4 96 e7 &lt;0f&gt; 0b eb a7 e8 58 b1 96 e7 0f 1f 84 00 00 00 00 00=
 0f 1f 44 00 00
&gt; Nov 1000:27:47 foobar kernel: RSP: 0018:ffffaa40c06cb640 EFLAGS: 00010=
086
&gt; Nov 1000:27:47 foobar kernel: RAX: 0000000000000000 RBX: ffff95f1d47df=
c00 RCX: 0000000000000006
&gt; Nov 1000:27:47 foobar kernel: RDX: 0000000000000007 RSI: 0000000000000=
082 RDI: ffff95f1e0217900
&gt; Nov 1000:27:47 foobar kernel: RBP: ffff95f1dd6e6748 R08: 0000000000000=
001 R09: 00000000000016f2
&gt; Nov 1000:27:47 foobar kernel: R10: 000000000000cc44 R11: 0000000000000=
003 R12: 0000000000000246
&gt; Nov 1000:27:47 foobar kernel: R13: ffff95f1dcd96050 R14: 0000000000000=
000 R15: ffff95f18c17a0c0
&gt; Nov 1000:27:47 foobar kernel: FS:  0000000000000000(0000) GS:ffff95f1e=
0200000(0000) knlGS:0000000000000000
&gt; Nov 1000:27:47 foobar kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
&gt; Nov 1000:27:47 foobar kernel: CR2: 00007f792a718e20 CR3: 000000040a60a=
003 CR4: 00000000003606f0
&gt; Nov 1000:27:47 foobar kernel: Call Trace:
&gt; Nov 1000:27:47 foobar kernel:  nv50_instobj_release+0x2f/0xc0 [nouveau]
&gt; Nov 1000:27:47 foobar kernel:  nvkm_vmm_iter.constprop.0+0x2bc/0x810 [=
nouveau]
&gt; Nov 1000:27:47 foobar kernel:  ? gp100_vmm_join+0x20/0x20 [nouveau]
&gt; Nov 1000:27:47 foobar kernel:  nvkm_vmm_map+0x136/0x360 [nouveau]
&gt; Nov 1000:27:47 foobar kernel:  ? gp100_vmm_join+0x20/0x20 [nouveau]
&gt; Nov 1000:27:47 foobar kernel:  nvkm_mem_map_dma+0x56/0x80 [nouveau]
&gt; Nov 1000:27:47 foobar kernel:  nvkm_uvmm_mthd+0x66a/0x780 [nouveau]
&gt; Nov 1000:27:47 foobar kernel:  nvkm_ioctl+0xde/0x180 [nouveau]
&gt; Nov 1000:27:47 foobar kernel:  nvif_object_mthd+0x104/0x130 [nouveau]
&gt; Nov 1000:27:47 foobar kernel:  nvif_vmm_map+0x115/0x130 [nouveau]
&gt; Nov 1000:27:47 foobar kernel:  nouveau_mem_map+0x8d/0x100 [nouveau]
&gt; Nov 1000:27:47 foobar kernel:  nouveau_vma_map+0x44/0x70 [nouveau]
&gt; Nov 1000:27:47 foobar kernel:  nouveau_bo_move_ntfy+0xcd/0xe0 [nouveau]
&gt; Nov 1000:27:47 foobar kernel:  ttm_bo_handle_move_mem+0xd2/0x5a0 [ttm]
&gt; Nov 1000:27:47 foobar kernel:  ttm_bo_evict+0x16f/0x1f0 [ttm]
&gt; Nov 1000:27:47 foobar kernel:  ? __drm_legacy_pci_free+0x66/0x90 [drm]
&gt; Nov 1000:27:47 foobar kernel:  ttm_mem_evict_first+0x273/0x360 [ttm]
&gt; Nov 1000:27:47 foobar kernel:  ttm_bo_force_list_clean+0xa4/0x170 [ttm]
&gt; Nov 1000:27:47 foobar kernel:  nouveau_do_suspend+0x80/0x170 [nouveau]
&gt; Nov 1000:27:47 foobar kernel:  nouveau_pmops_runtime_suspend+0x40/0xa0=
 [nouveau]
&gt; Nov 1000:27:47 foobar kernel:  pci_pm_runtime_suspend+0x58/0x140
&gt; Nov 1000:27:47 foobar kernel:  ? __switch_to_asm+0x40/0x70
&gt; Nov 1000:27:47 foobar kernel:  ? pci_pm_thaw_noirq+0xa0/0xa0
&gt; Nov 1000:27:47 foobar kernel:  __rpm_callback+0xc1/0x140
&gt; Nov 1000:27:47 foobar kernel:  ? pci_pm_thaw_noirq+0xa0/0xa0
&gt; Nov 1000:27:47 foobar kernel:  rpm_callback+0x1f/0x70
&gt; Nov 1000:27:47 foobar kernel:  rpm_suspend+0x10a/0x5a0
&gt; Nov 1000:27:47 foobar kernel:  ? __switch_to_asm+0x34/0x70
&gt; Nov 1000:27:47 foobar kernel:  pm_runtime_work+0x86/0x90
&gt; Nov 1000:27:47 foobar kernel:  process_one_work+0x1b0/0x350
&gt; Nov 1000:27:47 foobar kernel:  worker_thread+0x50/0x3b0
&gt; Nov 1000:27:47 foobar kernel:  kthread+0xfb/0x130
&gt; Nov 1000:27:47 foobar kernel:  ? process_one_work+0x350/0x350
&gt; Nov 1000:27:47 foobar kernel:  ? kthread_park+0x90/0x90
&gt; Nov 1000:27:47 foobar kernel:  ret_from_fork+0x35/0x40
&gt; Nov 1000:27:47 foobar kernel: ---[ end trace e70ebf987c8ad925 ]---
&gt; Nov 1000:27:47 foobar kernel: nouveau 0000:01:00.0: tmr: stalled at ff=
ffffffffffffff
&gt; Nov 1000:27:47 foobar kernel: ------------[ cut here ]------------
&gt; Nov 1000:27:47 foobar kernel: nouveau 0000:01:00.0: timeout
&gt; Nov 1000:27:47 foobar kernel: WARNING: CPU: 0 PID: 1085 at drivers/gpu=
/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c:44 tu102_vmm_flush+0x128/0x140 [nou=
veau]
&gt; Nov 1000:27:47 foobar kernel: Modules linked in: ccm rfcomm xt_CHECKSU=
M xt_MASQUERADE tun bridge stp llc nf_conntrack_netbios_ns nf_conntrack_bro=
adcast xt_CT ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_=
ipv4 xt_conntrac&gt;
&gt; Nov 1000:27:47 foobar kernel:  libarc4 snd_hda_codec videobuf2_v4l2 bt=
intel videobuf2_common iwlwifi kvm snd_hda_core snd_hwdep snd_seq snd_seq_d=
evice irqbypass videodev mei_hdcp bluetooth intel_cstate iTCO_wdt mc iTCO_v=
endor_support sn&gt;
&gt; Nov 1000:27:47 foobar kernel: CPU: 0 PID: 1085 Comm: kworker/0:4 Taint=
ed: G        W  OE     5.4.0-0.rc6.git0.1.fc30.x86_64 #1
&gt; Nov 1000:27:47 foobar kernel: Hardware name: Blue Technology Sp. z o.o=
. NH5_NH7/NH5_NH7, BIOS 1.07.03TBT 11/16/2018
&gt; Nov 1000:27:47 foobar kernel: Workqueue: pm pm_runtime_work
&gt; Nov 1000:27:47 foobar kernel: RIP: 0010:tu102_vmm_flush+0x128/0x140 [n=
ouveau]
&gt; Nov 1000:27:47 foobar kernel: Code: 8b 40 10 48 8b 78 10 4c 8b 67 50 4=
d 85 e4 75 03 4c 8b 27 e8 ca 19 eb e7 4c 89 e2 48 c7 c7 dc 8e 92 c0 48 89 c=
6 e8 d6 c8 91 e7 &lt;0f&gt; 0b eb aa e8 ef c5 91 e7 66 66 2e 0f 1f 84 00 00=
 00 00 00 0f 1f
&gt; Nov 1000:27:47 foobar kernel: RSP: 0018:ffffaa40c06cb678 EFLAGS: 00010=
286
&gt; Nov 1000:27:47 foobar kernel: RAX: 0000000000000000 RBX: ffff95f1d47df=
c00 RCX: 0000000000000006
&gt; Nov 1000:27:47 foobar kernel: RDX: 0000000000000007 RSI: 0000000000000=
092 RDI: ffff95f1e0217900
&gt; Nov 1000:27:47 foobar kernel: RBP: ffff95f1dce73220 R08: 0000000000000=
001 R09: 000000000000172b
&gt; Nov 1000:27:47 foobar kernel: R10: 000000000000e120 R11: 0000000000000=
003 R12: ffff95f1dcd96050
&gt; Nov 1000:27:47 foobar kernel: R13: ffff95f1d457f200 R14: 0000000000000=
000 R15: ffff95f18c17a0c0
&gt; Nov 1000:27:47 foobar kernel: FS:  0000000000000000(0000) GS:ffff95f1e=
0200000(0000) knlGS:0000000000000000
&gt; Nov 1000:27:47 foobar kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
&gt; Nov 1000:27:47 foobar kernel: CR2: 00007f792a718e20 CR3: 000000040a60a=
003 CR4: 00000000003606f0
&gt; Nov 1000:27:47 foobar kernel: Call Trace:
&gt; Nov 1000:27:47 foobar kernel:  nvkm_vmm_iter.constprop.0+0x34b/0x810 [=
nouveau]
&gt; Nov 1000:27:47 foobar kernel:  ? gp100_vmm_join+0x20/0x20 [nouveau]</s=
pan >

repeated (the stacktrace) a few times. Attached in a more complete form. Th=
e &quot;&quot;
are no longer visible.

On the consecutive laptop lid close the video hangs) - the music is still
playing, but caps lock doesn't turn on a led on my keyboard). In logs, afte=
r a
call trace I see &quot;kernel: [TTM] Buffer eviction failed&quot;:

<span class=3D"quote">&gt; Nov 1000:28:14 foobar systemd-logind[1719]: Lid =
closed.</span >
...
<span class=3D"quote">&gt; Nov 1000:28:15 foobar /usr/libexec/gdm-x-session=
[2441]: (II) modeset(0): Allocate new frame buffer 1920x1200 stride
&gt; Nov 1000:28:16 foobar /usr/libexec/gdm-x-session[2441]: (II) modeset(0=
): EDID vendor &quot;CMN&quot;, prod id 5608
&gt; Nov 1000:28:16 foobar /usr/libexec/gdm-x-session[2441]: (II) modeset(0=
): Printing DDC gathered Modelines:
&gt; Nov 1000:28:16 foobar /usr/libexec/gdm-x-session[2441]: (II) modeset(0=
): Modeline &quot;1920x1080&quot;x0.0  152.84  1920 2000 2054 2250  1080 10=
86 1094 1132 -hsync -vsync (67.9 kHz eP)
&gt; Nov 1000:28:16 foobar /usr/libexec/gdm-x-session[2441]: (II) modeset(0=
): EDID vendor &quot;SAM&quot;, prod id 1415</span >
...
<span class=3D"quote">&gt; Nov 1000:28:18 foobar kernel: nouveau 0000:01:00=
.0: tmr: stalled at ffffffffffffffff
&gt; Nov 1000:28:18 foobar kernel: ------------[ cut here ]------------
&gt; Nov 1000:28:18 foobar kernel: nouveau 0000:01:00.0: timeout
&gt; Nov 1000:28:18 foobar kernel: WARNING: CPU: 0 PID: 1085 at drivers/gpu=
/drm/nouveau/nvkm/subdev/bar/g84.c:35 g84_bar_flush+0xcf/0xe0 [nouveau]
&gt; Nov 1000:28:18 foobar kernel: Modules linked in: ccm rfcomm xt_CHECKSU=
M xt_MASQUERADE tun bridge stp llc nf_conntrack_netbios_ns nf_conntrack_bro=
adcast xt_CT ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_=
ipv4 xt_conntrac&gt;
&gt; Nov 1000:28:18 foobar kernel:  libarc4 snd_hda_codec videobuf2_v4l2 bt=
intel videobuf2_common iwlwifi kvm snd_hda_core snd_hwdep snd_seq snd_seq_d=
evice irqbypass videodev mei_hdcp bluetooth intel_cstate iTCO_wdt mc iTCO_v=
endor_support sn&gt;
&gt; Nov 1000:28:18 foobar kernel: CPU: 0 PID: 1085 Comm: kworker/0:4 Taint=
ed: G        W  OE     5.4.0-0.rc6.git0.1.fc30.x86_64 #1
&gt; Nov 1000:28:18 foobar kernel: Hardware name: Blue Technology Sp. z o.o=
. NH5_NH7/NH5_NH7, BIOS 1.07.03TBT 11/16/2018
&gt; Nov 1000:28:18 foobar kernel: Workqueue: pm pm_runtime_work
&gt; Nov 1000:28:18 foobar kernel: RIP: 0010:g84_bar_flush+0xcf/0xe0 [nouve=
au]</span >
...
<span class=3D"quote">&gt; Nov 1000:28:18 foobar kernel: ---[ end trace e70=
ebf987c8ad92c ]---
&gt; Nov 1000:28:18 foobar kernel: [TTM] Buffer eviction failed
&gt; Nov 1000:28:19 foobar abrt-dump-journal-oops[1695]: abrt-dump-journal-=
oops: Found oopses: 2
&gt; Nov 1000:28:19 foobar abrt-dump-journal-oops[1695]: abrt-dump-journal-=
oops: Creating problem directories
&gt; Nov 1000:28:19 foobar abrt-server[10758]: Package 'kernel-core' isn't =
signed with proper key
&gt; Nov 1000:28:19 foobar abrt-server[10758]: 'post-create' on '/var/spool=
/abrt/oops-2019-11-10-00:28:19-1695-0' exited with 1
&gt; Nov 1000:28:19 foobar abrt-server[10758]: Deleting problem directory '=
/var/spool/abrt/oops-2019-11-10-00:28:19-1695-0'
&gt; Nov 1000:28:20 foobar abrt-server[10761]: Package 'kernel-core' isn't =
signed with proper key
&gt; Nov 1000:28:20 foobar abrt-server[10761]: 'post-create' on '/var/spool=
/abrt/oops-2019-11-10-00:28:19-1695-1' exited with 1
&gt; Nov 1000:28:20 foobar abrt-server[10761]: Deleting problem directory '=
/var/spool/abrt/oops-2019-11-10-00:28:19-1695-1'
&gt; Nov 1000:28:21 foobar abrt-dump-journal-oops[1695]: Reported 2 kernel =
oopses to Abrt
&gt; Nov 1000:28:33 foobar kernel: nouveau 0000:01:00.0: DRM: failed to idl=
e channel 0 [DRM]
&gt; Nov 1000:28:33 foobar kernel: BUG: unable to handle page fault for add=
ress: ffffaa41c0386ffc
&gt; Nov 1000:28:33 foobar kernel: #PF: supervisor write access in kernel m=
ode
&gt; Nov 1000:28:33 foobar kernel: #PF: error_code(0x0002) - not-present pa=
ge
&gt; Nov 1000:28:33 foobar kernel: PGD 45e550067 P4D 45e550067 PUD 0=20
&gt; Nov 1000:28:33 foobar kernel: Oops: 0002 [#1] SMP PTI
&gt; Nov 1000:28:33 foobar kernel: CPU: 0 PID: 1085 Comm: kworker/0:4 Taint=
ed: G        W  OE     5.4.0-0.rc6.git0.1.fc30.x86_64 #1
&gt; Nov 1000:28:33 foobar kernel: Hardware name: Blue Technology Sp. z o.o=
. NH5_NH7/NH5_NH7, BIOS 1.07.03TBT 11/16/2018
&gt; Nov 1000:28:33 foobar kernel: Workqueue: pm pm_runtime_work
&gt; Nov 1000:28:33 foobar kernel: RIP: 0010:evo_wait+0x5a/0x130 [nouveau]<=
/span >
...
<span class=3D"quote">&gt; Nov 1000:28:40 foobar gsd-xsettings[2815]: Faile=
d to get current display configuration state: Timeout was reached</span >


<span class=3D"quote">&gt; $ lspci | grep VGA
&gt; 00:02.0 VGA compatible controller: Intel Corporation UHD Graphics 630 =
(Mobile)
&gt; 01:00.0 VGA compatible controller: NVIDIA Corporation TU116M [GeForce =
GTX 1660 Ti Mobile] (rev a1)</span >


I've seen similar issue, however, in that case it is a regression - it work=
ed
fine with kernel 5.2 (tested since RC1 to 5.2.18) and it's broken in 5.3
(tested with 5.3.1 to 5.3.8 and 5.4.0-rc6).

I'm not sure which commit broke it (building the kernel takes some time), b=
ut
having some candidates I could try to verify before/after it occurs or not.


Btw, I'm looking for potential workarounds (better than sticking to 5.2.18)=
. I
don't use NVidia to render the output, so I could blacklist nouveau and use
bbswitch to keep NVidia card off. However, it would make testing newer kern=
el
versions somehow harder. Maybe I can disable something in nouveau to keep t=
he
card off and still do not suffer from the errors above?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15733440700.b67fE4.17887--

--===============1089741147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1089741147==--
