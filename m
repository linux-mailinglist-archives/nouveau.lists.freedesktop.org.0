Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799105B3EC7
	for <lists+nouveau@lfdr.de>; Fri,  9 Sep 2022 20:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D52910ED90;
	Fri,  9 Sep 2022 18:25:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E0010ED8C
 for <nouveau@lists.freedesktop.org>; Fri,  9 Sep 2022 18:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662747896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vKgo9kNM9lmshPVUg8AZgq6yhDB1kDXUMjrFxdhRiKI=;
 b=Jsuh4ox/O8h34SeoTAaBh/fnu+AhFyECUApDet8blbRVMItF1GVtpMoG6GNOfy5Aw/IT4I
 5LcLVnlpEnmPG/7y2JQq8agsBDp6CKHwIgcmcthGGW9yrhOcM24bCtuPUEfKNa8F8QSwID
 fVqOWevdcR0mYGQ1rAxyiFMCe5Z1XCY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-FQaWhtEWMUm8Kd2NzhC8Jw-1; Fri, 09 Sep 2022 14:24:55 -0400
X-MC-Unique: FQaWhtEWMUm8Kd2NzhC8Jw-1
Received: by mail-qv1-f72.google.com with SMTP id
 e19-20020ad44433000000b004aaa7d00846so1798515qvt.0
 for <nouveau@lists.freedesktop.org>; Fri, 09 Sep 2022 11:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=vKgo9kNM9lmshPVUg8AZgq6yhDB1kDXUMjrFxdhRiKI=;
 b=AXeLTL/+vCsS5Avv/Aw2kmudnz1Rj0qssc3t5AzBuWfG9JyA3cF8DXnetQhAbqLnJJ
 5L31atbtW5CBuL1nszbSmcDc+IkfDTY35qk64GiMAfB3WaOJ5wcZuaSGPxzy1FYyHHYg
 XWRF5P6PMHkV6jGue9LbYVK3EHHDEAy7KAhi6VG1R456CTnUxzFLOYcnpiZHRpNzfKcS
 razW/K6syyU4+9GpBj/clf55J+ii8xq2hZKv8xVR54arhmaNQzuYtxs3uN6nq54CEYht
 ICNKYyyCb1AAunk8Ev4pIPVdEchNC5KT8dbMpzhioxjuMr2td2SGM9fCyIVsJ9pA9kK3
 86tA==
X-Gm-Message-State: ACgBeo30Yu3hNRU1xRT3s41JGbYakYhcvi2O7BcQpmOfcotAVSHclAc7
 T2Ob5YcN9eKrUjZxX1aBJpcNZZQJVedbaHwQr5lxBSwnM77L89/d+N0SVbxiboDp5CD5gOSibq0
 Dy4GO4g66RdU6OhdPaCdvQsZq+A==
X-Received: by 2002:a05:6214:29c7:b0:499:1500:4e3 with SMTP id
 gh7-20020a05621429c700b00499150004e3mr13309425qvb.26.1662747892184; 
 Fri, 09 Sep 2022 11:24:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7cVG6TZNwwhy926yFDbk2krn0djleQ/6MP15a8oPipRlK43GgxnwTDMH7Q9LinSgE91f7WoA==
X-Received: by 2002:a05:6214:29c7:b0:499:1500:4e3 with SMTP id
 gh7-20020a05621429c700b00499150004e3mr13309402qvb.26.1662747891925; 
 Fri, 09 Sep 2022 11:24:51 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00::9e6? ([2600:4040:5c48:e00::9e6])
 by smtp.gmail.com with ESMTPSA id
 bk38-20020a05620a1a2600b006b5d9a1d326sm884388qkb.83.2022.09.09.11.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 11:24:51 -0700 (PDT)
Message-ID: <38f7cab30c2a7efb9eb324fee0ae3ba7e806ba0a.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie, 
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, 
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 jyri.sarha@iki.fi, tomba@kernel.org, sam@ravnborg.org
Date: Fri, 09 Sep 2022 14:24:50 -0400
In-Reply-To: <20220909105947.6487-2-tzimmermann@suse.de>
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-2-tzimmermann@suse.de>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH 1/4] drm/plane: Remove drm_plane_init()
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
Cc: linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>
for common and nouveau bits

On Fri, 2022-09-09 at 12:59 +0200, Thomas Zimmermann wrote:
> Open-code drm_plane_init() and remove the function from DRM. The
> implementation of drm_plane_init() is a simple wrapper around a call
> to drm_universal_plane_init(), so drivers can just use that instead.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_modeset_helper.c       |  3 +-
>  drivers/gpu/drm/drm_plane.c                | 32 ----------------------
>  drivers/gpu/drm/nouveau/dispnv04/overlay.c | 13 +++++----
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c |  7 +++--
>  drivers/gpu/drm/tilcdc/tilcdc_plane.c      |  9 +++---
>  include/drm/drm_plane.h                    |  8 +-----
>  6 files changed, 17 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
> index bd609a978848..611dd01fb604 100644
> --- a/drivers/gpu/drm/drm_modeset_helper.c
> +++ b/drivers/gpu/drm/drm_modeset_helper.c
> @@ -100,8 +100,7 @@ EXPORT_SYMBOL(drm_helper_mode_fill_fb_struct);
>   * This is the minimal list of formats that seem to be safe for modeset use
>   * with all current DRM drivers.  Most hardware can actually support more
>   * formats than this and drivers may specify a more accurate list when
> - * creating the primary plane.  However drivers that still call
> - * drm_plane_init() will use this minimal format list as the default.
> + * creating the primary plane.
>   */
>  static const uint32_t safe_modeset_formats[] = {
>  	DRM_FORMAT_XRGB8888,
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 726f2f163c26..0f14b4d3bb10 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -482,38 +482,6 @@ void drm_plane_unregister_all(struct drm_device *dev)
>  	}
>  }
>  
> -/**
> - * drm_plane_init - Initialize a legacy plane
> - * @dev: DRM device
> - * @plane: plane object to init
> - * @possible_crtcs: bitmask of possible CRTCs
> - * @funcs: callbacks for the new plane
> - * @formats: array of supported formats (DRM_FORMAT\_\*)
> - * @format_count: number of elements in @formats
> - * @is_primary: plane type (primary vs overlay)
> - *
> - * Legacy API to initialize a DRM plane.
> - *
> - * New drivers should call drm_universal_plane_init() instead.
> - *
> - * Returns:
> - * Zero on success, error code on failure.
> - */
> -int drm_plane_init(struct drm_device *dev, struct drm_plane *plane,
> -		   uint32_t possible_crtcs,
> -		   const struct drm_plane_funcs *funcs,
> -		   const uint32_t *formats, unsigned int format_count,
> -		   bool is_primary)
> -{
> -	enum drm_plane_type type;
> -
> -	type = is_primary ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
> -	return drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
> -					formats, format_count,
> -					NULL, type, NULL);
> -}
> -EXPORT_SYMBOL(drm_plane_init);
> -
>  /**
>   * drm_plane_cleanup - Clean up the core plane usage
>   * @plane: plane to cleanup
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> index 37e63e98cd08..33f29736024a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> @@ -296,9 +296,10 @@ nv10_overlay_init(struct drm_device *device)
>  		break;
>  	}
>  
> -	ret = drm_plane_init(device, &plane->base, 3 /* both crtc's */,
> -			     &nv10_plane_funcs,
> -			     formats, num_formats, false);
> +	ret = drm_universal_plane_init(device, &plane->base, 3 /* both crtc's */,
> +				       &nv10_plane_funcs,
> +				       formats, num_formats, NULL,
> +				       DRM_PLANE_TYPE_OVERLAY, NULL);
>  	if (ret)
>  		goto err;
>  
> @@ -475,9 +476,9 @@ nv04_overlay_init(struct drm_device *device)
>  	if (!plane)
>  		return;
>  
> -	ret = drm_plane_init(device, &plane->base, 1 /* single crtc */,
> -			     &nv04_plane_funcs,
> -			     formats, 2, false);
> +	ret = drm_universal_plane_init(device, &plane->base, 1 /* single crtc */,
> +				       &nv04_plane_funcs, formats, 2, NULL,
> +				       DRM_PLANE_TYPE_OVERLAY, NULL);
>  	if (ret)
>  		goto err;
>  
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
> index 54228424793a..6c5f0cbe7d95 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
> @@ -252,9 +252,10 @@ int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index)
>  	splane->index = index;
>  	splane->alpha = 255;
>  
> -	ret = drm_plane_init(sdev->ddev, &splane->plane, 1,
> -			     &shmob_drm_plane_funcs, formats,
> -			     ARRAY_SIZE(formats), false);
> +	ret = drm_universal_plane_init(sdev->ddev, &splane->plane, 1,
> +				       &shmob_drm_plane_funcs,
> +				       formats, ARRAY_SIZE(formats), NULL,
> +				       DRM_PLANE_TYPE_OVERLAY, NULL);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> index 0ccf791301cb..cf77a8ce7398 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> @@ -105,11 +105,10 @@ int tilcdc_plane_init(struct drm_device *dev,
>  	struct tilcdc_drm_private *priv = dev->dev_private;
>  	int ret;
>  
> -	ret = drm_plane_init(dev, plane, 1,
> -			     &tilcdc_plane_funcs,
> -			     priv->pixelformats,
> -			     priv->num_pixelformats,
> -			     true);
> +	ret = drm_universal_plane_init(dev, plane, 1, &tilcdc_plane_funcs,
> +				       priv->pixelformats,
> +				       priv->num_pixelformats,
> +				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
>  	if (ret) {
>  		dev_err(dev->dev, "Failed to initialize plane: %d\n", ret);
>  		return ret;
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 89ea54652e87..910cb941f3d5 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -631,7 +631,7 @@ struct drm_plane {
>  	unsigned int format_count;
>  	/**
>  	 * @format_default: driver hasn't supplied supported formats for the
> -	 * plane. Used by the drm_plane_init compatibility wrapper only.
> +	 * plane. Used by the non-atomic driver compatibility wrapper only.
>  	 */
>  	bool format_default;
>  
> @@ -762,12 +762,6 @@ int drm_universal_plane_init(struct drm_device *dev,
>  			     const uint64_t *format_modifiers,
>  			     enum drm_plane_type type,
>  			     const char *name, ...);
> -int drm_plane_init(struct drm_device *dev,
> -		   struct drm_plane *plane,
> -		   uint32_t possible_crtcs,
> -		   const struct drm_plane_funcs *funcs,
> -		   const uint32_t *formats, unsigned int format_count,
> -		   bool is_primary);
>  void drm_plane_cleanup(struct drm_plane *plane);
>  
>  __printf(10, 11)

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

