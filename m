Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BFF6E4827
	for <lists+nouveau@lfdr.de>; Mon, 17 Apr 2023 14:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5666410E49B;
	Mon, 17 Apr 2023 12:47:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F292710E49B
 for <nouveau@lists.freedesktop.org>; Mon, 17 Apr 2023 12:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681735615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hi++eveNlkrj9xbWlpgBiAgo9b9NAN27QrWvfVpf3Hw=;
 b=H8DSD84gEvtcgMbPCyGfzmjEA68q1eBTaHSy93kFKjoc9KqvvVLzkH7UUk9wF9xxU2zJWV
 jNB7s5w5hXFLQqFAFIOoAtXHH4KsWgyA6TdnHv/KLfjfD8sixn5KcnGTcRLxM7zwvJricH
 D6Mw6qNsRn4qciZqZhPRbqdDS0FUk3c=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-S17c2KobMjSQTVK7ENNsNQ-1; Mon, 17 Apr 2023 08:46:54 -0400
X-MC-Unique: S17c2KobMjSQTVK7ENNsNQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4edb90ccaadso507537e87.3
 for <nouveau@lists.freedesktop.org>; Mon, 17 Apr 2023 05:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681735613; x=1684327613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hi++eveNlkrj9xbWlpgBiAgo9b9NAN27QrWvfVpf3Hw=;
 b=Q5bSZjPUlnVJMaMDMHxMYU1L7uzQ4T75jRda9HO0gZ6NHqjkMcQ+WlvMwTKn4l1qwg
 K4FZd6rbZ5ZG3k7Vd+yEbtS6DLF+FYndX0RVENBdAJa7M3iMmtKxJWtF2Vae3gRrCv2F
 M6Yk2nEBINHuFqcdUzBaMWE/v8yDoZWiHLrJ4mYhKwhwkFH2jHJqSODNZuqK5T54SRhR
 3gnWQlk5J1tUR6hNZHL95x7LlLzYa5owz2xYdkMlG6X2n6ULsc6D06mrmgxmlXpN/6hz
 YoLHCUnlLnt7GgCRlu/H/OakLxeWWsj2HG2nOQd+Zrjs4AG1oLlIhMmcQF7qa/vkNfP7
 qlLA==
X-Gm-Message-State: AAQBX9erqF13sle7TzsraF455pT2h1VWjKnhAGb74+kij1L4e9bMZel1
 XvlHINCy/qZbRNuXEUhNv3AFIhMhB2kiXBksT143PWyw2wMvLNN++kpci/mto6djIsFLInX4dEO
 Ouo9o5zOX/kP3oe3oonLXDjeNCcqwQilsY84zn3cR6g==
X-Received: by 2002:ac2:5dea:0:b0:4ec:e32f:3d1f with SMTP id
 z10-20020ac25dea000000b004ece32f3d1fmr2079779lfq.11.1681735612861; 
 Mon, 17 Apr 2023 05:46:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z7S18KuRxvZ5c/MFkn9CZgVP4JCWx+2zRnkVfsFNFdFSobcj64LGiM2uWx/5LJwcD36vpVs2SkVyqd5KSxyIk=
X-Received: by 2002:ac2:5dea:0:b0:4ec:e32f:3d1f with SMTP id
 z10-20020ac25dea000000b004ece32f3d1fmr2079772lfq.11.1681735612531; Mon, 17
 Apr 2023 05:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230415012137.615305-1-john.ogness@linutronix.de>
 <87edolaomt.fsf@jogness.linutronix.de>
 <7b17a825-0f76-3e0f-5e56-0e689b7d7866@amd.com>
In-Reply-To: <7b17a825-0f76-3e0f-5e56-0e689b7d7866@amd.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 17 Apr 2023 14:46:40 +0200
Message-ID: <CACO55tsvgOPgpc5Ssm-md_q4-0U6ON-kHzuu+F-RsnZ79ACYrA@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH v3] drm/nouveau: fix incorrect conversion to
 dma_resv_wait_timeout()
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
Cc: John Ogness <john.ogness@linutronix.de>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tanmay Bhushan <007047221b@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 7:55=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 15.04.23 um 04:02 schrieb John Ogness:
> > Commit 41d351f29528 ("drm/nouveau: stop using ttm_bo_wait")
> > converted from ttm_bo_wait_ctx() to dma_resv_wait_timeout().
> > However, dma_resv_wait_timeout() returns greater than zero on
> > success as opposed to ttm_bo_wait_ctx(). As a result, relocs
> > will fail and log errors even when it was a success.
> >
> > Change the return code handling to match that of
> > nouveau_gem_ioctl_cpu_prep(), which was already using
> > dma_resv_wait_timeout() correctly.
> >
> > Fixes: 41d351f29528 ("drm/nouveau: stop using ttm_bo_wait")
> > Reported-by: Tanmay Bhushan <007047221b@gmail.com>
> > Link: https://lore.kernel.org/lkml/20230119225351.71657-1-007047221b@gm=
ail.com
> > Signed-off-by: John Ogness <john.ogness@linutronix.de>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

will push shortly to drm-misc-fixes

> > ---
> >   I just realized that the nouveau driver style prefers to scope
> >   variables used only in loops.
> >
> >   v3: Define @lret within the for-loop.
> >
> >   drivers/gpu/drm/nouveau/nouveau_gem.c | 18 ++++++++++++------
> >   1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/no=
uveau/nouveau_gem.c
> > index f77e44958037..ab9062e50977 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > @@ -645,7 +645,7 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli =
*cli,
> >                               struct drm_nouveau_gem_pushbuf_reloc *rel=
oc,
> >                               struct drm_nouveau_gem_pushbuf_bo *bo)
> >   {
> > -     long ret =3D 0;
> > +     int ret =3D 0;
> >       unsigned i;
> >
> >       for (i =3D 0; i < req->nr_relocs; i++) {
> > @@ -653,6 +653,7 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli =
*cli,
> >               struct drm_nouveau_gem_pushbuf_bo *b;
> >               struct nouveau_bo *nvbo;
> >               uint32_t data;
> > +             long lret;
> >
> >               if (unlikely(r->bo_index >=3D req->nr_buffers)) {
> >                       NV_PRINTK(err, cli, "reloc bo index invalid\n");
> > @@ -703,13 +704,18 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cl=
i *cli,
> >                               data |=3D r->vor;
> >               }
> >
> > -             ret =3D dma_resv_wait_timeout(nvbo->bo.base.resv,
> > -                                         DMA_RESV_USAGE_BOOKKEEP,
> > -                                         false, 15 * HZ);
> > -             if (ret =3D=3D 0)
> > +             lret =3D dma_resv_wait_timeout(nvbo->bo.base.resv,
> > +                                          DMA_RESV_USAGE_BOOKKEEP,
> > +                                          false, 15 * HZ);
> > +             if (!lret)
> >                       ret =3D -EBUSY;
> > +             else if (lret > 0)
> > +                     ret =3D 0;
> > +             else
> > +                     ret =3D lret;
> > +
> >               if (ret) {
> > -                     NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\=
n",
> > +                     NV_PRINTK(err, cli, "reloc wait_idle failed: %d\n=
",
> >                                 ret);
> >                       break;
> >               }
> >
> > base-commit: 09a9639e56c01c7a00d6c0ca63f4c7c41abe075d
>

