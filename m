Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F931B3B08A
	for <lists+nouveau@lfdr.de>; Fri, 29 Aug 2025 03:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2F610EB23;
	Fri, 29 Aug 2025 01:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="VGvC3nUP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B42E10E0AB
 for <nouveau@lists.freedesktop.org>; Fri, 29 Aug 2025 01:36:11 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-24456ce0b96so18656295ad.0
 for <nouveau@lists.freedesktop.org>; Thu, 28 Aug 2025 18:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1756431371; x=1757036171;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2mjTTon6TE/fQbLYbsm3RTA3z68q12kNIdwRZqiqTQo=;
 b=VGvC3nUPh6Ow2xEdJoRwBEn2FLywRsGcXb/HOcQWH5HARC+dmaktWGOt1eVgDT2E6b
 MRrO7xOhWje3eu73rqgZv0GAqHXUhGk8jLHEhY7j21HydMBqHFS8pWcYV6jmc3B9BcEF
 SwCNPxNX4htSNMF0/2QKFrK/fvPV8Ea9P8v3Mmcr+GJP/Rqm7vWsTaRTywdj788p0WcD
 6Jo/9as1fvW3QcwKDVjlE0sKd9+zzTruYyEY+fDGmcdW+NHUlGw4TOQxHGVAHJp50/iz
 pa9XQISZh/hhtQKzKfCsZR0ZsktlNRLduHsGtnzJ3/1TS/LmP2r/EUEO2bWJ5c7C62CQ
 o5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756431371; x=1757036171;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2mjTTon6TE/fQbLYbsm3RTA3z68q12kNIdwRZqiqTQo=;
 b=OL+PzUnLDpUbO3wvWMeMxuBkYp30d12SdapRT2z2iNmPEwKPruxELa6ouaHLDxbxkl
 fTF1HCky1dRHmqVIN6tlyLaYdyV5yW291vVuKSmWe3lu5c5SnN3pwYbpbALnObLQod8q
 8dCs5qI8x7RYrXj/HTbrqbGzmrs7oZKkNDP29d+k133IvFMu6ddNEmCiUT6TBj/eLDLM
 1kPM2u1aKznXxHE+QDyoSVJxiNVkC2tY+sN/qQ4HXG9AE9XrHRKvi/0pz0zXi26nuVQ5
 O/U9g2dQDRceTvtTxgQSuNudGtIYTJlLefWIeyjF1sqcXHJBc0CTTW4mtUdaQhe1yN2D
 lANA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpYDng2Wvval4A+f2aj2hxnRcspiVx95/7leeNvsbFQaPubM1OHHVyOeSTzUtkFBQXKdJjMK0T@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7US93SGRTMKI1F+R4CPUkpQtRgrxw3tmCdmEHCeHkKaAmawFY
 OBJasgvGUEDXmka2OgmlttKH0SANyUYLXtUUhOHgDfeYRQ6efhPt7QDUj3+Vb/AAfAKuhk6/xsD
 cGSPXE8QC/kAzv93XukiuHf1ZafaRU8486tkmYBlQ4Q==
X-Gm-Gg: ASbGncsr5WMAsLJMpnQM/1xwjKLhswhh21R4SmrQ8+6E+7H2nuagLUNqVjNb0x0cMvv
 Olfc+657GRCwl1801pYgKFYllArWbQNi1+xYg2xshLfEjJjxsMqcG09zkvygxecAFpbtKpmGUUT
 QQscS99+cK53SDuHb/1hUlrkm4L5AfynSDfVwMCFKUkOneaBECSmaXc1AGsI4E1Aa0dL76xHaWy
 E02eK0=
X-Google-Smtp-Source: AGHT+IGkph62Fb/sN5fmBt+L1pOxGH77tEcBYJ/JKwe9VlNUE2djXpVCQ55MUoO3xqAVPZFQ/k/cxtuBqMLuClJiDqw=
X-Received: by 2002:a17:902:db08:b0:242:5f6c:6b4e with SMTP id
 d9443c01a7336-248753a298amr175641785ad.7.1756431370925; Thu, 28 Aug 2025
 18:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250828205517.1553768-1-airlied@gmail.com>
In-Reply-To: <20250828205517.1553768-1-airlied@gmail.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Thu, 28 Aug 2025 21:35:59 -0400
X-Gm-Features: Ac12FXyrZuhWiwh0jiDlo9WvCuY_vu-qRItnoZYN0idxR-jIyxJ4j3Hg2QxSiy0
Message-ID: <CAOFGe94kJQfGirjjyDCAD-Ryc7N=U4exd10rTWy_YhiemkZW3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] nouveau: fix disabling the nonstall irq due to storm
 code.
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

On Thu, Aug 28, 2025 at 5:01=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
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
> ---
>  .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |  2 ++
>  .../gpu/drm/nouveau/nvkm/engine/fifo/ga100.c  | 22 ++++++++++++-------
>  .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |  2 ++
>  .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    |  2 +-
>  4 files changed, 19 insertions(+), 9 deletions(-)
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

You're missing the corresponding update in ga102.c, which is what
actually covers most of the drivers.  Honestly, I'm not even sure why
there are two files. They look identical to me.

~Faith

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
