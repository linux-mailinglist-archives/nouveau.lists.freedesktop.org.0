Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8284294E9AF
	for <lists+nouveau@lfdr.de>; Mon, 12 Aug 2024 11:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE8210E180;
	Mon, 12 Aug 2024 09:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="iAUxludA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B25B10E177
 for <nouveau@lists.freedesktop.org>; Mon, 12 Aug 2024 09:25:36 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5a22874fcfdso401562a12.0
 for <nouveau@lists.freedesktop.org>; Mon, 12 Aug 2024 02:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723454735; x=1724059535; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+EKxL1/47sodejJjaqoXjSAf+cZ+hrNQYLGyG3cxXzg=;
 b=iAUxludArknN0Ca6kUfp7E0C3DcSRuJzvOlZcZs4Qp9Bll9AqFCt0yT4EUjtAQMeTO
 DiyfI8j6t295cn21vRmD59wuGEv75rNkm20VlXz1JTTpP3o0IAialCXKEAAmEWwfFbCK
 ANOokXF5Fcm1Whl4EjOI9JR7vRVpbKmTMAP8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723454735; x=1724059535;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+EKxL1/47sodejJjaqoXjSAf+cZ+hrNQYLGyG3cxXzg=;
 b=hYID3j9XDZ3f22k5Ofauctga8JvnR1Vmylu040zJksYKFz2QoloolinDcZtOVC19Df
 32wPYYfUFyS0q2f9csHdx57g5k1cT+qpMB9TtmWZBDnHXcKaMsKu9Qf7sGEV9fBUVGxT
 iW68m960bPLKJ0I515XkGwx27zdIhqlRXc2mnEMzJfEsyk/CbmTaozyoiY/rUeuQQEX7
 kMKgsgrWY5UAeJTNIdDKSs/RXoQIQ/b174iYeQXdxQLDBEa4CLGo9MFj2xdV36qRiCmD
 ELKzmKRwcHtLzHF1gS+LZoVTguQkwM2gdJVYb68DRNZSj6JFic/VJx+hhWwhOKe7vfz1
 7tuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSFrIPBHOUV9wlHPS8BqREXV3WKkuQ4KT7YHMza9KI4o1W9OPw8xhguwREZj6DD3hFRwRIFuxm9H8rn4WKZIuP96LEt9pMA5Ee75XXAg==
X-Gm-Message-State: AOJu0YyMi+wdvFmA+kedwWeGgsW2JXBmxrbBMG1yaACSU63FJy1FC4O3
 HkiuugSnjwnZJTogmjuzsWFt6EgaOjBhzuuSLzdz3i5YiErcr5HeF187PiehzVo=
X-Google-Smtp-Source: AGHT+IGpudpMYH9QESIjjsQEfI2/XjQRwbJopknCIvaUuJwRrrdZn34veUpw9B7DpRZR8Vj2FVDIQw==
X-Received: by 2002:a17:906:d155:b0:a80:b63b:eba0 with SMTP id
 a640c23a62f3a-a80b63bf2fbmr251450066b.4.1723454734475; 
 Mon, 12 Aug 2024 02:25:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb243c3dsm215340566b.225.2024.08.12.02.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 02:25:34 -0700 (PDT)
Date: Mon, 12 Aug 2024 11:25:31 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 6/9] drm/fbdev-helper: Update documentation on
 obsolete callbacks
Message-ID: <ZrnVCzdTsNQz4KQi@phenom.ffwll.local>
References: <20240812083000.337744-1-tzimmermann@suse.de>
 <20240812083000.337744-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812083000.337744-7-tzimmermann@suse.de>
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

On Mon, Aug 12, 2024 at 10:28:27AM +0200, Thomas Zimmermann wrote:
> The old callbacks lastclose and output_poll_changed are deprecated and
> unused. Remove them from the documentation.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 3f7da78849e4..fe5667477839 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -89,14 +89,6 @@ static DEFINE_MUTEX(kernel_fb_helper_lock);
>   * interfaces. Drivers that use one of the shared memory managers, TTM, SHMEM,
>   * DMA, should instead use the corresponding fbdev emulation.
>   *
> - * Existing fbdev implementations should restore the fbdev console by using
> - * drm_fb_helper_lastclose() as their &drm_driver.lastclose callback.
> - * They should also notify the fb helper code from updates to the output
> - * configuration by using drm_fb_helper_output_poll_changed() as their
> - * &drm_mode_config_funcs.output_poll_changed callback. New implementations
> - * of fbdev should be build on top of struct &drm_client_funcs, which handles
> - * this automatically. Setting the old callbacks should be avoided.
> - *
>   * For suspend/resume consider using drm_mode_config_helper_suspend() and
>   * drm_mode_config_helper_resume() which takes care of fbdev as well.
>   *
> @@ -260,12 +252,12 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
>   * drm_fb_helper_restore_fbdev_mode_unlocked - restore fbdev configuration
>   * @fb_helper: driver-allocated fbdev helper, can be NULL
>   *
> - * This should be called from driver's drm &drm_driver.lastclose callback
> - * when implementing an fbcon on top of kms using this helper. This ensures that
> - * the user isn't greeted with a black screen when e.g. X dies.
> + * This helper should be called from fbdev emulation's &drm_client_funcs.restore
> + * callback. It ensures that the user isn't greeted with a black screen when the
> + * userspace compositor releases the display device.
>   *
> - * RETURNS:
> - * Zero if everything went ok, negative error code otherwise.
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
>   */
>  int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
>  {
> @@ -2003,8 +1995,8 @@ EXPORT_SYMBOL(drm_fb_helper_hotplug_event);
>   * drm_fb_helper_lastclose - DRM driver lastclose helper for fbdev emulation
>   * @dev: DRM device
>   *
> - * This function can be used as the &drm_driver->lastclose callback for drivers
> - * that only need to call drm_fb_helper_restore_fbdev_mode_unlocked().
> + * This function is obsolete. Call drm_fb_helper_restore_fbdev_mode_unlocked()
> + * instead.
>   */
>  void drm_fb_helper_lastclose(struct drm_device *dev)
>  {
> -- 
> 2.46.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
