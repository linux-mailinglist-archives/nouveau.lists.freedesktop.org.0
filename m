Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513E4305637
	for <lists+nouveau@lfdr.de>; Wed, 27 Jan 2021 09:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEBD893EB;
	Wed, 27 Jan 2021 08:56:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17F089056
 for <nouveau@lists.freedesktop.org>; Wed, 27 Jan 2021 08:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611737804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yl8Qg+ujssN+74LSbNMdpPf0tA/RxFWK58EdgWxc2JI=;
 b=iYPhcbz1UkapknX3/X1Fa1Ef7Fjt6k5RpyYPnbZXJUDdLVZCXskNQp3owfAAsxrxSfqY1K
 4oJJ5WePTf2FSxhjGYwiX9mJs6kdeS4F15AEvgw+epLYvSLCKM4BvuzNZjtPIJ/6pJ4xTC
 yS1ModPvigZOfuu7XwtKLZ8WvNeQEiQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-YMB6M5WaOu6nWOX8q_-pdg-1; Wed, 27 Jan 2021 03:56:41 -0500
X-MC-Unique: YMB6M5WaOu6nWOX8q_-pdg-1
Received: by mail-wr1-f69.google.com with SMTP id d7so575646wri.23
 for <nouveau@lists.freedesktop.org>; Wed, 27 Jan 2021 00:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yl8Qg+ujssN+74LSbNMdpPf0tA/RxFWK58EdgWxc2JI=;
 b=jiARX6lsRU+b+8EqPQa4WkX4POReAbdi9gSTfxiLWOCNGPqyCFQjO527iHwpHjZZZF
 FU4+GI9P7+CLsuJhV/HrQywegG1kZ79/Fx4gSFC9OQ/bDVFkSe4Ps9MculKEPX9THDV9
 yjIFtoVZSk/Cd+0cmEVnaORFKiXY4R1R7eoHnwOlq5f99DFNZIeDL/CGX6s7VS+H9nAK
 elCpTBkM6zxo3lv1w1NIvYhcvfI3pRmySEV7Sa28U4/eJ5j1Sq25iBLrkNq8glhB4j/S
 YOmaX8zie1QlyvoSTpU4pwZCKzbzfcGwVuB5lN+BXBpKpT/2AkjGPZlSzvAaHWWmPrH/
 2ADA==
X-Gm-Message-State: AOAM531hTZjTB5FBUmxKM+FrTBXQYDf2ipeJwizuhv/rabL1iE4nSLkk
 59K9BpxArq2lf8WEf1SziZJBJyIEraEEPWTD23jE0CTEcZ/D0RBB5eRjcbksSs4QzjMtoGFpV7u
 b42JIJaoyQ/QNmVZjmlnWO6X9KgWsaoOTftHkt9Ni4Q==
X-Received: by 2002:adf:ab1d:: with SMTP id q29mr9795500wrc.415.1611737799815; 
 Wed, 27 Jan 2021 00:56:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAMMLq+pUnT4eZ6Zja4Mm1eIdoHtq63uJNEz0YFkfg0MujHalhsbkHqLC2bkcMXRxMKEhQ7VfKkT6zgi51XEY=
X-Received: by 2002:adf:ab1d:: with SMTP id q29mr9795487wrc.415.1611737799660; 
 Wed, 27 Jan 2021 00:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20210121111118.34587-1-bastian.beischer@rwth-aachen.de>
 <20210121142736.9525-1-bastian.beischer@rwth-aachen.de>
In-Reply-To: <20210121142736.9525-1-bastian.beischer@rwth-aachen.de>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 27 Jan 2021 09:56:29 +0100
Message-ID: <CACO55ts7nNHpsyVuTvSULPvNd4ttYZV1=t-xWo4Qnk2zgKMcsQ@mail.gmail.com>
To: Bastian Beranek <bastian.beischer@rwth-aachen.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH v3] drm/gpu/nouveau/dispnv50: Restore pushing
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

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Thu, Jan 21, 2021 at 3:28 PM Bastian Beranek
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
> index 302d4e6fc52f..788db043a342 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> @@ -88,7 +88,11 @@ base507c_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
>                           NVVAL(NV507C, SET_CONVERSION, OFS, 0x64));
>         } else {
>                 PUSH_MTHD(push, NV507C, SET_PROCESSING,
> -                         NVDEF(NV507C, SET_PROCESSING, USE_GAIN_OFS, DISABLE));
> +                         NVDEF(NV507C, SET_PROCESSING, USE_GAIN_OFS, DISABLE),
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
