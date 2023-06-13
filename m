Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FBD72EDE5
	for <lists+nouveau@lfdr.de>; Tue, 13 Jun 2023 23:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D07B10E3E2;
	Tue, 13 Jun 2023 21:30:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F332210E3E2
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 21:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686691812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BcxnAFsB73N1AMUtdPPscj+rOYVcRYIQ4rVO2va/kSU=;
 b=F3ChAv15xV6JvthQHETgMKDeLiHWidFqVBdtJEkuA2Zq1SbNe+Y5IE2UFlnC/5yhqjz2dN
 SJGLBiVpuOLWpbUGT1fi/QqbQBgoF/OxwGsuK0sELxF9zhl7ZP51LT/4C5cGrqruq9aiXd
 Xia9tBbOA0tNycfwd1uBV7nN6N9vjUM=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-VP1zcdhAMICZbTByfF1AHw-1; Tue, 13 Jun 2023 17:30:09 -0400
X-MC-Unique: VP1zcdhAMICZbTByfF1AHw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b330fbc513so3438291fa.0
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 14:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686691807; x=1689283807;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BcxnAFsB73N1AMUtdPPscj+rOYVcRYIQ4rVO2va/kSU=;
 b=ZFkAK3o7HVC53tDr+rMOd5rDhEcYD1np/q9amehi/01MIfTZfgDD8CnkQVlBUI3/K0
 5HSo6ZCaBSu7wgEq0221sI5IarlHT0jH8kQwJ3L7+/g0cEzBCQECoSZCeoXPqrUeQUvo
 8V5vqA1k+BjKVProVqlbcR5kDE+J53jVzag+wXU9t3Tr0JQVoxG/DpXfHzGkaDqkWov0
 bqXE4MjGSPtQr+1LeXCkI8Wxc0NvIiqRv5jU01JT6RwhdscEt0rw3ueLuH9o2uRF2fdp
 +YCoum4EEEHTZw0ye0NQmyeCUhS4Vq71sE86ofXPUp85lMH0B3cg3i8bgUu8/Gn+Fhfg
 BVag==
X-Gm-Message-State: AC+VfDzJtxZcSjElCzMUNxe97KaQLi2iCMGwFpiR/ReJhcuOHB7LVwld
 bVskHKCtb7gNGR/FvInBrGUobcX0zAkTRu3q/F0upkoWNsK3G4VCsCGAlf448MyzSythKbvTnru
 q+KxA4NkeoLG5A+IsnF/weVX/uZUwJPIho+zgi6tn9w==
X-Received: by 2002:a2e:a23a:0:b0:2b1:b741:7500 with SMTP id
 i26-20020a2ea23a000000b002b1b7417500mr6265951ljm.1.1686691807427; 
 Tue, 13 Jun 2023 14:30:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Auh9x6BvU8T2YlEYiuoQpOR/DafUDwGX5oMKL15yuB/rVzorXfkzg1yxABx1SEBbDoVbpoaGoEqmWKv1zFxw=
X-Received: by 2002:a2e:a23a:0:b0:2b1:b741:7500 with SMTP id
 i26-20020a2ea23a000000b002b1b7417500mr6265941ljm.1.1686691807028; Tue, 13 Jun
 2023 14:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230525003106.3853741-1-skeggsb@gmail.com>
 <20230525003106.3853741-3-skeggsb@gmail.com>
In-Reply-To: <20230525003106.3853741-3-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 13 Jun 2023 23:29:56 +0200
Message-ID: <CACO55tvsApqn+mn3Zjeo6Tfs6fPvycqVkQz974DEe1z9uv-x_Q@mail.gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 03/10] drm/nouveau/fb/gp102-ga100: switch to
 simpler vram size detection method
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
> Also exposes this for use by upcoming GSP-RM initialisation code.
>
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  .../gpu/drm/nouveau/include/nvkm/subdev/fb.h  |  1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild |  1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c | 12 +++++
>  .../gpu/drm/nouveau/nvkm/subdev/fb/ga100.c    |  3 +-
>  .../gpu/drm/nouveau/nvkm/subdev/fb/gp102.c    | 17 ++++++-
>  .../gpu/drm/nouveau/nvkm/subdev/fb/gv100.c    |  3 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h |  5 ++
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h  |  1 +
>  .../gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c | 50 +++++++++++++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/fb/tu102.c    |  3 +-
>  10 files changed, 92 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h b/drivers/g=
pu/drm/nouveau/include/nvkm/subdev/fb.h
> index 01a22a13b452..1755b0df3cc1 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
> @@ -59,6 +59,7 @@ struct nvkm_fb {
>         struct nvkm_memory *mmu_wr;
>  };
>
> +u64 nvkm_fb_vidmem_size(struct nvkm_device *);
>  int nvkm_fb_mem_unlock(struct nvkm_fb *);
>
>  void nvkm_fb_tile_init(struct nvkm_fb *, int region, u32 addr, u32 size,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild b/drivers/gpu/=
drm/nouveau/nvkm/subdev/fb/Kbuild
> index 6ba5120a2ebe..11dbfc4a381a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
> @@ -55,6 +55,7 @@ nvkm-y +=3D nvkm/subdev/fb/ramgk104.o
>  nvkm-y +=3D nvkm/subdev/fb/ramgm107.o
>  nvkm-y +=3D nvkm/subdev/fb/ramgm200.o
>  nvkm-y +=3D nvkm/subdev/fb/ramgp100.o
> +nvkm-y +=3D nvkm/subdev/fb/ramgp102.o
>  nvkm-y +=3D nvkm/subdev/fb/ramga102.o
>  nvkm-y +=3D nvkm/subdev/fb/sddr2.o
>  nvkm-y +=3D nvkm/subdev/fb/sddr3.o
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/fb/base.c
> index 0955340cc421..8a286a9349ac 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c
> @@ -174,6 +174,18 @@ nvkm_fb_mem_unlock(struct nvkm_fb *fb)
>         return 0;
>  }
>
> +u64
> +nvkm_fb_vidmem_size(struct nvkm_device *device)
> +{
> +       struct nvkm_fb *fb =3D device->fb;
> +
> +       if (fb && fb->func->vidmem.size)
> +               return fb->func->vidmem.size(fb);
> +
> +       WARN_ON(1);
> +       return 0;
> +}
> +
>  static int
>  nvkm_fb_init(struct nvkm_subdev *subdev)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/fb/ga100.c
> index a7456e786463..12037fd4fdf2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c
> @@ -30,7 +30,8 @@ ga100_fb =3D {
>         .init_page =3D gv100_fb_init_page,
>         .init_unkn =3D gp100_fb_init_unkn,
>         .sysmem.flush_page_init =3D gf100_fb_sysmem_flush_page_init,
> -       .ram_new =3D gp100_ram_new,
> +       .vidmem.size =3D gp102_fb_vidmem_size,
> +       .ram_new =3D gp102_ram_new,
>         .default_bigpage =3D 16,
>  };
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/fb/gp102.c
> index 14d942e8b857..534553c64805 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c
> @@ -40,6 +40,20 @@ gp102_fb_vpr_scrub_required(struct nvkm_fb *fb)
>         return (nvkm_rd32(device, 0x100cd0) & 0x00000010) !=3D 0;
>  }
>
> +u64
> +gp102_fb_vidmem_size(struct nvkm_fb *fb)
> +{
> +       const u32 data =3D nvkm_rd32(fb->subdev.device, 0x100ce0);

Do we have any kind of documentation for this register?

> +       const u32 lmag =3D (data & 0x000003f0) >> 4;
> +       const u32 lsca =3D (data & 0x0000000f);
> +       const u64 size =3D (u64)lmag << (lsca + 20);
> +
> +       if (data & 0x40000000)
> +               return size / 16 * 15;
> +
> +       return size;
> +}
> +
>  int
>  gp102_fb_oneinit(struct nvkm_fb *fb)
>  {
> @@ -59,9 +73,10 @@ gp102_fb =3D {
>         .init_remapper =3D gp100_fb_init_remapper,
>         .init_page =3D gm200_fb_init_page,
>         .sysmem.flush_page_init =3D gf100_fb_sysmem_flush_page_init,
> +       .vidmem.size =3D gp102_fb_vidmem_size,
>         .vpr.scrub_required =3D gp102_fb_vpr_scrub_required,
>         .vpr.scrub =3D gp102_fb_vpr_scrub,
> -       .ram_new =3D gp100_ram_new,
> +       .ram_new =3D gp102_ram_new,
>  };
>
>  int
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/fb/gv100.c
> index 4d8a286a7a34..f422564bee5b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c
> @@ -36,9 +36,10 @@ gv100_fb =3D {
>         .init_page =3D gv100_fb_init_page,
>         .init_unkn =3D gp100_fb_init_unkn,
>         .sysmem.flush_page_init =3D gf100_fb_sysmem_flush_page_init,
> +       .vidmem.size =3D gp102_fb_vidmem_size,
>         .vpr.scrub_required =3D gp102_fb_vpr_scrub_required,
>         .vpr.scrub =3D gp102_fb_vpr_scrub,
> -       .ram_new =3D gp100_ram_new,
> +       .ram_new =3D gp102_ram_new,
>         .default_bigpage =3D 16,
>  };
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h b/drivers/gpu/=
drm/nouveau/nvkm/subdev/fb/priv.h
> index 726c30c8bf95..77d6a8c10829 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h
> @@ -20,6 +20,10 @@ struct nvkm_fb_func {
>                 void (*flush_page_init)(struct nvkm_fb *);
>         } sysmem;
>
> +       struct nvkm_fb_func_vidmem {
> +               u64 (*size)(struct nvkm_fb *);
> +       } vidmem;
> +
>         struct {
>                 bool (*scrub_required)(struct nvkm_fb *);
>                 int (*scrub)(struct nvkm_fb *);
> @@ -84,6 +88,7 @@ void gp100_fb_init_remapper(struct nvkm_fb *);
>  void gp100_fb_init_unkn(struct nvkm_fb *);
>
>  int gp102_fb_oneinit(struct nvkm_fb *);
> +u64 gp102_fb_vidmem_size(struct nvkm_fb *);
>  bool gp102_fb_vpr_scrub_required(struct nvkm_fb *);
>  int gp102_fb_vpr_scrub(struct nvkm_fb *);
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/fb/ram.h
> index ea7d66f3dd82..33d4ab8d92e6 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
> @@ -70,5 +70,6 @@ int gk104_ram_new(struct nvkm_fb *, struct nvkm_ram **)=
;
>  int gm107_ram_new(struct nvkm_fb *, struct nvkm_ram **);
>  int gm200_ram_new(struct nvkm_fb *, struct nvkm_ram **);
>  int gp100_ram_new(struct nvkm_fb *, struct nvkm_ram **);
> +int gp102_ram_new(struct nvkm_fb *, struct nvkm_ram **);
>  int ga102_ram_new(struct nvkm_fb *, struct nvkm_ram **);
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c b/drivers/=
gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
> new file mode 100644
> index 000000000000..ee541b049fc5
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
> @@ -0,0 +1,50 @@
> +/*
> + * Copyright 2023 Red Hat Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +#include "ram.h"
> +
> +#include <subdev/bios.h>
> +
> +static const struct nvkm_ram_func
> +gp102_ram =3D {
> +};
> +
> +int
> +gp102_ram_new(struct nvkm_fb *fb, struct nvkm_ram **pram)
> +{
> +       enum nvkm_ram_type type =3D nvkm_fb_bios_memtype(fb->subdev.devic=
e->bios);
> +       const u32 rsvd_head =3D ( 256 * 1024); /* vga memory */
> +       const u32 rsvd_tail =3D (1024 * 1024); /* vbios etc */
> +       u64 size =3D fb->func->vidmem.size(fb);
> +       int ret;
> +
> +       ret =3D nvkm_ram_new_(&gp102_ram, fb, type, size, pram);
> +       if (ret)
> +               return ret;
> +
> +       nvkm_mm_fini(&(*pram)->vram);
> +
> +       return nvkm_mm_init(&(*pram)->vram, NVKM_RAM_MM_NORMAL,
> +                           rsvd_head >> NVKM_RAM_MM_SHIFT,
> +                           (size - rsvd_head - rsvd_tail) >> NVKM_RAM_MM=
_SHIFT,
> +                           1);
> +
> +}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/fb/tu102.c
> index b8803c124c3b..bcc23d4c8115 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c
> @@ -36,9 +36,10 @@ tu102_fb =3D {
>         .init_page =3D gv100_fb_init_page,
>         .init_unkn =3D gp100_fb_init_unkn,
>         .sysmem.flush_page_init =3D gf100_fb_sysmem_flush_page_init,
> +       .vidmem.size =3D gp102_fb_vidmem_size,
>         .vpr.scrub_required =3D tu102_fb_vpr_scrub_required,
>         .vpr.scrub =3D gp102_fb_vpr_scrub,
> -       .ram_new =3D gp100_ram_new,
> +       .ram_new =3D gp102_ram_new,
>         .default_bigpage =3D 16,
>  };
>
> --
> 2.40.1
>

