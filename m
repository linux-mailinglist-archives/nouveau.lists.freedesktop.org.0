Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B096D2C09
	for <lists+nouveau@lfdr.de>; Sat,  1 Apr 2023 02:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9325E10F358;
	Sat,  1 Apr 2023 00:19:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2ED10F356
 for <nouveau@lists.freedesktop.org>; Sat,  1 Apr 2023 00:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680308389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1akfVcI7QR7lEshuitx6obMsoCPveh68wJcZR6xPcO0=;
 b=GSuMFpwoC5DK4PS5l0AGdF5C1ZMkVMXhv3qudrHyo30thkK25KaQCQojDzzapA43joz2wt
 JpA1cK4tvJTpha4HMFfV1SYBjBg4U+jgci3IK9YlMh7eZO0U+xJGIjOowxVd2H5sMuh0jk
 mykA+khIa0DvtYn7PHRJD1XGrYxLChs=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-0D7sv5rnPfGuATF6MyBvhA-1; Fri, 31 Mar 2023 20:19:48 -0400
X-MC-Unique: 0D7sv5rnPfGuATF6MyBvhA-1
Received: by mail-lf1-f69.google.com with SMTP id
 b6-20020a196446000000b004eaf4c3bceeso9440701lfj.20
 for <nouveau@lists.freedesktop.org>; Fri, 31 Mar 2023 17:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680308386;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1akfVcI7QR7lEshuitx6obMsoCPveh68wJcZR6xPcO0=;
 b=A4rtYXKIBgmVxDF6xbTcaGNFVaTTQLwFpadwcOJ+5kSsVo6RTpYpMTTT41ySfG+EMd
 MEgyBsh2GVeGoueHHPtO5Y9R1JtTLFsxaPBa5MUX9KiVYGVJE89/RvYyPY+DwnX23oEM
 HEm3AaW4s3feUFMbjne7rLQLc2TPgqZZkAbwBuoZN3gb6Mm8feZ8dz+ay4WO4/h6WObo
 g8r5M6LtfmWPLer19zRKq18f2oNUiPkcreVWz1cpD3epk2CoTaQ7pC7p1R5zHxcdXFEq
 QKLyjDrdz9vXpGUrssExvvduItqBC/OvCOSppgp53pdvxDgQr4d0JRRYE//uS8ExlNGc
 Q/OA==
X-Gm-Message-State: AAQBX9fgPkJVqRJkKvNkRWZpJlMTuh2Z6sZzPgmvcqGkpp0tlo5Gg+KE
 u32D1xWx7CwphUk4vo0dYPnmkFK3f/lVdo/umvPvcQTqXV6FFJlkmeIyEThkUdmm/lTM/A3vjOL
 R2Gr+usm9iAV73LDsdBzRlBKjUOaxtY5GaIHi7ZsBEw==
X-Received: by 2002:ac2:5448:0:b0:4e9:bcf5:a0b6 with SMTP id
 d8-20020ac25448000000b004e9bcf5a0b6mr8226770lfn.11.1680308386561; 
 Fri, 31 Mar 2023 17:19:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350Ym6jp94Bk1kg399ONU4Y43W8m0No6VgXmQakZUMxIsdvzW+dZo3JC+oAnN0j7K8A6lQ3Sh1UTftySQqNEDppQ=
X-Received: by 2002:ac2:5448:0:b0:4e9:bcf5:a0b6 with SMTP id
 d8-20020ac25448000000b004e9bcf5a0b6mr8226765lfn.11.1680308386241; Fri, 31 Mar
 2023 17:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230330223938.4025569-1-kherbst@redhat.com>
In-Reply-To: <20230330223938.4025569-1-kherbst@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 1 Apr 2023 02:19:34 +0200
Message-ID: <CACO55turFB8MNbxB3Vk=J1GK_t07K+Ybym906fR=yDLfnwk8bw@mail.gmail.com>
To: linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp: Support more modes by
 checking with lower bpc
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 12:39=E2=80=AFAM Karol Herbst <kherbst@redhat.com> =
wrote:
>
> This allows us to advertise more modes especially on HDR displays.
>
> Fixes using 4K@60 modes on my TV and main display both using a HDMI to DP
> adapter. Also fixes similiar issues for users running into this.
>
> Cc: stable@vger.kernel.org # 5.10+
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 32 +++++++++++++++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_dp.c    |  8 ++++---
>  2 files changed, 37 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index ed9d374147b8d..f28e47c161dd9 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -363,6 +363,35 @@ nv50_outp_atomic_check_view(struct drm_encoder *enco=
der,
>         return 0;
>  }
>
> +static void
> +nv50_outp_atomic_fix_depth(struct drm_encoder *encoder, struct drm_crtc_=
state *crtc_state)
> +{
> +       struct nv50_head_atom *asyh =3D nv50_head_atom(crtc_state);
> +       struct nouveau_encoder *nv_encoder =3D nouveau_encoder(encoder);
> +       struct drm_display_mode *mode =3D &asyh->state.adjusted_mode;
> +       unsigned int max_rate, mode_rate;
> +
> +       switch (nv_encoder->dcb->type) {
> +       case DCB_OUTPUT_DP:
> +               max_rate =3D nv_encoder->dp.link_nr * nv_encoder->dp.link=
_bw;
> +
> +                /* we don't support more than 10 anyway */
> +               asyh->or.bpc =3D max_t(u8, asyh->or.bpc, 10);

luckily I didn't push yet, but this has to be `min_t` :)

> +
> +               /* reduce the bpc until it works out */
> +               while (asyh->or.bpc > 6) {
> +                       mode_rate =3D DIV_ROUND_UP(mode->clock * asyh->or=
.bpc * 3, 8);
> +                       if (mode_rate <=3D max_rate)
> +                               break;
> +
> +                       asyh->or.bpc -=3D 2;
> +               }
> +               break;
> +       default:
> +               break;
> +       }
> +}
> +
>  static int
>  nv50_outp_atomic_check(struct drm_encoder *encoder,
>                        struct drm_crtc_state *crtc_state,
> @@ -381,6 +410,9 @@ nv50_outp_atomic_check(struct drm_encoder *encoder,
>         if (crtc_state->mode_changed || crtc_state->connectors_changed)
>                 asyh->or.bpc =3D connector->display_info.bpc;
>
> +       /* We might have to reduce the bpc */
> +       nv50_outp_atomic_fix_depth(encoder, crtc_state);
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouve=
au/nouveau_dp.c
> index e00876f92aeea..d49b4875fc3c9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -263,8 +263,6 @@ nouveau_dp_irq(struct work_struct *work)
>  }
>
>  /* TODO:
> - * - Use the minimum possible BPC here, once we add support for the max =
bpc
> - *   property.
>   * - Validate against the DP caps advertised by the GPU (we don't check =
these
>   *   yet)
>   */
> @@ -276,7 +274,11 @@ nv50_dp_mode_valid(struct drm_connector *connector,
>  {
>         const unsigned int min_clock =3D 25000;
>         unsigned int max_rate, mode_rate, ds_max_dotclock, clock =3D mode=
->clock;
> -       const u8 bpp =3D connector->display_info.bpc * 3;
> +       /* Check with the minmum bpc always, so we can advertise better m=
odes.
> +        * In particlar not doing this causes modes to be dropped on HDR
> +        * displays as we might check with a bpc of 16 even.
> +        */
> +       const u8 bpp =3D 6 * 3;
>
>         if (mode->flags & DRM_MODE_FLAG_INTERLACE && !outp->caps.dp_inter=
lace)
>                 return MODE_NO_INTERLACE;
> --
> 2.39.2
>

