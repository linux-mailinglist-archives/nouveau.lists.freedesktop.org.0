Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75B91C8D19
	for <lists+nouveau@lfdr.de>; Thu,  7 May 2020 15:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370836E9B0;
	Thu,  7 May 2020 13:56:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4516E9B0
 for <nouveau@lists.freedesktop.org>; Thu,  7 May 2020 13:56:52 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id s11so3393821vsm.3
 for <nouveau@lists.freedesktop.org>; Thu, 07 May 2020 06:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8itcYlczoJacPPwMoZGTOHfufHBwx/ag1N74ozB8q4Y=;
 b=bMtC5awv0VOCdns0ZbCnh5QZ4DwZxQP3mfLPnhqXKRX5g7FqOVI8zj5/tIdACd50lg
 D0tmS/nFWZiUfzlGf+Eo1Jp38DwKlup17rhtxXaoHpIqwL+RsSVLW7XLwFiGDQjbT1hc
 aAiCmpPwQEDVu7TZg5HL/wGC+TvMEdEOEa8UUs11dxJtJhgjMkuMRoSS4zeYmEmosTW0
 uC+5Ocza1rbAFPzoXe1gm3Y+sgA5cKMI48yAfRffJEuBbNo36bYlejHRXAoeMqWA3vN0
 vMGyIRgdD3H1xR+stnHJsiPkXvvwRUA6Ne5PpBmPP8dnH9QyWZdkPOzfAr/Rh6yD0Cnh
 jy8A==
X-Gm-Message-State: AGi0PuaEcGJ0edWgtkKSt1+uPrTh6hNRmZIkKVKbxB3sirJXwDiHjptj
 QGfHkshg0wzzCXMPBJO95fNSxR7W1t+mb9dx0W0=
X-Google-Smtp-Source: APiQypJieXH6bQYCgmdi53qGRBUE47KZYcwGwrd9CImzAFBSR9Uf5wruTE3MMDyo3VTRwzSabyjiX8+SUMjNQl87rko=
X-Received: by 2002:a05:6102:409:: with SMTP id
 d9mr11853207vsq.220.1588859811916; 
 Thu, 07 May 2020 06:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAKb7UvhNDFKHkOV8p0v8cVHf7cMadNLVKi0iD_mCZnH_j5=2OA@mail.gmail.com>
 <CAFCWPP+WmbjM0O2T9ODi-iVU1qGXjpk9V9LeE9PsuT7t+APLQA@mail.gmail.com>
 <CAKb7Uvj6nMk2U6MD-iMXEWQzc4ok2xxuq7K3C8ti6mfFDqhuDw@mail.gmail.com>
 <e681b4315b596dca39bb4a28866d509e23a150c1.camel@lynxeye.de>
 <CAKb7Uvh8dvVTVbu15e2=7qb4dgoVbigrnjkYW6i7z5dsk4g3qQ@mail.gmail.com>
 <CAKb7UvjZ87wJ4niA0k3AcELC44CcwLYd00NtxE5hTEk6LBPdMQ@mail.gmail.com>
 <20200506211015.GA473@ishi>
 <CAKb7Uvi6g5Y3d9tqz4=JFoyQ3hk169konLaW_UVfNGnZ-oisQg@mail.gmail.com>
 <20200506215859.GA7599@ishi>
 <CAKb7UvioQ5P-vCKPB-aHqbyV58qDvTUeHQeJYnFZkWQfJXgshg@mail.gmail.com>
 <20200507041147.GA455@ishi>
In-Reply-To: <20200507041147.GA455@ishi>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 7 May 2020 09:56:40 -0400
Message-ID: <CAKb7UvjUGjKTw8izw2=1P8fRbmMWmrH0m5yFRyL9Q0+D18V0bQ@mail.gmail.com>
To: Milan Buska <milan.buska@gmail.com>
Subject: Re: [Nouveau] GeForce(R) GT 710 1GB PCIE x 1 on arm64
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, May 7, 2020 at 12:11 AM Milan Buska <milan.buska@gmail.com> wrote:
>
> On 20-05-06 18:53:00, Ilia Mirkin wrote:
> > On Wed, May 6, 2020 at 5:59 PM Milan Buska <milan.buska@gmail.com> wrote:
> > >
> > > On 20-05-06 17:12:44, Ilia Mirkin wrote:
> > > > You need both VRAM *and* UNCACHED. Separate them with a |
> > > >
> > > > On Wed, May 6, 2020 at 5:10 PM Milan Buska <milan.buska@gmail.com> wrote:
> > > > >
> > > > > On 20-05-06 11:51:35, Ilia Mirkin wrote:
> > > > > > On Wed, May 6, 2020 at 10:42 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > > > > > > On Wed, May 6, 2020 at 10:39 AM Lucas Stach <dev@lynxeye.de> wrote:
> > > > > > > > > > [   17.146929] nouveau 0000:01:00.0: DRM: core notifier timeout
> > > > > > > > > > [   19.146846] nouveau 0000:01:00.0: DRM: base-0: timeout
> > > > > > > > > > [   19.147554] Console: switching to colour frame buffer device 240x67
> > > > > > > > > > [   19.446311] nouveau 0000:01:00.0: DRM: GPU lockup - switching to software fbcon
> > > > > > > > > > [   19.501043] nouveau 0000:01:00.0: fb0: nouveaudrmfb frame buffer device
> > > > > > > > > > [   19.523471] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
> > > > > > > > >
> > > > > > > > > So that "core notifier timeout" and subsequent GPU lockup indicate
> > > > > > > > > that something's amiss. Most of the initialization was able to be
> > > > > > > > > completed, including reading EDID from your monitor (hence the
> > > > > > > > > non-default resolution), but we're not seeing values change properly /
> > > > > > > > > missing notifications. I'm actually wondering if we aren't
> > > > > > > > > initializing the GPU because we think it's already initialized. Could
> > > > > > > > > you boot with nouveau.config=NvForcePost=1 and see if that helps?
> > > > > > > >
> > > > > > > > Note that PCIe is non-coherent on most ARM devices (including Tegra TX2
> > > > > > > > IIRC), so if the notifier BO isn't mapped as uncached memory, you
> > > > > > > > probably won't see the expected notifier content, as you are reading
> > > > > > > > stale cache line content.
> > > > > > >
> > > > > > > I *believe* that as part of getting nouveau working with the Tegra
> > > > > > > in-SoC GPU, at least the fence logic was adjusted. However perhaps we
> > > > > > > didn't do it for notifier memory... worth checking.
> > > > > >
> > > > > > Hm, looks like we should be passing in TTM_PL_FLAG_UNCACHED for the
> > > > > > notifier, which should cause nouveau_bo to do the right thing (by
> > > > > > setting force_coherent=true in this environment):
> > > > > >
> > > > > > ret = nouveau_bo_new(&drm->client, 4096, 0x1000, TTM_PL_FLAG_VRAM,
> > > > > >      0, 0x0000, NULL, NULL, &disp->sync);
> > > > > >
> > > > > > Milan - can you try changing that line in
> > > > > >
> > > > > > drivers/gpu/drm/nouveau/dispnv50/disp.c::nv50_display_create
> > > > > >
> > > > > > to have TTM_PL_FLAG_VRAM | TTM_PL_FLAG_UNCACHED instead for that
> > > > > > nouveau_bo_new call (no need to change the later nouveau_bo_pin call)?
> > > > > >
> > > > > > Cheers,
> > > > > >
> > > > > >   -ilia
> > > > > >
> > > > >
> > > > >         /* small shared memory area we use for notifiers and semaphores */
> > >             ret = nouveau_bo_new(&drm->client, 4096, 0x1000, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_UNCACHED,
> > >
> > > it is OK
> >
> > What do you mean by that? You're testing it, or that fixed it?
> >
> It's the same

Oh well, it was worth a shot. Someone will have to debug what's going on.

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
