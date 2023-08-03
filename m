Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1B876EE37
	for <lists+nouveau@lfdr.de>; Thu,  3 Aug 2023 17:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B23F10E61A;
	Thu,  3 Aug 2023 15:35:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F050710E61A
 for <nouveau@lists.freedesktop.org>; Thu,  3 Aug 2023 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691076897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GAn60s5VL8+3FWf4gqWswaZZmaZpliVGHrn8c7NwxLc=;
 b=XNktx60WFw8epYmRkMJ5rM13O2OviH3vMMW6anJfX0VglUELfE8jNoC1dysUGB/w/UcaBt
 pypx3lxiGw7lELcPmYBM7mOgAZIjTKNYObQQQWjOMig8m06/L1XXsTg0+hX5m0Emtu8TEZ
 R7hs0vNfiQBigPgSDUGB+GnRLbEBeQs=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-j-9mLKsIOT6KDzETGprrIw-1; Thu, 03 Aug 2023 11:34:56 -0400
X-MC-Unique: j-9mLKsIOT6KDzETGprrIw-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4fe4f5ffe2aso242872e87.1
 for <nouveau@lists.freedesktop.org>; Thu, 03 Aug 2023 08:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691076894; x=1691681694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GAn60s5VL8+3FWf4gqWswaZZmaZpliVGHrn8c7NwxLc=;
 b=hk2n+rpZ2QvShBFtCCBnwWpj2ugLOgUfRIIZVedsCgol58Ra+7toATlKi9fAnd6ljy
 peUSfb4DT1+8xhApLe9mZwJhd1uw3yFczWJL72659PYTHPjp5iG37ahiiGM60nBiZVAN
 q0FxROs5RV6xdcGLRW7f1qSqGGa8Ydn0Ezz92eMNNsqcm0yBLLF32iNT5o1Z8wPf6A8+
 OPkUKzrnJfZdf8I/nqY/coUGJUvnaBrcd4A3nDhgME4U2OBA81qOvcYOjUpRpnGA0myd
 b1H2gkFw8rcZYNFieHhrc7u+gYSHLwfJnmTrprEcqvUoxHaLs6SEgNO6NQmYh8ZBsGEr
 3wfQ==
X-Gm-Message-State: ABy/qLadJGoHm41XR6Ylk36KFVNE8/99tFbYcQlA35e9Qz5jCDLKzIuU
 TPr4WWr/aQR5fhEt79XQLvNnOztK07Kc0j6az6y+GYJTbya/J8uJXBhywVeI1QagXPt2G/XdCs2
 gguuSy9iy7EfCDcDUmuGEBFMpM2CEG0JFYlck3T+ItQ==
X-Received: by 2002:a2e:a7cf:0:b0:2b6:9969:d0ab with SMTP id
 x15-20020a2ea7cf000000b002b69969d0abmr12388659ljp.4.1691076894714; 
 Thu, 03 Aug 2023 08:34:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEz/wDErpCcQsXauXulvVlKBxx8fIp7/uctE6vRdS4DBK25r+JCF/5qhcGyR21XS9Fl91S59IuTEBpqIWDsIHQ=
X-Received: by 2002:a2e:a7cf:0:b0:2b6:9969:d0ab with SMTP id
 x15-20020a2ea7cf000000b002b69969d0abmr12388632ljp.4.1691076894406; Thu, 03
 Aug 2023 08:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230803143358.13563-1-arnd@kernel.org>
In-Reply-To: <20230803143358.13563-1-arnd@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 3 Aug 2023 17:34:43 +0200
Message-ID: <CACO55tskNHHpEjQK-+wBR+nVgz+Fq31U0_FKmNGSL2JDCMnJUA@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] [RESEND] drm/nouveau: remove unused
 tu102_gr_load() function
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
Cc: Arnd Bergmann <arnd@arndb.de>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Aug 3, 2023 at 4:34=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> tu102_gr_load() is completely unused and can be removed to address
> this warning:
>
> drivers/gpu/drm/nouveau/dispnv50/disp.c:2517:1: error: no previous protot=
ype for 'nv50_display_create'
>
> Another patch was sent in the meantime to mark the function static but
> that would just cause a different warning about an unused function.
>
> Fixes: 1cd97b5490c8 ("drm/nouveau/gr/tu102-: use sw_veid_bundle_init from=
 firmware")
> Link: https://lore.kernel.org/all/CACO55tuaNOYphHyB9+ygi9AnXVuF49etsW7x2X=
5K5iEtFNAAyw@mail.gmail.com/
> Link: https://lore.kernel.org/all/20230417210310.2443152-1-arnd@kernel.or=
g/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I send this one back in April, and Lee Jones sent a similar patch in May.
> Please apply so we can enable the warning by default.
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/gr/tu102.c
> index 3b6c8100a242..a7775aa18541 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> @@ -206,19 +206,6 @@ tu102_gr_av_to_init_veid(struct nvkm_blob *blob, str=
uct gf100_gr_pack **ppack)
>         return gk20a_gr_av_to_init_(blob, 64, 0x00100000, ppack);
>  }
>
> -int
> -tu102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *=
fwif)
> -{
> -       int ret;
> -
> -       ret =3D gm200_gr_load(gr, ver, fwif);
> -       if (ret)
> -               return ret;
> -
> -       return gk20a_gr_load_net(gr, "gr/", "sw_veid_bundle_init", ver, t=
u102_gr_av_to_init_veid,
> -                                &gr->bundle_veid);
> -}
> -
>  static const struct gf100_gr_fwif
>  tu102_gr_fwif[] =3D {
>         {  0, gm200_gr_load, &tu102_gr, &gp108_gr_fecs_acr, &gp108_gr_gpc=
cs_acr },
> --
> 2.39.2
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

Will push to drm-misc in a sec

