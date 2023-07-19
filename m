Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA17590CB
	for <lists+nouveau@lfdr.de>; Wed, 19 Jul 2023 11:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03C610E087;
	Wed, 19 Jul 2023 09:01:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8604E10E1CC
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jul 2023 09:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689757267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XTSWtCdRRyBQtaxq6k7vtQgN1uF7XZRdPHODarevd4M=;
 b=IgBQDNT/odASJlwrAqmCivQ0eJDl90+8zCK/fdQdftOi3GHs7VLUBzhgyvA11rKG0aTEHJ
 x4jhtrknfVK/AF1RkMbCL+COZEz2GMkwTvvbkv00yvwis/mhWwYuPxdWGwJT4/i5UC5VJt
 IQDBcj13tUPmk9aUPegJdbymzw0hB0k=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-2iG9PNpKMeOGpR_4i92q5A-1; Wed, 19 Jul 2023 05:01:06 -0400
X-MC-Unique: 2iG9PNpKMeOGpR_4i92q5A-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b6fdb8d0acso11680691fa.0
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jul 2023 02:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689757264; x=1690362064;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XTSWtCdRRyBQtaxq6k7vtQgN1uF7XZRdPHODarevd4M=;
 b=bX3XhjGjMoe2Vs8NPeOSc267/FqhEFw5M0KsBtQXGA7ZjSU4dZAfLx3dGWLhkFiiVS
 t3XNTAJwD72500jMbrEPUvIgCrlhGYBXXk/zoF7ms5Wx3aWh2waULb+bliaSxDeEdEfv
 sg6VY5LyT0K7rurGLi0YdwxBu5PAV6LQCh9buRlq2lHuNmyQLGADG4QLoeyuKe+TtUvD
 VzcE70vuAj8BKmWT6Eva7w69cqU5BquZc3O/Xi0Hnt+UdJTUzQsEK3KDRlW4YNGE33BN
 RfvRaFgrWFiYecfiDL/DfsJnJDhO/zASoaIhOVNYSfXTH1OcHF9zlDWnsg9CfzDvhiBz
 nOOQ==
X-Gm-Message-State: ABy/qLYLJeIL7pkBi0PxUwpe4Vkw5zcSFiQeg8asTGqd2qu/0UAbFmWU
 GE8wVz8AJV5GI4gwnC9WdEjeOO3AxIZ2ChlBCTgbVA60ePaOX4qcq4LW/mhGC5xxCtfBPgqyiHx
 vS8hqa8GRWoZyMYAV45tk4hcbSB9aDIbMWmZ3gKZz3ZqElvX9na3z
X-Received: by 2002:a05:651c:1725:b0:2b9:3c1d:6ec0 with SMTP id
 be37-20020a05651c172500b002b93c1d6ec0mr924586ljb.4.1689757264037; 
 Wed, 19 Jul 2023 02:01:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGtyKIFzC0Oe5dIhMtIlHNMmF5RleyvN7KeLT6gW5sXZRB08x6FwAarTMlNrvsYshHE+fAI1cnuIRtmQPK9hdQ=
X-Received: by 2002:a05:651c:1725:b0:2b9:3c1d:6ec0 with SMTP id
 be37-20020a05651c172500b002b93c1d6ec0mr924571ljb.4.1689757263619; Wed, 19 Jul
 2023 02:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230719044051.6975-1-skeggsb@gmail.com>
In-Reply-To: <20230719044051.6975-1-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 19 Jul 2023 11:00:52 +0200
Message-ID: <CACO55tsNg42B_PJj6hX22uCxiB+kQf7AxTqg152TfdPnhUcrrQ@mail.gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 1/3] drm/nouveau/i2c: fix number of aux event
 slots
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

On Wed, Jul 19, 2023 at 6:41=E2=80=AFAM Ben Skeggs <skeggsb@gmail.com> wrot=
e:
>
> From: Ben Skeggs <bskeggs@redhat.com>
>
> This was completely bogus before, using maximum DCB device index rather
> than maximum AUX ID to size the buffer that stores event refcounts.
>
> *Pretty* unlikely to have been an actual problem on most configurations,
> that is, unless you've got one of the rare boards that have off-chip DP.
>
> There, it'll likely crash.
>
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h |  4 ++--
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c    | 11 +++++++++--
>  2 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h b/drivers/=
gpu/drm/nouveau/include/nvkm/subdev/i2c.h
> index 40a1065ae626..ef441dfdea09 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h
> @@ -16,7 +16,7 @@ struct nvkm_i2c_bus {
>         const struct nvkm_i2c_bus_func *func;
>         struct nvkm_i2c_pad *pad;
>  #define NVKM_I2C_BUS_CCB(n) /* 'n' is ccb index */                      =
     (n)
> -#define NVKM_I2C_BUS_EXT(n) /* 'n' is dcb external encoder type */ ((n) =
+ 0x100)
> +#define NVKM_I2C_BUS_EXT(n) /* 'n' is dcb external encoder type */  ((n)=
 + 0x10)
>  #define NVKM_I2C_BUS_PRI /* ccb primary comm. port */                   =
     -1
>  #define NVKM_I2C_BUS_SEC /* ccb secondary comm. port */                 =
     -2
>         int id;
> @@ -38,7 +38,7 @@ struct nvkm_i2c_aux {
>         const struct nvkm_i2c_aux_func *func;
>         struct nvkm_i2c_pad *pad;
>  #define NVKM_I2C_AUX_CCB(n) /* 'n' is ccb index */                      =
     (n)
> -#define NVKM_I2C_AUX_EXT(n) /* 'n' is dcb external encoder type */ ((n) =
+ 0x100)
> +#define NVKM_I2C_AUX_EXT(n) /* 'n' is dcb external encoder type */  ((n)=
 + 0x10)
>         int id;
>
>         struct mutex mutex;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/i2c/base.c
> index 976539de4220..731b2f68d3db 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> @@ -260,10 +260,11 @@ nvkm_i2c_new_(const struct nvkm_i2c_func *func, str=
uct nvkm_device *device,
>  {
>         struct nvkm_bios *bios =3D device->bios;
>         struct nvkm_i2c *i2c;
> +       struct nvkm_i2c_aux *aux;
>         struct dcb_i2c_entry ccbE;
>         struct dcb_output dcbE;
>         u8 ver, hdr;
> -       int ret, i;
> +       int ret, i, ids;
>
>         if (!(i2c =3D *pi2c =3D kzalloc(sizeof(*i2c), GFP_KERNEL)))
>                 return -ENOMEM;
> @@ -406,5 +407,11 @@ nvkm_i2c_new_(const struct nvkm_i2c_func *func, stru=
ct nvkm_device *device,
>                 }
>         }
>
> -       return nvkm_event_init(&nvkm_i2c_intr_func, &i2c->subdev, 4, i, &=
i2c->event);
> +       ids =3D 0;
> +       list_for_each_entry(aux, &i2c->aux, head)
> +               ids =3D max(ids, aux->id + 1);
> +       if (!ids)
> +               return 0;
> +
> +       return nvkm_event_init(&nvkm_i2c_intr_func, &i2c->subdev, 4, ids,=
 &i2c->event);
>  }
> --
> 2.41.0
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

