Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F7461F215
	for <lists+nouveau@lfdr.de>; Mon,  7 Nov 2022 12:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848C810E174;
	Mon,  7 Nov 2022 11:42:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0567010E174
 for <nouveau@lists.freedesktop.org>; Mon,  7 Nov 2022 11:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667821326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yjvWdd26iDilLnPHRX6c1MroxbQlN8iPtZcAWdOXsfg=;
 b=LFf5HRqqrRyUzC495b3CqetUS0W2hhY3/abZrb3IKgcQGVNlXFOZC5/GScDJpPdhMx7xYD
 6cYF8R1/+QtPuKPE4JeSnxZHAam8/ujp/Jae25ScWcfIoOcpVBgUnU8dhHyTpPOHZekWpD
 5zNYiIr9VoQb+/jbsd/SDCSgag8vRAM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-330-Joa43U7jOtSSyD4xBmT3JQ-1; Mon, 07 Nov 2022 06:42:05 -0500
X-MC-Unique: Joa43U7jOtSSyD4xBmT3JQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 bb32-20020a05622a1b2000b003a56991a048so4872398qtb.6
 for <nouveau@lists.freedesktop.org>; Mon, 07 Nov 2022 03:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yjvWdd26iDilLnPHRX6c1MroxbQlN8iPtZcAWdOXsfg=;
 b=KUqMEDGSrvDE9Z+aT+NxBoFLaa3zP0/NV3lQm+8U5oN5YyZue+tbo8q7q7Hv9FJ9AW
 uNZbcJwHSr0Fiym55Uociuq1VsxL3qGhCF1VgkmpLSn0h6i+sGNE3Hh5R/QgieIpU3aO
 MPmkB3Qv7Vahe/h4H3q4xxSNiglaiWTtI+Y1G5Ya+Oq5doz6sVK/fe6hvS0MFPADnp8J
 j4iAG/G2Wb4gR2+bxcTL2a9xbVcMufR/GOImtN12HbyyR2rwQoL02GTflKFgIKvZprry
 IT9E6M6WcjeRcAbmsaUFUhqCI92c0maLHb3jTBuT/t9hH43KObLdqqlqRDOi+2MZVXRV
 TPpA==
X-Gm-Message-State: ACrzQf3cFnCHnEdXNnVAXbLrKvVgkON0X46rs/8Ygo+x3W3+M+mhWiXl
 HXN65hJfWCwHyQalfc6+UPafCGyp3cnTMGorSjJx6ic7MSgrVR0tuy8hWrSGQOyxEiO5EnOtm+6
 rzz26t7/KCgDw3fs55rE6zzPBqNvvYXofkU6sA8Wcjw==
X-Received: by 2002:a05:620a:bcc:b0:6ce:c077:acf3 with SMTP id
 s12-20020a05620a0bcc00b006cec077acf3mr34541971qki.263.1667821323782; 
 Mon, 07 Nov 2022 03:42:03 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6gyY5LrIiGmzfffJrBSQ24n39MGg8bl45cgoCqcBEaCo/gfgD150Ap+LyQ9dz1h3d6HGYC521UBckVjBHtkDs=
X-Received: by 2002:a05:620a:bcc:b0:6ce:c077:acf3 with SMTP id
 s12-20020a05620a0bcc00b006cec077acf3mr34541964qki.263.1667821323555; Mon, 07
 Nov 2022 03:42:03 -0800 (PST)
MIME-Version: 1.0
References: <tk6dm1$jsm$1@ciao.gmane.io>
In-Reply-To: <tk6dm1$jsm$1@ciao.gmane.io>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 7 Nov 2022 12:41:51 +0100
Message-ID: <CACO55tt5QTM=Amm560pBoDyKdib+YL77-d3rArhi0AmtLOdPMg@mail.gmail.com>
To: Timothy Madden <terminatorul@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Fans ramping up randomly when idle
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
Cc: nouveau@lists.freedesktop.org, Ajay Gupta <ajayg@nvidia.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Nov 5, 2022 at 8:36 PM Timothy Madden <terminatorul@gmail.com> wrote:
>
> Hello
>
> My Msi Gaming X Trio 2080 Ti randomly ramps up the fans with no way to recover
> (I have to reboot) even when the card is idle or is only showing the desktop.
>
> This issue happens even when the card is not connected to a monitor.
>
> My dmesg output from nouveau is included below, I think the last 2 lines are
> the relevant ones:
> [ 9426.768449] nvidia-gpu 0000:0b:00.3: Unable to change power state from D3hot to D0, device inaccessible
> [ 9427.889387] nvidia-gpu 0000:0b:00.3: i2c timeout error ffffffff
>
>

that's kind of odd, because "nvidia-gpu" implies you might have
multiple drivers here? Though .3 should be some USB/UCSI or something
related sub device on the GPU and Nvidia might have messed it up
(adding the maintainer of the i2c-nvidia-gpu driver on CC).

Anyway, the fans are probably controlled by the Laptops firmware and
maybe something goes wrong with the runtime power management feature
here, which as far as I can tell works on the Nouveau side, but
i2c-nvidia-gpu might prevent the GPU from powering done and so causing
more heat. It's also interesting that the GPU runs that hot, but given
we don't support changing power states yet in Nouveau (still WIP
wiring up the new released firmware from nvidia), not much we can do
while the GPU is actually in use at this point.

>
>
> timothy@localhost:~> dmesg | grep -i -e nouveau -e nvidia
> [    6.511064] nouveau 0000:0b:00.0: NVIDIA TU102 (162000a1)
> [    6.594464] nouveau 0000:0b:00.0: bios: version 90.02.42.00.14
> [    6.597756] nouveau 0000:0b:00.0: pmu: firmware unavailable
> [    6.601947] nouveau 0000:0b:00.0: fb: 11264 MiB GDDR6
> [    6.618463] nouveau 0000:0b:00.0: DRM: VRAM: 11264 MiB
> [    6.618465] nouveau 0000:0b:00.0: DRM: GART: 536870912 MiB
> [    6.618466] nouveau 0000:0b:00.0: DRM: BIT table 'A' not found
> [    6.618468] nouveau 0000:0b:00.0: DRM: BIT table 'L' not found
> [    6.618469] nouveau 0000:0b:00.0: DRM: TMDS table version 2.0
> [    6.618470] nouveau 0000:0b:00.0: DRM: DCB version 4.1
> [    6.618471] nouveau 0000:0b:00.0: DRM: DCB outp 00: 02800f66 04600020
> [    6.618473] nouveau 0000:0b:00.0: DRM: DCB outp 01: 02000f62 00020020
> [    6.618474] nouveau 0000:0b:00.0: DRM: DCB outp 03: 02011f52 00020010
> [    6.618475] nouveau 0000:0b:00.0: DRM: DCB outp 04: 04822f76 04600010
> [    6.618476] nouveau 0000:0b:00.0: DRM: DCB outp 05: 04022f72 00020010
> [    6.618477] nouveau 0000:0b:00.0: DRM: DCB outp 08: 01844f36 04600010
> [    6.618478] nouveau 0000:0b:00.0: DRM: DCB outp 09: 01044f32 00020010
> [    6.618479] nouveau 0000:0b:00.0: DRM: DCB outp 10: 04833f86 04600020
> [    6.618481] nouveau 0000:0b:00.0: DRM: DCB conn 00: 00020046
> [    6.618481] nouveau 0000:0b:00.0: DRM: DCB conn 01: 00010161
> [    6.618482] nouveau 0000:0b:00.0: DRM: DCB conn 02: 01000246
> [    6.618483] nouveau 0000:0b:00.0: DRM: DCB conn 03: 02000371
> [    6.618484] nouveau 0000:0b:00.0: DRM: DCB conn 04: 00001446
> [    6.620448] nouveau 0000:0b:00.0: DRM: MM: using COPY for buffer copies
> [    7.062338] nouveau 0000:0b:00.0: [drm] Cannot find any crtc or sizes
> [    7.065331] [drm] Initialized nouveau 1.3.1 20120801 for 0000:0b:00.0 on minor 1
> [    7.254317] nouveau 0000:0b:00.0: [drm] Cannot find any crtc or sizes
> [    7.446318] nouveau 0000:0b:00.0: [drm] Cannot find any crtc or sizes
> [    8.501252] nvidia-gpu 0000:0b:00.3: enabling device (0000 -> 0002)
> [    8.696138] audit: type=1400 audit(1667665884.700:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=926 comm="apparmor_parser"
> [    8.696141] audit: type=1400 audit(1667665884.700:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=926 comm="apparmor_parser"
> [    8.704333] snd_hda_intel 0000:0b:00.1: bound 0000:0b:00.0 (ops nv50_audio_component_bind_ops [nouveau])
> [    8.708797] input: HDA NVidia HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:03.2/0000:0b:00.1/sound/card1/input15
> [    8.708903] input: HDA NVidia HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:03.2/0000:0b:00.1/sound/card1/input16
> [    8.708936] input: HDA NVidia HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:03.2/0000:0b:00.1/sound/card1/input17
> [    8.708965] input: HDA NVidia HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:03.2/0000:0b:00.1/sound/card1/input18
> [    8.708994] input: HDA NVidia HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:03.2/0000:0b:00.1/sound/card1/input19
> [    8.709032] input: HDA NVidia HDMI/DP,pcm=11 as /devices/pci0000:00/0000:00:03.2/0000:0b:00.1/sound/card1/input20
> [    8.709065] input: HDA NVidia HDMI/DP,pcm=12 as /devices/pci0000:00/0000:00:03.2/0000:0b:00.1/sound/card1/input21
> [   10.776280] nouveau 0000:0b:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none
> [ 3275.720190] nouveau 0000:0b:00.0: therm: temperature (90 C) hit the 'fanboost' threshold
> [ 9426.768449] nvidia-gpu 0000:0b:00.3: Unable to change power state from D3hot to D0, device inaccessible
> [ 9427.889387] nvidia-gpu 0000:0b:00.3: i2c timeout error ffffffff
> timothy@localhost:~>
>

