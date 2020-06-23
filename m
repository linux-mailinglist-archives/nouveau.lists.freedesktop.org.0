Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9CC2056EA
	for <lists+nouveau@lfdr.de>; Tue, 23 Jun 2020 18:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9D56E9F5;
	Tue, 23 Jun 2020 16:17:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C6D6E9F7
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jun 2020 16:17:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l10so21174398wrr.10
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jun 2020 09:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=mtC3PJGWDMIcehgxPBpR+PLKV5Q1ssV6CDNH3+eOQLw=;
 b=AgZt1w4gGD2RpEAMlnkEkOstZUnDRyAAjz/EQMmp6yPl3Lis6UbhheQUte9x7A3Sl8
 INAAavAqBXoG8u813E9qRNezIwY3TA/qTfYzBEtibXtlJot3xHssjhseNF9Iko9zdxlZ
 gSBzxiH+ouRSdrfa366RTmwgZ2QRhz5Frxqn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=mtC3PJGWDMIcehgxPBpR+PLKV5Q1ssV6CDNH3+eOQLw=;
 b=BFXqELlQj271r5XLr8yBOBHs7UcO8UPIjnkDQ5C+0c53VDkvzc5CiI2V0/biFBLsSo
 ODMHQnCx4++r+gJlCBoWjijVYxOppbO0z500a/MYJVXUwZzRG6yr6dKrJomwTE5kR+UX
 CMSh2bMMRhcHYl4bkE+3Oa+2wGokgjGfsBig0ZCNdqgrPD8P5R0/2Wi9RIpmcj17/S5M
 9DY7mUsDBtDjVVVNCzfRL8+m6YXIFQHKJp0qxD2pas7tHdPU3ZuHtVax3Xohs9uh5JtJ
 l0hT/b51OwrO/28x7WFRSCngI+atIeHCs32cGBEsw7obZP6878LByVedCAfbxC9ZzqV/
 zwBg==
X-Gm-Message-State: AOAM53101kuu0ttkwivR6LDbrOJkHTpp0OI/gXJARKadhoFWEYdb7ZV+
 0+w1hyiVw2x13b66ebUJouULRQ==
X-Google-Smtp-Source: ABdhPJyWm7Jfm7MiyZs5D80QWQxf/J5hWl6QhbRvpHGCjtbEL/+fbiu5ejjrpoum+qf6AjPPBpCveg==
X-Received: by 2002:adf:e38d:: with SMTP id e13mr5383859wrm.304.1592929064445; 
 Tue, 23 Jun 2020 09:17:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y19sm4146273wmi.6.2020.06.23.09.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 09:17:43 -0700 (PDT)
Date: Tue, 23 Jun 2020 18:17:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20200623161741.GN20149@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20200622200730.120716-1-lyude@redhat.com>
 <20200622200730.120716-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622200730.120716-2-lyude@redhat.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Subject: Re: [Nouveau] [RFC v5 01/10] drm/vblank: Register drmm cleanup
 action once per drm_vblank_crtc
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
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jun 22, 2020 at 04:07:21PM -0400, Lyude Paul wrote:
> Since we'll be allocating resources for kthread_create_worker() in the
> next commit (which could fail and require us to clean up the mess),
> let's simplify the cleanup process a bit by registering a
> drm_vblank_init_release() action for each drm_vblank_crtc so they're
> still cleaned up if we fail to initialize one of them.
> =

> Changes since v3:
> * Use drmm_add_action_or_reset() - Daniel Vetter
> =

> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 85e5f2db16085..ce5c1e1d29963 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -492,16 +492,12 @@ static void vblank_disable_fn(struct timer_list *t)
>  =

>  static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
>  {
> -	unsigned int pipe;
> -
> -	for (pipe =3D 0; pipe < dev->num_crtcs; pipe++) {
> -		struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank =3D ptr;
>  =

> -		drm_WARN_ON(dev, READ_ONCE(vblank->enabled) &&
> -			    drm_core_check_feature(dev, DRIVER_MODESET));
> +	drm_WARN_ON(dev, READ_ONCE(vblank->enabled) &&
> +		    drm_core_check_feature(dev, DRIVER_MODESET));
>  =

> -		del_timer_sync(&vblank->disable_timer);
> -	}
> +	del_timer_sync(&vblank->disable_timer);
>  }
>  =

>  /**
> @@ -511,7 +507,7 @@ static void drm_vblank_init_release(struct drm_device=
 *dev, void *ptr)
>   *
>   * This function initializes vblank support for @num_crtcs display pipel=
ines.
>   * Cleanup is handled automatically through a cleanup function added with
> - * drmm_add_action().
> + * drmm_add_action_or_reset().
>   *
>   * Returns:
>   * Zero on success or a negative error code on failure.
> @@ -530,10 +526,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned=
 int num_crtcs)
>  =

>  	dev->num_crtcs =3D num_crtcs;
>  =

> -	ret =3D drmm_add_action(dev, drm_vblank_init_release, NULL);
> -	if (ret)
> -		return ret;
> -
>  	for (i =3D 0; i < num_crtcs; i++) {
>  		struct drm_vblank_crtc *vblank =3D &dev->vblank[i];
>  =

> @@ -542,6 +534,11 @@ int drm_vblank_init(struct drm_device *dev, unsigned=
 int num_crtcs)
>  		init_waitqueue_head(&vblank->queue);
>  		timer_setup(&vblank->disable_timer, vblank_disable_fn, 0);
>  		seqlock_init(&vblank->seqlock);
> +
> +		ret =3D drmm_add_action_or_reset(dev, drm_vblank_init_release,
> +					       vblank);
> +		if (ret)
> +			return ret;
>  	}
>  =

>  	return 0;

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -- =

> 2.26.2
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
