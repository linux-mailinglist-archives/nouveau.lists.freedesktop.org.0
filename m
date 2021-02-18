Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40D231E5E6
	for <lists+nouveau@lfdr.de>; Thu, 18 Feb 2021 06:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EF66E23F;
	Thu, 18 Feb 2021 05:48:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABAA89E98
 for <nouveau@lists.freedesktop.org>; Thu, 18 Feb 2021 03:06:12 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id s17so592784ioj.4
 for <nouveau@lists.freedesktop.org>; Wed, 17 Feb 2021 19:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ringerc-id-au.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=3Mc7RmxYQ4lU1Zr/HXIaJIDQTNUNrbDkV4DU3hKhdFU=;
 b=ip4SfsqZURInSqzhVddWOlU1pD98fcMGYJ2LMrVEIEoFjwc4QDsdsn/AKrZG/phWri
 RBmjn+QlQZCHR2Ho6K8I8AM6jp1tekcwax+aBF3r/armsSN6DqB0nio0Y1xeYQbMpSwC
 IYnJJxlV1IMjLxFe2Ow8e5q1SDlS6meAEk1nHPFtkvF3BAJBPwHZ2XM25Q9Z3uPoRuqz
 5PAhJFgYXJe+iSNk6JqK0w4ap4xTYeGmNw/7Gfp4cDU3re022t1pGmgAO7Sfd549jBQV
 f06sKPwjMdSqcxXI4/uMxZgwSxLL0AWu7CffGUVyPTBphqG+x4e23D9XzGr8KmJ6cFXF
 X4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3Mc7RmxYQ4lU1Zr/HXIaJIDQTNUNrbDkV4DU3hKhdFU=;
 b=PRvYdobootme6msjdCDbMdCwG5T2mNaIvkMhWRbn/BIMcI1K1NQzuzxPIETwasLym5
 xPRwFqNLtnin61fTX4w9b/DwLYJaU7AakVccWaRZxia50FlqqDFoJ2FFc0avpZbc1bOk
 BIv1NAdPyuoDE4rhzqfNDW6J4O3zF2IoP9vQ8DWX67bBYiuyuZVMjx1yXqMTIZxNacgu
 LhSFjzsseXYqTBQ8at+RKPmUpBQOCrlSoj+C3OsYWOkmVc27aASbI/LUn6PGTHSOt2fB
 OYERKMvbhVfJ+20Hm1uxFOQFo05cAql75zvqEW0SCDuE7m9tNc0M+uCm0M5zALEQyWtV
 T71Q==
X-Gm-Message-State: AOAM533Yon29dMwgmWcErhWMZ4RAsQRoVzsN9wBGMqi5q4v8bwMT4C+t
 K1xEDLfopaMl9Q/8lJUFIhNujx5B0JZlRGBrTm1YxqFtua54uQ==
X-Google-Smtp-Source: ABdhPJygBg5I8sdyS9J1dbrRIP+a4Boeilyu9Nbo4Q4eQST/908/HAjI9t9vpvpnN3xkMhb3funzl6vkq2kHplqJttc=
X-Received: by 2002:a05:6638:2721:: with SMTP id
 m33mr2546350jav.59.1613617571408; 
 Wed, 17 Feb 2021 19:06:11 -0800 (PST)
MIME-Version: 1.0
From: Craig Ringer <ringerc@ringerc.id.au>
Date: Thu, 18 Feb 2021 11:06:00 +0800
Message-ID: <CAD2md3HfNcL=S83BkVN_DpUnhKJpRAkPcg=ds4uFb_uTLHF6kA@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 18 Feb 2021 05:48:13 +0000
Subject: [Nouveau] Optimus HDMI hotplug fails with "DRM: Dropped ACPI
 reprobe event due to RPM error: -22"
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0656308957=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0656308957==
Content-Type: multipart/alternative; boundary="00000000000025c66305bb939e64"

--00000000000025c66305bb939e64
Content-Type: text/plain; charset="UTF-8"

Hi all

I'm trying to get HDMI hotplug working on my Lenovo T15g laptop with
Optimus graphics. HDMI works when plugged in at boot, but does not work
when hotplugged after boot, or when hot-unplugged then re-plugged. The
external display is not detected, its status remains 'disconnected' in
sysfs, and the display stays in what looks like DPMS-off state.

NOTE: This is a PRELIMINARY problem report and request for advice or
comment. I'm on a recent Fedora kernel but still need to try latest
mainline + nouveau. I still need to capture detailed debug logs from
nouveau, drm, kms, etc. And while writing the report I found an i915 config
issue I need to retry without. So this is mostly google-help for others
right now.

VERSIONS AND DEVICES
====

Kernel and nouveau version: 5.10.15-200.fc33.x86_64 with the bundled
nouveau driver. (I'll try latest mainline soon).

Video hardware:
  * GeForce RTX 2070 SUPER Mobile (PCI ID 10de:1e91)
  * Intel CometLake-H GT2 (PCI ID 8086:9bc4)

Laptop: Lenovo T15g. DMI identifies it as: LENOVO 20URCTO1WW/20URCTO1WW,
BIOS N30ET33W (1.16 ) 12/17/2020

I believe this is a muxless design with the external outputs under control
of the NVidia card, as the Intel card only has one output in
/sys/bus/drm/card0/ and the external display doesn't work (even when
attached at boot) if I blacklist the nouveau module.

BEHAVIOUR
============

An external HDMI display is only detected and used if it's attached before
boot. If hotplugged later instead it isn't detected and

    DRM: Dropped ACPI reprobe event due to RPM error: -22

is printed to dmesg.

"RPM error -22" is -EINVAL. AFAICS this is probably coming from the
rpm_resume() function [1] as called by __pm_runtime_resume() by
pm_runtime_get() by nouveau_display_acpi_ntfy() [2]. I haven't tracked it
down further yet - I'll do some perf probing and report back in a followup
post.

IIRC (need to repeat and verify) once hot-unplugged, the display won't
re-detect, even if it was connected at boot. Connecting it while the
machine is in S3 sleep doesn't help, it still doesn't get (re)detected on
resume.

    echo 'detect' > card1-HDMI-A-1/status

has no apparent effect - no message is printed to dmesg (default log level)
and the monitor isn't detected.

TAINTED KERNEL
============

While collecting info for this report, I noticed that I am still running
with some non-default i915 options from my old (non-hybrid-graphics)
laptop. I'll have to reboot without those to verify these i915 options
aren't the cause:

[    3.403694] Setting dangerous option enable_guc - tainting kernel
[    3.404506] Setting dangerous option enable_fbc - tainting kernel
[    3.405306] Setting dangerous option enable_dc - tainting kernel

I'll be sure to update once I disable these, but I'll post now. If nothing
else, it might help someone else.

NOUVEAU TIMEOUTS IN DMESG
============

I also noticed some nouveau related output in the kernel logs - I think
from the first suspend, or possibly the first HDMI unplug. I'll need to
verify this later. There are also some xhci_hcd messages that may or may
not be relevant. I'll include longer excerpts at the end of the post but
the basics are:

[25877.621114] nouveau 0000:01:00.0: timeout
[25877.621289] WARNING: CPU: 14 PID: 73556 at
drivers/gpu/drm/nouveau/nvkm/falcon/v1.c:247
nvkm_falcon_v1_wait_for_halt+0x96/0xa0 [nouveau]
...
[25877.621631] RIP: 0010:nvkm_falcon_v1_wait_for_halt+0x96/0xa0 [nouveau]
...
[25877.621680] Call Trace:
[25877.621754]  gm200_acr_hsfw_boot+0xc3/0x160 [nouveau]
[25877.621782]  ? mutex_lock+0xe/0x30
[25877.621849]  nvkm_acr_hsf_boot+0x85/0xe0 [nouveau]
[25877.621916]  nvkm_acr_fini+0x25/0x30 [nouveau]
[25877.621984]  nvkm_subdev_fini+0x59/0xb0 [nouveau]
[25877.622100]  nvkm_device_fini+0x79/0x110 [nouveau]
[25877.622215]  nvkm_udevice_fini+0x47/0x60 [nouveau]
[25877.622277]  nvkm_object_fini+0xbc/0x150 [nouveau]
[25877.622343]  nvkm_object_fini+0x73/0x150 [nouveau]
[25877.622464]  nouveau_do_suspend+0x107/0x180 [nouveau]
[25877.622583]  nouveau_pmops_runtime_suspend+0x3b/0xb0 [nouveau]
[25877.622597]  pci_pm_runtime_suspend+0x5e/0x170
...

then

[25877.622741] nouveau 0000:01:00.0: acr: unload binary failed
[25877.946511] nouveau 0000:01:00.0: fifo: fault 00 [VIRT_READ] at
00000000000bd000 engine c0 [BAR2] client 07 [HUB/HOST_CPU] reason 0d
[REGION_VIOLATION] on channel -1 [01ffedf000 unknown]
[25913.829849] nouveau 0000:01:00.0: fifo: fault 01 [VIRT_WRITE] at
00000000004df000 engine c0 [BAR2] client 08 [HUB/HOST_CPU_NB] reason 02
[PTE] on channel -1 [01ffedf000 unknown]

then

[25913.930365] nouveau 0000:01:00.0: timeout
[25913.930426] WARNING: CPU: 5 PID: 2395 at
drivers/gpu/drm/nouveau/nvkm/falcon/v1.c:247
nvkm_falcon_v1_wait_for_halt+0x96/0xa0 [nouveau]
...
[25913.930511] RIP: 0010:nvkm_falcon_v1_wait_for_halt+0x96/0xa0 [nouveau]
...
[25913.930523] Call Trace:
[25913.930540]  gm200_acr_hsfw_boot+0xc3/0x160 [nouveau]
[25913.930543]  ? mutex_lock+0xe/0x30
[25913.930558]  nvkm_acr_hsf_boot+0x85/0xe0 [nouveau]
[25913.930573]  tu102_acr_init+0x15/0x30 [nouveau]
[25913.930587]  nvkm_acr_load+0x2b/0xd0 [nouveau]
[25913.930589]  ? ktime_get+0x38/0xa0
[25913.930603]  nvkm_subdev_init+0x92/0xd0 [nouveau]
[25913.930604]  ? ktime_get+0x38/0xa0
[25913.930629]  nvkm_device_init+0x10b/0x190 [nouveau]
[25913.930656]  nvkm_udevice_init+0x41/0x60 [nouveau]
[25913.930676]  nvkm_object_init+0x3e/0x100 [nouveau]
[25913.930690]  nvkm_object_init+0x6f/0x100 [nouveau]
[25913.930703]  nvkm_object_init+0x6f/0x100 [nouveau]
[25913.930729]  nouveau_do_resume+0x2b/0xc0 [nouveau]
[25913.930755]  nouveau_pmops_runtime_resume+0x7a/0x150 [nouveau]
[25913.930760]  pci_pm_runtime_resume+0xaa/0xc0
[...]
[25913.930806]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[...]
[25913.930820] nouveau 0000:01:00.0: acr: AHESASC binary failed
[25913.930821] nouveau 0000:01:00.0: acr: init failed, -110
[25913.930958] nouveau 0000:01:00.0: init failed with -110
[25913.930959] nouveau: systemd-logind[1510]:00000000:00000080: init failed
with -110
[25913.930960] nouveau: DRM-master:00000000:00000000: init failed with -110
[25913.930961] nouveau: DRM-master:00000000:00000000: init failed with -110
[25913.930963] nouveau 0000:01:00.0: DRM: Client resume failed with error:
-110
[25913.930963] nouveau 0000:01:00.0: DRM: resume failed with: -110

I'll do some poking around with perf, capture some ACPI state and verbose
nouveau + drm kernel logs for both attached-at-boot and detached-at-boot
cases, etc, then post a big diagnostics bundle in a bit. But I thought I'd
keep this initial report short-ish. I'll include some basic diag info below
though.

URL REFERENCES
============

URLs referenced:

[1]
https://github.com/torvalds/linux/blob/521b619acdc8f1f5acdac15b84f81fd9515b2aff/drivers/base/power/runtime.c#L702

[2]
https://github.com/torvalds/linux/blob/93b694d096cc10994c817730d4d50288f9ae3d66/drivers/gpu/drm/nouveau/nouveau_display.c#L530

BASIC DIAGNOSTICS
============

Basic diagnostics, when display physically connected (DVI-D -> HDMI) but
not detected by nouveau:

$ ls /sys/class/drm
card0  card0-eDP-1  card1  card1-DP-1  card1-DP-2  card1-DP-3  card1-eDP-2
 card1-HDMI-A-1  renderD128  renderD129  ttm  version

$ for f in */status; do printf "%s: %s\n" "$f" "$(cat $f)"; done
card0-eDP-1/status: connected
card1-DP-1/status: disconnected
card1-DP-2/status: disconnected
card1-DP-3/status: disconnected
card1-eDP-2/status: disconnected
card1-HDMI-A-1/status: disconnected

$ dmesg | tail -n 2
[42147.075025] nouveau 0000:01:00.0: DRM: Dropped ACPI reprobe event due to
RPM error: -22
[42151.153559] nouveau 0000:01:00.0: DRM: Dropped ACPI reprobe event due to
RPM error: -22

# for p in /sys/module/nouveau/parameters/*; do printf "%s: %s\n"
"$(basename $p)" "$(cat $p)"; done
[sudo] password for craig:
atomic: 0
config: (null)
debug: (null)
duallink: 1
fbcon_bpp: 0
hdmimhz: 0
ignorelid: 0
modeset: -1
mst: 1
noaccel: 0
nofbaccel: 0
runpm: -1
tv_disable: 0
tv_norm: (null)
vram_pushbuf: 0

$ cat /proc/cmdline
BOOT_IMAGE=(hd1,gpt2)/vmlinuz-5.10.15-200.fc33.x86_64 [SNIP root dev args]
libata.allow_tpm=on systemd.unified_cgroup_hierarchy=0 rhgb

$ sudo  lspci -vvnnqPP -d 10de:1e91
00:01.0/01:00.0 VGA compatible controller [0300]: NVIDIA Corporation TU104M
[GeForce RTX 2070 SUPER Mobile / Max-Q] [10de:1e91] (rev a1) (prog-if 00
[VGA controller])
Subsystem: Lenovo Device [17aa:22c3]
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
....
Kernel driver in use: nouveau
Kernel modules: nouveau

# dmidecode
...
Processor Information
    ...
    Version: Intel(R) Core(TM) i9-10980HK CPU @ 2.40GHz
...
BIOS Information
    Vendor: LENOVO
    Version: N30ET33W (1.16 )
    Release Date: 12/17/2020
    ...
    BIOS Revision: 1.16
    Firmware Revision: 1.12
...
Port Connector Information
    Internal Reference Designator: Not Available
    Internal Connector Type: None
    External Reference Designator: Hdmi1
    External Connector Type: Other
    Port Type: Video Port

System Information
    Manufacturer: LENOVO
    Product Name: 20URCTO1WW
    Version: ThinkPad T15g Gen 1
    [snip serial number and uuid]
    SKU Number: LENOVO_MT_20UR_BU_Think_FM_ThinkPad T15g Gen 1
    Family: ThinkPad T15g Gen 1

I'll attach a detailed lspci, bigger excerpts from demesg, etc in a
followup to make sure I don't upset any mail filter.


-- 
Craig Ringer

--00000000000025c66305bb939e64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all</div><div><br></div><div>I&#39;m trying to get=
 HDMI hotplug working on my Lenovo T15g laptop with Optimus graphics. HDMI =
works when plugged in at boot, but does not work when hotplugged after boot=
, or when hot-unplugged then re-plugged. The external display is not detect=
ed, its status remains &#39;disconnected&#39; in sysfs, and the display sta=
ys in what looks like DPMS-off state.<br></div><div><div><div><br></div><di=
v>NOTE: This is a PRELIMINARY problem report and request for advice or comm=
ent. I&#39;m on a recent Fedora kernel but still need to try latest mainlin=
e + nouveau. I still need to capture detailed debug logs from nouveau, drm,=
 kms, etc. And while writing the report I found an i915 config issue I need=
 to retry without. So this is mostly google-help for others right now.<br><=
/div><div><div><br></div><div>VERSIONS AND DEVICES</div><div>=3D=3D=3D=3D</=
div><div><div><br></div><div><div>Kernel and nouveau version: 5.10.15-200.f=
c33.x86_64 with the bundled nouveau driver. (I&#39;ll try latest mainline s=
oon).<br></div></div></div><div><br></div><div>Video hardware:<br></div><di=
v>=C2=A0 * GeForce RTX 2070 SUPER Mobile (PCI ID 10de:1e91) <br></div><div>=
=C2=A0 * Intel CometLake-H GT2 (PCI ID 8086:9bc4)</div><div><br></div><div>=
Laptop: Lenovo T15g. DMI identifies it as: LENOVO 20URCTO1WW/20URCTO1WW, BI=
OS N30ET33W (1.16 ) 12/17/2020</div></div></div><div><div><div><br></div><d=
iv>I believe this is a muxless design with the external outputs under contr=
ol of the NVidia card, as the Intel card only has one output in /sys/bus/dr=
m/card0/ and the external display doesn&#39;t work (even when attached at b=
oot) if I blacklist the nouveau module.</div><div><br></div></div><div>BEHA=
VIOUR<br></div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div><div><br=
></div><div>An external HDMI display is only detected and used if it&#39;s =
attached before boot. If hotplugged later instead it isn&#39;t detected and=
 <br></div><div><br></div><div>=C2=A0=C2=A0=C2=A0 DRM: Dropped ACPI reprobe=
 event due to RPM error: -22</div><div><br></div><div>is printed to dmesg.<=
/div><div><div><div><span class=3D"gmail-pl-en"><span class=3D"gmail-pl-en"=
><br></span></span></div><div><div>&quot;RPM error -22&quot; is -EINVAL. AF=
AICS this is probably coming from the rpm_resume() function [1] as called b=
y <span class=3D"gmail-pl-en">__pm_runtime_resume() by pm_runtime_get() by =
<span class=3D"gmail-pl-en">nouveau_display_acpi_ntfy() [2]. I haven&#39;t =
tracked it down further yet - I&#39;ll do some perf probing and report back=
 in a followup post.<br></span></span></div><span class=3D"gmail-pl-en"><sp=
an class=3D"gmail-pl-en"></span></span></div></div></div></div></div><div><=
br></div><div>IIRC (need to repeat and verify) once hot-unplugged, the disp=
lay won&#39;t re-detect, even if it was connected at boot. Connecting it wh=
ile the machine is in S3 sleep doesn&#39;t help, it still doesn&#39;t get (=
re)detected on resume.</div><div><br></div><div>=C2=A0=C2=A0=C2=A0 echo &#3=
9;detect&#39; &gt; card1-HDMI-A-1/status</div><div><br></div><div>has no ap=
parent effect - no message is printed to dmesg (default log level) and the =
monitor isn&#39;t detected.</div><div><div><br></div><div><div>TAINTED KERN=
EL<br></div><div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div><br></=
div></div></div></div><div>While collecting info for this report, I noticed=
 that I am still running with some non-default i915 options from my old (no=
n-hybrid-graphics) laptop. I&#39;ll have to reboot without those to verify =
these i915 options aren&#39;t the cause:<br></div><div><br></div><div>[ =C2=
=A0 =C2=A03.403694] Setting dangerous option enable_guc - tainting kernel<b=
r>[ =C2=A0 =C2=A03.404506] Setting dangerous option enable_fbc - tainting k=
ernel<br>[ =C2=A0 =C2=A03.405306] Setting dangerous option enable_dc - tain=
ting kernel<br></div><div><br></div><div>I&#39;ll be sure to update once I =
disable these, but I&#39;ll post now. If nothing else, it might help someon=
e else.</div><div><br></div><div><div>NOUVEAU TIMEOUTS IN DMESG<br></div><d=
iv><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div></div></div><div><br></di=
v><div>I also noticed some nouveau related output in the kernel logs - I th=
ink from the first suspend, or possibly the first HDMI unplug. I&#39;ll nee=
d to verify this later. There are also some xhci_hcd messages that may or m=
ay not be relevant. I&#39;ll include longer excerpts at the end of the post=
 but the basics are:</div><div><br></div><div>[25877.621114] nouveau 0000:0=
1:00.0: timeout<br>[25877.621289] WARNING: CPU: 14 PID: 73556 at drivers/gp=
u/drm/nouveau/nvkm/falcon/v1.c:247 nvkm_falcon_v1_wait_for_halt+0x96/0xa0 [=
nouveau]</div><div>...</div><div>[25877.621631] RIP: 0010:nvkm_falcon_v1_wa=
it_for_halt+0x96/0xa0 [nouveau]</div><div>...<br></div><div>[25877.621680] =
Call Trace:<br>[25877.621754] =C2=A0gm200_acr_hsfw_boot+0xc3/0x160 [nouveau=
]<br>[25877.621782] =C2=A0? mutex_lock+0xe/0x30<br>[25877.621849] =C2=A0nvk=
m_acr_hsf_boot+0x85/0xe0 [nouveau]<br>[25877.621916] =C2=A0nvkm_acr_fini+0x=
25/0x30 [nouveau]<br>[25877.621984] =C2=A0nvkm_subdev_fini+0x59/0xb0 [nouve=
au]<br>[25877.622100] =C2=A0nvkm_device_fini+0x79/0x110 [nouveau]<br>[25877=
.622215] =C2=A0nvkm_udevice_fini+0x47/0x60 [nouveau]<br>[25877.622277] =C2=
=A0nvkm_object_fini+0xbc/0x150 [nouveau]<br>[25877.622343] =C2=A0nvkm_objec=
t_fini+0x73/0x150 [nouveau]<br>[25877.622464] =C2=A0nouveau_do_suspend+0x10=
7/0x180 [nouveau]<br>[25877.622583] =C2=A0nouveau_pmops_runtime_suspend+0x3=
b/0xb0 [nouveau]<br>[25877.622597] =C2=A0pci_pm_runtime_suspend+0x5e/0x170<=
br></div><div>...<br></div><div><br></div><div>then</div><div><br></div><di=
v>[25877.622741] nouveau 0000:01:00.0: acr: unload binary failed<br>[25877.=
946511] nouveau 0000:01:00.0: fifo: fault 00 [VIRT_READ] at 00000000000bd00=
0 engine c0 [BAR2] client 07 [HUB/HOST_CPU] reason 0d [REGION_VIOLATION] on=
 channel -1 [01ffedf000 unknown]</div><div>[25913.829849] nouveau 0000:01:0=
0.0: fifo: fault 01 [VIRT_WRITE] at 00000000004df000 engine c0 [BAR2] clien=
t 08 [HUB/HOST_CPU_NB] reason 02 [PTE] on channel -1 [01ffedf000 unknown]</=
div><div><br></div><div>then</div><div><br></div><div>[25913.930365] nouvea=
u 0000:01:00.0: timeout<br>[25913.930426] WARNING: CPU: 5 PID: 2395 at driv=
ers/gpu/drm/nouveau/nvkm/falcon/v1.c:247 nvkm_falcon_v1_wait_for_halt+0x96/=
0xa0 [nouveau]</div><div>...<br></div><div>[25913.930511] RIP: 0010:nvkm_fa=
lcon_v1_wait_for_halt+0x96/0xa0 [nouveau]<br></div><div>...</div><div>[2591=
3.930523] Call Trace:<br>[25913.930540] =C2=A0gm200_acr_hsfw_boot+0xc3/0x16=
0 [nouveau]<br>[25913.930543] =C2=A0? mutex_lock+0xe/0x30<br>[25913.930558]=
 =C2=A0nvkm_acr_hsf_boot+0x85/0xe0 [nouveau]<br>[25913.930573] =C2=A0tu102_=
acr_init+0x15/0x30 [nouveau]<br>[25913.930587] =C2=A0nvkm_acr_load+0x2b/0xd=
0 [nouveau]<br>[25913.930589] =C2=A0? ktime_get+0x38/0xa0<br>[25913.930603]=
 =C2=A0nvkm_subdev_init+0x92/0xd0 [nouveau]<br>[25913.930604] =C2=A0? ktime=
_get+0x38/0xa0<br>[25913.930629] =C2=A0nvkm_device_init+0x10b/0x190 [nouvea=
u]<br>[25913.930656] =C2=A0nvkm_udevice_init+0x41/0x60 [nouveau]<br>[25913.=
930676] =C2=A0nvkm_object_init+0x3e/0x100 [nouveau]<br>[25913.930690] =C2=
=A0nvkm_object_init+0x6f/0x100 [nouveau]<br>[25913.930703] =C2=A0nvkm_objec=
t_init+0x6f/0x100 [nouveau]<br>[25913.930729] =C2=A0nouveau_do_resume+0x2b/=
0xc0 [nouveau]<br>[25913.930755] =C2=A0nouveau_pmops_runtime_resume+0x7a/0x=
150 [nouveau]<br>[25913.930760] =C2=A0pci_pm_runtime_resume+0xaa/0xc0</div>=
<div>[...]</div><div>[25913.930806] =C2=A0entry_SYSCALL_64_after_hwframe+0x=
44/0xa9</div><div>[...]<br></div><div>[25913.930820] nouveau 0000:01:00.0: =
acr: AHESASC binary failed<br>[25913.930821] nouveau 0000:01:00.0: acr: ini=
t failed, -110<br>[25913.930958] nouveau 0000:01:00.0: init failed with -11=
0<br>[25913.930959] nouveau: systemd-logind[1510]:00000000:00000080: init f=
ailed with -110<br>[25913.930960] nouveau: DRM-master:00000000:00000000: in=
it failed with -110<br>[25913.930961] nouveau: DRM-master:00000000:00000000=
: init failed with -110<br>[25913.930963] nouveau 0000:01:00.0: DRM: Client=
 resume failed with error: -110<br>[25913.930963] nouveau 0000:01:00.0: DRM=
: resume failed with: -110<br></div><div><br></div><div>I&#39;ll do some po=
king around with perf, capture some ACPI state and verbose nouveau + drm ke=
rnel logs for both attached-at-boot and detached-at-boot cases, etc, then p=
ost a big diagnostics bundle in a bit. But I thought I&#39;d keep this init=
ial report short-ish. I&#39;ll include some basic diag info below though.<b=
r></div><div><span class=3D"gmail-pl-en"><span class=3D"gmail-pl-en"><br></=
span></span></div><div>URL REFERENCES<br><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D</div><div><br></div><span class=3D"gmail-pl-en"><span class=3D"gm=
ail-pl-en"></span></span></div><div><span class=3D"gmail-pl-en"><span class=
=3D"gmail-pl-en">URLs referenced:<br></span></span></div><div><br></div><di=
v>[1] <a href=3D"https://github.com/torvalds/linux/blob/521b619acdc8f1f5acd=
ac15b84f81fd9515b2aff/drivers/base/power/runtime.c#L702">https://github.com=
/torvalds/linux/blob/521b619acdc8f1f5acdac15b84f81fd9515b2aff/drivers/base/=
power/runtime.c#L702</a></div><div><br></div><div>[2] <a href=3D"https://gi=
thub.com/torvalds/linux/blob/93b694d096cc10994c817730d4d50288f9ae3d66/drive=
rs/gpu/drm/nouveau/nouveau_display.c#L530">https://github.com/torvalds/linu=
x/blob/93b694d096cc10994c817730d4d50288f9ae3d66/drivers/gpu/drm/nouveau/nou=
veau_display.c#L530</a></div><div><br></div><div>BASIC DIAGNOSTICS</div><di=
v>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br></div><div><br></div><div>Basic d=
iagnostics, when display physically connected (DVI-D -&gt; HDMI) but not de=
tected by nouveau:<br></div><div><br></div><div>$ ls /sys/class/drm<br>card=
0 =C2=A0card0-eDP-1 =C2=A0card1 =C2=A0card1-DP-1 =C2=A0card1-DP-2 =C2=A0car=
d1-DP-3 =C2=A0card1-eDP-2 =C2=A0card1-HDMI-A-1 =C2=A0renderD128 =C2=A0rende=
rD129 =C2=A0ttm =C2=A0version</div><div><br></div><div>$ for f in */status;=
 do printf &quot;%s: %s\n&quot; &quot;$f&quot; &quot;$(cat $f)&quot;; done<=
br>card0-eDP-1/status: connected<br>card1-DP-1/status: disconnected<br>card=
1-DP-2/status: disconnected<br>card1-DP-3/status: disconnected<br>card1-eDP=
-2/status: disconnected<br>card1-HDMI-A-1/status: disconnected</div><div><b=
r></div><div>$ dmesg | tail -n 2<br></div><div>[42147.075025] nouveau 0000:=
01:00.0: DRM: Dropped ACPI reprobe event due to RPM error: -22<br>[42151.15=
3559] nouveau 0000:01:00.0: DRM: Dropped ACPI reprobe event due to RPM erro=
r: -22</div><div><br></div><div># for p in /sys/module/nouveau/parameters/*=
; do printf &quot;%s: %s\n&quot; &quot;$(basename $p)&quot; &quot;$(cat $p)=
&quot;; done<br>[sudo] password for craig: <br>atomic: 0<br>config: (null)<=
br>debug: (null)<br>duallink: 1<br>fbcon_bpp: 0<br>hdmimhz: 0<br>ignorelid:=
 0<br>modeset: -1<br>mst: 1<br>noaccel: 0<br>nofbaccel: 0<br>runpm: -1<br>t=
v_disable: 0<br>tv_norm: (null)<br>vram_pushbuf: 0</div><div><br></div><div=
>$ cat /proc/cmdline <br>BOOT_IMAGE=3D(hd1,gpt2)/vmlinuz-5.10.15-200.fc33.x=
86_64 [SNIP root dev args] libata.allow_tpm=3Don systemd.unified_cgroup_hie=
rarchy=3D0 rhgb</div><div><br></div><div>$ sudo =C2=A0lspci -vvnnqPP -d 10d=
e:1e91<br>00:01.0/01:00.0 VGA compatible controller [0300]: NVIDIA Corporat=
ion TU104M [GeForce RTX 2070 SUPER Mobile / Max-Q] [10de:1e91] (rev a1) (pr=
og-if 00 [VGA controller])<br>	Subsystem: Lenovo Device [17aa:22c3]<br>	Con=
trol: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- =
SERR- FastB2B- DisINTx-<br>	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSE=
L=3Dfast &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-</div=
><div>....</div><div>	Kernel driver in use: nouveau<br>	Kernel modules: nou=
veau<br></div><div><br></div><div># dmidecode</div><div>...<br>Processor In=
formation</div><div>=C2=A0=C2=A0=C2=A0 ...<br>=C2=A0=C2=A0=C2=A0 Version: I=
ntel(R) Core(TM) i9-10980HK CPU @ 2.40GHz</div><div>...</div><div>BIOS Info=
rmation<br>=C2=A0 =C2=A0 Vendor: LENOVO<br>=C2=A0 =C2=A0 Version: N30ET33W =
(1.16 )<br>=C2=A0 =C2=A0 Release Date: 12/17/2020</div><div>=C2=A0=C2=A0=C2=
=A0 ...</div><div>=C2=A0 =C2=A0 BIOS Revision: 1.16<br>=C2=A0 =C2=A0 Firmwa=
re Revision: 1.12</div><div>...</div><div>Port Connector Information<br>=C2=
=A0 =C2=A0 Internal Reference Designator: Not Available<br>=C2=A0 =C2=A0 In=
ternal Connector Type: None<br>=C2=A0 =C2=A0 External Reference Designator:=
 Hdmi1<br>=C2=A0 =C2=A0 External Connector Type: Other<br>=C2=A0 =C2=A0 Por=
t Type: Video Port</div><div><br></div><div>System Information<br>=C2=A0 =
=C2=A0 Manufacturer: LENOVO<br>=C2=A0 =C2=A0 Product Name: 20URCTO1WW<br>=
=C2=A0 =C2=A0 Version: ThinkPad T15g Gen 1<br></div><div>=C2=A0=C2=A0=C2=A0=
 [snip serial number and uuid]<br>=C2=A0 =C2=A0 SKU Number: LENOVO_MT_20UR_=
BU_Think_FM_ThinkPad T15g Gen 1<br>=C2=A0 =C2=A0 Family: ThinkPad T15g Gen =
1</div></div><div><br></div><div>I&#39;ll attach a detailed lspci, bigger e=
xcerpts from demesg, etc in a followup to make sure I don&#39;t upset any m=
ail filter.<br></div><div><div><br></div><div><br></div><div>-- <br><div di=
r=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div=
 dir=3D"ltr"><div><div>Craig Ringer</div></div></div></div></div></div><div=
><br></div></div>

--00000000000025c66305bb939e64--

--===============0656308957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0656308957==--
