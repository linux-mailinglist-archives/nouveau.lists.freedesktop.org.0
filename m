Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346463273FF
	for <lists+nouveau@lfdr.de>; Sun, 28 Feb 2021 20:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0275C89F8B;
	Sun, 28 Feb 2021 19:10:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F7E89F8B
 for <nouveau@lists.freedesktop.org>; Sun, 28 Feb 2021 19:10:35 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id i8so15362416iog.7
 for <nouveau@lists.freedesktop.org>; Sun, 28 Feb 2021 11:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3RyMdf27d4YfRZCYiitWwZ1QZzQZBmpl830KZc01AU4=;
 b=lLUFlKfIidauwLTJ5Ob5yB+hI85U5SRMTfafEPCq42SkItoEas5JyUnth96JsJDmPb
 CJsyylswu88ExarpuN54t3iiXSPY0jawGzvR5rYpT3yQxc2bNRH1Q8+WtjivyRtw+Etu
 HJH/TvdqeNq4Tou3ycLP4krUrmhO4em2pO2XvbUMl5kt5/OXoJLn3IH1QG3f2Won4GlP
 q5WOd6rRGXyCU28yUUwlTHI7t5uplZtoZqeS2KbS7Z7L7Cs98sO6h7JR8i4lsXRiPB87
 JbjKBB3P8PKe6lJWGk0z9hWcQVlBhCLtqpw3Jo7D6P4Kfg8iZVoOOwlYbr2YGQUk0H36
 2wHA==
X-Gm-Message-State: AOAM530AcuGvDJNckEPWSNtKNQHACTQgS79Ndzrlym+mQdJs8x/so+Jt
 JudVUyhc2MV5+asYCgPjize+R0yYEtIVozzd2x1sJD0tPzY=
X-Google-Smtp-Source: ABdhPJzH/7N0ZuWOavSyKLnW0embSEQ5ypGpgfuqT2YAp7CJGSRb+3+uXoFDk94lBoErT2iI98Z+8b/bI6vWtTdpz0k=
X-Received: by 2002:a05:6638:635:: with SMTP id
 h21mr1590089jar.97.1614539435241; 
 Sun, 28 Feb 2021 11:10:35 -0800 (PST)
MIME-Version: 1.0
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
 <56b77cbe-6ace-6850-b26a-a762ae94dbcd@gmail.com>
 <CAKb7UvjYcrqzbyRCZDcO=hA3R4pF2hzEdjqMHgRGuYQPYSqKmQ@mail.gmail.com>
 <a4b52255-5b09-4eaa-8a35-81c1c062b462@gmail.com>
In-Reply-To: <a4b52255-5b09-4eaa-8a35-81c1c062b462@gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 28 Feb 2021 14:10:24 -0500
Message-ID: <CAKb7Uvh5T-B37yTeky7keXYZQEd8B8=sqKbQ7TsD0W83HbanWg@mail.gmail.com>
To: uwe.sauter.de@gmail.com
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
Cc: Alex Riesen <alexander.riesen@cetitec.com>,
 nouveau <nouveau@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Feb 28, 2021 at 12:59 PM Uwe Sauter <uwe.sauter.de@gmail.com> wrote:
>
>
>
> Am 28.02.21 um 18:02 schrieb Ilia Mirkin:
> > On Sun, Feb 28, 2021 at 10:10 AM Uwe Sauter <uwe.sauter.de@gmail.com> wrote:
> >>
> >>
> >>
> >> Am 27.02.21 um 22:26 schrieb Ilia Mirkin:
> >>> On Sat, Feb 27, 2021 at 7:28 AM Uwe Sauter <uwe.sauter.de@gmail.com> wrote:
> >>>>
> >>>> I can also report that the modesetting ddx that comes with xorg-server 1.20.10-3 (Arch Linux package) shows this kind of
> >>>> cursor-cut-into-horizontal-stripes behavior. Changing to xf86-video-nouveau 1.0.17-1 solves this issue. But nouveau has
> >>>> issues with Mate 1.24 (as discussed earlier this month).
> >>>>
> >>>> My hardware:
> >>>> # lspci -s 3:0.0 -v
> >>>> 03:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 710] (rev a1) (prog-if 00 [VGA controller])
> >>>>           Subsystem: ASUSTeK Computer Inc. GT710-4H-SL-2GD5
> >>>>           Flags: bus master, fast devsel, latency 0, IRQ 36, IOMMU group 12
> >>>>           Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
> >>>>           Memory at fff0000000 (64-bit, prefetchable) [size=128M]
> >>>>           Memory at fff8000000 (64-bit, prefetchable) [size=32M]
> >>>>           I/O ports at f000 [size=128]
> >>>>           Expansion ROM at fc000000 [disabled] [size=512K]
> >>>>           Capabilities: [60] Power Management version 3
> >>>>           Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
> >>>>           Capabilities: [78] Express Legacy Endpoint, MSI 00
> >>>>           Capabilities: [100] Virtual Channel
> >>>>           Capabilities: [128] Power Budgeting <?>
> >>>>           Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
> >>>>           Capabilities: [900] Secondary PCI Express
> >>>>           Kernel driver in use: nouveau
> >>>>           Kernel modules: nouveau
> >>>>
> >>>>
> >>>> If I can help in any way please let me know.
> >>>
> >>> Thanks, that's good info. Simon - you originally said that everything
> >>> looked good on your GK208, so a retest would be super.
> >>>
> >>> I just double-checked on a GP108 (with an older kernel, but same idea
> >>> should apply), and it seems like 256x256 cursors are fine there.
> >>> However the display logic has gone through some ideally no-op updates
> >>> since that kernel version, but there could very easily be issues.
> >>>
> >>> Can you try Alex's patch to modetest and confirm that you see issues
> >>> with modetest? If so, can you (and maybe Alex as well) try an older
> >>> kernel (I'm on 5.6) and see if modetest behaves well there. [The patch
> >>> in question was to expose 256x256 as the 'preferred' size, but support
> >>> for the larger cursors has been around for a while.] Alex - if you
> >>> have time, same question to you.
> >>>
> >>> You can find the patch here:
> >>> https://lists.x.org/archives/nouveau/2021-February/037992.html
> >>
> >> I had to install a parallel Arch Linux to my existing production system in order to keep it clean from all the
> >> development stuff.
> >>
> >> System summary (most recent):
> >> AMD Ryzen 3 3100
> >> Gigabyte B550M S2H with BIOS F13c
> >> Asus GT710-4H-SL-2GD5 (GK208B [GeForce GT 710] (rev a1)) using nouveau kernel module
> >> 32GB DDR4-3200MHz ECC
> >>
> >> libdrm 2.4.104-1
> >> linux 5.11.2.arch1-1
> >> mesa 20.3.4-3
> >> xf86-video-nouveau 1.0.17-1
> >>
> >>
> >>
> >> I built libdrm 2.4.104.r16.ga9bb32cf in order to get modetest.
> >>
> >> With unmodified kernel / modetest (cw=64, ch=64) I call:
> >>
> >> $ ./modetest -c |grep '^[0-9]\|preferred'
> >> 85  86  connected HDMI-A-1        530x300   40  86
> >>     #0 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500 flags: phsync, pvsync; type: preferred, driver
> >> 87  0 disconnected  HDMI-A-2        0x0   0 88
> >> 89  0 disconnected  HDMI-A-3        0x0   0 90
> >> 91  0 disconnected  HDMI-A-4        0x0   0 92
> >>
> >> ./modetest -s 85:1920x1080 -C
> >> trying to open device 'i915'...failed
> >> trying to open device 'amdgpu'...failed
> >> trying to open device 'radeon'...failed
> >> trying to open device 'nouveau'...done
> >> setting mode 1920x1080-60.00Hz on connectors 85, crtc 50
> >> starting cursor
> >> ^C
> >>
> >> This shows several things:
> >> * There is a moving gray, half transparent square bouncing around. I believe that this is
> >>     the mentioned cursor.
> >>
> >> * The cursor movement happens at various speeds, sometimes staying half a second on the
> >>     same position to then move quite fast to another, then slowing down.
> >>
> >> * The cursor is flickering.
> >>
> >> * When (forcefully) ending the test the screen is not properly reset, leaving the
> >>     previous content in a state similar to the phenomenon with the mouse cursor that stated
> >>     this discussion. On my FullHD display the console output is sliced horizontally and
> >>     offset with about 1/5th of the screen width.
> >>
> >> This also happens on my other machine with a Xeon E3-1245 v3 with integrated graphics on a ASRock C226 WS, using the
> >> i915 kernel module and same software versions as above.
> >>
> >> Applying Alex' patch with (cw=128, ch=128) shows a cursor that contains the same test pattern as is shown in the
> >> background. The behavior is as jumpy and flickery as it was with size 64.
> >> When killing the test the last position of the cursor still shows the test pattern while the background is again sliced
> >> and shuffled horizontally.
> >>
> >> Setting the size to 256 shows an even larger cursor. It shows the same jumpy and flickery behavior as the other two. The
> >> cursor itself also shows a horizontal sliced in the lower half. After killing the test the cursor's last position still
> >> shows the test pattern while the background is sliced.
> >>
> >> This testing was all conducted with packages from the Arch Linux distribution (but for modetest).
> >>
> >> Questions:
> >>
> >> 1) Is this jumpy and flickery behavior expected or should the cursor move smoothly?
> >
> > Good question. It's definitely jumpy/flickery for me too. I haven't
> > looked at why, but I wouldn't worry about it. I suspect it has to do
> > with the mechanics of how it causes the cursor to be moved.
> >
> >>
> >> 2) With unmodified modetest, what should the cursor look like? Without further inspection
> >>      of the code I suspect that the change from UTIL_PATTERN_PLAIN to UTIL_PATTERN_SMPTE
> >>      changed the cursor's appearance.
> >
> > The PLAIN pattern is just gray, which isn't necessarily a great test
> > to see visual corruption.
> >
> >>
> >> 4) How long is modetest expected to run? On the first run I let it test for over 10min
> >>      before deciding to kill it.
> >
> > Until you hit enter (or escape or maybe any key, I forget).
> >
> >>
> >> 5) Is modetest expected to reset the display to the state it was before? Why doesn't it
> >>      do that when being killed?
> >
> > No. You can switch vt's back and forth to restore. It's just a test
> > application. It's unfortunately not an entirely trivial thing to do.
> >
> >>
> >> 6) Where do you expect this bug to come from? Kernel nouveau driver, modesetting ddx,
> >>      nouveau ddx?
> >
> > modetest interacts with the kernel directly. The bug is most likely in
> > the hardware, and we should just not use the 256x256 size even though
> > allegedly the hw supports it. But perhaps the kernel screws something
> > up.
> >
> >>
> >> 7) Any proposal what kernel to test next?
> >
> > If you could test modetest with 256x256 cursor on a pre-5.9 kernel and
> > ensure that you see the same corruption in the cursor image, that'd
> > confirm that we didn't just screw something up in the macro rework
> > which landed in 5.9, vs a hw issue.
>
>
> Ok, two more kernels tested.
>
> 5.10.19:
> * modetest same as 5.11.2
> * mouse pointer in X session is ok (both modesetting ddx and nouveau ddx)
> * (Mate issue does appear with nouveau ddx but not with modesetting ddx)
>
> 5.4.101:
> * modetest connector ID changed from 85 to 69
> * other than that same as 5.11.2
> * mouse pointer in X session is ok (both modesetting ddx and nouveau ddx)
> * (Mate issue does appear with nouveau ddx but not with modesetting ddx)
>
>
> Summary:
>                    5.4.101  | 5.10.19  | 5.11.2
> modetest-64       seems ok | seems ok | seems ok
> modetest-128      seems ok | seems ok | seems ok
> modetest-256      sliced   | sliced   | sliced
> X mouse pointer   ok       | ok       | sliced
> (modesetting ddx)
> X mouse pointer   ok       | ok       | ok
> (nouveau ddx)
>
> Really strange that the issue only appears on 5.11 on my hardware.
>
>
> >
> > Presumably the corruption you refer to in the cursor image at 256x256
> > is similar to what you see with Xorg + modesetting?
>
> In X the mouse pointer is sliced and somehow wraps in vertical direction so that
> the tip of the arrow is about 1/3 from the top.
>
> The sclicing in the modetest cursor appears in the area from about 1/2 to 3/4 from
> the top of the cursor.

It's probably the same corruption, just looks slightly different based
on the image. Kernel 5.11 made 256x256 cursors the default (which is
what xf86-video-modesetting uses to determine cursor size), hence the
change in behavior.

Thanks again for confirming.

So it sounds like all Kepler hardware has issues with 256x256. I've
tested on gp108 and did not observe any obvious issues. Probably good
to find a GM107 and GM200 to test on as well.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
