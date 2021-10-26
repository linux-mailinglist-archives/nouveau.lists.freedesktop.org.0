Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952EF43A979
	for <lists+nouveau@lfdr.de>; Tue, 26 Oct 2021 02:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611676E171;
	Tue, 26 Oct 2021 00:55:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F0A6E171
 for <nouveau@lists.freedesktop.org>; Tue, 26 Oct 2021 00:55:02 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id y12so7035033eda.4
 for <nouveau@lists.freedesktop.org>; Mon, 25 Oct 2021 17:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=rZW+7gQIqNcEFs0H3yPNhkh/BKTxr4jBGRoD2wO43Cw=;
 b=mgBpeHiLtHOR90HUXHMDwhb6HCl7km291cxUR6crPw2d+gA9F2VWeZTgVzYYZp9r1I
 QGcNJj19Y0PS0SCMFjLYnhE09J+kjtuE21gBXRgCUFZen0NZd9cFQQHNjMfQb8V0RY7Y
 JwDMn8SSusqhnC/tka+pIzy4XjnHGgnh07AC9s25V4JA4urFrJbGnEoVPONqZT+WZMEd
 MtPRVU5ivzfC5dT31PmS5OmJwwfwNgwbDJJ/9hvqcrx0wN311+I2qNRHK5XTA1tIoEem
 k3Jnl45TlZr+xQK+5iYCdmn01iDqWq8TfKI8TMoz4A62IcOhKmqcJy81kJjaIQaeAtWf
 MdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=rZW+7gQIqNcEFs0H3yPNhkh/BKTxr4jBGRoD2wO43Cw=;
 b=VzLxW1gL22ScuzAupYfwisTHPg4cq9PcxwwrDxDUG829mKFDbl3FXlogoA2C7cLXOe
 h4zWpN/qb4Ab8qJRjSmMn223YJUuSiwNtrjQAT2t8DBfN6TdTdK6G2GFd41NFWUtanz3
 CE9/uGIsOQHohlZbUTCunD+0WxM3RWCC2x5FRIB8CW8zoQ5pIzgUSbRC93pLolI9u67A
 eQI1vg95GrX2DVRb+1Rf8mukgYkh+RFHHpIMd9JrT8826gnmNEWT58eF/wIqSf4cCtDW
 ZeVfyIapezg4DXAfv0znsMcswIKnILYlU42qHusePNEKeqTIywuH5mQhP8ERXOFd0z75
 +zNA==
X-Gm-Message-State: AOAM531IWyje5lYlhUovEsnxA+5FYlDP/hNVZzhhNR1ko3F34aL8fWyd
 PU/Nzw3853GPSu1Ty61opKRFL1pa4FOVjPHd0/NPr6qK
X-Google-Smtp-Source: ABdhPJyCIFCO3LxN8Zn4kdDvnf4zyTnAb7pY+t/KCBwX7qQilYeIR5EbF1nyrHfSi47auLQznrAPK5miTf17zPiW22o=
X-Received: by 2002:a05:6402:190e:: with SMTP id
 e14mr31321095edz.20.1635209700715; 
 Mon, 25 Oct 2021 17:55:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:3410:0:0:0:0 with HTTP; Mon, 25 Oct 2021 17:55:00
 -0700 (PDT)
From: riveravaldez <riveravaldezmail@gmail.com>
Date: Mon, 25 Oct 2021 21:55:00 -0300
Message-ID: <CAD8U+g_t-QVWsE5HtiDPecUknGnpgvYJ9dK66mHZfPfDUcizTQ@mail.gmail.com>
To: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [Nouveau] System freeze: Debian Stable with C61 [GeForce 7025 /
 nForce 630a]
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

Hi, this may be an old issue.
I copied at the bottom the last message of a previous solution for
this same machine.
Essentially I have random freezes (display image seems like a snow storm or=
 just
gets frozen), nothing works, I'm forced to hard reset the machine.
Last time the solution was just to remove nouveau_dri.so, and for what
seems to be
a couple of years system worked rock-solid.
But a couple of days ago I did a system update (I'm on Debian Stable
Bullseye right
now) and apparently the problem reappeared but worse/different: now it
happens even
without nouveau_dri.so present on the system. (Meaning: I remove
nouveau_dri.so and
the freezes happen randomly anyway.)
The hardware is the same, so, I'm imaging maybe is a kernel issue?
This is the hardware:

$ lspci
00:00.0 RAM memory: NVIDIA Corporation MCP61 Host Bridge (rev a1)
00:01.0 ISA bridge: NVIDIA Corporation MCP61 LPC Bridge (rev a2)
00:01.1 SMBus: NVIDIA Corporation MCP61 SMBus (rev a2)
00:01.2 RAM memory: NVIDIA Corporation MCP61 Memory Controller (rev a2)
00:02.0 USB controller: NVIDIA Corporation MCP61 USB 1.1 Controller (rev a3=
)
00:02.1 USB controller: NVIDIA Corporation MCP61 USB 2.0 Controller (rev a3=
)
00:04.0 PCI bridge: NVIDIA Corporation MCP61 PCI bridge (rev a1)
00:05.0 Audio device: NVIDIA Corporation MCP61 High Definition Audio (rev a=
2)
00:06.0 IDE interface: NVIDIA Corporation MCP61 IDE (rev a2)
00:07.0 Bridge: NVIDIA Corporation MCP61 Ethernet (rev a2)
00:08.0 IDE interface: NVIDIA Corporation MCP61 SATA Controller (rev a2)
00:08.1 IDE interface: NVIDIA Corporation MCP61 SATA Controller (rev a2)
00:0d.0 VGA compatible controller: NVIDIA Corporation C61 [GeForce
7025 / nForce 630a] (rev a2)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h
Processor HyperTransport Configuration
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h
Processor Address Map
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h
Processor DRAM Controller
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h
Processor Miscellaneous Control
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h
Processor Link Control

With:

$ uname -a
Linux debian 5.10.0-9-amd64 #1 SMP Debian 5.10.70-1 (2021-09-30)
x86_64 GNU/Linux

And:

$ apt-cache policy xserver-xorg-video-nouveau
xserver-xorg-video-nouveau:
  Instalados: 1:1.0.17-1
  Candidato:  1:1.0.17-1
  Tabla de versi=C3=B3n:
 *** 1:1.0.17-1 500
        500 https://deb.debian.org/debian bullseye/main amd64 Packages
        100 /var/lib/dpkg/status

And this seems to be all the info I have:

$ sudo journalctl -S 2021-10-21 -x -p 4 | grep nouveau
oct 21 13:16:43 debian kernel: nouveau 0000:00:0d.0: DRM: DCB type 4 not kn=
own
oct 21 13:16:43 debian kernel: nouveau 0000:00:0d.0: DRM: Unknown-1
has no encoders, removing
oct 21 13:17:00 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 005c0001 FAULT at 00b000
oct 21 17:12:05 debian kernel: nouveau 0000:00:0d.0: DRM: DCB type 4 not kn=
own
oct 21 17:12:05 debian kernel: nouveau 0000:00:0d.0: DRM: Unknown-1
has no encoders, removing
oct 21 17:12:18 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 005c0001 FAULT at 00b000
oct 21 17:22:21 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 014b0001 FAULT at 00b010
oct 21 17:22:21 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 014b0001 FAULT at 00b010
oct 21 21:32:55 debian kernel:  autofs4 ext4 crc16 mbcache jbd2
crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic
crct10dif_common nouveau video mxm_wmi wmi i2c_algo_bit drm_kms_helper
cec ttm ata_generic sata_nv drm libata scsi_mod psmouse serio_raw
evdev button
oct 21 22:22:53 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 01f20001 FAULT at 00b020
oct 21 22:23:14 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 00000000 FAULT at 00b020
oct 21 22:23:23 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 01f20001 FAULT at 00b020
oct 21 22:25:32 debian kernel: nouveau 0000:00:0d.0: DRM: DCB type 4 not kn=
own
oct 21 22:25:32 debian kernel: nouveau 0000:00:0d.0: DRM: Unknown-1
has no encoders, removing
oct 21 22:26:03 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 005c0001 FAULT at 00b000
oct 21 22:46:40 debian kernel: nouveau 0000:00:0d.0: DRM: DCB type 4 not kn=
own
oct 21 22:46:40 debian kernel: nouveau 0000:00:0d.0: DRM: Unknown-1
has no encoders, removing
oct 21 22:46:51 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 005c0001 FAULT at 00b000
oct 21 22:59:55 debian kernel:  crct10dif_common nouveau video mxm_wmi
wmi i2c_algo_bit drm_kms_helper ata_generic sata_nv cec libata ttm drm
scsi_mod psmouse evdev serio_raw button
oct 21 23:44:26 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 01570001 FAULT at 00b010
oct 21 23:44:26 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 01ef0001 FAULT at 00b020
oct 21 23:45:08 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 02550001 FAULT at 00b030
oct 21 23:45:09 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 01440001 FAULT at 00b030
oct 21 23:45:09 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 02610001 FAULT at 00b030
oct 21 23:45:09 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 015e0001 FAULT at 00b030
oct 21 23:45:10 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 02610001 FAULT at 00b030
oct 21 23:45:11 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 01440001 FAULT at 00b030
oct 21 23:45:13 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 02550001 FAULT at 00b030
oct 21 23:45:13 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 01440001 FAULT at 00b030
oct 21 23:45:16 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 02610001 FAULT at 00b040
oct 21 23:45:17 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 02550001 FAULT at 00b040
oct 21 23:45:17 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 00000000 FAULT at 00b030
oct 21 23:45:24 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 00000000 FAULT at 00b040
oct 21 23:48:53 debian kernel: nouveau 0000:00:0d.0: DRM: DCB type 4 not kn=
own
oct 21 23:48:53 debian kernel: nouveau 0000:00:0d.0: DRM: Unknown-1
has no encoders, removing
oct 21 23:49:21 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 005c0001 FAULT at 00b000
oct 22 00:28:54 debian kernel: nouveau 0000:00:0d.0: DRM: DCB type 4 not kn=
own
oct 22 00:28:54 debian kernel: nouveau 0000:00:0d.0: DRM: Unknown-1
has no encoders, removing
oct 22 00:29:04 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 005c0001 FAULT at 00b000
oct 23 14:48:33 debian kernel:  parport_pc ppdev lp parport fuse
configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2
crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic
crct10dif_common nouveau video mxm_wmi wmi i2c_algo_bit drm_kms_helper
cec ttm drm sata_nv ata_generic psmouse libata serio_raw scsi_mod
evdev button
oct 24 03:18:13 debian kernel: nouveau 0000:00:0d.0: DRM: DCB type 4 not kn=
own
oct 24 03:18:13 debian kernel: nouveau 0000:00:0d.0: DRM: Unknown-1
has no encoders, removing
oct 24 03:18:38 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 005c0001 FAULT at 00b000
oct 24 11:08:30 debian kernel: nouveau 0000:00:0d.0: DRM: DCB type 4 not kn=
own
oct 24 11:08:30 debian kernel: nouveau 0000:00:0d.0: DRM: Unknown-1
has no encoders, removing
oct 24 11:09:04 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 005c0001 FAULT at 00b000
oct 24 11:12:01 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 01740001 FAULT at 00b010
oct 24 11:12:02 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 018b0001 FAULT at 00b020
oct 24 11:12:18 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 02150001 FAULT at 00b030
oct 24 11:12:23 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 00000000 FAULT at 00b030
oct 24 11:12:23 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 02910001 FAULT at 00b030
oct 24 11:23:33 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 00000000 FAULT at 00b030
oct 24 12:33:35 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 00000000 FAULT at 00b010
oct 24 12:33:35 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 00000000 FAULT at 00b020
oct 24 12:33:35 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 005c0001 FAULT at 00b000
oct 24 12:33:45 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 014a0001 FAULT at 00b010
oct 24 12:33:45 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 018b0001 FAULT at 00b020
oct 24 13:09:37 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 02290001 FAULT at 00b030
oct 24 13:09:38 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 01710001 FAULT at 00b040
oct 24 13:09:38 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 00000000 FAULT at 00b030
oct 24 13:09:39 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 00000000 FAULT at 00b040
oct 24 13:09:39 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 02870001 FAULT at 00b030
oct 24 13:09:39 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 01570001 FAULT at 00b030
oct 24 13:09:42 debian kernel: nouveau 0000:00:0d.0: bus: MMIO write
of 00000000 FAULT at 00b030

Sorry for not trimming anything, not sure what's useful and what's not.

Any hint?

As previously, thanks A LOT in advance.

Best regards!


On 1/29/20, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> On Wed, Jan 29, 2020 at 5:03 AM riveravaldez <riveravaldezmail@gmail.com>
> wrote:
>>
>> On 12/11/18, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>> > On Tue, Dec 11, 2018 at 11:16 AM riveravaldez
>> > <riveravaldezmail@gmail.com> wrote:
>> >
>> >> The freezes appears randomly, in every situation, and not when I
>> >> launch some 3D applications or anything similar.
>> >
>> > Try removing nouveau_dri.so -- that will ensure no 3d accel is used,
>> > while keeping your 2d accel provided by the nouveau ddx.
>>
>> Sorry if it's wrong to continue this old thread, but after a good
>> amount of testing (+1 year) I can confirm that both the problem and
>> the solution where the mentioned ones.
>>
>> The problem (random full-system freezes) persists without change,
>> identical. And removing nouveau_dri.so from
>> /usr/lib/x86_64-linux-gnu/dri/ effectively fixes it completely
>> (leaving aside any lost of performance and some warning messages in
>> system upgrades and programs launching[1]).
>>
>> So, after a GREAT thank-you to Ilia, I consult:
>>
>> 1. Is this something that could be fixed? Can I do anything to help?
>>
>> 2. If the only possible/viable solution is the mentioned one (remove
>> nouveau_dri.so), which would be the proper way to make it permanent?
>>
>> 2'. In many dist-upgrades the nouveau_dri.so file is re-created in the
>> same folder, what would be a clean/neat way to handle this?
>>
>> Thanks A LOT again.
>>
>> [1] A lot of lines like these on some dist-upgrades:
>>
>> W: Possible missing firmware
>> /lib/firmware/nvidia/gp100/gr/sw_method_init.bin for module nouveau
>> W: Possible missing firmware
>> /lib/firmware/nvidia/gp100/gr/sw_bundle_init.bin for module nouveau
>> W: Possible missing firmware
>> /lib/firmware/nvidia/gp100/gr/sw_nonctx.bin for module nouveau
>> (...)
>
> Sounds like your initramfs builder tries to include these but they're
> not available on your filesystem. As long as you're not plugging a
> Pascal GPU into your system, you're fine.
>
>>
>> And a lot of programs producing messages like these on start:
>>
>> libGL error: unable to load driver: nouveau_dri.so
>> libGL error: driver pointer missing
>> libGL error: failed to load driver: nouveau
>
> Hmmmm annoying. I hadn't considered that. I could add an option to the
> DDX which makes the default driver "swrast" or something. I also
> wonder if just not loading the "glx" and "dri2" X modules would be
> sufficient to get rid of these.
>
> You can also stick LIBGL_ALWAYS_SOFTWARE=3D1 into your /etc/environment
> (or whatever location causes that env var to appear everywhere) which
> will force it to use swrast. (With the added benefit of being able to
> unset it for the programs where you really do want 3d accel.)
>
> As for a more permanent fix, one could invest developer attention to
> the nv30 gallium driver, but that one would first have to be located.
> I'd be happy to provide some limited mentoring in such a case.
>
> Cheers,
>
>   -ilia
>
