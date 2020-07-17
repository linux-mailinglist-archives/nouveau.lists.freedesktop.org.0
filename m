Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CE3224482
	for <lists+nouveau@lfdr.de>; Fri, 17 Jul 2020 21:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909A06E0CF;
	Fri, 17 Jul 2020 19:47:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2610D6E0CF
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jul 2020 19:47:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 88so1999945wrh.3
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jul 2020 12:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BJhqzrd3R5ryEgtDsZ4wv+6tBKnvjo/+t3MCHY6TAQ0=;
 b=VnEzasbpx0Ui95jfnNqXa6mJJCCnUgAiQ2SbyxZ72i07ktLNeghCrdtePA3Yfsxntp
 VGTPqFLjHBMuwB5qYjLmIv0KkCsfS3h92FP6/brhOUVSCFkexXJT2oR/lVZw/bRnouIc
 VZkyXvswQIkqJ0VCtz2EuRDJieV2gAU9uBPkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BJhqzrd3R5ryEgtDsZ4wv+6tBKnvjo/+t3MCHY6TAQ0=;
 b=ftZgMtl74ql3byrU3mmKww+kaDVNmEB1llvnP9M9rqd4RHCc+3hqRL2GloqQikdp9n
 7DIJZauWQvNFZJwL9NGV0E9HOazYYSBR46rnX27b1AdQKQyWlxoiI2vrGpGJFxi11stz
 wV1eDFb0Lv+z9kkY0jHol8UgASDE/s1h/p9D0CbJSVuMFoMNSTYA+q+pixoM6V+Eh9yx
 v2dRX1HppU48gUjPXbwKOCWMZsKTDmW5a+0TJLPABSz0m3buGtat+9DwsE5wYZklOd6d
 8NLLnM2JoGJbMV18fnE3MQqToVocRdObk2wJkSpLyaUS8D7ADeuUASZkwypufTi4qrfC
 gvIg==
X-Gm-Message-State: AOAM533YKNp9y7737x7wg1+5XYdIsrbJv/gkCTBhO5+JS3qw0XkRL8Hf
 eARGzTsq8MtM1lWKPgtBCngaiA==
X-Google-Smtp-Source: ABdhPJxoyTQJXMktadF78pgIkL8vwhBZWf76W9+/SfKCN0aK6eaJoEumTnH2qZgBSi4NnvxVRqa0nQ==
X-Received: by 2002:adf:e68f:: with SMTP id r15mr3428370wrm.196.1595015273744; 
 Fri, 17 Jul 2020 12:47:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w16sm17767440wrg.95.2020.07.17.12.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 12:47:53 -0700 (PDT)
Date: Fri, 17 Jul 2020 21:47:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: James Jones <jajones@nvidia.com>
Message-ID: <20200717194751.GS3278063@phenom.ffwll.local>
References: <20200717185757.2786-1-jajones@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717185757.2786-1-jajones@nvidia.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Accept 'legacy' format modifiers
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
Cc: Nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 11:57:57AM -0700, James Jones wrote:
> Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
> family of modifiers to handle broken userspace
> Xorg modesetting and Mesa drivers.
> 
> Tested with Xorg 1.20 modesetting driver,
> weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
> gnome & KDE wayland desktops from Ubuntu 18.04,
> and sway 1.5

Just bikeshed, but maybe a few more words on what exactly is broken and
how this works around it. Specifically why we only accept these, but don't
advertise them.

> 
> Signed-off-by: James Jones <jajones@nvidia.com>

Needs Fixes: line here. Also nice to mention the bug reporter/link.

> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 26 +++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 496c4621cc78..31543086254b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -191,8 +191,14 @@ nouveau_decode_mod(struct nouveau_drm *drm,
>  		   uint32_t *tile_mode,
>  		   uint8_t *kind)
>  {
> +	struct nouveau_display *disp = nouveau_display(drm->dev);
>  	BUG_ON(!tile_mode || !kind);
>  
> +	if ((modifier & (0xffull << 12)) == 0ull) {
> +		/* Legacy modifier.  Translate to this device's 'kind.' */
> +		modifier |= disp->format_modifiers[0] & (0xffull << 12);
> +	}

Hm I tried to understand what this magic does by looking at drm_fourcc.h,
but the drm_fourcc_canonicalize_nvidia_format_mod() in there implements
something else. Is that function wrong, or should we use it here instead?

Or is there something else going on entirely?

Cheers, Daniel

> +
>  	if (modifier == DRM_FORMAT_MOD_LINEAR) {
>  		/* tile_mode will not be used in this case */
>  		*tile_mode = 0;
> @@ -227,6 +233,16 @@ nouveau_framebuffer_get_layout(struct drm_framebuffer *fb,
>  	}
>  }
>  
> +static const u64 legacy_modifiers[] = {
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3),
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4),
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5),
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
>  static int
>  nouveau_validate_decode_mod(struct nouveau_drm *drm,
>  			    uint64_t modifier,
> @@ -247,8 +263,14 @@ nouveau_validate_decode_mod(struct nouveau_drm *drm,
>  	     (disp->format_modifiers[mod] != modifier);
>  	     mod++);
>  
> -	if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
> -		return -EINVAL;
> +	if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID) {
> +		for (mod = 0;
> +		     (legacy_modifiers[mod] != DRM_FORMAT_MOD_INVALID) &&
> +		     (legacy_modifiers[mod] != modifier);
> +		     mod++);
> +		if (legacy_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
> +			return -EINVAL;
> +	}
>  
>  	nouveau_decode_mod(drm, modifier, tile_mode, kind);
>  
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
