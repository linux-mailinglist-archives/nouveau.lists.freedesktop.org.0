Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D0F94E9A8
	for <lists+nouveau@lfdr.de>; Mon, 12 Aug 2024 11:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F58E10E174;
	Mon, 12 Aug 2024 09:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ORC2b1ta";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8D310E174
 for <nouveau@lists.freedesktop.org>; Mon, 12 Aug 2024 09:24:33 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2ef301eabe4so2955551fa.0
 for <nouveau@lists.freedesktop.org>; Mon, 12 Aug 2024 02:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723454671; x=1724059471; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zJwwC7NvxOGNPRdGhNuQnaArLNnaQ9jdbr05HbVMu2U=;
 b=ORC2b1talxqve8Qg67L/j0WSyFQ25x73yAl8ngKsPSgqsOhk+L2JsjWhDbb0Yhzu6w
 3yIOfwo+9fVRlwIhFrlx1S6c6ntkcK7GoGzk6cyxI9DHW+HHo1DAEzVvgZT3MLIpMP/G
 N+Yl5gnpxiOwzwv/Ih0AQ/xjreWWVEqkuqGfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723454671; x=1724059471;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zJwwC7NvxOGNPRdGhNuQnaArLNnaQ9jdbr05HbVMu2U=;
 b=l+PqjX29DG/GdlG+VzGehHO7JQUjJanoqjPQA1YoGua2PcD+liUxtEZuFK0vPYdTZc
 WBkDDq3HoenG9gexnnBpWy3C7j7M/9Tn27MZSp+dJEtMENTVY5c/lX5XfBDIqvutX78i
 Cg48J6gc3pO5Gb8la4UaKwf2DhcXF3/0HPj5ogsSheLFgWN0FrUTEFGFfIH5w60LlwzW
 moRf41KrJs84pqcB0zMgtfbyt0AAhn80spOv74fZAFjonyc2ASYYOLIWOiIUiSLrPVME
 ei0XNtDtWJabRDtqIm6HDTO48jnLmwRHGyaMfwjmSP4bd1+ysqgrnd6zfjcWzNYU0tXM
 FoSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXa1GYMcDrwu+DMEQY3fLUzeEujL5Qe0Il787Fz2oth9iZwVZP14XG/aMUo+MseppMBN0Z0nXZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOXNeIgCb2hB0Mw+eFsd/AeMFxFC8PdoQcKYyUc0l2CbUL8Azh
 UptAoO1IfWS1x73pfUUKTVJMMS8e0HkiQrKAJ39Td34SsgR4Lb/AX5MZgIB9Xws=
X-Google-Smtp-Source: AGHT+IFIOZStpf2467iNtxAQsVDRYlOTXLEPZ8JwWq8jWhJ0qLTHijtbjmSXUOTaE4pjzbGxfBSY1Q==
X-Received: by 2002:a05:6512:ac9:b0:52c:def2:d8af with SMTP id
 2adb3069b0e04-530eea09fc4mr3227266e87.4.1723454670928; 
 Mon, 12 Aug 2024 02:24:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb2136f5sm216211466b.179.2024.08.12.02.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 02:24:30 -0700 (PDT)
Date: Mon, 12 Aug 2024 11:24:28 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 2/9] drm/amdgpu: Do not set struct drm_driver.lastclose
Message-ID: <ZrnUzGX2n6aeEyTr@phenom.ffwll.local>
References: <20240812083000.337744-1-tzimmermann@suse.de>
 <20240812083000.337744-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812083000.337744-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.9.10-amd64 
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Aug 12, 2024 at 10:28:23AM +0200, Thomas Zimmermann wrote:
> Remove the implementation of struct drm_driver.lastclose. The hook
> was only necessary before in-kernel DRM clients existed, but is now
> obsolete. The code in amdgpu_driver_lastclose_kms() is performed by
> drm_lastclose().
> 
> v2:
> - update commit message
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  2 --
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 17 -----------------
>  3 files changed, 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 137a88b8de45..4baeb6519fda 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1484,7 +1484,6 @@ extern const int amdgpu_max_kms_ioctl;
>  
>  int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags);
>  void amdgpu_driver_unload_kms(struct drm_device *dev);
> -void amdgpu_driver_lastclose_kms(struct drm_device *dev);
>  int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
>  void amdgpu_driver_postclose_kms(struct drm_device *dev,
>  				 struct drm_file *file_priv);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 094498a0964b..5dd39e6c6223 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2953,7 +2953,6 @@ static const struct drm_driver amdgpu_kms_driver = {
>  	    DRIVER_SYNCOBJ_TIMELINE,
>  	.open = amdgpu_driver_open_kms,
>  	.postclose = amdgpu_driver_postclose_kms,
> -	.lastclose = amdgpu_driver_lastclose_kms,
>  	.ioctls = amdgpu_ioctls_kms,
>  	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
>  	.dumb_create = amdgpu_mode_dumb_create,
> @@ -2980,7 +2979,6 @@ const struct drm_driver amdgpu_partition_driver = {
>  	    DRIVER_SYNCOBJ_TIMELINE,
>  	.open = amdgpu_driver_open_kms,
>  	.postclose = amdgpu_driver_postclose_kms,
> -	.lastclose = amdgpu_driver_lastclose_kms,
>  	.ioctls = amdgpu_ioctls_kms,
>  	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
>  	.dumb_create = amdgpu_mode_dumb_create,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 66782be5917b..0a799942343d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1269,23 +1269,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>  	return 0;
>  }
>  
> -
> -/*
> - * Outdated mess for old drm with Xorg being in charge (void function now).
> - */
> -/**
> - * amdgpu_driver_lastclose_kms - drm callback for last close
> - *
> - * @dev: drm dev pointer
> - *
> - * Switch vga_switcheroo state after last close (all asics).
> - */
> -void amdgpu_driver_lastclose_kms(struct drm_device *dev)
> -{
> -	drm_fb_helper_lastclose(dev);
> -	vga_switcheroo_process_delayed_switch();
> -}
> -
>  /**
>   * amdgpu_driver_open_kms - drm callback for open
>   *
> -- 
> 2.46.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
