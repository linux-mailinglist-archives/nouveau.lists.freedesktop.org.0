Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E673272D3
	for <lists+nouveau@lfdr.de>; Sun, 28 Feb 2021 16:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789C86E219;
	Sun, 28 Feb 2021 15:10:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A516E219
 for <nouveau@lists.freedesktop.org>; Sun, 28 Feb 2021 15:10:26 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id k13so23460440ejs.10
 for <nouveau@lists.freedesktop.org>; Sun, 28 Feb 2021 07:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dkLr7pSmE3s2wYeM1JyjAiM3R0Sn+X/EP48XYd/StHg=;
 b=DWtVzRtJ0v7xfiK6mtn+hYqQwGF9RG1Br9ETy0WSdRiUxXPcUgbbyR8stSxo0InVSn
 z5Hxq+/HreKXygmAFGeVNdnt2ZN5ZHDOFnIUlkTAmq/Lbc6hIApgxv2F/64Yw6UFniLY
 tMqUtiM4/qv+O/YKjVKsdYcf1XfLzaPO0WfTdAeyTf0pVKfj04MUModYP/JmS5E7/N1p
 exjU/c7B32mHKmE2KE3FVsvvChn9kdpYwbJYJ4QTge3JhEImrj3suJ8hCFpPSaDDQ35F
 eIuwcRuR4hxFJNj+pOSJfUC1gJg1eqFDURqOtMb1UuIW5c9+INaBSixoQqnpqns3pd7w
 fk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dkLr7pSmE3s2wYeM1JyjAiM3R0Sn+X/EP48XYd/StHg=;
 b=TLTNYSvPa7wrHYUuq+qVKo3kZ5BnloZ2JOt70YagjHlLkDwPkpUsfW4LBgQAcsBgSN
 jz/VcuX7sSkkbFVBXJ+yBy/zx81Vcm4jLdFbT/fts27K7oXJkvRRvLriX7M1xAR5shC5
 9wWkLe6aUy7ONhnk3thZsqg3oVM0cRUGWTbEZMcIFJ2/wRIbFK3UPkFCjuFIEACAl+YU
 rgUd9Rg8q6CzY3z5dyyxfsRDc62V5q+V+dR7zLXtIl8U+aANzGUMsauychuMaxStCnJF
 itwlqyAQHyhKbb1sYERRACxJZoYYmc5c9NusUybfUXb5YHQHHXUYWRIV22dRlOgjoPjo
 lEFQ==
X-Gm-Message-State: AOAM532Hp6Rp6d0Ljys5vh9EZGx5udcBrN5XnQX9Ud6Hb5v/Cynr0ope
 GJsKzqe/JUwLcYyHlX8DUJvqBkgw+wzIF9gt
X-Google-Smtp-Source: ABdhPJz0PRSvd6v09FW+E2NICky+9SYyqJA7jSI5DfrU8Xd84ucKWjVJyD5k2BhezehZzuOjctN0XQ==
X-Received: by 2002:a17:906:a944:: with SMTP id
 hh4mr4842096ejb.479.1614525024695; 
 Sun, 28 Feb 2021 07:10:24 -0800 (PST)
Received: from ?IPv6:2a02:8070:a396:f000:42be:1b84:875b:eaf?
 ([2a02:8070:a396:f000:42be:1b84:875b:eaf])
 by smtp.googlemail.com with ESMTPSA id a7sm11217669edr.29.2021.02.28.07.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 07:10:24 -0800 (PST)
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
 <YDUkfjDA4xLJlxE5@pflmari> <YDUr2OGDsxDyC0l2@pflmari>
 <CAKb7UvjmdgS536tNzisomi_oXOGk3Q+anp0AfPvA8OruU_9m5Q@mail.gmail.com>
 <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
 <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
 <YDaEiDkTiqhy/r+i@pflmari>
 <CAKb7UviFdgqqSrFvZJzfenaKa_0P6hJ4SaDrwA39Lz8jVigDGw@mail.gmail.com>
 <YDaGtzRDUIbErYDY@pflmari>
 <CAKb7UvjBQeb84sitYUTLOd6EJo_+_9hXjmT=8r5V1onxtUMh7g@mail.gmail.com>
 <91687a59-dae6-199e-ca4a-35b49b6959ea@gmail.com>
 <CAKb7Uvg-R-rW_=+YZusocwwedDzHc0Nffwki5vOEd4tP6zRy3g@mail.gmail.com>
From: Uwe Sauter <uwe.sauter.de@gmail.com>
Message-ID: <56b77cbe-6ace-6850-b26a-a762ae94dbcd@gmail.com>
Date: Sun, 28 Feb 2021 16:10:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAKb7Uvg-R-rW_=+YZusocwwedDzHc0Nffwki5vOEd4tP6zRy3g@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor
 size to userspace
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
Reply-To: uwe.sauter.de@gmail.com
Cc: Alex Riesen <alexander.riesen@cetitec.com>,
 nouveau <nouveau@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



Am 27.02.21 um 22:26 schrieb Ilia Mirkin:
> On Sat, Feb 27, 2021 at 7:28 AM Uwe Sauter <uwe.sauter.de@gmail.com> wrote:
>>
>> I can also report that the modesetting ddx that comes with xorg-server 1.20.10-3 (Arch Linux package) shows this kind of
>> cursor-cut-into-horizontal-stripes behavior. Changing to xf86-video-nouveau 1.0.17-1 solves this issue. But nouveau has
>> issues with Mate 1.24 (as discussed earlier this month).
>>
>> My hardware:
>> # lspci -s 3:0.0 -v
>> 03:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 710] (rev a1) (prog-if 00 [VGA controller])
>>          Subsystem: ASUSTeK Computer Inc. GT710-4H-SL-2GD5
>>          Flags: bus master, fast devsel, latency 0, IRQ 36, IOMMU group 12
>>          Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
>>          Memory at fff0000000 (64-bit, prefetchable) [size=128M]
>>          Memory at fff8000000 (64-bit, prefetchable) [size=32M]
>>          I/O ports at f000 [size=128]
>>          Expansion ROM at fc000000 [disabled] [size=512K]
>>          Capabilities: [60] Power Management version 3
>>          Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
>>          Capabilities: [78] Express Legacy Endpoint, MSI 00
>>          Capabilities: [100] Virtual Channel
>>          Capabilities: [128] Power Budgeting <?>
>>          Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
>>          Capabilities: [900] Secondary PCI Express
>>          Kernel driver in use: nouveau
>>          Kernel modules: nouveau
>>
>>
>> If I can help in any way please let me know.
> 
> Thanks, that's good info. Simon - you originally said that everything
> looked good on your GK208, so a retest would be super.
> 
> I just double-checked on a GP108 (with an older kernel, but same idea
> should apply), and it seems like 256x256 cursors are fine there.
> However the display logic has gone through some ideally no-op updates
> since that kernel version, but there could very easily be issues.
> 
> Can you try Alex's patch to modetest and confirm that you see issues
> with modetest? If so, can you (and maybe Alex as well) try an older
> kernel (I'm on 5.6) and see if modetest behaves well there. [The patch
> in question was to expose 256x256 as the 'preferred' size, but support
> for the larger cursors has been around for a while.] Alex - if you
> have time, same question to you.
> 
> You can find the patch here:
> https://lists.x.org/archives/nouveau/2021-February/037992.html

I had to install a parallel Arch Linux to my existing production system in order to keep it clean from all the 
development stuff.

System summary (most recent):
AMD Ryzen 3 3100
Gigabyte B550M S2H with BIOS F13c
Asus GT710-4H-SL-2GD5 (GK208B [GeForce GT 710] (rev a1)) using nouveau kernel module
32GB DDR4-3200MHz ECC

libdrm 2.4.104-1
linux 5.11.2.arch1-1
mesa 20.3.4-3
xf86-video-nouveau 1.0.17-1



I built libdrm 2.4.104.r16.ga9bb32cf in order to get modetest.

With unmodified kernel / modetest (cw=64, ch=64) I call:

$ ./modetest -c |grep '^[0-9]\|preferred'
85  86  connected HDMI-A-1        530x300   40  86
   #0 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500 flags: phsync, pvsync; type: preferred, driver
87  0 disconnected  HDMI-A-2        0x0   0 88
89  0 disconnected  HDMI-A-3        0x0   0 90
91  0 disconnected  HDMI-A-4        0x0   0 92

./modetest -s 85:1920x1080 -C
trying to open device 'i915'...failed
trying to open device 'amdgpu'...failed
trying to open device 'radeon'...failed
trying to open device 'nouveau'...done
setting mode 1920x1080-60.00Hz on connectors 85, crtc 50
starting cursor
^C

This shows several things:
* There is a moving gray, half transparent square bouncing around. I believe that this is
   the mentioned cursor.

* The cursor movement happens at various speeds, sometimes staying half a second on the
   same position to then move quite fast to another, then slowing down.

* The cursor is flickering.

* When (forcefully) ending the test the screen is not properly reset, leaving the
   previous content in a state similar to the phenomenon with the mouse cursor that stated
   this discussion. On my FullHD display the console output is sliced horizontally and
   offset with about 1/5th of the screen width.

This also happens on my other machine with a Xeon E3-1245 v3 with integrated graphics on a ASRock C226 WS, using the 
i915 kernel module and same software versions as above.

Applying Alex' patch with (cw=128, ch=128) shows a cursor that contains the same test pattern as is shown in the 
background. The behavior is as jumpy and flickery as it was with size 64.
When killing the test the last position of the cursor still shows the test pattern while the background is again sliced 
and shuffled horizontally.

Setting the size to 256 shows an even larger cursor. It shows the same jumpy and flickery behavior as the other two. The 
cursor itself also shows a horizontal sliced in the lower half. After killing the test the cursor's last position still 
shows the test pattern while the background is sliced.

This testing was all conducted with packages from the Arch Linux distribution (but for modetest).

Questions:

1) Is this jumpy and flickery behavior expected or should the cursor move smoothly?

2) With unmodified modetest, what should the cursor look like? Without further inspection
    of the code I suspect that the change from UTIL_PATTERN_PLAIN to UTIL_PATTERN_SMPTE
    changed the cursor's appearance.

4) How long is modetest expected to run? On the first run I let it test for over 10min
    before deciding to kill it.

5) Is modetest expected to reset the display to the state it was before? Why doesn't it
    do that when being killed?

6) Where do you expect this bug to come from? Kernel nouveau driver, modesetting ddx,
    nouveau ddx?

7) Any proposal what kernel to test next?



Regards,

     Uwe

> Unfortunately I'm doing some other stuff, so it's not convenient for
> me to hop to a different kernel version right now.
> 
> Cheers,
> 
>    -ilia
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
