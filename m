Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F8F3D37A6
	for <lists+nouveau@lfdr.de>; Fri, 23 Jul 2021 11:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A056F902;
	Fri, 23 Jul 2021 09:24:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119A46F8FE
 for <nouveau@lists.freedesktop.org>; Fri, 23 Jul 2021 09:24:44 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id o185so1121462oih.13
 for <nouveau@lists.freedesktop.org>; Fri, 23 Jul 2021 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e30m4UPG96stOKc9AAKHmmDvPceuMEjTC/oE9rnemL8=;
 b=kqGrIiB/LDwg0WCxZ8DhN1/fGwYijFuvJQbIO3b1viS2rD29dJRysDWAOVB8Rubitl
 AyY7ROW2xqDesH1d5+Sdx1fg6fqsPqp+Gjj9A8S8OibqPvLsWW998o0xN7+OXzkM+nVl
 WGFurJZj5+2B5v68/fEm3CkgfS8MCZTQB3v6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e30m4UPG96stOKc9AAKHmmDvPceuMEjTC/oE9rnemL8=;
 b=ZitZdwJQLiDdEqBhNeM77MX7sDa12X+NwIeswh71rywbhYZOBIBGGFaABVq5c/uFMe
 qRobyIRRVAcnuHiKVHOjaG2b+6GYfkxFVUcbuPTKMa+QpnbX4xyxhbAC5gjAoy+G/s0+
 jIaixGs/OhTF4y1UcvecuyzDZd/4GlBnqw4QNc/Szgoap3Jhpl4GcjXiZyykaEdKQ9Vj
 cLQwxlk1skhtWMtA8ZePSKBR6BpR901jfpvwvPSmqtVK0i2a6SznmtB+Y6Bj/BFisiUK
 lI9QGSb+rPxfkrPp4iEa1d7oXE1GJ+uUwcrT9wVGq4rQF0DxW+GD9JPEQI4fzbbss4xZ
 ItkA==
X-Gm-Message-State: AOAM5320lVPJiRLIav0Cw8K6c5HDNyVww+uy98egyJQ1lFh84J7BedoV
 1a5/IV7jf8E8cd8kgKjkMA1ElPxak9V2k2aKf/ab8Q==
X-Google-Smtp-Source: ABdhPJy2No+cuZ76/SxEQnH4zinzF2kmRucefQc9Y7v0x1BAgQW8WF9jPryfnWoCo+N0dsICDiQ1KmHu4e+YHQ1LzpI=
X-Received: by 2002:aca:3085:: with SMTP id w127mr7843600oiw.101.1627032283413; 
 Fri, 23 Jul 2021 02:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210723091534.1730564-1-arnd@kernel.org>
In-Reply-To: <20210723091534.1730564-1-arnd@kernel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 23 Jul 2021 11:24:32 +0200
Message-ID: <CAKMK7uHG0T7kgHzrkxoGj+Cv1-5f=GaH1CviunoZd_wEL5G4YQ@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv50-: fix build failure with
 CONFIG_BACKLIGHT=n
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 11:15 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> When the backlight support is disabled, the driver fails to build:
>
> drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_sor_atomic_disable':
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1665:59: error: 'struct nouveau_connector' has no member named 'backlight'
>  1665 |         struct nouveau_backlight *backlight = nv_connector->backlight;
>       |                                                           ^~
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1670:35: error: invalid use of undefined type 'struct nouveau_backlight'
>  1670 |         if (backlight && backlight->uses_dpcd) {
>       |                                   ^~
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1671:64: error: invalid use of undefined type 'struct nouveau_backlight'
>  1671 |                 ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
>       |                                                                ^~
>
> The patch that introduced the problem already contains some #ifdef
> checks, so just add another one that makes it build again.
>
> Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Can we just toss the idea that BACKTLIGHT=n is a reasonable config for
drm drivers using backlights, and add depends BACKLIGHT to all of
them?

I mean this is a perfect source of continued patch streams to keep us
all busy, but beyond that I really don't see the point ... I frankly
have better things to do, and especially with the big drivers we have
making backlight optional saves comparitively nothing.
-Daniel

> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 093e1f7163b3..fcf53e24db21 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1659,20 +1659,23 @@ static void
>  nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
>  {
>         struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
> -       struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
>         struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
>         struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
> -       struct nouveau_backlight *backlight = nv_connector->backlight;
>         struct drm_dp_aux *aux = &nv_connector->aux;
> -       int ret;
>         u8 pwr;
>
> +#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
> +       struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
> +       struct nouveau_backlight *backlight = nv_connector->backlight;
> +
>         if (backlight && backlight->uses_dpcd) {
> -               ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
> +               int ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
> +
>                 if (ret < 0)
>                         NV_ERROR(drm, "Failed to disable backlight on [CONNECTOR:%d:%s]: %d\n",
>                                  nv_connector->base.base.id, nv_connector->base.name, ret);
>         }
> +#endif
>
>         if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
>                 int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
> --
> 2.29.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
