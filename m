Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9376019D9C6
	for <lists+nouveau@lfdr.de>; Fri,  3 Apr 2020 17:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848916EC01;
	Fri,  3 Apr 2020 15:09:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01ED56EC01
 for <nouveau@lists.freedesktop.org>; Fri,  3 Apr 2020 15:09:29 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id i3so7768544ioo.13
 for <nouveau@lists.freedesktop.org>; Fri, 03 Apr 2020 08:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=qc7GgD8G0ne1uTjsOQs5vhkpyIMSwvCa85nP9Yafns4=;
 b=QwcYkbwUaBmVffZ5HXFcwdD2rdtb3SMuD74GviJsUK9hxqk/0+Rqy54KLw3T2LZAfi
 uH/ac9Z7oac8G8ttAZe2sgFp0l5JK65n8JhaQZTRC8I6k6rvXEAx54wcHEbEUms1GGsY
 8hYfUYh3wdkqCOCIgBuBmWO0IddYDMjdWt7WZKGUxzcI7O/gsal/c+hWmJEMdOeUA91n
 S3cMlTh736XnKrxCn0eMB6fnwgqnXZwi5FFMjhWRb0wvYjoEPQhw+cLJTAONRdEOPyTx
 syrZcB2RvPMuSm6Mt7vqE8FKZWW3Ot3iXIQpgH44hZh07b8akvd97gtjPRqKgo/LBW2k
 VjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=qc7GgD8G0ne1uTjsOQs5vhkpyIMSwvCa85nP9Yafns4=;
 b=f1O6SLJoFuAP00p/pK7B54scwGJuh3/5bGwgKB6bhgNw50vje/JzR1iz6/r98Egk9k
 a+QY2SN1ZhWQbuAQjTl3Zy1RpkOzXTtuAU8zDFXsyThoxChiQUOUNYfZ4DBbEKL0LE9C
 8WRYwSY8ZjYn63VfWmo7eg5A5CO/W6dW7KCMbecIhmMr4GdeMpzdezxMiUmQPIzke4B9
 PDAI13AG0OWmo6t2sA4XqF8ZNRth1L8sSz7tMSwiQifKJ+u0IJ8HWTAkQ5cpFX5S7nvC
 GcHRhvfFQXkTxGW61WbigBU67wvO+QEDRm3G9mE85EpXNe9+xeBIdImo+NkjgLKXOeBP
 nsbQ==
X-Gm-Message-State: AGi0PubCwAm3QhBoEYSGhimTQ79tTq8vGJzpQF5DM+3P9c5nwZSTGvX1
 yEfPbhOSQHkgiYoqThr2aOXnO5bI5HhPDtxUkyY80nrN7l0=
X-Google-Smtp-Source: APiQypKx0mF5qzhtNT3aUIWXYWCH4/dRb+VGn2nN/rhXY016mtzzpGZXsdAZinHoSWnDmCdtYShKjn+Wu6JYYseYQhM=
X-Received: by 2002:a5e:c803:: with SMTP id y3mr8109815iol.82.1585926569049;
 Fri, 03 Apr 2020 08:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLWMB8rr0x4KKfqruCcTLVq4dH6nZ365auMqA1arZ57J7g@mail.gmail.com>
In-Reply-To: <CAOkhzLWMB8rr0x4KKfqruCcTLVq4dH6nZ365auMqA1arZ57J7g@mail.gmail.com>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Fri, 3 Apr 2020 17:09:18 +0200
Message-ID: <CAOkhzLVSrJWCrRhoDqwS2-4ozVA37OnKNvuFn0pc=MBZUa5Njg@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [Nouveau] acr: failed to load firmware with Kernel 5.6. Kernel 5.5
 works just fine.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi

After installing Kernel 5.6 I am getting this error:

Cannot run in framebuffer mode. Please specify busIDs for all
framebuffer devices

[ 0.757317] nouveau 0000:05:00.0: NVIDIA GP107 (137000a1)
[ 0.869775] nouveau 0000:05:00.0: bios: version 86.07.42.00.4a
[ 0.870157] nouveau 0000:05:00.0: acr: failed to load firmware
[ 0.870256] nouveau 0000:05:00.0: acr: failed to load firmware
[ 0.870356] nouveau 0000:05:00.0: acr ctor failed, -2
[ 0.870455] nouveau: probe of 0000:05:00.0 failed with error -2

This used to work just fine, with Version 5.5, Gentoo/Funtoo Linux.

Very strange.

With Kernel 5.5 everything was fine:

this is what I get with Kernel 5.5

~/.backup> dmesg | grep nouveau
[ 0.994622] nouveau 0000:05:00.0: NVIDIA GP107 (137000a1)
[ 1.107079] nouveau 0000:05:00.0: bios: version 86.07.42.00.4a
[ 1.107391] nouveau 0000:05:00.0: gr: failed to load firmware "gr/sw_nonctx"
[ 1.107494] nouveau 0000:05:00.0: gr: failed to load gr/sw_nonctx
[ 1.107857] nouveau 0000:05:00.0: fb: 4096 MiB GDDR5
[ 1.124158] nouveau 0000:05:00.0: DRM: VRAM: 4096 MiB
[ 1.124268] nouveau 0000:05:00.0: DRM: GART: 536870912 MiB
[ 1.124381] nouveau 0000:05:00.0: DRM: BIT table 'A' not found
[ 1.124493] nouveau 0000:05:00.0: DRM: BIT table 'L' not found
[ 1.124604] nouveau 0000:05:00.0: DRM: TMDS table version 2.0
[ 1.124719] nouveau 0000:05:00.0: DRM: DCB version 4.1
[ 1.124829] nouveau 0000:05:00.0: DRM: DCB outp 00: 01000f42 04620030
[ 1.124941] nouveau 0000:05:00.0: DRM: DCB outp 01: 02011f62 00020010
[ 1.125054] nouveau 0000:05:00.0: DRM: DCB outp 02: 02822f76 04600020
[ 1.125166] nouveau 0000:05:00.0: DRM: DCB outp 03: 02022f72 00020020
[ 1.125278] nouveau 0000:05:00.0: DRM: DCB outp 04: 04033f82 00020030
[ 1.125390] nouveau 0000:05:00.0: DRM: DCB conn 00: 00001031
[ 1.125501] nouveau 0000:05:00.0: DRM: DCB conn 01: 00010161
[ 1.125612] nouveau 0000:05:00.0: DRM: DCB conn 02: 00020246
[ 1.125723] nouveau 0000:05:00.0: DRM: DCB conn 03: 01000331
[ 1.126100] nouveau 0000:05:00.0: DRM: failed to create kernel channel, -22
[ 1.126364] nouveau 0000:05:00.0: DRM: MM: using COPY for buffer copies
[ 1.481589] nouveau 0000:05:00.0: DRM: allocated 1680x1050 fb:
0x200000, bo (____ptrval____)
[ 1.481807] fbcon: nouveaudrmfb (fb0) is primary device
[ 1.672191] nouveau 0000:05:00.0: fb0: nouveaudrmfb frame buffer device
[ 1.672362] [drm] Initialized nouveau 1.3.1 20120801 for 0000:05:00.0 on minor 1

Looking forward to any help or reply.

I went back to version 5.5 of the Kernel (recompiled after git
checkout v5.5) and all is fine again.

Kernel Config file is here:
https://slack-files.com/T27F6280H-F011D481UDS-179bd8aa7f

Best
Zeno
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
