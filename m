Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65C43640BC
	for <lists+nouveau@lfdr.de>; Mon, 19 Apr 2021 13:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4726E250;
	Mon, 19 Apr 2021 11:45:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8936E24E
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=koc049HugtBARt6EjAzw6mtyEEpABQogvtRQVut/VZw=;
 b=PxHqrdeFzL0pYWIBxiX+595HwHlAFs+oJw+kmtVUa8ypVe7Tge6CTV/2rWDuGwrrDKVOGn
 9MF5ederkTuvrd8QlDx1URj3g1LIiPx1zhZ8h56vdfu28q5+i5kW9NoREtPgJXGw/MqBt4
 lGWa+GNWKUtyR5mo7Cn1St2RyT/qL9o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-mHLJSE9QM1iJRq1egiN1gg-1; Mon, 19 Apr 2021 07:45:34 -0400
X-MC-Unique: mHLJSE9QM1iJRq1egiN1gg-1
Received: by mail-wm1-f71.google.com with SMTP id
 j3-20020a1c55030000b029012e7c06101aso2853565wmb.5
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 04:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=koc049HugtBARt6EjAzw6mtyEEpABQogvtRQVut/VZw=;
 b=MzUSWZy7OQ0rm0Ftf8sTPjZHAwhX0v5D9zgptHYD3KnqMbaJTnDVLyvmKGcqQyuEVK
 zPy9yf8RBcnsn7YeFut+LduBuFxOfCvMm39pchzzENqrZ/7/wYs1kO4cKLIs4oOBxGZW
 HBEyT+uR6cK7FqcbHT6OqE91bDoG4FQX4hQhSRQw27MJSiwlG0FnjkgkCTTSuOj9nrFx
 /93UkyTmZ+efg28EHgz53FhQ35Q7unK2ZrKl8LW65WuLszw2S15o0klUpAgVy3DLwDyl
 SQBFr8sULlqx69EZkxFseUu1W0LrMJL3VlBlFKUVqgAArWPUJAeHjnP/JxNGXy88nYTt
 42Hw==
X-Gm-Message-State: AOAM532LouS74UQJ+LXQ89esKsgXjBV1SKw+Bw+E3hQIa5seeCT2+wgL
 xCtrrXtT+TWMXah85oytayKX8Y/w5k7LBw/UyhbZV4vCIBU1GWHKXjQhN+IKYiMBwzyQc/DcYB1
 s+qpypvafjxeK1UMQTEUZv3CXUh8p0wLYvAu8+1tf8A==
X-Received: by 2002:a5d:6983:: with SMTP id g3mr13595813wru.415.1618832733324; 
 Mon, 19 Apr 2021 04:45:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMWuQi4zxk85zmf73Pwt63xQbdTQuszlMMCk8bIRtx2iSyg8ZGa26+dC0kfmhUNyg8Km1sHUnjbaHgtAhKXgI=
X-Received: by 2002:a5d:6983:: with SMTP id g3mr13595801wru.415.1618832733209; 
 Mon, 19 Apr 2021 04:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-10-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-10-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:45:22 +0200
Message-ID: <CACO55tvWgRUnLsLY+d1-j3tjFQbOgzZzWszfNPjx0d1K+Smw5A@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 09/40] drm/nouveau/dispnv04/crtc: Demote
 non-conforming kernel-doc headers
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Fri, Apr 16, 2021 at 4:38 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:462: warning: Function parameter or member 'crtc' not described in 'nv_crtc_mode_set_regs'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:462: warning: Function parameter or member 'mode' not described in 'nv_crtc_mode_set_regs'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'crtc' not described in 'nv_crtc_mode_set'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'mode' not described in 'nv_crtc_mode_set'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'adjusted_mode' not described in 'nv_crtc_mode_set'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'x' not described in 'nv_crtc_mode_set'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'y' not described in 'nv_crtc_mode_set'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'old_fb' not described in 'nv_crtc_mode_set'
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> index f9e962fd94d0d..f9a276ea5a9e0 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -449,7 +449,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct drm_display_mode *mode)
>         regp->Attribute[NV_CIO_AR_CSEL_INDEX] = 0x00;
>  }
>
> -/**
> +/*
>   * Sets up registers for the given mode/adjusted_mode pair.
>   *
>   * The clocks, CRTCs and outputs attached to this CRTC must be off.
> @@ -625,7 +625,7 @@ nv_crtc_swap_fbs(struct drm_crtc *crtc, struct drm_framebuffer *old_fb)
>         return ret;
>  }
>
> -/**
> +/*
>   * Sets up registers for the given mode/adjusted_mode pair.
>   *
>   * The clocks, CRTCs and outputs attached to this CRTC must be off.
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
