Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018E372EE11
	for <lists+nouveau@lfdr.de>; Tue, 13 Jun 2023 23:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E6D10E3E0;
	Tue, 13 Jun 2023 21:35:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DF410E3E0
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 21:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686692120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Me4VlrAs4n17ONutZyNyw1dDB61Vnhi5ttBqI4q17Xg=;
 b=HJrw4DCnVxQIgf4Obo0QGtzpmS+XrmlFA2hRMp978HkEx1Tje1PQqDpuVtanjSxGgc2k7F
 s/s+l2Mjh4rYcT5AoGfNdWv9hrLCvMVm6ofZv74m0WA8cxYL+/zusLWZDqfF6crCRH8qSk
 L5jVLXWRejSEHVrGlprp7tttibt4/hs=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-lITMlkFDMvSPfGhBO96pEQ-1; Tue, 13 Jun 2023 17:35:19 -0400
X-MC-Unique: lITMlkFDMvSPfGhBO96pEQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b216f624c0so8467411fa.0
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 14:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686692118; x=1689284118;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Me4VlrAs4n17ONutZyNyw1dDB61Vnhi5ttBqI4q17Xg=;
 b=A03gho30AFj0ofUlZKBorKr2+HE7bw58lJCa2fg27nweu3Waw0HxTCCkTU2SjGzQsU
 eHDSnKCpSjNfgW5q56hyjX5CXbmg9yryESFgOm/eq+DLmBmq3NJdvvEoCplK3vBO/pSZ
 hTBUGn+nH2d7mocF0gU3pod1Juu4NxIdJKZj3oo+khEHlC8xLei9f5YGyngnJhYaU0j/
 9Zs5g1HGMLgXbZLPeQturL66ynuKCOWM4QpKzeL8RjVC6+3HheRtg94OTj1VpW3UTSmA
 bb2HPVrP+dyvAe2PxOJUVPnYue9rLqj2dvFoocX0UiRErFHDDsv/ao/7eZh3aQFdGlnd
 Zqtw==
X-Gm-Message-State: AC+VfDxr7/tgTwP8zjx/w0Ykmdx/LF6wznlORv2uvXZZTKaBroHCCcRa
 vHxINx72dsnYWkM4sFVJGAPlx4KnHvQLQQDiYYIFzxBc/nz59WoDt5nq1rSWoodTteMafXX1sXI
 ZoeFteUd3ma1/loEdiJGSDXua5L7w3CPiEP7mtJSGBg==
X-Received: by 2002:a2e:a271:0:b0:2b1:b778:152f with SMTP id
 k17-20020a2ea271000000b002b1b778152fmr6116621ljm.3.1686692118247; 
 Tue, 13 Jun 2023 14:35:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4D3XDLO5Tt6226pE3mmLaC0s1/5kAv4EkP66BnU4KApVk0TrwTorrrVC0O79adAxVCw9HaGQusCmEpTepbo1I=
X-Received: by 2002:a2e:a271:0:b0:2b1:b778:152f with SMTP id
 k17-20020a2ea271000000b002b1b778152fmr6116613ljm.3.1686692117930; Tue, 13 Jun
 2023 14:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230525003106.3853741-1-skeggsb@gmail.com>
 <20230525003106.3853741-7-skeggsb@gmail.com>
In-Reply-To: <20230525003106.3853741-7-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 13 Jun 2023 23:35:07 +0200
Message-ID: <CACO55tu+NTSQsd397SYe9m4Y5ASz+1ASJsO+VLFMSQ18JTf1hg@mail.gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 07/10] drm/nouveau/fifo/ga100-: remove
 individual runlists rather than failing oneinit
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
> We're adding better support for the non-stall interrupt, which will need
> to fetch the interrupt vector from the runlist's primary engine.
>
> NVKM doesn't support all target engines (ie. NVDEC etc), and it wouldn't
> be ideal to completely fail initialisation in this case.
>
> Instead.  Remove runlists where we can't determine all the needed info.
>
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  .../gpu/drm/nouveau/nvkm/engine/fifo/ga100.c  | 46 ++++++++++++++-----
>  1 file changed, 35 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/fifo/ga100.c
> index 12a5d99d5e77..a729f8b7f0da 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
> @@ -429,7 +429,9 @@ static int
>  ga100_runl_new(struct nvkm_fifo *fifo, int id, u32 addr, struct nvkm_run=
l **prunl)
>  {
>         struct nvkm_device *device =3D fifo->engine.subdev.device;
> +       struct nvkm_top_device *tdev;
>         struct nvkm_runl *runl;
> +       struct nvkm_engn *engn;
>         u32 chcfg  =3D nvkm_rd32(device, addr + 0x004);
>         u32 chnum  =3D 1 << (chcfg & 0x0000000f);
>         u32 chaddr =3D (chcfg & 0xfffffff0);
> @@ -437,26 +439,50 @@ ga100_runl_new(struct nvkm_fifo *fifo, int id, u32 =
addr, struct nvkm_runl **prun
>         u32 vector =3D nvkm_rd32(device, addr + 0x160);
>         int i, ret;
>
> -       runl =3D *prunl =3D nvkm_runl_new(fifo, id, addr, chnum);
> +       runl =3D nvkm_runl_new(fifo, id, addr, chnum);
>         if (IS_ERR(runl))
>                 return PTR_ERR(runl);
>
> +       *prunl =3D runl;
> +
>         for (i =3D 0; i < 2; i++) {
>                 u32 pbcfg =3D nvkm_rd32(device, addr + 0x010 + (i * 0x04)=
);
>                 if (pbcfg & 0x80000000) {
>                         runl->runq[runl->runq_nr] =3D
>                                 nvkm_runq_new(fifo, ((pbcfg & 0x03fffc00)=
 - 0x040000) / 0x800);
> -                       if (!runl->runq[runl->runq_nr])
> +                       if (!runl->runq[runl->runq_nr]) {
> +                               RUNL_ERROR(runl, "runq %d", runl->runq_nr=
);
>                                 return -ENOMEM;
> +                       }
>
>                         runl->runq_nr++;
>                 }
>         }
>
> +       nvkm_list_foreach(tdev, &device->top->device, head, tdev->runlist=
 =3D=3D runl->addr) {
> +               if (tdev->engine < 0) {
> +                       RUNL_DEBUG(runl, "engn !top");
> +                       return -EINVAL;
> +               }
> +
> +               engn =3D nvkm_runl_add(runl, tdev->engine, (tdev->type =
=3D=3D NVKM_ENGINE_CE) ?
> +                                    fifo->func->engn_ce : fifo->func->en=
gn,
> +                                    tdev->type, tdev->inst);
> +               if (!engn)
> +                       return -EINVAL;
> +       }
> +
> +       if (list_empty(&runl->engns)) {
> +               RUNL_DEBUG(runl, "!engns");
> +               return -EINVAL;
> +       }
> +
>         ret =3D nvkm_inth_add(&device->vfn->intr, vector & 0x00000fff, NV=
KM_INTR_PRIO_NORMAL,
>                             &fifo->engine.subdev, ga100_runl_intr, &runl-=
>inth);
> -       if (ret)
> +       if (ret) {
> +               RUNL_ERROR(runl, "inth %d", ret);
>                 return ret;
> +       }
>
>         runl->chan =3D chaddr;
>         runl->doorbell =3D dbcfg >> 16;
> @@ -514,15 +540,13 @@ ga100_fifo_runl_ctor(struct nvkm_fifo *fifo)
>                 runl =3D nvkm_runl_get(fifo, -1, tdev->runlist);
>                 if (!runl) {
>                         ret =3D ga100_runl_new(fifo, id++, tdev->runlist,=
 &runl);
> -                       if (ret)
> -                               return ret;
> -               }
> -
> -               if (tdev->engine < 0)
> -                       continue;
> +                       if (ret) {
> +                               if (runl)
> +                                       nvkm_runl_del(runl);
>
> -               nvkm_runl_add(runl, tdev->engine, (tdev->type =3D=3D NVKM=
_ENGINE_CE) ?
> -                             fifo->func->engn_ce : fifo->func->engn, tde=
v->type, tdev->inst);
> +                               continue;
> +                       }
> +               }
>         }
>
>         return 0;
> --
> 2.40.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

