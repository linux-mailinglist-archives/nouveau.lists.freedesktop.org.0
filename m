Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C773B2FE87E
	for <lists+nouveau@lfdr.de>; Thu, 21 Jan 2021 12:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332B989838;
	Thu, 21 Jan 2021 11:15:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA2289838
 for <nouveau@lists.freedesktop.org>; Thu, 21 Jan 2021 11:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611227710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vrHtnFDu1lMq2EljZmesD22bqqbPURdUzPCJKZf8hGQ=;
 b=VCVZ9pNabo5lRen3Si9VpsRBX4/jsO6y2zPjNMA6FjSulyVvICuRBaExZHBCiSzc2L+vR3
 I+Ampg00jjCfbD2BN/GiGZYaaPk/WTQnD0Dn79ILy+MZ8/ykmDe0320YykF2kvv4leKkjz
 B7N4ZgQR2rmiQuD99sqTCJqBd+PQTNU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-fcd9Tx-gOimBp_fBG9Ex6A-1; Thu, 21 Jan 2021 06:15:07 -0500
X-MC-Unique: fcd9Tx-gOimBp_fBG9Ex6A-1
Received: by mail-wr1-f72.google.com with SMTP id u3so773723wri.19
 for <nouveau@lists.freedesktop.org>; Thu, 21 Jan 2021 03:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vrHtnFDu1lMq2EljZmesD22bqqbPURdUzPCJKZf8hGQ=;
 b=ISVAIPI7cSUwhgjUbg/UY/u4KoyM846OaEGD1fJYgW14/01e9T3Ox76FGOacwoSqXb
 X6ITa8HNtGBzkMwAnuwDigOSrgGdDNYJwL9ONfVdjE73BfoJdsH9XRue9gGRfTTFtR9Z
 9gS94AlZvHgUKRHXkzkKLHAb5lmLl56JBx9p2dJdn4EhVFPQgnI8YIZVUBY5rEqRL2QU
 hJ0uaZM41VL5VjsBR28vTOVSl+lnrpPgZpRHeRluSMzz74+aHxjkkkDF4usUS4j8qTYa
 aVA8dsauX7IbHBR330t250iGyFaKQeU9kZmYhuwEw+bSRjp4GaFziJNN5tqir8FlVICO
 DOFw==
X-Gm-Message-State: AOAM531qTRE6XWiJfblMmbZW/JNNO5hC7+8ySfRsfUK0aclETz+ShTBR
 QHbmTZqLq1RCP7E9twagEwujWYV2I4jokF3yQ9aL0WOBo29bLtZe7ZTeplbRTLr9b+HJ2m/UEmV
 FluG1LjlBdiQg4x8xD94IocBPcZbP+GU/EHrV6xDVjQ==
X-Received: by 2002:a05:600c:2351:: with SMTP id
 17mr2651146wmq.163.1611227706078; 
 Thu, 21 Jan 2021 03:15:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4N8SP7GcZ5vxQrjmVWxtqtU9Rch3uwQ/+AOgNcYGXaXfqbmyKUmFmk+1Ow+6Lc9ljyh2TczMH7185Kt80iPc=
X-Received: by 2002:a05:600c:2351:: with SMTP id
 17mr2651136wmq.163.1611227705904; 
 Thu, 21 Jan 2021 03:15:05 -0800 (PST)
MIME-Version: 1.0
References: <20210118124048.8772-1-bastian.beischer@rwth-aachen.de>
 <20210121111118.34587-1-bastian.beischer@rwth-aachen.de>
In-Reply-To: <20210121111118.34587-1-bastian.beischer@rwth-aachen.de>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 21 Jan 2021 12:14:55 +0100
Message-ID: <CACO55tvPqCGu4TLnGfiGDs5tKdq3DwUZ5O_7EMM4A5KTJsRwCQ@mail.gmail.com>
To: Bastian Beranek <bastian.beischer@rwth-aachen.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH v2] drm/gpu/nouveau/dispnv50: Restore pushing
 of all data.
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

ohh, at first I thought this was a resend, but it's in a different file :)

On Thu, Jan 21, 2021 at 12:11 PM Bastian Beranek
<bastian.beischer@rwth-aachen.de> wrote:
>
> Commit f844eb485eb056ad3b67e49f95cbc6c685a73db4 introduced a regression for
> NV50, which lead to visual artifacts, tearing and eventual crashes.
>
> In the changes of f844eb485eb056ad3b67e49f95cbc6c685a73db4 only the first line
> was correctly translated to the new NVIDIA header macros:
>
> -               PUSH_NVSQ(push, NV827C, 0x0110, 0,
> -                                       0x0114, 0);
> +               PUSH_MTHD(push, NV827C, SET_PROCESSING,
> +                         NVDEF(NV827C, SET_PROCESSING, USE_GAIN_OFS, DISABLE));
>
> The lower part ("0x0114, 0") was probably omitted by accident.
>
> This patch restores the push of the missing data and fixes the regression.
>
> Signed-off-by: Bastian Beranek <bastian.beischer@rwth-aachen.de>
> Fixes: f844eb485eb056ad3b67e49f95cbc6c685a73db4
> Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/14
> ---
>  drivers/gpu/drm/nouveau/dispnv50/base507c.c | 6 +++++-
>  drivers/gpu/drm/nouveau/dispnv50/base827c.c | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> index 302d4e6fc52f..2d1825a5d751 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> @@ -88,7 +88,11 @@ base507c_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
>                           NVVAL(NV507C, SET_CONVERSION, OFS, 0x64));
>         } else {
>                 PUSH_MTHD(push, NV507C, SET_PROCESSING,
> -                         NVDEF(NV507C, SET_PROCESSING, USE_GAIN_OFS, DISABLE));
> +                         NVDEF(NV507C, SET_PROCESSING, USE_GAIN_OFS, DISABLE)),
> +
> +                                       SET_CONVERSION,
> +                         NVVAL(NV507C, SET_CONVERSION, GAIN, 0) |
> +                         NVVAL(NV507C, SET_CONVERSION, OFS, 0));
>         }
>
>         PUSH_MTHD(push, NV507C, SURFACE_SET_OFFSET(0, 0), asyw->image.offset[0] >> 8);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/base827c.c b/drivers/gpu/drm/nouveau/dispnv50/base827c.c
> index 18d34096f125..093d4ba6910e 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/base827c.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/base827c.c
> @@ -49,7 +49,11 @@ base827c_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
>                           NVVAL(NV827C, SET_CONVERSION, OFS, 0x64));
>         } else {
>                 PUSH_MTHD(push, NV827C, SET_PROCESSING,
> -                         NVDEF(NV827C, SET_PROCESSING, USE_GAIN_OFS, DISABLE));
> +                         NVDEF(NV827C, SET_PROCESSING, USE_GAIN_OFS, DISABLE),
> +
> +                                       SET_CONVERSION,
> +                         NVVAL(NV827C, SET_CONVERSION, GAIN, 0) |
> +                         NVVAL(NV827C, SET_CONVERSION, OFS, 0));
>         }
>
>         PUSH_MTHD(push, NV827C, SURFACE_SET_OFFSET(0, 0), asyw->image.offset[0] >> 8,
> --
> 2.30.0
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
