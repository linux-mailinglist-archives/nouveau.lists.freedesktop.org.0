Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AF272EDFB
	for <lists+nouveau@lfdr.de>; Tue, 13 Jun 2023 23:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A8910E3E2;
	Tue, 13 Jun 2023 21:32:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5691C10E3E2
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 21:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686691954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QdOrFiDnrtMMQTAFk0z7jVpsb9hiYGd67nsDaocTQzc=;
 b=JOLRSQZVaARyen0GeX9qXdo7qJpNFZNwpyvM/TRztmWUFGm7nVDGluN9fxA1/MFDEK0EwN
 m2+nryhleFwg7mO6h2OGlvuJEa7OADJYXECbFffe/qckKpz2joQ7pJtiomxzZDgwkmOEEA
 P9kgjAwig9lC1yMRcz7dpgRKLzGcJqI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-C48w0uR-MrWj3YldhTAcJQ-1; Tue, 13 Jun 2023 17:32:32 -0400
X-MC-Unique: C48w0uR-MrWj3YldhTAcJQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4f74128e499so452340e87.0
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 14:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686691950; x=1689283950;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QdOrFiDnrtMMQTAFk0z7jVpsb9hiYGd67nsDaocTQzc=;
 b=MHGE6ZXNFv7SFn3eY7/+8wctYo1GR5Qz2eoPWjKSL487kHdgA8DiVMDv6IkvtoeMza
 qB41qJB6u26ZiOo/LWKCO1SsS3lI+dFjelXjr2z9s0Ho7SPfKu3jdkPwpiFI4RZauhCU
 P+fkujc87PjMMa34jQyeiijSn6Hde+Tyhlsu67T2/ek0Mc823qHirKICUfDhz9Suk38b
 zcNbVhMCHMwQhdO77LZaJjnSDIlFkTMle0gnb3pcptpXEihjeOV4xlyrhTlnlkSAw/X/
 ZvsBf0ggqNIsEQ+3hMy1MrtU5mwyHGRwKWN8trdpaDwYbILDK/0kICsL0nxzW16JRX1s
 c7fg==
X-Gm-Message-State: AC+VfDxH+DeMb4kqwlt5Wo/czMvRFy9JlBGuULssFoA7ZyIB2Ct/ua/W
 K06y53YgMvtdlbq6mZb04cmhNpRkTOMiXy99jWZ8Yke5OUlZeMCRC+iLO4GBcuzxykNMiX2uQVK
 ojTlFIJsduqacYaCtNFLD2Bwqo0ph6jbxqXW7tz42099gbrI9bAOI
X-Received: by 2002:a2e:a4a3:0:b0:2b2:1757:13ed with SMTP id
 g3-20020a2ea4a3000000b002b2175713edmr6577895ljm.4.1686691949848; 
 Tue, 13 Jun 2023 14:32:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7GmSSUI7uEURXf8akEftXbqSVQhNskKIyqKc1FQ9w70sxbxJga45I007nygVHoRVmlMbqrb70/dEXCWnCunAU=
X-Received: by 2002:a2e:a4a3:0:b0:2b2:1757:13ed with SMTP id
 g3-20020a2ea4a3000000b002b2175713edmr6577891ljm.4.1686691949257; Tue, 13 Jun
 2023 14:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230525003106.3853741-1-skeggsb@gmail.com>
 <20230525003106.3853741-5-skeggsb@gmail.com>
In-Reply-To: <20230525003106.3853741-5-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 13 Jun 2023 23:32:18 +0200
Message-ID: <CACO55ts5Tk=a4Zs_T2m=TyEFN+VtpJGFf+DsBx_CufKH+Hpx1A@mail.gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 05/10] drm/nouveau/fifo: remove left-over
 references to nvkm_fifo_chan
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

On Thu, May 25, 2023 at 2:31=E2=80=AFAM Ben Skeggs <skeggsb@gmail.com> wrot=
e:
>
> From: Ben Skeggs <bskeggs@redhat.com>
>
> This was renamed to nvkm_chan in the host rework.
>
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvkm/core/engine.h   | 5 ++---
>  drivers/gpu/drm/nouveau/include/nvkm/core/os.h       | 5 -----
>  drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c        | 3 +--
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c       | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.h        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.c        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.c        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.c        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.c        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.c        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.h        | 4 ++--
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.c        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.h        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h        | 4 ++--
>  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.c      | 3 +--
>  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.h      | 4 ++--
>  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c      | 5 ++---
>  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/priv.h      | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/base.c        | 3 +--
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.c        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.h        | 4 ++--
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c       | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.c        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.c        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c        | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/priv.h        | 2 +-
>  32 files changed, 37 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h b/drivers=
/gpu/drm/nouveau/include/nvkm/core/engine.h
> index b67b9c1a6b4e..8041fe03237e 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h
> @@ -3,7 +3,7 @@
>  #define __NVKM_ENGINE_H__
>  #define nvkm_engine(p) container_of((p), struct nvkm_engine, subdev)
>  #include <core/subdev.h>
> -struct nvkm_fifo_chan;
> +struct nvkm_chan;
>  struct nvkm_fb_tile;
>
>  extern const struct nvkm_subdev_func nvkm_engine;
> @@ -32,8 +32,7 @@ struct nvkm_engine_func {
>         } base;
>
>         struct {
> -               int (*cclass)(struct nvkm_fifo_chan *,
> -                             const struct nvkm_oclass *,
> +               int (*cclass)(struct nvkm_chan *, const struct nvkm_oclas=
s *,
>                               struct nvkm_object **);
>                 int (*sclass)(struct nvkm_oclass *, int index);
>         } fifo;
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h b/drivers/gpu=
/drm/nouveau/include/nvkm/core/os.h
> index 4486d9862849..3fd5c007a663 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
> @@ -49,9 +49,4 @@ nvkm_blob_dtor(struct nvkm_blob *blob)
>         (p =3D container_of((h), typeof(*p), m), nvkm_list_find_next(p, (=
h), m, (c)))
>  #define nvkm_list_foreach(p,h,m,c)                                      =
                     \
>         for (p =3D nvkm_list_find(p, (h), m, (c)); p; p =3D nvkm_list_fin=
d_next(p, (h), m, (c)))
> -
> -/*FIXME: remove after */
> -#define nvkm_fifo_chan nvkm_chan
> -#define nvkm_fifo_chan_func nvkm_chan_func
> -#define nvkm_fifo_cgrp nvkm_cgrp
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h b/drive=
rs/gpu/drm/nouveau/include/nvkm/engine/falcon.h
> index cd86d9198e4a..b7bb8a29a729 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
> @@ -3,7 +3,7 @@
>  #define __NVKM_FLCNEN_H__
>  #define nvkm_falcon(p) container_of((p), struct nvkm_falcon, engine)
>  #include <core/engine.h>
> -struct nvkm_fifo_chan;
> +struct nvkm_chan;
>
>  enum nvkm_falcon_dmaidx {
>         FALCON_DMAIDX_UCODE             =3D 0,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h b/drivers/gpu/=
drm/nouveau/nvkm/engine/ce/priv.h
> index c4c046916fa6..53ba2abe0bf5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
> @@ -3,7 +3,7 @@
>  #define __NVKM_CE_PRIV_H__
>  #include <engine/ce.h>
>
> -void gt215_ce_intr(struct nvkm_falcon *, struct nvkm_fifo_chan *);
> +void gt215_ce_intr(struct nvkm_falcon *, struct nvkm_chan *);
>  void gk104_ce_intr(struct nvkm_engine *);
>  void gp100_ce_intr(struct nvkm_engine *);
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/base.c
> index 71b824e6da9d..5653fbf785e1 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
> @@ -109,8 +109,7 @@ nvkm_gr_oclass_get(struct nvkm_oclass *oclass, int in=
dex)
>  }
>
>  static int
> -nvkm_gr_cclass_new(struct nvkm_fifo_chan *chan,
> -                  const struct nvkm_oclass *oclass,
> +nvkm_gr_cclass_new(struct nvkm_chan *chan, const struct nvkm_oclass *ocl=
ass,
>                    struct nvkm_object **pobject)
>  {
>         struct nvkm_gr *gr =3D nvkm_gr(oclass->engine);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/gr/gf100.c
> index 5f20079c3660..29afec9a55bf 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> @@ -374,7 +374,7 @@ gf100_gr_chan =3D {
>  };
>
>  static int
> -gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
> +gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>                   const struct nvkm_oclass *oclass,
>                   struct nvkm_object **pobject)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/nv04.c
> index 81bd682c2102..ca822f07b63e 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c
> @@ -1181,7 +1181,7 @@ nv04_gr_chan =3D {
>  };
>
>  static int
> -nv04_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
> +nv04_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>                  const struct nvkm_oclass *oclass, struct nvkm_object **p=
object)
>  {
>         struct nv04_gr *gr =3D nv04_gr(base);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/nv10.c
> index 7fe6e58f6bab..92ef7c9b2910 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c
> @@ -999,7 +999,7 @@ nv10_gr_chan =3D {
>         } while (0)
>
>  int
> -nv10_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
> +nv10_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>                  const struct nvkm_oclass *oclass, struct nvkm_object **p=
object)
>  {
>         struct nv10_gr *gr =3D nv10_gr(base);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.h b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/nv10.h
> index 5cfe927c9123..b86090c08060 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.h
> @@ -9,6 +9,6 @@ int nv10_gr_init(struct nvkm_gr *);
>  void nv10_gr_intr(struct nvkm_gr *);
>  void nv10_gr_tile(struct nvkm_gr *, int, struct nvkm_fb_tile *);
>
> -int nv10_gr_chan_new(struct nvkm_gr *, struct nvkm_fifo_chan *,
> +int nv10_gr_chan_new(struct nvkm_gr *, struct nvkm_chan *,
>                      const struct nvkm_oclass *, struct nvkm_object **);
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/nv20.c
> index 75434f5de7ad..02a8c62a0a32 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c
> @@ -72,7 +72,7 @@ nv20_gr_chan =3D {
>  };
>
>  static int
> -nv20_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
> +nv20_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>                  const struct nvkm_oclass *oclass, struct nvkm_object **p=
object)
>  {
>         struct nv20_gr *gr =3D nv20_gr(base);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/nv25.c
> index 94685e4d4f87..d6bc6904dcc8 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.c
> @@ -18,7 +18,7 @@ nv25_gr_chan =3D {
>  };
>
>  static int
> -nv25_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
> +nv25_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>                  const struct nvkm_oclass *oclass, struct nvkm_object **p=
object)
>  {
>         struct nv20_gr *gr =3D nv20_gr(base);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/nv2a.c
> index 2d6273675291..e5a351b51eb9 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.c
> @@ -18,7 +18,7 @@ nv2a_gr_chan =3D {
>  };
>
>  static int
> -nv2a_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
> +nv2a_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>                  const struct nvkm_oclass *oclass, struct nvkm_object **p=
object)
>  {
>         struct nv20_gr *gr =3D nv20_gr(base);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/nv30.c
> index 647bd6fede04..80370323755e 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.c
> @@ -19,7 +19,7 @@ nv30_gr_chan =3D {
>  };
>
>  static int
> -nv30_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
> +nv30_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>                  const struct nvkm_oclass *oclass, struct nvkm_object **p=
object)
>  {
>         struct nv20_gr *gr =3D nv20_gr(base);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/nv34.c
> index 2eae3fe4ef4e..cdf043bbdd59 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.c
> @@ -18,7 +18,7 @@ nv34_gr_chan =3D {
>  };
>
>  static int
> -nv34_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
> +nv34_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>                  const struct nvkm_oclass *oclass, struct nvkm_object **p=
object)
>  {
>         struct nv20_gr *gr =3D nv20_gr(base);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/nv35.c
> index 657d7cdba369..fa5a6ccb871d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.c
> @@ -18,7 +18,7 @@ nv35_gr_chan =3D {
>  };
>
>  static int
> -nv35_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
> +nv35_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>                  const struct nvkm_oclass *oclass, struct nvkm_object **p=
object)
>  {
>         struct nv20_gr *gr =3D nv20_gr(base);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/nv40.c
> index d2df097a6cf6..a5e1f02791b4 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c
> @@ -145,7 +145,7 @@ nv40_gr_chan =3D {
>  };
>
>  int
> -nv40_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
> +nv40_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>                  const struct nvkm_oclass *oclass, struct nvkm_object **p=
object)
>  {
>         struct nv40_gr *gr =3D nv40_gr(base);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.h b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/nv40.h
> index f3d3d3a5ae5b..84fbc99139e5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.h
> @@ -22,12 +22,12 @@ u64 nv40_gr_units(struct nvkm_gr *);
>  struct nv40_gr_chan {
>         struct nvkm_object object;
>         struct nv40_gr *gr;
> -       struct nvkm_fifo_chan *fifo;
> +       struct nvkm_chan *fifo;
>         u32 inst;
>         struct list_head head;
>  };
>
> -int nv40_gr_chan_new(struct nvkm_gr *, struct nvkm_fifo_chan *,
> +int nv40_gr_chan_new(struct nvkm_gr *, struct nvkm_chan *,
>                      const struct nvkm_oclass *, struct nvkm_object **);
>
>  extern const struct nvkm_object_func nv40_gr_object;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/nv50.c
> index 1ba18a8e380f..c8a0288c092d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.c
> @@ -86,7 +86,7 @@ nv50_gr_chan =3D {
>  };
>
>  int
> -nv50_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
> +nv50_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>                  const struct nvkm_oclass *oclass, struct nvkm_object **p=
object)
>  {
>         struct nv50_gr *gr =3D nv50_gr(base);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.h b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/nv50.h
> index 84388c42e5c6..97ead0042357 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.h
> @@ -27,7 +27,7 @@ struct nv50_gr_chan {
>         struct nv50_gr *gr;
>  };
>
> -int nv50_gr_chan_new(struct nvkm_gr *, struct nvkm_fifo_chan *,
> +int nv50_gr_chan_new(struct nvkm_gr *, struct nvkm_chan *,
>                      const struct nvkm_oclass *, struct nvkm_object **);
>
>  extern const struct nvkm_object_func nv50_gr_object;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/priv.h
> index 08d5c96e6458..6ec8b94854c0 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h
> @@ -5,7 +5,7 @@
>  #include <engine/gr.h>
>  #include <core/enum.h>
>  struct nvkm_fb_tile;
> -struct nvkm_fifo_chan;
> +struct nvkm_chan;
>
>  int nvkm_gr_ctor(const struct nvkm_gr_func *, struct nvkm_device *, enum=
 nvkm_subdev_type, int,
>                  bool enable, struct nvkm_gr *);
> @@ -21,7 +21,7 @@ struct nvkm_gr_func {
>         void (*intr)(struct nvkm_gr *);
>         void (*tile)(struct nvkm_gr *, int region, struct nvkm_fb_tile *)=
;
>         int (*tlb_flush)(struct nvkm_gr *);
> -       int (*chan_new)(struct nvkm_gr *, struct nvkm_fifo_chan *,
> +       int (*chan_new)(struct nvkm_gr *, struct nvkm_chan *,
>                         const struct nvkm_oclass *, struct nvkm_object **=
);
>         int (*object_get)(struct nvkm_gr *, int, struct nvkm_sclass *);
>         /* Returns chipset-specific counts of units packed into an u64.
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/mpeg/nv31.c
> index cb0c3991b2ad..db9fc1ecae0d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.c
> @@ -81,8 +81,7 @@ nv31_mpeg_chan =3D {
>  };
>
>  int
> -nv31_mpeg_chan_new(struct nvkm_fifo_chan *fifoch,
> -                  const struct nvkm_oclass *oclass,
> +nv31_mpeg_chan_new(struct nvkm_chan *fifoch, const struct nvkm_oclass *o=
class,
>                    struct nvkm_object **pobject)
>  {
>         struct nv31_mpeg *mpeg =3D nv31_mpeg(oclass->engine);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.h b/drivers/gp=
u/drm/nouveau/nvkm/engine/mpeg/nv31.h
> index 9f30aaaf809e..251d659565de 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.h
> @@ -24,9 +24,9 @@ struct nv31_mpeg_func {
>  struct nv31_mpeg_chan {
>         struct nvkm_object object;
>         struct nv31_mpeg *mpeg;
> -       struct nvkm_fifo_chan *fifo;
> +       struct nvkm_chan *fifo;
>  };
>
> -int nv31_mpeg_chan_new(struct nvkm_fifo_chan *, const struct nvkm_oclass=
 *,
> +int nv31_mpeg_chan_new(struct nvkm_chan *, const struct nvkm_oclass *,
>                        struct nvkm_object **);
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/mpeg/nv44.c
> index 0890a279458e..4b1374adbda3 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c
> @@ -43,7 +43,7 @@ struct nv44_mpeg {
>  struct nv44_mpeg_chan {
>         struct nvkm_object object;
>         struct nv44_mpeg *mpeg;
> -       struct nvkm_fifo_chan *fifo;
> +       struct nvkm_chan *fifo;
>         struct list_head head;
>         u32 inst;
>  };
> @@ -100,8 +100,7 @@ nv44_mpeg_chan =3D {
>  };
>
>  static int
> -nv44_mpeg_chan_new(struct nvkm_fifo_chan *fifoch,
> -                  const struct nvkm_oclass *oclass,
> +nv44_mpeg_chan_new(struct nvkm_chan *fifoch, const struct nvkm_oclass *o=
class,
>                    struct nvkm_object **pobject)
>  {
>         struct nv44_mpeg *mpeg =3D nv44_mpeg(oclass->engine);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/priv.h b/drivers/gp=
u/drm/nouveau/nvkm/engine/mpeg/priv.h
> index 667a2d05dd89..044ff4133874 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/priv.h
> @@ -2,7 +2,7 @@
>  #ifndef __NVKM_MPEG_PRIV_H__
>  #define __NVKM_MPEG_PRIV_H__
>  #include <engine/mpeg.h>
> -struct nvkm_fifo_chan;
> +struct nvkm_chan;
>
>  int nv31_mpeg_init(struct nvkm_engine *);
>  void nv31_mpeg_tile(struct nvkm_engine *, int, struct nvkm_fb_tile *);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/base.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/sw/base.c
> index a9d464db6974..20220d6d4a13 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/base.c
> @@ -74,8 +74,7 @@ nvkm_sw_oclass_get(struct nvkm_oclass *oclass, int inde=
x)
>  }
>
>  static int
> -nvkm_sw_cclass_get(struct nvkm_fifo_chan *fifoch,
> -                  const struct nvkm_oclass *oclass,
> +nvkm_sw_cclass_get(struct nvkm_chan *fifoch, const struct nvkm_oclass *o=
class,
>                    struct nvkm_object **pobject)
>  {
>         struct nvkm_sw *sw =3D nvkm_sw(oclass->engine);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/sw/chan.c
> index 834b8cbed51d..2bf45141de60 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.c
> @@ -74,7 +74,7 @@ nvkm_sw_chan =3D {
>
>  int
>  nvkm_sw_chan_ctor(const struct nvkm_sw_chan_func *func, struct nvkm_sw *=
sw,
> -                 struct nvkm_fifo_chan *fifo, const struct nvkm_oclass *=
oclass,
> +                 struct nvkm_chan *fifo, const struct nvkm_oclass *oclas=
s,
>                   struct nvkm_sw_chan *chan)
>  {
>         unsigned long flags;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.h b/drivers/gpu/=
drm/nouveau/nvkm/engine/sw/chan.h
> index 67b2e5ea93d9..c313aea16a17 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.h
> @@ -11,7 +11,7 @@ struct nvkm_sw_chan {
>         const struct nvkm_sw_chan_func *func;
>         struct nvkm_object object;
>         struct nvkm_sw *sw;
> -       struct nvkm_fifo_chan *fifo;
> +       struct nvkm_chan *fifo;
>         struct list_head head;
>
>  #define NVKM_SW_CHAN_EVENT_PAGE_FLIP BIT(0)
> @@ -24,7 +24,7 @@ struct nvkm_sw_chan_func {
>  };
>
>  int nvkm_sw_chan_ctor(const struct nvkm_sw_chan_func *, struct nvkm_sw *=
,
> -                     struct nvkm_fifo_chan *, const struct nvkm_oclass *=
,
> +                     struct nvkm_chan *, const struct nvkm_oclass *,
>                       struct nvkm_sw_chan *);
>  bool nvkm_sw_chan_mthd(struct nvkm_sw_chan *, int subc, u32 mthd, u32 da=
ta);
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/sw/gf100.c
> index c3cf6f2ff86c..a0273baf4c67 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> @@ -102,7 +102,7 @@ gf100_sw_chan =3D {
>  };
>
>  static int
> -gf100_sw_chan_new(struct nvkm_sw *sw, struct nvkm_fifo_chan *fifoch,
> +gf100_sw_chan_new(struct nvkm_sw *sw, struct nvkm_chan *fifoch,
>                   const struct nvkm_oclass *oclass,
>                   struct nvkm_object **pobject)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/sw/nv04.c
> index 4aa57573869c..8a1d112da894 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.c
> @@ -106,7 +106,7 @@ nv04_sw_chan =3D {
>  };
>
>  static int
> -nv04_sw_chan_new(struct nvkm_sw *sw, struct nvkm_fifo_chan *fifo,
> +nv04_sw_chan_new(struct nvkm_sw *sw, struct nvkm_chan *fifo,
>                  const struct nvkm_oclass *oclass, struct nvkm_object **p=
object)
>  {
>         struct nv04_sw_chan *chan;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/sw/nv10.c
> index e79e640ae535..742c75859569 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.c
> @@ -36,7 +36,7 @@ nv10_sw_chan =3D {
>  };
>
>  static int
> -nv10_sw_chan_new(struct nvkm_sw *sw, struct nvkm_fifo_chan *fifo,
> +nv10_sw_chan_new(struct nvkm_sw *sw, struct nvkm_chan *fifo,
>                  const struct nvkm_oclass *oclass, struct nvkm_object **p=
object)
>  {
>         struct nvkm_sw_chan *chan;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/sw/nv50.c
> index 9d7a9b7d5be3..99476d32c5af 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> @@ -99,7 +99,7 @@ nv50_sw_chan =3D {
>  };
>
>  static int
> -nv50_sw_chan_new(struct nvkm_sw *sw, struct nvkm_fifo_chan *fifoch,
> +nv50_sw_chan_new(struct nvkm_sw *sw, struct nvkm_chan *fifoch,
>                  const struct nvkm_oclass *oclass, struct nvkm_object **p=
object)
>  {
>         struct nvkm_disp *disp =3D sw->engine.subdev.device->disp;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/priv.h b/drivers/gpu/=
drm/nouveau/nvkm/engine/sw/priv.h
> index d9d83b1b8849..8015afaba947 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/priv.h
> @@ -15,7 +15,7 @@ struct nvkm_sw_chan_sclass {
>  };
>
>  struct nvkm_sw_func {
> -       int (*chan_new)(struct nvkm_sw *, struct nvkm_fifo_chan *,
> +       int (*chan_new)(struct nvkm_sw *, struct nvkm_chan *,
>                         const struct nvkm_oclass *, struct nvkm_object **=
);
>         const struct nvkm_sw_chan_sclass sclass[];
>  };
> --
> 2.40.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

