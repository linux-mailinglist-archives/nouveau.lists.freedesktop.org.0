Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5801974C004
	for <lists+nouveau@lfdr.de>; Sun,  9 Jul 2023 01:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0D510E075;
	Sat,  8 Jul 2023 23:42:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216DA10E075
 for <nouveau@lists.freedesktop.org>; Sat,  8 Jul 2023 23:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688859746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zuXUWar5it67xzTLsfG6dq75MzwcYYcoVnZ3Qa6+OwQ=;
 b=PKr0KnBTegGuOk9QOHkuSmAqRC4uj9GrrWpLoTHwHQ5yN/9xe/5z8F+lbFYPZqMVqcjD7C
 hyW2VVfRHy3sKjesJ/Mz09YWQyr6EB8gN1YFupMkwdzVTWP2w1wVNA1ZiCBK+P8Bs96mRI
 qtJ17GBKkfg2qQL97V4Nz2U3/CKb+Ug=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-KY06q1PxMpeoLXWBR5-ZCQ-1; Sat, 08 Jul 2023 19:42:24 -0400
X-MC-Unique: KY06q1PxMpeoLXWBR5-ZCQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b04d5ed394so5413011fa.1
 for <nouveau@lists.freedesktop.org>; Sat, 08 Jul 2023 16:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688859742; x=1691451742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zuXUWar5it67xzTLsfG6dq75MzwcYYcoVnZ3Qa6+OwQ=;
 b=MUO1q92yU9LkBsfM2WloRo1rIG5qDR9ELBLkgjfFYxF7xFvEbRmGIKWXaOfRheMe2/
 7zzwTJbJqfBc5rLLpg4IGBpKTw0qF9M3Nj1K7v2KUxQ8ipQ3s2whSxP5IFMMxJlvkJTB
 /a2g5G2TdvtAhmbaWOQGzGwbiQTy1M/gosSFLpd5GLlqnQVSFPuKmTy5UVef4SCQyWbk
 bwSCcVMSwVZR8ASaaazf2acTrgHP9rz7z4h/lshHZ88vkR8z/aXN/b9FeBt82sNKQGvO
 /33AZKzHpCZGZjsl+JfE3A+kBvvSn8/WTv7+bUv1oDdcz+Llw0WYvtPR9HSngfe7QiYz
 JqxQ==
X-Gm-Message-State: ABy/qLaroaQUnXuSwyZ1vsR+6naK/isQSeO2cpuOs0WF77UfZaUAJVft
 LJfEAtvLC/4VxApbyOq4C1N+E3wOKxigbhqBO02P0Nw0lKMlQZ0MKWQME4suq/uuwYwHI2DmxtB
 OejCHBlfSOrZK7H5NFS5iztOGQ37IXxb1uhYRSrC92g==
X-Received: by 2002:a2e:a10b:0:b0:2b6:9a47:c4bd with SMTP id
 s11-20020a2ea10b000000b002b69a47c4bdmr7458207ljl.1.1688859742215; 
 Sat, 08 Jul 2023 16:42:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE5X3CBQWtiEdrj3rZYiIrmAV14yV6EXlVIUUteCnODFqXHRUw2+sSlSUsqusjTgXVX8PP6eFgmtiIYHbhX8EI=
X-Received: by 2002:a2e:a10b:0:b0:2b6:9a47:c4bd with SMTP id
 s11-20020a2ea10b000000b002b69a47c4bdmr7458188ljl.1.1688859741870; Sat, 08 Jul
 2023 16:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230707215851.590754-1-lyude@redhat.com>
In-Reply-To: <20230707215851.590754-1-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sun, 9 Jul 2023 01:42:10 +0200
Message-ID: <CACO55tvfTDu8XcKowWXcSRqp8OMLb8Q4jnPG_Fn5y=yJy-Dqbw@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/nvkm/dp: Add hack to fix DP 1.3+
 DPCD issues
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
Cc: nouveau@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jul 7, 2023 at 11:58=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> Currently we use the drm_dp_dpcd_read_caps() helper in the DRM side of
> nouveau in order to read the DPCD of a DP connector, which makes sure we =
do
> the right thing and also check for extended DPCD caps. However, it turns
> out we're not currently doing this on the nvkm side since we don't have
> access to the drm_dp_aux structure there - which means that the DRM side =
of
> the driver and the NVKM side can end up with different DPCD capabilities
> for the same connector.
>
> Ideally to fix this, we want to start setting up the drm_dp_aux device in
> NVKM before we've made contact with the DRM side - which should be pretty
> easy to accomplish (I'm already working on it!). Until then however, let'=
s
> workaround this problem by porting a copy of drm_dp_read_dpcd_caps() into
> NVKM - which should fix this issue.
>
> Issue: https://gitlab.freedesktop.org/drm/nouveau/-/issues/211

Should a Fixes: or Cc: stable tag be added so it gets backported?

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 48 ++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/disp/dp.c
> index 40c8ea43c42f..b8ac66b4a2c4 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> @@ -26,6 +26,8 @@
>  #include "head.h"
>  #include "ior.h"
>
> +#include <drm/display/drm_dp.h>
> +
>  #include <subdev/bios.h>
>  #include <subdev/bios/init.h>
>  #include <subdev/gpio.h>
> @@ -634,6 +636,50 @@ nvkm_dp_enable_supported_link_rates(struct nvkm_outp=
 *outp)
>         return outp->dp.rates !=3D 0;
>  }
>
> +/* XXX: This is a big fat hack, and this is just drm_dp_read_dpcd_caps()

Well.. maybe we should rephrase that _if_ we want to see it
backported. But is this code really that bad? It kinda looks
reasonable enough.

> + * converted to work inside nvkm. This is a temporary holdover until we =
start
> + * passing the drm_dp_aux device through NVKM
> + */
> +static int
> +nvkm_dp_read_dpcd_caps(struct nvkm_outp *outp)
> +{
> +       struct nvkm_i2c_aux *aux =3D outp->dp.aux;
> +       u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
> +       int ret;
> +
> +       ret =3D nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.dpcd, DP_REC=
EIVER_CAP_SIZE);
> +       if (ret < 0)
> +               return ret;
> +
> +       /*
> +        * Prior to DP1.3 the bit represented by
> +        * DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT was reserved.
> +        * If it is set DP_DPCD_REV at 0000h could be at a value less tha=
n
> +        * the true capability of the panel. The only way to check is to
> +        * then compare 0000h and 2200h.
> +        */
> +       if (!(outp->dp.dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> +             DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
> +               return 0;
> +
> +       ret =3D nvkm_rdaux(aux, DP_DP13_DPCD_REV, dpcd_ext, sizeof(dpcd_e=
xt));
> +       if (ret < 0)
> +               return ret;
> +
> +       if (outp->dp.dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
> +               OUTP_DBG(outp, "Extended DPCD rev less than base DPCD rev=
 (%d > %d)\n",
> +                        outp->dp.dpcd[DP_DPCD_REV], dpcd_ext[DP_DPCD_REV=
]);
> +               return 0;
> +       }
> +
> +       if (!memcmp(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext)))
> +               return 0;
> +
> +       memcpy(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext));
> +
> +       return 0;
> +}
> +
>  void
>  nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
>  {
> @@ -689,7 +735,7 @@ nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
>                         memset(outp->dp.lttpr, 0x00, sizeof(outp->dp.lttp=
r));
>                 }
>
> -               if (!nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.dpcd, s=
izeof(outp->dp.dpcd))) {
> +               if (!nvkm_dp_read_dpcd_caps(outp)) {
>                         const u8 rates[] =3D { 0x1e, 0x14, 0x0a, 0x06, 0 =
};
>                         const u8 *rate;
>                         int rate_max;
> --
> 2.40.1
>

