Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D811FFC64
	for <lists+nouveau@lfdr.de>; Thu, 18 Jun 2020 22:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568716E447;
	Thu, 18 Jun 2020 20:19:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4A56E447;
 Thu, 18 Jun 2020 20:19:14 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id u17so4314382vsu.7;
 Thu, 18 Jun 2020 13:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qSwSY8YJQIddJ59Vrp95WbPXR1QMxnWBM80612/bTbE=;
 b=UWbn9KGxZF7aORtcDFPcCOGnZedVxvGgUtn5FCP3rOJe9AZgo9gcDIONxjg1//vf5z
 mEWHGF4/KvGAXO4l0V3Pwd9KvQLdJtWaIYYkGNhxJqgOyYeen6z1ZaepCq2atkiVAHtB
 oIpSPv26HGMQuOjPPbkwrrN303P0tPd513SJKnG6RoOSKGZY2cn0feWKQcknwxKiz8dH
 Jv8MvVR9jmX7Rv4Wv0oBEhCBTYMctdgR/HBY9knm9SXF7pzuNUDv+GXCnNySM4LtD764
 R503pHGCYvZkj42zOJ6cgOwOcQbGHX2ZTFkKpHaph2VpXW9Ok6NEko9J257gQq0fMwfV
 3iEA==
X-Gm-Message-State: AOAM531pZyV7PD0cy3hxQVXOzWz5ZtsIN7wtM7ZwRmrTFpunvcdt96xL
 i6fqKSFtncqfeyCLQuWkLn8zW7/9yohWp0l/U/8=
X-Google-Smtp-Source: ABdhPJxxiADmycRfXrdHbDVvri9Z01+pfe+180opoCNTMkKQRieFT1HVfW4arAxR78ynemYMFpQ3OldW4Yi7x3AX38U=
X-Received: by 2002:a67:800f:: with SMTP id b15mr5034663vsd.220.1592511553876; 
 Thu, 18 Jun 2020 13:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200618200106.GF27951@zn.tnic>
In-Reply-To: <20200618200106.GF27951@zn.tnic>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 18 Jun 2020 16:19:02 -0400
Message-ID: <CAKb7UviibvRfqJgtLkePEuXFa6mQfi4h=7eeW+YQxB-StVjjrA@mail.gmail.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [Nouveau] 2dd4d163cd9c ("drm/nouveau: remove open-coded version
 of remove_conflicting_pci_framebuffers()")
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Boris,

There was a fixup to that patch that you'll also have to revert first
-- 7dbbdd37f2ae7dd4175ba3f86f4335c463b18403. I guess there's some
subtle difference between the old open-coded logic and the helper,
they were supposed to be identical.

Cheers,

  -ilia

On Thu, Jun 18, 2020 at 4:09 PM Borislav Petkov <bp@alien8.de> wrote:
>
> Hi,
>
> my test box won't boot 5.8-rc1 all the way but stops at
>
> ...
> fb0: switching to nouveaufb from EFI VGA
> <-- EOF
>
> I've bisected it to the commit in $Subject, see below. Unfortunately, it
> doesn't revert cleanly so I can't really do the final test of reverting
> it ontop of 5.8-rc1 to confirm that this one is really causing it.
>
> Any ideas?
>
> GPU is:
>
> [    5.678614] fb0: switching to nouveaufb from EFI VGA
> [    5.685577] Console: switching to colour dummy device 80x25
> [    5.691865] nouveau 0000:03:00.0: NVIDIA GT218 (0a8c00b1)
> [    5.814409] nouveau 0000:03:00.0: bios: version 70.18.83.00.08
> [    5.823559] nouveau 0000:03:00.0: fb: 512 MiB DDR3
> [    6.096680] [TTM] Zone  kernel: Available graphics memory: 8158364 KiB
> [    6.103327] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
> [    6.109951] [TTM] Initializing pool allocator
> [    6.114405] [TTM] Initializing DMA pool allocator
> [    6.119256] nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
> [    6.124285] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
> [    6.129677] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
> [    6.135534] nouveau 0000:03:00.0: DRM: DCB version 4.0
> [    6.140755] nouveau 0000:03:00.0: DRM: DCB outp 00: 02000360 00000000
> [    6.147273] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000362 00020010
> [    6.153782] nouveau 0000:03:00.0: DRM: DCB outp 02: 028003a6 0f220010
> [    6.160292] nouveau 0000:03:00.0: DRM: DCB outp 03: 01011380 00000000
> [    6.166810] nouveau 0000:03:00.0: DRM: DCB outp 04: 08011382 00020010
> [    6.173306] nouveau 0000:03:00.0: DRM: DCB outp 05: 088113c6 0f220010
> [    6.179829] nouveau 0000:03:00.0: DRM: DCB conn 00: 00101064
> [    6.185553] nouveau 0000:03:00.0: DRM: DCB conn 01: 00202165
> [    6.196145] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
> [    6.233659] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    6.311939] nouveau 0000:03:00.0: DRM: allocated 1920x1080 fb: 0x70000, bo (____ptrval____)
> [    6.320736] fbcon: nouveaudrmfb (fb0) is primary device
> [    6.392722] tsc: Refined TSC clocksource calibration: 3591.346 MHz
> [    6.392788] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x33c46403b59, max_idle_ns: 440795293818 ns
> [    6.392930] clocksource: Switched to clocksource tsc
> [    6.509946] Console: switching to colour frame buffer device 240x67
> [    6.546287] nouveau 0000:03:00.0: fb0: nouveaudrmfb frame buffer device
> [    6.555021] [drm] Initialized nouveau 1.3.1 20120801 for 0000:03:00.0 on minor 0
>
> Thx.
>
> git bisect start
> # good: [3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162] Linux 5.7
> git bisect good 3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162
> # bad: [b3a9e3b9622ae10064826dccb4f7a52bd88c7407] Linux 5.8-rc1
> git bisect bad b3a9e3b9622ae10064826dccb4f7a52bd88c7407
> # bad: [ee01c4d72adffb7d424535adf630f2955748fa8b] Merge branch 'akpm' (patches from Andrew)
> git bisect bad ee01c4d72adffb7d424535adf630f2955748fa8b
> # bad: [16d91548d1057691979de4686693f0ff92f46000] Merge tag 'xfs-5.8-merge-8' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux
> git bisect bad 16d91548d1057691979de4686693f0ff92f46000
> # good: [cfa3b8068b09f25037146bfd5eed041b78878bee] Merge tag 'for-linus-hmm' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
> git bisect good cfa3b8068b09f25037146bfd5eed041b78878bee
> # good: [3fd911b69b3117e03181262fc19ae6c3ef6962ce] Merge tag 'drm-misc-next-2020-05-07' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
> git bisect good 3fd911b69b3117e03181262fc19ae6c3ef6962ce
> # bad: [1966391fa576e1fb2701be8bcca197d8f72737b7] mm/migrate.c: attach_page_private already does the get_page
> git bisect bad 1966391fa576e1fb2701be8bcca197d8f72737b7
> # good: [43c8546bcd854806736d8a635a0d696504dd4c21] drm/amdgpu: Add a UAPI flag for user to call mem_sync
> git bisect good 43c8546bcd854806736d8a635a0d696504dd4c21
> # good: [6cf991611bc72c077f0cc64e23987341ad7ef41e] Merge tag 'drm-intel-next-2020-05-15' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
> git bisect good 6cf991611bc72c077f0cc64e23987341ad7ef41e
> # bad: [dc455f4c888365595c0a13da445e092422d55b8d] drm/nouveau/dispnv50: fix runtime pm imbalance on error
> git bisect bad dc455f4c888365595c0a13da445e092422d55b8d
> # bad: [2dd4d163cd9c15432524aa9863155bc03a821361] drm/nouveau: remove open-coded version of remove_conflicting_pci_framebuffers()
> git bisect bad 2dd4d163cd9c15432524aa9863155bc03a821361
> # good: [c41219fda6e04255c44d37fd2c0d898c1c46abf1] Merge tag 'drm-intel-next-fixes-2020-05-20' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
> git bisect good c41219fda6e04255c44d37fd2c0d898c1c46abf1
> # good: [fd44028ff145ffb2d03c877d74f479da04ac2c62] drm/nouveau/acr: ensure falcon providing acr functions is bootstrapped first
> git bisect good fd44028ff145ffb2d03c877d74f479da04ac2c62
> # good: [fa4f4c213f5f7807360c41f2501a3031a9940f3a] drm/nouveau/kms: Support NVIDIA format modifiers
> git bisect good fa4f4c213f5f7807360c41f2501a3031a9940f3a
> # good: [d2bcfce7f8a4ba8df28d3bebb81225bd7f9c046f] drm/nouveau/ibus: use nvkm_subdev_new_()
> git bisect good d2bcfce7f8a4ba8df28d3bebb81225bd7f9c046f
> # good: [fb172f5fe880cd0ddb4370b2fcc9ad4848c98bbb] drm/nouveau/gr/gk20a: move MODULE_FIRMWARE firmware definitions
> git bisect good fb172f5fe880cd0ddb4370b2fcc9ad4848c98bbb
> # first bad commit: [2dd4d163cd9c15432524aa9863155bc03a821361] drm/nouveau: remove open-coded version of remove_conflicting_pci_framebuffers()
>
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
