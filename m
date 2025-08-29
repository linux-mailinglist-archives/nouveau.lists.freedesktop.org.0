Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14096B3BE86
	for <lists+nouveau@lfdr.de>; Fri, 29 Aug 2025 16:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267ED10EBE9;
	Fri, 29 Aug 2025 14:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="V2CU8/er";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4716110EBEA
 for <nouveau@lists.freedesktop.org>; Fri, 29 Aug 2025 14:50:11 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2489c65330aso20774415ad.0
 for <nouveau@lists.freedesktop.org>; Fri, 29 Aug 2025 07:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1756479011; x=1757083811;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OO2kfUyqCh2tLO6z6YUVQo9y6L8QQ/AzHAEKzdJdRx8=;
 b=V2CU8/er23H43pXBLUUgFnXiLD+7whrN5L+w+RyZH8cknjIn2mzhnQVI2JY56r/zVW
 zIloSpM4rv4t5RXTeKofIdZGwxopw4NgIZ5nGC2Og/gguYDUxzAPC02CntmQnLROEPLM
 UjhG6Ppo1MQdIzGZStPnQbVtN56sbWRBqVPtBJ2Bm7o2rptsJDNy4Oe+Meq3vzC2qsu1
 M0nbf8Xu+AAFfltQfq73r0WMbZ1mLWRmDmnkf0C7GlKyYfCweprHPTSv3ER75Q5EYYy5
 b722aJtPSBD93u3NeZHzhG7wdrxV94MSQsse+avtrZqqRDEWjf+iVjNom4uJJk5PTCyp
 6xtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756479011; x=1757083811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OO2kfUyqCh2tLO6z6YUVQo9y6L8QQ/AzHAEKzdJdRx8=;
 b=CCMq9g3+vUeP5i0kIhFqOMbZcWJNmYYtBQDanQ0wQE7/LetPqs5bk/jnlqqzADSW9/
 BZZJrFI4Qb+mtG7Ggw6MvElgV/AvRBqt/YOF7RefMEv0ZhD7Nc6NwoedHnP9qmzg8T2c
 UAvAD11iphvCxzb4j8Z/zX/2mTMeBH5l2UzsJzv8ce4W5PK7UySxF+wUGRrg5snkU4S9
 E6JgDNraXt/m264CmpqrlZPFdRPKrZtHBep/NBrrOom4ixYvzMk7omUqGdYavSL8lSOx
 3cswsnTRysJe12sLo3uSTCsLuUECmgu1LVYbVX6cBUBFOgoACIQ7G305e9U4tTlva/rx
 2c5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAm9ynijUC52/ze3FClLJaY7qMzI1rdw6rO/dgrc+V/eMKoNgPIKmWyZBIbBoP5iiWYM3Ah8S0@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3stpNfEDKZtit7Vzz+YQEF3bN7oeWad5IXqqoNh1QswTnEBZJ
 W7j5qtauMfSFUr9e9tHCT6gqrCJF2F1XzTx2BOQPIyYIxEsleIfrYNqwDMz6GQUXHIaD1jh00gt
 gywxYrVa8Ggq4QdgYKCdkPnpjPWDPoJbfuI0bvK5X2A==
X-Gm-Gg: ASbGncsbqfUfWi/6Djfp6VvpxQVCMgq9zfs1HGWnnjW3MjbYj8tbr7LjFicgOq5xbtw
 D3HGfvL+PAXhCkOxi2MuhIt00fQT/ELN1W/LDdgEkPSz3gjT9lDYoBhe8q/E3Xmu3+7WghzTX+l
 Xh1A+UsHfQu+Vw/wJ4YShiy0tB1dHU9MNDHQwoi59rCtO5/dBYVOfBr7kiwF/0T7pwVnlNHV+tl
 W7ckekhsvqs8Fvvzg==
X-Google-Smtp-Source: AGHT+IFRXSGaDAEaFKQtiyEMP6kQZzUFARG8g+Xk6Xo+TWGWuy4Tm3z2qapi2jAWwK1gX8mHX5Yl99N3UMw0Hub8KOo=
X-Received: by 2002:a17:903:37c5:b0:246:cfc4:9a52 with SMTP id
 d9443c01a7336-246cfc4a0ccmr269028505ad.52.1756479010693; Fri, 29 Aug 2025
 07:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250829021633.1674524-1-airlied@gmail.com>
In-Reply-To: <20250829021633.1674524-1-airlied@gmail.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Fri, 29 Aug 2025 10:49:59 -0400
X-Gm-Features: Ac12FXzar1Z7rKv7qZ_yPRgG5WWF9qnflSoL4POjxuoSorCFCIunJO25X9LlMUE
Message-ID: <CAOFGe95wF3-8dcbmEs+t=Z_NeXyES4xkTmKToZkExompEq0VFQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] nouveau: fix disabling the nonstall irq due to storm
 code. (v2)
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Aug 28, 2025 at 10:17=E2=80=AFPM Dave Airlie <airlied@gmail.com> wr=
ote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> Nouveau has code that when it gets an IRQ with no allowed handler
> it disables it to avoid storms.
>
> However with nonstall interrupts, we often disable them from
> the drm driver, but still request their emission via the push submission.
>
> Just don't disable nonstall irqs ever in normal operation, the
> event handling code will filter them out, and the driver will
> just enable/disable them at load time.
>
> This fixes timeouts we've been seeing on/off for a long time,
> but they became a lot more noticable on Blackwell.
>
> This doesn't fix all of them, there is a subsequent fence emission
> fix to fix the last few.
>
> Fixes: 3ebd64aa3c4f ("drm/nouveau/intr: support multiple trees, and expli=
cit interfaces")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dave Airlie <airlied@redhat.com>

I don't 100% grok all the storm stuff but this certainly looks
reasonable and I'm convinced it shouldn't break anything

Reviewed-by Faith Ekstrand <faith.ekstrand@collabora.com>

>
> ---
> v2: add missing ga102.
> ---
>  .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |  2 ++
>  .../gpu/drm/nouveau/nvkm/engine/fifo/ga100.c  | 22 ++++++++++++-------
>  .../gpu/drm/nouveau/nvkm/engine/fifo/ga102.c  |  1 +
>  .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |  2 ++
>  .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    |  2 +-
>  5 files changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/fifo/base.c
> index fdffa0391b31..6fd4e60634fb 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
> @@ -350,6 +350,8 @@ nvkm_fifo_dtor(struct nvkm_engine *engine)
>         nvkm_chid_unref(&fifo->chid);
>
>         nvkm_event_fini(&fifo->nonstall.event);
> +       if (fifo->func->nonstall_dtor)
> +               fifo->func->nonstall_dtor(fifo);
>         mutex_destroy(&fifo->mutex);
>
>         if (fifo->func->dtor)
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/fifo/ga100.c
> index e74493a4569e..81beae473122 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
> @@ -517,19 +517,11 @@ ga100_fifo_nonstall_intr(struct nvkm_inth *inth)
>  static void
>  ga100_fifo_nonstall_block(struct nvkm_event *event, int type, int index)
>  {
> -       struct nvkm_fifo *fifo =3D container_of(event, typeof(*fifo), non=
stall.event);
> -       struct nvkm_runl *runl =3D nvkm_runl_get(fifo, index, 0);
> -
> -       nvkm_inth_block(&runl->nonstall.inth);
>  }
>
>  static void
>  ga100_fifo_nonstall_allow(struct nvkm_event *event, int type, int index)
>  {
> -       struct nvkm_fifo *fifo =3D container_of(event, typeof(*fifo), non=
stall.event);
> -       struct nvkm_runl *runl =3D nvkm_runl_get(fifo, index, 0);
> -
> -       nvkm_inth_allow(&runl->nonstall.inth);
>  }
>
>  const struct nvkm_event_func
> @@ -564,12 +556,25 @@ ga100_fifo_nonstall_ctor(struct nvkm_fifo *fifo)
>                 if (ret)
>                         return ret;
>
> +               nvkm_inth_allow(&runl->nonstall.inth);
> +
>                 nr =3D max(nr, runl->id + 1);
>         }
>
>         return nr;
>  }
>
> +void
> +ga100_fifo_nonstall_dtor(struct nvkm_fifo *fifo)
> +{
> +       struct nvkm_runl *runl;
> +       nvkm_runl_foreach(runl, fifo) {
> +               if (runl->nonstall.vector < 0)
> +                       continue;
> +               nvkm_inth_block(&runl->nonstall.inth);
> +       }
> +}
> +
>  int
>  ga100_fifo_runl_ctor(struct nvkm_fifo *fifo)
>  {
> @@ -599,6 +604,7 @@ ga100_fifo =3D {
>         .runl_ctor =3D ga100_fifo_runl_ctor,
>         .mmu_fault =3D &tu102_fifo_mmu_fault,
>         .nonstall_ctor =3D ga100_fifo_nonstall_ctor,
> +       .nonstall_dtor =3D ga100_fifo_nonstall_dtor,
>         .nonstall =3D &ga100_fifo_nonstall,
>         .runl =3D &ga100_runl,
>         .runq =3D &ga100_runq,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/fifo/ga102.c
> index 755235f55b3a..18a0b1f4eab7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> @@ -30,6 +30,7 @@ ga102_fifo =3D {
>         .runl_ctor =3D ga100_fifo_runl_ctor,
>         .mmu_fault =3D &tu102_fifo_mmu_fault,
>         .nonstall_ctor =3D ga100_fifo_nonstall_ctor,
> +       .nonstall_dtor =3D ga100_fifo_nonstall_dtor,
>         .nonstall =3D &ga100_fifo_nonstall,
>         .runl =3D &ga100_runl,
>         .runq =3D &ga100_runq,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h b/drivers/gp=
u/drm/nouveau/nvkm/engine/fifo/priv.h
> index 5e81ae195329..fff1428ef267 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
> @@ -41,6 +41,7 @@ struct nvkm_fifo_func {
>         void (*start)(struct nvkm_fifo *, unsigned long *);
>
>         int (*nonstall_ctor)(struct nvkm_fifo *);
> +       void (*nonstall_dtor)(struct nvkm_fifo *);
>         const struct nvkm_event_func *nonstall;
>
>         const struct nvkm_runl_func *runl;
> @@ -200,6 +201,7 @@ u32 tu102_chan_doorbell_handle(struct nvkm_chan *);
>
>  int ga100_fifo_runl_ctor(struct nvkm_fifo *);
>  int ga100_fifo_nonstall_ctor(struct nvkm_fifo *);
> +void ga100_fifo_nonstall_dtor(struct nvkm_fifo *);
>  extern const struct nvkm_event_func ga100_fifo_nonstall;
>  extern const struct nvkm_runl_func ga100_runl;
>  extern const struct nvkm_runq_func ga100_runq;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/dri=
vers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
> index 1ac5628c5140..b8be0a872e7a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
> @@ -601,7 +601,7 @@ r535_fifo_new(const struct nvkm_fifo_func *hw, struct=
 nvkm_device *device,
>         rm->chan.func =3D &r535_chan;
>         rm->nonstall =3D &ga100_fifo_nonstall;
>         rm->nonstall_ctor =3D ga100_fifo_nonstall_ctor;
> -
> +       rm->nonstall_dtor =3D ga100_fifo_nonstall_dtor;
>         return nvkm_fifo_new_(rm, device, type, inst, pfifo);
>  }
>
> --
> 2.50.1
>
