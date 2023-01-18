Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3926D671CD6
	for <lists+nouveau@lfdr.de>; Wed, 18 Jan 2023 14:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DE610E73C;
	Wed, 18 Jan 2023 13:01:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6A410E73C
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674046879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1pFnXKm7lpy3kI7TdBU60hs2dC+eyPkJKVz0rmKvawI=;
 b=gjfQm3J2LzvnZS84ZHOpL75uExP2+7zgEH4lAfOaX6Uj+whsp9oFC+v2Z/yCK4Vt2orcuC
 MTpsS54vA+E0abKiInwbXXkmSrenl1gUSUzyCNjijG9z/H3nQoxs3SgIvUqRMotNi2Nfqw
 7H0Xyv3tKmpexrgulZ4ch0N1DE0MNy8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-3C2LfKPnNPC1vWCC8ruMOw-1; Wed, 18 Jan 2023 08:01:16 -0500
X-MC-Unique: 3C2LfKPnNPC1vWCC8ruMOw-1
Received: by mail-lj1-f199.google.com with SMTP id
 z26-20020a2e885a000000b0028b760713a3so2923765ljj.8
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 05:01:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1pFnXKm7lpy3kI7TdBU60hs2dC+eyPkJKVz0rmKvawI=;
 b=Hfhpe32jYp5w8Fc9Dtd0GGgYUHJWldS8YS3xV5KC+1Jp35jcmmMqfbW5pX8js3+xgr
 D2xhRNy/GAE8A1z9c4kJdJEUaOTE5FNppF959iUzyYgoiBORGDk+zRVnHSRFQhXvU0Vl
 f6PO59986yrv7zdt3fN4uQwzdR7CDFlOtw8hZ5OkjK00Grt2BXJh0226SnKnystFzi5R
 RN4IimcW6WSBYWX2KjLRFGM3Qcgh0U5NFGutykLUoxLWGZZu/xq7sw102pzMJW5O7MAJ
 wniVwhEv1Qlpx1P0e1yx7HYrk1kIjWZvxYRApE7CA2IJNt2x8LpFx51WUquUkRDmD1QU
 qB9Q==
X-Gm-Message-State: AFqh2kqYNpLX1I2pVU33K+Lyd43iFJgRHuml3szz5++uSHdpiwo0mLsn
 Tyo2Y5MHYfvcNbDBRJPCAgH5DHuBWVJVOiLUkYzPRB9MvRGNHlm2TpqxtYzyZ/6GNKZGgiCXY0v
 38djKQorCcXLoX0Z2RzsXcAZCA4bicoJi15X/ybf5JA==
X-Received: by 2002:a19:ad06:0:b0:4d5:7b89:7b67 with SMTP id
 t6-20020a19ad06000000b004d57b897b67mr277465lfc.17.1674046874632; 
 Wed, 18 Jan 2023 05:01:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsfD5nNaPY4SYa94lYkJOihwossB+UoomeF07j4zByD2GitfSK6n50WsR+Z4Y/2J36ZvWDZmQ4Ny5+Zwq6bUaU=
X-Received: by 2002:a19:ad06:0:b0:4d5:7b89:7b67 with SMTP id
 t6-20020a19ad06000000b004d57b897b67mr277459lfc.17.1674046874417; Wed, 18 Jan
 2023 05:01:14 -0800 (PST)
MIME-Version: 1.0
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-5-christian.koenig@amd.com>
 <1b69d455-ce93-4a9d-0bb3-f145c03837c7@gmail.com>
 <ca4ae666-b971-5edb-733c-dbed7826b40c@gmail.com>
In-Reply-To: <ca4ae666-b971-5edb-733c-dbed7826b40c@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 18 Jan 2023 14:01:02 +0100
Message-ID: <CACO55tsVW9EVdK9TWVMx-v=0YNyMmRAVdBLYGoBOmBKATPO4Gw@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 5/9] drm/nouveau: stop using ttm_bo_wait
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
Cc: Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, nouveau <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 10:04 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Hi guys,
>
> another ping for this. It's just a minor cleanup.
>

Acked-by: Karol Herbst <kherbst@redhat.com>

Though I'd say that having a wrapper function like that isn't
pointless on its own and I kind of fail to see the reason it gets
removed in the first place.

Also.. I wouldn't call this a "cleanup" because it actually removes
something useful. Yes, it's only calling one function, but it's more
of a pain to use the wrapped one than the outer one.

> Dave/Daniel can you help me out here?
>
> Thanks,
> Christian.
>
> Am 11.01.23 um 10:52 schrieb Christian K=C3=B6nig:
> > Hi guys,
> >
> > can I get a quick ack for this?
> >
> > The patch has no functional change and is just a cleanup.
> >
> > Thanks,
> > Christian.
> >
> > Am 25.11.22 um 11:21 schrieb Christian K=C3=B6nig:
> >> TTM is just wrapping core DMA functionality here, remove the mid-layer=
.
> >> No functional change.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> ---
> >>   drivers/gpu/drm/nouveau/nouveau_bo.c  |  6 +++++-
> >>   drivers/gpu/drm/nouveau/nouveau_gem.c | 11 ++++++++---
> >>   2 files changed, 13 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> index 335fa91ca4ad..288eebc70a67 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> @@ -922,6 +922,7 @@ static void nouveau_bo_move_ntfy(struct
> >> ttm_buffer_object *bo,
> >>       struct nouveau_mem *mem =3D new_reg ? nouveau_mem(new_reg) : NUL=
L;
> >>       struct nouveau_bo *nvbo =3D nouveau_bo(bo);
> >>       struct nouveau_vma *vma;
> >> +    long ret;
> >>         /* ttm can now (stupidly) pass the driver bos it didn't
> >> create... */
> >>       if (bo->destroy !=3D nouveau_bo_del_ttm)
> >> @@ -936,7 +937,10 @@ static void nouveau_bo_move_ntfy(struct
> >> ttm_buffer_object *bo,
> >>           }
> >>       } else {
> >>           list_for_each_entry(vma, &nvbo->vma_list, head) {
> >> -            WARN_ON(ttm_bo_wait(bo, false, false));
> >> +            ret =3D dma_resv_wait_timeout(bo->base.resv,
> >> +                            DMA_RESV_USAGE_BOOKKEEP,
> >> +                            false, 15 * HZ);
> >> +            WARN_ON(ret <=3D 0);
> >>               nouveau_vma_unmap(vma);
> >>           }
> >>       }
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> >> b/drivers/gpu/drm/nouveau/nouveau_gem.c
> >> index ac5793c96957..f77e44958037 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> >> @@ -645,7 +645,7 @@ nouveau_gem_pushbuf_reloc_apply(struct
> >> nouveau_cli *cli,
> >>                   struct drm_nouveau_gem_pushbuf_reloc *reloc,
> >>                   struct drm_nouveau_gem_pushbuf_bo *bo)
> >>   {
> >> -    int ret =3D 0;
> >> +    long ret =3D 0;
> >>       unsigned i;
> >>         for (i =3D 0; i < req->nr_relocs; i++) {
> >> @@ -703,9 +703,14 @@ nouveau_gem_pushbuf_reloc_apply(struct
> >> nouveau_cli *cli,
> >>                   data |=3D r->vor;
> >>           }
> >>   -        ret =3D ttm_bo_wait(&nvbo->bo, false, false);
> >> +        ret =3D dma_resv_wait_timeout(nvbo->bo.base.resv,
> >> +                        DMA_RESV_USAGE_BOOKKEEP,
> >> +                        false, 15 * HZ);
> >> +        if (ret =3D=3D 0)
> >> +            ret =3D -EBUSY;
> >>           if (ret) {
> >> -            NV_PRINTK(err, cli, "reloc wait_idle failed: %d\n", ret);
> >> +            NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
> >> +                  ret);
> >>               break;
> >>           }
> >
>

