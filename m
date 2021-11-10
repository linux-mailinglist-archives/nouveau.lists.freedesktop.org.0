Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D40844C602
	for <lists+nouveau@lfdr.de>; Wed, 10 Nov 2021 18:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBF46EC30;
	Wed, 10 Nov 2021 17:33:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FE26EC30
 for <nouveau@lists.freedesktop.org>; Wed, 10 Nov 2021 17:33:52 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id m14so13879415edd.0
 for <nouveau@lists.freedesktop.org>; Wed, 10 Nov 2021 09:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gvkjzwwH9wCeM8xIUwXDr0jc0H1EZZRPrN5X5UOqwyo=;
 b=OSZt8HsjMglhaoCXrvxjpBuzZ6gwWrfbKIVkXAELfONxhHncp1AyBdpSLRINDxVGtN
 HDuF0/JyxevP3fUp+aa9cvFhxXL6B1/9TPSTRQwkxqxl8ws2AH83EBl0c6GE/5D9jeD2
 9cdiOzmvwdIZGYsB3UzlSRc0XfCXQmix+LXyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gvkjzwwH9wCeM8xIUwXDr0jc0H1EZZRPrN5X5UOqwyo=;
 b=krvIduQwYHIPdRvdCEj7rh6JaG0Hh63ZeH8g+EXGZ8rFFA93OeMkv752oHZHHIKe9l
 Uqo3Dv4gpliK+zYLm5TW7SWGitffFcwz+2+7KHPpconLeNfapz0BTejG/w6jgR6ZF4yu
 Huo0/pIKD9L3An2tp2bdln3P3bE7MGCUtoWqsoplBr2ZWkzFMvo+4IWXQXzjSaSHuGIf
 5JHRsRxqKjLSkOuJwnEZajLq2IZG2TDVPDztUstai7RHfHnJyH9NvfuJAaJVWl9fb8Eg
 xsV8k9bl9NYaK14+W3rqSO+RwVpaDbknKemedhGke+i50IAyQ35kNKxPs/DcGtJPqL+S
 uF9A==
X-Gm-Message-State: AOAM530gfzvrssNmZlxHf5Ws5WVlw8LtreJqsKEHs4barNcKWCHN5CMB
 zzAg4wclNeXHlukKzTlPcAvkZA==
X-Google-Smtp-Source: ABdhPJypJbNYnKe5aXd7d7+Gi1dyeD7DSsTZuaua43rNJOTbSoleAHbGitAWrvXev37dsfYz8GnSMw==
X-Received: by 2002:a17:906:2a06:: with SMTP id
 j6mr935983eje.401.1636565630533; 
 Wed, 10 Nov 2021 09:33:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u14sm237771edj.74.2021.11.10.09.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 09:33:50 -0800 (PST)
Date: Wed, 10 Nov 2021 18:33:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <YYwCfCaANDHsVRfR@phenom.ffwll.local>
References: <20211110133157.553251-1-kherbst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110133157.553251-1-kherbst@redhat.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Subject: Re: [Nouveau] [PATCH] MAINTAINERS: update information for nouveau
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 02:31:57PM +0100, Karol Herbst wrote:
> Some side notes on this. Atm we do want to use gitlab for bug tracking and
> merge requests. But due to the nature of the current linux kernel
> development, we can only do so for nouveau internal changes.
> 
> Everything else still needs to be sent as emails and this is also includes
> changes to UAPI etc.
> 
> Anyway, if somebody wants to submit patches via gitlab, they are free to
> do so and this should just make this more official and documented.
> 
> People listed as maintainers are such that have push access to drm-misc
> (where changes are pushed to after landing in gitlab) and are known
> nouveau developers.
> We did this already for some trivial changes and critical bug fixes
> already, we just weren't thinking about updating the MAINTAINERS file.
> 
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Karol Herbst <kherbst@redhat.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  MAINTAINERS | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8805df335326..270dc9c0a427 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5961,10 +5961,17 @@ F:	drivers/gpu/drm/panel/panel-novatek-nt36672a.c
>  
>  DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
>  M:	Ben Skeggs <bskeggs@redhat.com>
> +M:	Karol Herbst <kherbst@redhat.com>
> +M:	Lyude Paul <lyude@redhat.com>
>  L:	dri-devel@lists.freedesktop.org
>  L:	nouveau@lists.freedesktop.org
>  S:	Supported
> -T:	git git://github.com/skeggsb/linux
> +W:	https://nouveau.freedesktop.org/
> +Q:	https://patchwork.freedesktop.org/project/nouveau/
> +Q:	https://gitlab.freedesktop.org/drm/nouveau/-/merge_requests
> +B:	https://gitlab.freedesktop.org/drm/nouveau/-/issues
> +C:	irc://irc.oftc.net/nouveau
> +T:	git https://gitlab.freedesktop.org/drm/nouveau.git
>  F:	drivers/gpu/drm/nouveau/
>  F:	include/uapi/drm/nouveau_drm.h
>  
> -- 
> 2.33.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
