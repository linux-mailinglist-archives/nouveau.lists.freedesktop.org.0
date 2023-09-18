Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C7E7A3EE2
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 02:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D38010E087;
	Mon, 18 Sep 2023 00:02:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582AD10E087
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 00:02:48 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c012232792so2460041fa.0
 for <nouveau@lists.freedesktop.org>; Sun, 17 Sep 2023 17:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694995366; x=1695600166; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/Eb3fOx1ew6uXDKDbUqmE2zZWYt/wbhQmFHJ6nzEER4=;
 b=Ok3sOM3cw0iaHJy9RpI0+6uaocefTlX92x1o/olvGpMB+/Ex1ZCc1gvxOy9LgdwW1m
 cODsKNpGbWhD/pu8bkuTXTLOr6hKNeVbtVFv5+4swCraRWF4RX7ErqvDw4149WR8MNKv
 lNAuiHj9D2qbr22wUEMZDpxD8pRaECuJvB9IVJCoKygBPh6dDohI8RjGeYoukQ3euNl8
 Uer1mhpTR0aoqTBUWTAApYQ0BxZapwPXb5LqvFzRqEkkXzWQa9hJhqEaeH2+FOvnpz3q
 JMLCmwQJt4qR8i1bUu9IbpGjSWFKMLfv5tIk5hHPaxU/qTRWbX2uE6uFATJQUE+XZLn+
 qkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694995366; x=1695600166;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Eb3fOx1ew6uXDKDbUqmE2zZWYt/wbhQmFHJ6nzEER4=;
 b=oySX8jPQzgzHby4+1OKlCS4Y0EpgCRvBcHK1Mt/FH0loEUfpILlbf7qQnQcTPGIHF/
 2eoIx0YGrnBdm/hEkFnyrT2X7J7tfHn6J6L+CIZGcjLPQQUd+j+I0gxIZYJQyDsv4X8M
 Ntphk5KBGNxQ1/mz8+Wi0YJXpDQr3m1p//I/mBYwuQRMDXFY+WL+fKRogJouVA7gibO3
 FmcXfClmzAGQi891GcRC5WWdlMrM8SzbKdG5rwvSKEurulumJBsDDoY3na0d7tspAq6t
 5THUU+pJemUXChSKRaPk0IkGVWnDo3z0J37SxbXULo9JjjTUnZgQ0gSk+9ajgG79Ml+L
 ztPQ==
X-Gm-Message-State: AOJu0YyA9VqHnUlX9URd3nQpCpVD6FwRkPGKD4okmxnRq1tAQnOLAoJ0
 YIPK1mMaLgS8oznB2I6iUoKUQBqPNqkZ38U27jE=
X-Google-Smtp-Source: AGHT+IGswMiwj86cmSMAUsQ4UWFnNfeM6/fTYbYTtzRhjy2BK62WY2TGd7My3gZDjNYjO+fau0HupzlBhH9m0FSiUo8=
X-Received: by 2002:a2e:be28:0:b0:2c0:cd8:2bdc with SMTP id
 z40-20020a2ebe28000000b002c00cd82bdcmr1183329ljq.24.1694995366017; Sun, 17
 Sep 2023 17:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230914084624.2299765-2-skeggsb@gmail.com>
 <20230914084624.2299765-6-skeggsb@gmail.com>
 <3e46a803-1ed6-63e7-909e-053cb7425af3@dakr.org>
In-Reply-To: <3e46a803-1ed6-63e7-909e-053cb7425af3@dakr.org>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 18 Sep 2023 10:02:34 +1000
Message-ID: <CACAvsv4xT_+=XQO6_aUK3MzkS1nkc2tiFjgkXS2fiLz=ghcKHA@mail.gmail.com>
To: Danilo Krummrich <me@dakr.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH 04/44] drm/nouveau/mmu/gp100-: always
 invalidate TLBs at CACHE_LEVEL_ALL
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, 16 Sept 2023 at 08:34, Danilo Krummrich <me@dakr.org> wrote:
>
> On 9/14/23 10:45, Ben Skeggs wrote:
> > From: Ben Skeggs <bskeggs@redhat.com>
> >
> > Fixes some issues when running on top of RM.
>
> Which issues have you seen in particular?
"random" mmu faults.

>
> Also, would it make sense to only invalidate TLBs at CACHE_LEVEL_ALL
> when actually running on top of RM?
I don't think so, I'm not entirely sure we should have been using it
to begin with.  Last I looked, RM didn't use this either (except
perhaps on UVM).

Ben.

>
> >
> > Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> > ---
> >   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c | 2 +-
> >   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> > index f3630d0e0d55..bddac77f48f0 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> > @@ -558,7 +558,7 @@ gp100_vmm_invalidate_pdb(struct nvkm_vmm *vmm, u64 addr)
> >   void
> >   gp100_vmm_flush(struct nvkm_vmm *vmm, int depth)
> >   {
> > -     u32 type = (5 /* CACHE_LEVEL_UP_TO_PDE3 */ - depth) << 24;
> > +     u32 type = 0;
> >       if (atomic_read(&vmm->engref[NVKM_SUBDEV_BAR]))
> >               type |= 0x00000004; /* HUB_ONLY */
> >       type |= 0x00000001; /* PAGE_ALL */
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
> > index 6cb5eefa45e9..0095d58d4d9a 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
> > @@ -27,7 +27,7 @@ static void
> >   tu102_vmm_flush(struct nvkm_vmm *vmm, int depth)
> >   {
> >       struct nvkm_device *device = vmm->mmu->subdev.device;
> > -     u32 type = (5 /* CACHE_LEVEL_UP_TO_PDE3 */ - depth) << 24;
> > +     u32 type = 0;
> >
> >       type |= 0x00000001; /* PAGE_ALL */
> >       if (atomic_read(&vmm->engref[NVKM_SUBDEV_BAR]))
