Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F130172EE31
	for <lists+nouveau@lfdr.de>; Tue, 13 Jun 2023 23:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E89010E087;
	Tue, 13 Jun 2023 21:42:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC27210E087
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 21:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686692534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u2U6uvRgrQNIk8ScoKq8v6JtdBfOgVsf1owk+3Lemp0=;
 b=RS4ctRJJUwbDtc7iG5ViQG91c0axccsibvZ1nIPP1TedDFGrYDFNsoG0V+gXvX2oBCcLdg
 S6jmgxA6Jx56QW8WLagj9B7fmNmCKDgvLnG7M9swC74z40nCf2oT21w97ic9WWFg5vppCM
 isClQm/Pf5re/xwI1u1nEXfsuCjetR0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-tc65CH0DP-msN94q6cI7-w-1; Tue, 13 Jun 2023 17:42:12 -0400
X-MC-Unique: tc65CH0DP-msN94q6cI7-w-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b330fbc513so3458881fa.0
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 14:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686692531; x=1689284531;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u2U6uvRgrQNIk8ScoKq8v6JtdBfOgVsf1owk+3Lemp0=;
 b=D/5GDi6mr6VJJwlFOWUrdgz7yetRXzZfb1uBFiw8pu9fUyAJDsnSY8MFCeZbdZp/fZ
 XmJ6QTs7oXIs/6aq4Gy9I4J2LJqjNl5NjX1F9GZFUyuxH2h7WzkEk06mYiHp29xo5zko
 0pDduZ8ksr2hrDz+UI6tvDLq3utaMN3jqEGlGvRIii+aL4fPcnwyTDlFIQ4vzDcoLv7z
 HzyioIowF70aVOsqZThr4IEp2e7OuP6QIMe2sHQ68mDUh85z7gOWmmtdqb27qoqPUUv0
 KnOcx0kswm8w2aQsP5ca/qLjpV2MXMPrr35c9SQBh8iy+fMYwTOffYZQQEWDgNIUDsfY
 pI/g==
X-Gm-Message-State: AC+VfDxmlxhWIXrH6lcF1vNJD9jGrDnn15XyCWu6bxkrtu9TJBVrutgE
 2pMp0apsgP87rx4UGxMYB6L9QIJMhBnQlhpgHzV9zxEUooeDVgYopHEV/j3DuKLnDMHSR2t3KeL
 mojtZFeFxlBBjYQZ1Czv+1St4G3tpJbSeb0BuC61PnPsvQu4aKY/M
X-Received: by 2002:a2e:b98c:0:b0:2b3:4849:e6f with SMTP id
 p12-20020a2eb98c000000b002b348490e6fmr70290ljp.2.1686692530758; 
 Tue, 13 Jun 2023 14:42:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7MzmCnkBtcBwG8kN+P10FNiK4ewIIE8PMh+wsfmeWBsPL+S5twEOBYyagSeXSv5g9KmPOwGmD6Ae0TtJlDnUs=
X-Received: by 2002:a2e:b98c:0:b0:2b3:4849:e6f with SMTP id
 p12-20020a2eb98c000000b002b348490e6fmr70278ljp.2.1686692530284; Tue, 13 Jun
 2023 14:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230525003106.3853741-1-skeggsb@gmail.com>
 <20230525003106.3853741-8-skeggsb@gmail.com>
In-Reply-To: <20230525003106.3853741-8-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 13 Jun 2023 23:41:59 +0200
Message-ID: <CACO55ttHMzbFa3e6DZDresBUJysRQiyUnKJhcPRHvsRef=Knfg@mail.gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 08/10] drm/nouveau/fifo/ga100-: add
 per-runlist nonstall intr handling
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
> GSP-RM will enforce this, so implement on HW too so we can share code.
>
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  .../drm/nouveau/include/nvkm/core/engine.h    |  1 +
>  .../gpu/drm/nouveau/nvkm/engine/ce/ga100.c    | 10 ++++
>  .../gpu/drm/nouveau/nvkm/engine/ce/ga102.c    |  1 +
>  drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h |  1 +
>  .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   | 32 +++++-----
>  .../gpu/drm/nouveau/nvkm/engine/fifo/ga100.c  | 59 +++++++++++++++----
>  .../gpu/drm/nouveau/nvkm/engine/fifo/runl.h   |  6 ++
>  .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  |  2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c | 12 ++++
>  .../gpu/drm/nouveau/nvkm/engine/gr/ga102.c    |  7 +++
>  .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    | 12 ++++
>  .../gpu/drm/nouveau/nvkm/engine/gr/gf100.h    |  1 +
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h |  1 +
>  13 files changed, 116 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h b/drivers=
/gpu/drm/nouveau/include/nvkm/core/engine.h
> index 8041fe03237e..738899fcf30b 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h
> @@ -22,6 +22,7 @@ struct nvkm_engine_func {
>         int (*init)(struct nvkm_engine *);
>         int (*fini)(struct nvkm_engine *, bool suspend);
>         int (*reset)(struct nvkm_engine *);
> +       int (*nonstall)(struct nvkm_engine *);
>         void (*intr)(struct nvkm_engine *);
>         void (*tile)(struct nvkm_engine *, int region, struct nvkm_fb_til=
e *);
>         bool (*chsw_load)(struct nvkm_engine *);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/ce/ga100.c
> index 6648ed62daa6..315a69f7fdd1 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
> @@ -35,6 +35,15 @@ ga100_ce_intr(struct nvkm_inth *inth)
>         return IRQ_NONE;
>  }
>
> +int
> +ga100_ce_nonstall(struct nvkm_engine *engine)
> +{
> +       struct nvkm_subdev *subdev =3D &engine->subdev;
> +       struct nvkm_device *device =3D subdev->device;
> +
> +       return nvkm_rd32(device, 0x104424 + (subdev->inst * 0x80)) & 0x00=
000fff;
> +}
> +
>  int
>  ga100_ce_fini(struct nvkm_engine *engine, bool suspend)
>  {
> @@ -67,6 +76,7 @@ ga100_ce =3D {
>         .oneinit =3D ga100_ce_oneinit,
>         .init =3D ga100_ce_init,
>         .fini =3D ga100_ce_fini,
> +       .nonstall =3D ga100_ce_nonstall,
>         .cclass =3D &gv100_ce_cclass,
>         .sclass =3D {
>                 { -1, -1, AMPERE_DMA_COPY_A },
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/ce/ga102.c
> index 9f3448ad625f..461b73c7e2e0 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c
> @@ -28,6 +28,7 @@ ga102_ce =3D {
>         .oneinit =3D ga100_ce_oneinit,
>         .init =3D ga100_ce_init,
>         .fini =3D ga100_ce_fini,
> +       .nonstall =3D ga100_ce_nonstall,
>         .cclass =3D &gv100_ce_cclass,
>         .sclass =3D {
>                 { -1, -1, AMPERE_DMA_COPY_A },
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h b/drivers/gpu/=
drm/nouveau/nvkm/engine/ce/priv.h
> index 53ba2abe0bf5..0be72c463b21 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
> @@ -12,4 +12,5 @@ extern const struct nvkm_object_func gv100_ce_cclass;
>  int ga100_ce_oneinit(struct nvkm_engine *);
>  int ga100_ce_init(struct nvkm_engine *);
>  int ga100_ce_fini(struct nvkm_engine *, bool);
> +int ga100_ce_nonstall(struct nvkm_engine *);
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/fifo/base.c
> index 5ea9a2ff0663..5db37247dc29 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
> @@ -283,11 +283,21 @@ nvkm_fifo_oneinit(struct nvkm_engine *engine)
>         }
>
>         /* Initialise non-stall intr handling. */
> -       if (fifo->func->nonstall_ctor) {
> -               ret =3D fifo->func->nonstall_ctor(fifo);
> -               if (ret) {
> -                       nvkm_error(subdev, "nonstall %d\n", ret);
> +       if (fifo->func->nonstall) {
> +               if (fifo->func->nonstall_ctor) {
> +                       ret =3D fifo->func->nonstall_ctor(fifo);
> +                       if (ret < 0) {
> +                               nvkm_error(subdev, "nonstall %d\n", ret);
> +                               return ret;
> +                       }
> +               } else {
> +                       ret =3D 1;
>                 }
> +
> +               ret =3D nvkm_event_init(fifo->func->nonstall, &fifo->engi=
ne.subdev, 1, ret,
> +                                     &fifo->nonstall.event);
> +               if (ret)
> +                       return ret;
>         }
>
>         /* Allocate USERD + BAR1 polling area. */
> @@ -358,7 +368,6 @@ nvkm_fifo_new_(const struct nvkm_fifo_func *func, str=
uct nvkm_device *device,
>                enum nvkm_subdev_type type, int inst, struct nvkm_fifo **p=
fifo)
>  {
>         struct nvkm_fifo *fifo;
> -       int ret;
>
>         if (!(fifo =3D *pfifo =3D kzalloc(sizeof(*fifo), GFP_KERNEL)))
>                 return -ENOMEM;
> @@ -374,16 +383,5 @@ nvkm_fifo_new_(const struct nvkm_fifo_func *func, st=
ruct nvkm_device *device,
>         spin_lock_init(&fifo->lock);
>         mutex_init(&fifo->mutex);
>
> -       ret =3D nvkm_engine_ctor(&nvkm_fifo, device, type, inst, true, &f=
ifo->engine);
> -       if (ret)
> -               return ret;
> -
> -       if (func->nonstall) {
> -               ret =3D nvkm_event_init(func->nonstall, &fifo->engine.sub=
dev, 1, 1,
> -                                     &fifo->nonstall.event);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return 0;
> +       return nvkm_engine_ctor(&nvkm_fifo, device, type, inst, true, &fi=
fo->engine);
>  }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/fifo/ga100.c
> index a729f8b7f0da..c56d2a839efb 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
> @@ -32,9 +32,6 @@
>
>  #include <nvif/class.h>
>
> -/*TODO: allocate? */
> -#define GA100_FIFO_NONSTALL_VECTOR 0
> -
>  static u32
>  ga100_chan_doorbell_handle(struct nvkm_chan *chan)
>  {
> @@ -83,7 +80,7 @@ ga100_chan_ramfc_write(struct nvkm_chan *chan, u64 offs=
et, u64 length, u32 devm,
>         nvkm_wo32(chan->inst, 0x0e4, priv ? 0x00000020 : 0x00000000);
>         nvkm_wo32(chan->inst, 0x0e8, chan->id);
>         nvkm_wo32(chan->inst, 0x0f4, 0x00001000 | (priv ? 0x00000100 : 0x=
00000000));
> -       nvkm_wo32(chan->inst, 0x0f8, 0x80000000 | GA100_FIFO_NONSTALL_VEC=
TOR);
> +       nvkm_wo32(chan->inst, 0x0f8, 0x80000000 | chan->cgrp->runl->nonst=
all.vector);
>         nvkm_mo32(chan->inst, 0x218, 0x00000000, 0x00000000);
>         nvkm_done(chan->inst);
>         return 0;
> @@ -148,8 +145,20 @@ ga100_engn_cxid(struct nvkm_engn *engn, bool *cgid)
>         return -ENODEV;
>  }
>
> +static int
> +ga100_engn_nonstall(struct nvkm_engn *engn)
> +{
> +       struct nvkm_engine *engine =3D engn->engine;
> +
> +       if (WARN_ON(!engine->func->nonstall))
> +               return -EINVAL;
> +
> +       return engine->func->nonstall(engine);
> +}
> +
>  const struct nvkm_engn_func
>  ga100_engn =3D {
> +       .nonstall =3D ga100_engn_nonstall,
>         .cxid =3D ga100_engn_cxid,
>         .ctor =3D gk104_ectx_ctor,
>         .bind =3D gv100_ectx_bind,
> @@ -157,6 +166,7 @@ ga100_engn =3D {
>
>  const struct nvkm_engn_func
>  ga100_engn_ce =3D {
> +       .nonstall =3D ga100_engn_nonstall,
>         .cxid =3D ga100_engn_cxid,
>         .ctor =3D gv100_ectx_ce_ctor,
>         .bind =3D gv100_ectx_ce_bind,
> @@ -470,6 +480,11 @@ ga100_runl_new(struct nvkm_fifo *fifo, int id, u32 a=
ddr, struct nvkm_runl **prun
>                                      tdev->type, tdev->inst);
>                 if (!engn)
>                         return -EINVAL;
> +
> +               if (!engn->engine->func->nonstall) {
> +                       RUNL_DEBUG(runl, "engn %s !nonstall", engn->engin=
e->subdev.name);
> +                       return -EINVAL;
> +               }
>         }
>
>         if (list_empty(&runl->engns)) {
> @@ -492,9 +507,9 @@ ga100_runl_new(struct nvkm_fifo *fifo, int id, u32 ad=
dr, struct nvkm_runl **prun
>  static irqreturn_t
>  ga100_fifo_nonstall_intr(struct nvkm_inth *inth)
>  {
> -       struct nvkm_fifo *fifo =3D container_of(inth, typeof(*fifo), nons=
tall.intr);
> +       struct nvkm_runl *runl =3D container_of(inth, typeof(*runl), nons=
tall.inth);
>
> -       nvkm_event_ntfy(&fifo->nonstall.event, 0, NVKM_FIFO_NONSTALL_EVEN=
T);
> +       nvkm_event_ntfy(&runl->fifo->nonstall.event, runl->id, NVKM_FIFO_=
NONSTALL_EVENT);
>         return IRQ_HANDLED;
>  }
>
> @@ -502,16 +517,18 @@ static void
>  ga100_fifo_nonstall_block(struct nvkm_event *event, int type, int index)
>  {
>         struct nvkm_fifo *fifo =3D container_of(event, typeof(*fifo), non=
stall.event);
> +       struct nvkm_runl *runl =3D nvkm_runl_get(fifo, index, 0);
>
> -       nvkm_inth_block(&fifo->nonstall.intr);
> +       nvkm_inth_block(&runl->nonstall.inth);
>  }
>
>  static void
>  ga100_fifo_nonstall_allow(struct nvkm_event *event, int type, int index)
>  {
>         struct nvkm_fifo *fifo =3D container_of(event, typeof(*fifo), non=
stall.event);
> +       struct nvkm_runl *runl =3D nvkm_runl_get(fifo, index, 0);
>
> -       nvkm_inth_allow(&fifo->nonstall.intr);
> +       nvkm_inth_allow(&runl->nonstall.inth);
>  }
>
>  const struct nvkm_event_func
> @@ -523,9 +540,29 @@ ga100_fifo_nonstall =3D {
>  int
>  ga100_fifo_nonstall_ctor(struct nvkm_fifo *fifo)
>  {
> -       return nvkm_inth_add(&fifo->engine.subdev.device->vfn->intr, GA10=
0_FIFO_NONSTALL_VECTOR,
> -                            NVKM_INTR_PRIO_NORMAL, &fifo->engine.subdev,=
 ga100_fifo_nonstall_intr,
> -                            &fifo->nonstall.intr);
> +       struct nvkm_subdev *subdev =3D &fifo->engine.subdev;
> +       struct nvkm_vfn *vfn =3D subdev->device->vfn;
> +       struct nvkm_runl *runl;
> +       int ret, nr =3D 0;
> +
> +       nvkm_runl_foreach(runl, fifo) {
> +               struct nvkm_engn *engn =3D list_first_entry(&runl->engns,=
 typeof(*engn), head);
> +
> +               runl->nonstall.vector =3D engn->func->nonstall(engn);
> +               if (runl->nonstall.vector < 0) {
> +                       RUNL_ERROR(runl, "nonstall %d", runl->nonstall.ve=
ctor);
> +                       return runl->nonstall.vector;
> +               }
> +
> +               ret =3D nvkm_inth_add(&vfn->intr, runl->nonstall.vector, =
NVKM_INTR_PRIO_NORMAL,
> +                                   subdev, ga100_fifo_nonstall_intr, &ru=
nl->nonstall.inth);
> +               if (ret)
> +                       return ret;
> +
> +               nr =3D max(nr, runl->id + 1);
> +       }
> +
> +       return nr;
>  }
>
>  int
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h b/drivers/gp=
u/drm/nouveau/nvkm/engine/fifo/runl.h
> index c93d21bb7bd5..5421321f8e85 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h
> @@ -11,6 +11,7 @@ enum nvkm_subdev_type;
>
>  struct nvkm_engn {
>         const struct nvkm_engn_func {
> +               int (*nonstall)(struct nvkm_engn *);
>                 bool (*chsw)(struct nvkm_engn *);
>                 int (*cxid)(struct nvkm_engn *, bool *cgid);
>                 void (*mmu_fault_trigger)(struct nvkm_engn *);
> @@ -69,6 +70,11 @@ struct nvkm_runl {
>
>         struct nvkm_inth inth;
>
> +       struct {
> +               int vector;
> +               struct nvkm_inth inth;
> +       } nonstall;
> +
>         struct list_head cgrps;
>         int cgrp_nr;
>         int chan_nr;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/fifo/uchan.c
> index 1dac95ae7b43..04140e0110be 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
> @@ -52,7 +52,7 @@ nvkm_uchan_uevent(struct nvkm_object *object, void *arg=
v, u32 argc, struct nvkm_
>
>         switch (args->v0.type) {
>         case NVIF_CHAN_EVENT_V0_NON_STALL_INTR:
> -               return nvkm_uevent_add(uevent, &runl->fifo->nonstall.even=
t, 0,
> +               return nvkm_uevent_add(uevent, &runl->fifo->nonstall.even=
t, runl->id,
>                                        NVKM_FIFO_NONSTALL_EVENT, NULL);
>         case NVIF_CHAN_EVENT_V0_KILLED:
>                 return nvkm_uevent_add(uevent, &runl->chid->event, chan->=
id,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/base.c
> index 5653fbf785e1..0096ad401b15 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
> @@ -125,6 +125,17 @@ nvkm_gr_intr(struct nvkm_engine *engine)
>         gr->func->intr(gr);
>  }
>
> +static int
> +nvkm_gr_nonstall(struct nvkm_engine *engine)
> +{
> +       struct nvkm_gr *gr =3D nvkm_gr(engine);
> +
> +       if (gr->func->nonstall)
> +               return gr->func->nonstall(gr);
> +
> +       return -EINVAL;
> +}
> +
>  static int
>  nvkm_gr_oneinit(struct nvkm_engine *engine)
>  {
> @@ -177,6 +188,7 @@ nvkm_gr =3D {
>         .init =3D nvkm_gr_init,
>         .fini =3D nvkm_gr_fini,
>         .reset =3D nvkm_gr_reset,
> +       .nonstall =3D nvkm_gr_nonstall,
>         .intr =3D nvkm_gr_intr,
>         .tile =3D nvkm_gr_tile,
>         .chsw_load =3D nvkm_gr_chsw_load,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/gr/ga102.c
> index a5b5ac2755a2..00cd70abad67 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
> @@ -137,8 +137,15 @@ ga102_gr_oneinit_intr(struct gf100_gr *gr, enum nvkm=
_intr_type *pvector)
>         return &device->vfn->intr;
>  }
>
> +static int
> +ga102_gr_nonstall(struct gf100_gr *gr)
> +{
> +       return nvkm_rd32(gr->base.engine.subdev.device, 0x400160) & 0x000=
00fff;
> +}
> +
>  static const struct gf100_gr_func
>  ga102_gr =3D {
> +       .nonstall =3D ga102_gr_nonstall,
>         .oneinit_intr =3D ga102_gr_oneinit_intr,
>         .oneinit_tiles =3D gm200_gr_oneinit_tiles,
>         .oneinit_sm_id =3D gv100_gr_oneinit_sm_id,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/gr/gf100.c
> index 29afec9a55bf..3648868bb9fc 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> @@ -2494,12 +2494,24 @@ gf100_gr_gpccs_ucode =3D {
>         .data.size =3D sizeof(gf100_grgpc_data),
>  };
>
> +static int
> +gf100_gr_nonstall(struct nvkm_gr *base)
> +{
> +       struct gf100_gr *gr =3D gf100_gr(base);
> +
> +       if (gr->func->nonstall)
> +               return gr->func->nonstall(gr);
> +
> +       return -EINVAL;
> +}
> +
>  static const struct nvkm_gr_func
>  gf100_gr_ =3D {
>         .dtor =3D gf100_gr_dtor,
>         .oneinit =3D gf100_gr_oneinit,
>         .init =3D gf100_gr_init_,
>         .fini =3D gf100_gr_fini,
> +       .nonstall =3D gf100_gr_nonstall,
>         .reset =3D gf100_gr_reset,
>         .units =3D gf100_gr_units,
>         .chan_new =3D gf100_gr_chan_new,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h b/drivers/gpu=
/drm/nouveau/nvkm/engine/gr/gf100.h
> index 94ca7ac16acf..54f686ba39ac 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
> @@ -147,6 +147,7 @@ struct gf100_gr_func_zbc {
>  };
>
>  struct gf100_gr_func {
> +       int (*nonstall)(struct gf100_gr *);
>         struct nvkm_intr *(*oneinit_intr)(struct gf100_gr *, enum nvkm_in=
tr_type *);
>         void (*oneinit_tiles)(struct gf100_gr *);
>         int (*oneinit_sm_id)(struct gf100_gr *);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h b/drivers/gpu/=
drm/nouveau/nvkm/engine/gr/priv.h
> index 6ec8b94854c0..0884abc73a9d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h
> @@ -18,6 +18,7 @@ struct nvkm_gr_func {
>         int (*init)(struct nvkm_gr *);
>         int (*fini)(struct nvkm_gr *, bool);
>         int (*reset)(struct nvkm_gr *);
> +       int (*nonstall)(struct nvkm_gr *);
>         void (*intr)(struct nvkm_gr *);
>         void (*tile)(struct nvkm_gr *, int region, struct nvkm_fb_tile *)=
;
>         int (*tlb_flush)(struct nvkm_gr *);
> --
> 2.40.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

