Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B87B3EDB5
	for <lists+nouveau@lfdr.de>; Mon,  1 Sep 2025 20:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FBA10E4F7;
	Mon,  1 Sep 2025 18:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="0VI2YUvC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AB610E4F7
 for <nouveau@lists.freedesktop.org>; Mon,  1 Sep 2025 18:18:06 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-61ce4c32a36so7246250a12.3
 for <nouveau@lists.freedesktop.org>; Mon, 01 Sep 2025 11:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1756750685;
 x=1757355485; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMr1Irr8Ve+sqp2XbKFZPkDcuphJii2oL1w8Y4yVsWE=;
 b=0VI2YUvCgYfomVccNzdxlvPeNk06opupJr7l1Awc3godY0CVZLL7CrAqh/b2RjnDMT
 5sCziRqfsNtBLtUIOYatPTDgOr2C0jIblCa8Vu1hXFADZ3jpt0D9BmrxnYXll6lUOqXI
 6p2CZlMP6+xchDOr7fQDEj1ALXt0ueJ/U2E6/qvpC8iXGFuHjZZr4/tJsaqQo89Ydk1g
 ePbjc/Kr5SKwntiuJJ3k21ErU4m1mYMHJx8rMOMyj1GNaXDQkCo3umsOACyNpmemPICo
 pd4MxpQJA9NK2VbNzUGVMezLhLDVT/Dar9jNRP+txCdEExAXtGtGtYkpAnvBh0XD/JIH
 OE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756750685; x=1757355485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMr1Irr8Ve+sqp2XbKFZPkDcuphJii2oL1w8Y4yVsWE=;
 b=bVkgRBpMKTt0qGSeLJQvwbdtp2SePTy3F87xdqPjIR9qSintV6u4++8niesQmMBDIH
 665/NvlMdw677ahKCIwlZXOMpxqk8tQj281G/GAZjpRLE0fCnUAHixz6ZLV9XhK6c40Y
 eE9b2drnYNgbHDQC3f9ostekOrzKQP1ojrscnr6AvKjmE26o2Y93Tf9coH/5JbIpIPSu
 9eDZ2BDYjwca7c47XyxTc8Wty9JXD+G1e78SVOyU6w1A0vdNI/JjsGaifoT6fcH1vzS/
 UAWlppvvzEMcyULTulOpDqqtVhgHe/9uzQh34g44JW4+c6qu2uRd48Iytr2k/wldbyzX
 YHLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ2LNZCXhGkK6W4IfiHtiPAUQlHXFs5RnY11azGcdDwbjicuRX/QKpNwF5oYZCVUqBXqF1THZy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeDs9F24M5LjWyqWBBiBNPDFowK8mIYByJdEWqDybluqHfdXs/
 kj/5EhZSA0ePp0ZWEnTwB6VuhTD0SsjFQlNKVZdce5y/ikqqyTxfOldmaFCZky9pjhd/H7PJIHN
 hEvvIqRPPEyhfhEqbBaaFqjdgqESremYDbv9pphgG0g==
X-Gm-Gg: ASbGncsLghSaZ0LYCrXE3O6u6gOBKnnztQvngrdepTO7/j9KLUrzc1WRYoHYVT1TqHt
 YnToE+2GwSFMzpnDrScFidPG+B47wRkDE4EGUV4kKAFDPRTYNHljH48JctBniM6QY1p6mzvuS3p
 f1wdhu4Jhh0Og2tghxZBe0jX+N4wWL9B9R7n44R1syi4CLjTwgFC8WiBCRBxKYgHpL20rSmaAwN
 dYfkp/6WrP1wncl
X-Google-Smtp-Source: AGHT+IGSj0uvd/fuKyQZnOG6Oz1OMdhUsP21aDFjYL0iUiajXSzgph8BYYUjp0jRidp5MrMkbyA+x12DMTgjCvnTkdE=
X-Received: by 2002:a05:6402:26c3:b0:61e:ae59:5f02 with SMTP id
 4fb4d7f45d1cf-61eae59726emr1428541a12.31.1756750684998; Mon, 01 Sep 2025
 11:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250829021633.1674524-1-airlied@gmail.com>
In-Reply-To: <20250829021633.1674524-1-airlied@gmail.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Mon, 1 Sep 2025 14:17:38 -0400
X-Gm-Features: Ac12FXx0_2IFUgdQ3F-_qtwuFIoMxlSu7gYpq_ItkcmqwvAv7tCMktRTBaogiCU
Message-ID: <CAAgWFh0QgCe3MMExMkJqdRBj5NqDrJ7zq6eaQ-Yszm2xFaqRpQ@mail.gmail.com>
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

Maybe we should also do this for older GPUs? eg. perhaps we should
also update gf100_fifo_nonstall_allow / gf100_fifo_nonstall_block ?
