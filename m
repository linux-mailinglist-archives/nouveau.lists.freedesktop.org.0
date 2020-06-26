Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AFD20BA81
	for <lists+nouveau@lfdr.de>; Fri, 26 Jun 2020 22:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BB68925B;
	Fri, 26 Jun 2020 20:47:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2C98925B
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jun 2020 20:47:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l17so9973834wmj.0
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jun 2020 13:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=/Ea+qLyapMjkqF8q416MXgoOYTiC3N65am0udhxrn5A=;
 b=PLVdSe4ayKx1lUKmV+XUNx1u98xGglABLuz4wQg8gbgePDgVEzPvvRx6iWpSgLOJGz
 iNZarICH6/QVOj61k0JQ/CaTq2MSRlaop7/7wINfjGIAuVYde5+gvWQjVGJKpjXB+Kmk
 0NuwsSwMIflanz+zYC/qPWqdm/G8PoQj3YVsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=/Ea+qLyapMjkqF8q416MXgoOYTiC3N65am0udhxrn5A=;
 b=CnPbM/1+rQvimPS6+QbzW3COqIwOXq58HXhLAazzDECfhCrM9DlXmF3VY+ngyAtFvW
 J5r5DzHSnghYGLw5115Y45cdMLd1rT7JFgyySnMsEZ7AUsEerlutY0FAuBy8dwao3KSu
 hd7RMdJ1OePAXO8vronLCVNnKXChfaowDtVVsIJVxLj2yWznRRjNvVhpllZq1fXwbVrH
 LU2peT+kwmZgM8jGx3w3HAyPmqqBn2fnSHA1WFUC0UO7f91mwZVJpkXKMC+YwpCHJOj4
 cKzCFAJmkBOTpuvU6R7pKJSYdCxHUEITE/NtxtFafB1O8oBmp4h2gIbrAFoC8pojqlej
 jLZA==
X-Gm-Message-State: AOAM532b8Zt6X3ajm3R2vshCndr/ZGZUg6h1CECKV3VMgvAC++khqBHA
 fSuKFaZQcYbA0dLKx3i3dTZLzg==
X-Google-Smtp-Source: ABdhPJx8Tto1cF8Id9IgyfYaYlK3h5do6M2mcNRScvbhep9L5XRc9KXOUP4W/mClPzUVKJO+DGwVaQ==
X-Received: by 2002:a7b:c403:: with SMTP id k3mr1452065wmi.35.1593204435910;
 Fri, 26 Jun 2020 13:47:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i17sm31758331wrc.34.2020.06.26.13.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 13:47:15 -0700 (PDT)
Date: Fri, 26 Jun 2020 22:47:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20200626204713.GG3278063@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20200624230318.126256-1-lyude@redhat.com>
 <20200624230318.126256-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624230318.126256-3-lyude@redhat.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Subject: Re: [Nouveau] [RFC v7 02/11] drm/vblank: Use spin_(un)lock_irq() in
 drm_crtc_vblank_off()
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

On Wed, Jun 24, 2020 at 07:03:09PM -0400, Lyude Paul wrote:
> This got me confused for a bit while looking over this code: I had been
> planning on adding some blocking function calls into this function, but
> seeing the irqsave/irqrestore variants of spin_(un)lock() didn't make it
> very clear whether or not that would actually be safe.
> =

> So I went ahead and reviewed every single driver in the kernel that uses
> this function, and they all fall into three categories:
> =

> * Driver probe code
> * ->atomic_disable() callbacks
> * Legacy modesetting callbacks
> =

> All of these will be guaranteed to have IRQs enabled, which means it's
> perfectly safe to block here. Just to make things a little less
> confusing to others in the future, let's switch over to
> spin_lock_irq()/spin_unlock_irq() to make that fact a little more
> obvious.
> =

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

I think the patch is correct, but now we're having a bit a inconsistency,
since all other functions where the same applies still use _irqsave. I
looked through the file and I think drm_vblank_get, drm_crtc_vblank_reset,
drm_crtc_vblank_on and drm_legacy_vblank_post_modeset,
drm_queue_vblank_event and drm_crtc_queue_sequence_ioctl are all candiates
for the same cleanup.

Maybe follow up patches for less confusion?

On this:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_vblank.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index ce5c1e1d29963..e895f5331fdb4 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1283,13 +1283,12 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>  	struct drm_pending_vblank_event *e, *t;
>  =

>  	ktime_t now;
> -	unsigned long irqflags;
>  	u64 seq;
>  =

>  	if (drm_WARN_ON(dev, pipe >=3D dev->num_crtcs))
>  		return;
>  =

> -	spin_lock_irqsave(&dev->event_lock, irqflags);
> +	spin_lock_irq(&dev->event_lock);
>  =

>  	spin_lock(&dev->vbl_lock);
>  	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
> @@ -1325,7 +1324,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>  		drm_vblank_put(dev, pipe);
>  		send_vblank_event(dev, e, seq, now);
>  	}
> -	spin_unlock_irqrestore(&dev->event_lock, irqflags);
> +	spin_unlock_irq(&dev->event_lock);
>  =

>  	/* Will be reset by the modeset helpers when re-enabling the crtc by
>  	 * calling drm_calc_timestamping_constants(). */
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
