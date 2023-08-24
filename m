Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D091D786A4F
	for <lists+nouveau@lfdr.de>; Thu, 24 Aug 2023 10:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9A210E4ED;
	Thu, 24 Aug 2023 08:42:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D2D10E4EE
 for <nouveau@lists.freedesktop.org>; Thu, 24 Aug 2023 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692866521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IsB/rgE71MKRCAfugQoyX1VTNTlOQvUYEhfYQX7N874=;
 b=IW+yFv0sk2vGdNG2RV5dg47mvAPmdUMOCBJObBQPa8bdVYeu4fnUm6j1MDFaRjlRZSltoJ
 qtjgJs3XwUomr12Xp77By5gXs/R/NPdBLcX55bihheEsBXEFY4EcPWOhyImjCvAPvH9iBd
 rGemq0KIHK7Y5XGcBRYTcpl2GyMnwQY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-nEVvLR0iNvyaucb7N7p4LQ-1; Thu, 24 Aug 2023 04:41:57 -0400
X-MC-Unique: nEVvLR0iNvyaucb7N7p4LQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4ff9b3e7c94so1336664e87.1
 for <nouveau@lists.freedesktop.org>; Thu, 24 Aug 2023 01:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692866516; x=1693471316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IsB/rgE71MKRCAfugQoyX1VTNTlOQvUYEhfYQX7N874=;
 b=j0G1Jdws6EFy52Y35qDQUPLP1WR9hvIy8NicZsI9waAHw4SGZ2ECNvFBwN2KN9EomF
 ysy5dzV01gPOl+v/CW2jrH6IsqKCo7y8Cr2E3lknKODkxPR72SozQpg8blSGS2PKOQHj
 5fi6XX906itEWKTA6elV8Io52vaLeJKFpSvyqj7YfdwbangJG0mkXGhpqgkEgVXAIDvo
 semhH5e/oiNMxMGUsoI3yULc8oRbkHQ0+nXarZrsWp5IQ1uRlx1zYWFHlIi6/S1OzB80
 rqcgqeKSOCemryBDzDQdSljy/QCfdQoiD1GG02PJu/gh1ox2QS22k+xWYCgGhT/2HvIm
 z9Sg==
X-Gm-Message-State: AOJu0YzdGgZr7lMDOa0WfXDF1QVG84G5bXoD3N2xFIfY3v4lcxpFidu+
 Hy7cgqTYytJWj+JCzWrk3QzycDK8SfEiE4XDyS/BDi0SW6YuN7rJdsmU0MiWMEkitigKRRB1val
 TuUfgBdHIUopNoIVHLR1S9x52ofNeTHGbSYX7JYzviA==
X-Received: by 2002:a2e:a795:0:b0:2b6:7c3a:6adc with SMTP id
 c21-20020a2ea795000000b002b67c3a6adcmr12550897ljf.5.1692866516043; 
 Thu, 24 Aug 2023 01:41:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZUHPWZDKgvC3dNDa3Zh4y3brX0dAkFwoJfBWqG0XeVgAinujTjApQBRr3j9aCYGGyak4hQCHpLkui5aRtbIw=
X-Received: by 2002:a2e:a795:0:b0:2b6:7c3a:6adc with SMTP id
 c21-20020a2ea795000000b002b67c3a6adcmr12550879ljf.5.1692866515666; Thu, 24
 Aug 2023 01:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-5-lee@kernel.org>
In-Reply-To: <20230824073710.2677348-5-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 24 Aug 2023 10:41:44 +0200
Message-ID: <CACO55tvZ+mv7xxRB4hbM7ttTnJznbyVAs41fn1Dq-rEeLUWYyg@mail.gmail.com>
To: Lee Jones <lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 04/20] drm/nouveau/nvkm/subdev/volt/gk20a:
 Demote kerneldoc abuses
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 9:37=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:49: warning: This comme=
nt starts with '/**', but isn't a kernel-doc comment. Refer Documentation/d=
oc-guide/kernel-doc.rst
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:62: warning: This comme=
nt starts with '/**', but isn't a kernel-doc comment. Refer Documentation/d=
oc-guide/kernel-doc.rst
>
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/volt/gk20a.c
> index 8c2faa9645111..ccac88da88648 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
> @@ -45,7 +45,7 @@ static const struct cvb_coef gk20a_cvb_coef[] =3D {
>         /* 852 */ { 1608418, -21643, -269,     0,    763,  -48},
>  };
>
> -/**
> +/*
>   * cvb_mv =3D ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0)
>   */
>  static inline int
> @@ -58,7 +58,7 @@ gk20a_volt_get_cvb_voltage(int speedo, int s_scale, con=
st struct cvb_coef *coef)
>         return mv;
>  }
>
> -/**
> +/*
>   * cvb_t_mv =3D
>   * ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0) +
>   * ((c3 * speedo / s_scale + c4 + c5 * T / t_scale) * T / t_scale)
> --
> 2.42.0.rc1.204.g551eb34607-goog
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

