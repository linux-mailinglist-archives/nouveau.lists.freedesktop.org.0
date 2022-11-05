Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 875F161DDD2
	for <lists+nouveau@lfdr.de>; Sat,  5 Nov 2022 20:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1433A10E00E;
	Sat,  5 Nov 2022 19:36:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Sat, 05 Nov 2022 19:36:27 UTC
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB67D10E00E
 for <nouveau@lists.freedesktop.org>; Sat,  5 Nov 2022 19:36:27 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gcfxn-nouveau@m.gmane-mx.org>) id 1orOsw-0006p5-QS
 for nouveau@lists.freedesktop.org; Sat, 05 Nov 2022 20:31:18 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: nouveau@lists.freedesktop.org
From: Timothy Madden <terminatorul@gmail.com>
Date: Sat, 5 Nov 2022 19:31:14 -0000 (UTC)
Message-ID: <tk6dm1$jsm$1@ciao.gmane.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
User-Agent: Pan/0.151 (Butcha; a6f6327)
Subject: [Nouveau] Fans ramping up randomly when idle
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello

My Msi Gaming X Trio 2080 Ti randomly ramps up the fans with no way to recover
(I have to reboot) even when the card is idle or is only showing the desktop.

This issue happens even when the card is not connected to a monitor.

My dmesg output from nouveau is included below, I think the last 2 lines are
the relevant ones:
[ 9426.768449] nvidia-gpu 0000:0b:00.3: Unable to change power state from D3hot to D0, device inaccessible
[ 9427.889387] nvidia-gpu 0000:0b:00.3: i2c timeout error ffffffff




timothy@localhost:~> dmesg | grep -i -e nouveau -e nvidia
[    6.511064] nouveau 0000:0b:00.0: NVIDIA TU102 (162000a1)
[    6.594464] nouveau 0000:0b:00.0: bios: version 90.02.42.00.14
[    6.597756] nouveau 0000:0b:00.0: pmu: firmware unavailable
[    6.601947] nouveau 0000:0b:00.0: fb: 11264 MiB GDDR6
[    6.618463] nouveau 0000:0b:00.0: DRM: VRAM: 11264 MiB
[    6.618465] nouveau 0000:0b:00.0: DRM: GART: 536870912 MiB
[    6.618466] nouveau 0000:0b:00.0: DRM: BIT table 'A' not found
[    6.618468] nouveau 0000:0b:00.0: DRM: BIT table 'L' not found
[    6.618469] nouveau 0000:0b:00.0: DRM: TMDS table version 2.0
[    6.618470] nouveau 0000:0b:00.0: DRM: DCB version 4.1
[    6.618471] nouveau 0000:0b:00.0: DRM: DCB outp 00: 02800f66 04600020
[    6.618473] nouveau 0000:0b:00.0: DRM: DCB outp 01: 02000f62 00020020
[    6.618474] nouveau 0000:0b:00.0: DRM: DCB outp 03: 02011f52 00020010
[    6.618475] nouveau 0000:0b:00.0: DRM: DCB outp 04: 04822f76 04600010
[    6.618476] nouveau 0000:0b:00.0: DRM: DCB outp 05: 04022f72 00020010
[    6.618477] nouveau 0000:0b:00.0: DRM: DCB outp 08: 01844f36 04600010
[    6.618478] nouveau 0000:0b:00.0: DRM: DCB outp 09: 01044f32 00020010
[    6.618479] nouveau 0000:0b:00.0: DRM: DCB outp 10: 04833f86 04600020
[    6.618481] nouveau 0000:0b:00.0: DRM: DCB conn 00: 00020046
[    6.618481] nouveau 0000:0b:00.0: DRM: DCB conn 01: 00010161
[    6.618482] nouveau 0000:0b:00.0: DRM: DCB conn 02: 01000246
[    6.618483] nouveau 0000:0b:00.0: DRM: DCB conn 03: 02000371
[    6.618484] nouveau 0000:0b:00.0: DRM: DCB conn 04: 00001446
[    6.620448] nouveau 0000:0b:00.0: DRM: MM: using COPY for buffer copies
[    7.062338] nouveau 0000:0b:00.0: [drm] Cannot find any crtc or sizes
[    7.065331] [drm] Initialized nouveau 1.3.1 20120801 for 0000:0b:00.0 on minor 1
[    7.254317] nouveau 0000:0b:00.0: [drm] Cannot find any crtc or sizes
[    7.446318] nouveau 0000:0b:00.0: [drm] Cannot find any crtc or sizes
[    8.501252] nvidia-gpu 0000:0b:00.3: enabling device (0000 -> 0002)
[    8.696138] audit: type=1400 audit(1667665884.700:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=926 comm="apparmor_parser"
[    8.696141] audit: type=1400 audit(1667665884.700:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=926 comm="apparmor_parser"
[    8.704333] snd_hda_intel 0000:0b:00.1: bound 0000:0b:00.0 (ops nv50_audio_component_bind_ops [nouveau])
[    8.708797] input: HDA NVidia HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:03.2/0000:0b:00.1/sound/card1/input15
[    8.708903] input: HDA NVidia HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:03.2/0000:0b:00.1/sound/card1/input16
[    8.708936] input: HDA NVidia HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:03.2/0000:0b:00.1/sound/card1/input17
[    8.708965] input: HDA NVidia HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:03.2/0000:0b:00.1/sound/card1/input18
[    8.708994] input: HDA NVidia HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:03.2/0000:0b:00.1/sound/card1/input19
[    8.709032] input: HDA NVidia HDMI/DP,pcm=11 as /devices/pci0000:00/0000:00:03.2/0000:0b:00.1/sound/card1/input20
[    8.709065] input: HDA NVidia HDMI/DP,pcm=12 as /devices/pci0000:00/0000:00:03.2/0000:0b:00.1/sound/card1/input21
[   10.776280] nouveau 0000:0b:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none
[ 3275.720190] nouveau 0000:0b:00.0: therm: temperature (90 C) hit the 'fanboost' threshold
[ 9426.768449] nvidia-gpu 0000:0b:00.3: Unable to change power state from D3hot to D0, device inaccessible
[ 9427.889387] nvidia-gpu 0000:0b:00.3: i2c timeout error ffffffff
timothy@localhost:~> 

