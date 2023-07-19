Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 027077590CC
	for <lists+nouveau@lfdr.de>; Wed, 19 Jul 2023 11:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9226610E1CC;
	Wed, 19 Jul 2023 09:01:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B7510E1CC
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jul 2023 09:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689757276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iEingK6F6sQjEzMfdFhGQISzZgx2KwL76de8p1LAtAc=;
 b=Zo/UcUeNmSo0sDr2KuPxGJehC4/SNLXTPf/ecE3kM+2K2ehPOJLqR4+ghFPrxXpPHRAy4Y
 bWoOfxZ4yb81SaNvhR9NtnS+46QRtWWFmtre4HYFUQvpy4zH944tLkgwHPMysrrIQKpm3M
 pZO2kHo/mxRWtHavVEOb8SFGa0SrV8w=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-QG8jolQTNLyJsgAGdOqAxg-1; Wed, 19 Jul 2023 05:01:14 -0400
X-MC-Unique: QG8jolQTNLyJsgAGdOqAxg-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b72262fb80so11177391fa.0
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jul 2023 02:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689757273; x=1690362073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iEingK6F6sQjEzMfdFhGQISzZgx2KwL76de8p1LAtAc=;
 b=dQhojuf/mIBEDJnqOsmlpU7dKFKqvYerzyLlzzuoKPD0hqqwZfgMMIUMD+AngofXEX
 O41fxA+oINc30usF1idVVthDfso0fjLKTmsUYXs3C4ljdI7ZQyzo256ezosxeZUhCH9D
 x+DPCOzG7ryilTY6JK1QlOPVQPBoSrjk2JKZ1tKEY/tybhBpWwa0Dn+++7XpGDZJBQgL
 zZKtgdeVNp3qb3P6Vhp5EmihC2Ux7OO9iKTxWcipPJi7Tu2Ey1WUI6hCpJ0Ev2bEnSlr
 mUZWP2+BxNqOmo0pRcPMd+WDxZbReG5MrVQVZQRJuHmArvzFpWOtW3dSQf8m2zO24XDO
 pGlA==
X-Gm-Message-State: ABy/qLZF/P3SxOazYVbd+b6ASV1VLxY0c9C5K84n817oehwMD2mP+y2n
 4RdHgoWWtpo9SHUhDq7ocpjXKqcVrWK3nANJYLHlDMjzZVJYzLglEbDDKdtfGWypL0A/ZfOM7B9
 fQbzAonKfE4F59YIfp1rv7r16qwxM/roxSq1lzWLNUw==
X-Received: by 2002:a2e:b891:0:b0:2b6:9a47:c4bd with SMTP id
 r17-20020a2eb891000000b002b69a47c4bdmr8857189ljp.1.1689757272939; 
 Wed, 19 Jul 2023 02:01:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFVcnTraDYZyT6H8+2HkWTXBE73JnREC8HbKBvR2QCxpwFXsH9jfRQZnT1LHuB4uC0NL0yOLLXRDEd4uTb8lkE=
X-Received: by 2002:a2e:b891:0:b0:2b6:9a47:c4bd with SMTP id
 r17-20020a2eb891000000b002b69a47c4bdmr8857171ljp.1.1689757272554; Wed, 19 Jul
 2023 02:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230719044051.6975-1-skeggsb@gmail.com>
 <20230719044051.6975-2-skeggsb@gmail.com>
In-Reply-To: <20230719044051.6975-2-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 19 Jul 2023 11:01:00 +0200
Message-ID: <CACO55tv19giHd7-Psv6AU5tPTHraCxYSzRwkL6G_p+PdGXq7OQ@mail.gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau/disp: PIOR DP uses GPIO for
 HPD, not PMGR AUX interrupts
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
> Fixes crash on boards with ANX9805 TMDS/DP encoders.
>
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 27 ++++++++++++-------
>  1 file changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/disp/uconn.c
> index dad942be6679..46b057fe1412 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
> @@ -81,20 +81,29 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *a=
rgv, u32 argc, struct nvkm_
>                 return -ENOSYS;
>
>         list_for_each_entry(outp, &conn->disp->outps, head) {
> -               if (outp->info.connector =3D=3D conn->index && outp->dp.a=
ux) {
> -                       if (args->v0.types & NVIF_CONN_EVENT_V0_PLUG  ) b=
its |=3D NVKM_I2C_PLUG;
> -                       if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) b=
its |=3D NVKM_I2C_UNPLUG;
> -                       if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ   ) b=
its |=3D NVKM_I2C_IRQ;
> +               if (outp->info.connector =3D=3D conn->index)
> +                       break;
> +       }
>
> -                       return nvkm_uevent_add(uevent, &device->i2c->even=
t, outp->dp.aux->id, bits,
> -                                              nvkm_uconn_uevent_aux);
> -               }
> +       if (&outp->head =3D=3D &conn->disp->outps)
> +               return -EINVAL;
> +
> +       if (outp->dp.aux && !outp->info.location) {
> +               if (args->v0.types & NVIF_CONN_EVENT_V0_PLUG  ) bits |=3D=
 NVKM_I2C_PLUG;
> +               if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |=3D=
 NVKM_I2C_UNPLUG;
> +               if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ   ) bits |=3D=
 NVKM_I2C_IRQ;
> +
> +               return nvkm_uevent_add(uevent, &device->i2c->event, outp-=
>dp.aux->id, bits,
> +                                      nvkm_uconn_uevent_aux);
>         }
>
>         if (args->v0.types & NVIF_CONN_EVENT_V0_PLUG  ) bits |=3D NVKM_GP=
IO_HI;
>         if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |=3D NVKM_GP=
IO_LO;
> -       if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ)
> -               return -EINVAL;
> +       if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ) {
> +               /* TODO: support DP IRQ on ANX9805 and remove this hack. =
*/
> +               if (!outp->info.location)
> +                       return -EINVAL;
> +       }
>
>         return nvkm_uevent_add(uevent, &device->gpio->event, conn->info.h=
pd, bits,
>                                nvkm_uconn_uevent_gpio);
> --
> 2.41.0
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

