Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D36237A2
	for <lists+nouveau@lfdr.de>; Thu, 10 Nov 2022 00:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEF110E62C;
	Wed,  9 Nov 2022 23:44:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242CE10E62C
 for <nouveau@lists.freedesktop.org>; Wed,  9 Nov 2022 23:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668037473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EByE73TSfDyrbg/nLS2GCOxthVuRBYwoCKFyOCq1oeg=;
 b=iA6F7e0f9QNxTuouoPeow5qpiMMkZBHO+/gAyt/KUA3Ume08fO2dEh6MyHbNcSDkkM+573
 ZmrnOto7ra+1u4o6L2m5k5GbmqbNw2IFPM0JfZp7SeM34k+alxCijv1Md/ojroslvdhmDF
 iQJsTsayaX6ACQi6Q4vEAySs0jAhPrk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-KBBpY0R8PnmMYuw1rssGow-1; Wed, 09 Nov 2022 18:44:32 -0500
X-MC-Unique: KBBpY0R8PnmMYuw1rssGow-1
Received: by mail-qv1-f69.google.com with SMTP id
 ng1-20020a0562143bc100b004bb706b3a27so333581qvb.20
 for <nouveau@lists.freedesktop.org>; Wed, 09 Nov 2022 15:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EByE73TSfDyrbg/nLS2GCOxthVuRBYwoCKFyOCq1oeg=;
 b=p8gsU8E6IGgIS7o/df4kf0dKOPu5TvdSLHomrsY93bvsGh5oPEsI0os9ZQ4tTzstUp
 0/nyYUcXDLB26pFdnzmQFRf8Wp/gJn0e/VBCmvYqltAapvRMBvg7U4brNkzWa/SPp+Dy
 IVc5C4+RdzoU2SviR4FbkV8eGNKgpNLjPpNA/tN+MVg59DP6lrhJfE03G+Ck45Krovcb
 FnfiCY7313UKsvfQVVHsY8eIo7R8luOQYLg+WdAFqpzWJI+rttG3ypMuYxRWE0wMYYZi
 YwbAYtAVX5PblyNgJKzAqmI3uWPrimMkR2kaUCK93SA0KXQJKpy8KJsllo7J0P5eLTy9
 TnqA==
X-Gm-Message-State: ACrzQf3Ec8/Rr4zyyt9K6MDeCOy9xDvckfUenyqudREoaGHIZ2msLYgX
 x+VuSLfqyBhUjXyvem1fMAqsXJa8yHoVSpEYQah9iPoz+92qj1RBzfn85ATTkX4ZUZG4AZ9cj8s
 Ilr9tC3ev1GQGJKXU3IKsRMY73dj8ND1cFje68J4PnA==
X-Received: by 2002:a05:620a:bcc:b0:6ce:c077:acf3 with SMTP id
 s12-20020a05620a0bcc00b006cec077acf3mr44789039qki.263.1668037471234; 
 Wed, 09 Nov 2022 15:44:31 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6w9nXTYKi3Z1ZvM/WN4DWAs3XqYpeo0FrrcbDKV0tO0AA0+IkiJ6gEG1JPgP5K6pL4EMR4DWOZGlNVcYXIvqA=
X-Received: by 2002:a05:620a:bcc:b0:6ce:c077:acf3 with SMTP id
 s12-20020a05620a0bcc00b006cec077acf3mr44789025qki.263.1668037470952; Wed, 09
 Nov 2022 15:44:30 -0800 (PST)
MIME-Version: 1.0
References: <tk6dm1$jsm$1@ciao.gmane.io>
In-Reply-To: <tk6dm1$jsm$1@ciao.gmane.io>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 10 Nov 2022 00:44:19 +0100
Message-ID: <CACO55tuPJy3GfYOyNkV=5aLLWrNQx=7DVZ3R6yCxd_X0+wUUNg@mail.gmail.com>
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
Cc: nouveau@lists.freedesktop.org
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

one thing which might help to figure out what's going on would be to
know the output of `lspci -t` and `grep .
/sys/bus/pci/devices/*/power/control`

> [ 9426.768449] nvidia-gpu 0000:0b:00.3: Unable to change power state from D3hot to D0, device inaccessible
> [ 9427.889387] nvidia-gpu 0000:0b:00.3: i2c timeout error ffffffff
> timothy@localhost:~>
>

