Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 437251C7558
	for <lists+nouveau@lfdr.de>; Wed,  6 May 2020 17:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E00E6E89E;
	Wed,  6 May 2020 15:51:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967786E89E
 for <nouveau@lists.freedesktop.org>; Wed,  6 May 2020 15:51:47 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id e10so1294478vsp.12
 for <nouveau@lists.freedesktop.org>; Wed, 06 May 2020 08:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VPztx0PmkwDyYgiqDRue/oUY68y76Ihp48X1eOFmCEc=;
 b=h//IHtkOGHLhXlAauc8fHQTnBVPgQ7FTmP5nBjBfAZ1ta5gLH3Qpw2txD7G1KV7u0o
 kyfamoFsWhLSnV238uigf6sSdiGrNeFILNrNT7wRCEN0R2fGdIKNqxCTMKGpUSDoxKfX
 giw+a+OZzKj+ZsQapzYkWiVhfQBorVn26yiiRWT2tfoKS4kzT4bgpv82BAPf5xtYneEJ
 FOcodw8ibgyGXCS8R4wd1Ia6VlIhA5lsycA/7rffl7TwLxyOVhUeE7lWBYgzY/KC/JzH
 9mU+474zEber/96pE6QzGzzPyHbWk3/1ODTHVYu3on9iIdYBX2eo1T2i25WdL4ZTWJhM
 rfgw==
X-Gm-Message-State: AGi0PuZw0ifN3+u26RHCdEr/HY/FEaLCxYWrJ7g2pGkbpzieRn2k4b9M
 T48FuidL1a5UxW4mW8Tvta+bt3rUySKSK98zW9c=
X-Google-Smtp-Source: APiQypKSDAoz+OwhOK/J6DuVcf9HXEdNJooq/4sMjBXn/DJN0k6x65Aq6XdeexEqZkj0vF8P9JNOECcJJgZc8kP62/A=
X-Received: by 2002:a67:6955:: with SMTP id e82mr8600047vsc.18.1588780306730; 
 Wed, 06 May 2020 08:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCWPP+WKRhhXG3CRfqRztWbFJwUqeeY6tiip4fT9gwtyjKNwQ@mail.gmail.com>
 <CAKb7UvhNDFKHkOV8p0v8cVHf7cMadNLVKi0iD_mCZnH_j5=2OA@mail.gmail.com>
 <CAFCWPP+WmbjM0O2T9ODi-iVU1qGXjpk9V9LeE9PsuT7t+APLQA@mail.gmail.com>
 <CAKb7Uvj6nMk2U6MD-iMXEWQzc4ok2xxuq7K3C8ti6mfFDqhuDw@mail.gmail.com>
 <e681b4315b596dca39bb4a28866d509e23a150c1.camel@lynxeye.de>
 <CAKb7Uvh8dvVTVbu15e2=7qb4dgoVbigrnjkYW6i7z5dsk4g3qQ@mail.gmail.com>
In-Reply-To: <CAKb7Uvh8dvVTVbu15e2=7qb4dgoVbigrnjkYW6i7z5dsk4g3qQ@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 6 May 2020 11:51:35 -0400
Message-ID: <CAKb7UvjZ87wJ4niA0k3AcELC44CcwLYd00NtxE5hTEk6LBPdMQ@mail.gmail.com>
To: Lucas Stach <dev@lynxeye.de>
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

On Wed, May 6, 2020 at 10:42 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> On Wed, May 6, 2020 at 10:39 AM Lucas Stach <dev@lynxeye.de> wrote:
> > > > [   17.146929] nouveau 0000:01:00.0: DRM: core notifier timeout
> > > > [   19.146846] nouveau 0000:01:00.0: DRM: base-0: timeout
> > > > [   19.147554] Console: switching to colour frame buffer device 240x67
> > > > [   19.446311] nouveau 0000:01:00.0: DRM: GPU lockup - switching to software fbcon
> > > > [   19.501043] nouveau 0000:01:00.0: fb0: nouveaudrmfb frame buffer device
> > > > [   19.523471] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
> > >
> > > So that "core notifier timeout" and subsequent GPU lockup indicate
> > > that something's amiss. Most of the initialization was able to be
> > > completed, including reading EDID from your monitor (hence the
> > > non-default resolution), but we're not seeing values change properly /
> > > missing notifications. I'm actually wondering if we aren't
> > > initializing the GPU because we think it's already initialized. Could
> > > you boot with nouveau.config=NvForcePost=1 and see if that helps?
> >
> > Note that PCIe is non-coherent on most ARM devices (including Tegra TX2
> > IIRC), so if the notifier BO isn't mapped as uncached memory, you
> > probably won't see the expected notifier content, as you are reading
> > stale cache line content.
>
> I *believe* that as part of getting nouveau working with the Tegra
> in-SoC GPU, at least the fence logic was adjusted. However perhaps we
> didn't do it for notifier memory... worth checking.

Hm, looks like we should be passing in TTM_PL_FLAG_UNCACHED for the
notifier, which should cause nouveau_bo to do the right thing (by
setting force_coherent=true in this environment):

ret = nouveau_bo_new(&drm->client, 4096, 0x1000, TTM_PL_FLAG_VRAM,
     0, 0x0000, NULL, NULL, &disp->sync);

Milan - can you try changing that line in

drivers/gpu/drm/nouveau/dispnv50/disp.c::nv50_display_create

to have TTM_PL_FLAG_VRAM | TTM_PL_FLAG_UNCACHED instead for that
nouveau_bo_new call (no need to change the later nouveau_bo_pin call)?

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
