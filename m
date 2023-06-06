Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B84723FC6
	for <lists+nouveau@lfdr.de>; Tue,  6 Jun 2023 12:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A4110E220;
	Tue,  6 Jun 2023 10:39:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB2710E234
 for <nouveau@lists.freedesktop.org>; Tue,  6 Jun 2023 10:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686047944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpv953l+q5fc9HmqRZAoq0E3Wcwa2EnYD8e+xZL0CXA=;
 b=NM5TCxMcY7c2ENeUO31I4lPg7b8MwMDLKcbuRRZtaogdAVyuz8jAfKmrKoXRL3rMCmfvyS
 eEzc/4QAktr15+LcZomMa/Hkc6hNFGt3VPzGC3hIeGzWo9EfAyjdqkIZTIvbQ0dfY1bsCs
 cMNz4wUCj1RnI3a70Vv2UKeqKyP+MXE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-lEacUn_-Niis12zS2yTHig-1; Tue, 06 Jun 2023 06:39:03 -0400
X-MC-Unique: lEacUn_-Niis12zS2yTHig-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b1bc54374aso3801341fa.0
 for <nouveau@lists.freedesktop.org>; Tue, 06 Jun 2023 03:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686047942; x=1688639942;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bpv953l+q5fc9HmqRZAoq0E3Wcwa2EnYD8e+xZL0CXA=;
 b=IMDh5iepjoaCUqlwrDQpvv9KycYNPWDOGmXg8L91S9b3c0jgCrZz/s8z9J3AC7ESte
 DLbrWSlozqvEU5U44VNUviJwa2RA+HYRcdGLKkyjICW7DAvor5ekALL+6Z6yeKNYfVE9
 c1UT3AycdTxZmGDhFQOIz41IS0AmrBtQKIDLDFxGVfIbn73cUL/vI2HgWCeq/XiEfyCO
 6u/pVz9g9ZIxA/pPT+6G3y28YAJeMhomTPGd9J52owY0ONB4+oo6RkiHew7iRFBTsX3t
 lxIb8mE2ZqBgiJyloCBqMcyr13ikkiDRfhij9xnLVbIEpUr12kkdz1kn9Q7SfDyO5KF9
 4m1w==
X-Gm-Message-State: AC+VfDzV1biEFJY9Eg3ZNEPqs6oNK+QtgZmLV1kCbokgkn9qlNL9Vj9Z
 d/4HHaeU3hgDdsXfIPwHrQkPYvnCzf1uyTHVG2+lVc/Kh6wq+fPoCZydi7PQoIoad95h8wHl3IO
 w35A4DKeXZ5AuiSmXmea2fsOVebmrijs8PaHAYqqa+w==
X-Received: by 2002:a05:651c:3c2:b0:2b1:d8fa:3e59 with SMTP id
 f2-20020a05651c03c200b002b1d8fa3e59mr804609ljp.4.1686047942044; 
 Tue, 06 Jun 2023 03:39:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Zn97oPcc9bAEPtfRK6uwJ9A0EpNgvvjiCSHupJDNIoKQNNQXMCMOfbu3Undc2TovwL4NGYatrgXpJavNHMaQ=
X-Received: by 2002:a05:651c:3c2:b0:2b1:d8fa:3e59 with SMTP id
 f2-20020a05651c03c200b002b1d8fa3e59mr804601ljp.4.1686047941701; Tue, 06 Jun
 2023 03:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230526091052.2169044-1-kherbst@redhat.com>
 <CAKb7Uvha74HOvny25aqnwzvvRLpc7+DNQm6QEAk4oxfTa1urJg@mail.gmail.com>
In-Reply-To: <CAKb7Uvha74HOvny25aqnwzvvRLpc7+DNQm6QEAk4oxfTa1urJg@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 6 Jun 2023 12:38:50 +0200
Message-ID: <CACO55ts7gJfJ5ver+qvL5Tp9X+Kzk9ByvmXUD1hLH31NR+3pBg@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: bring back blit subchannel
 for pre nv50 GPUs
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, May 26, 2023 at 5:21=E2=80=AFPM Ilia Mirkin <imirkin@alum.mit.edu> =
wrote:
>
> On Fri, May 26, 2023 at 5:11=E2=80=AFAM Karol Herbst <kherbst@redhat.com>=
 wrote:
> >
> > 1ba6113a90a0 removed a lot of the kernel GPU channel, but method 0x128
> > was important as otherwise the GPU spams us with `CACHE_ERROR` messages=
.
> >
> > We use the blit subchannel inside our vblank handling, so we should kee=
p
> > at least this part.
> >
> > v2: Only do it for NV11+ GPUs
> >
> > Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/201
> > Fixes: 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
> > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_chan.c |  1 +
> >  drivers/gpu/drm/nouveau/nouveau_chan.h |  1 +
> >  drivers/gpu/drm/nouveau/nouveau_drm.c  | 20 +++++++++++++++++---
> >  3 files changed, 19 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/n=
ouveau/nouveau_chan.c
> > index e648ecd0c1a0..3dfbc374478e 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > @@ -90,6 +90,7 @@ nouveau_channel_del(struct nouveau_channel **pchan)
> >                 if (cli)
> >                         nouveau_svmm_part(chan->vmm->svmm, chan->inst);
> >
> > +               nvif_object_dtor(&chan->blit);
> >                 nvif_object_dtor(&chan->nvsw);
> >                 nvif_object_dtor(&chan->gart);
> >                 nvif_object_dtor(&chan->vram);
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/n=
ouveau/nouveau_chan.h
> > index e06a8ffed31a..bad7466bd0d5 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_chan.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
> > @@ -53,6 +53,7 @@ struct nouveau_channel {
> >         u32 user_put;
> >
> >         struct nvif_object user;
> > +       struct nvif_object blit;
> >
> >         struct nvif_event kill;
> >         atomic_t killed;
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/no=
uveau/nouveau_drm.c
> > index cc7c5b4a05fd..9512f1c2f871 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > @@ -369,15 +369,29 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
> >                 ret =3D nvif_object_ctor(&drm->channel->user, "drmNvsw"=
,
> >                                        NVDRM_NVSW, nouveau_abi16_swclas=
s(drm),
> >                                        NULL, 0, &drm->channel->nvsw);
> > +
> > +               if (ret =3D=3D 0 && device->info.chipset >=3D 0x11) {
>
> Can you double-check that this is needed on NV15? IIRC there's some
> non-linearity of chipsets here which is why we had (some long time
> ago, not sure if it's still there), a chip class which would simplify
> such checks.
>

yeah, it's fine. The old code before 4a16dd9d18a0 had a
"device->info.chipset >=3D 0x11 ? 0x009f : 0x005f" check when creating
the blit object.

> Cheers,
>
>   -ilia
>

