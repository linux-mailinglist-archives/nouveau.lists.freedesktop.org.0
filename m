Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573D294CC86
	for <lists+nouveau@lfdr.de>; Fri,  9 Aug 2024 10:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F3210E113;
	Fri,  9 Aug 2024 08:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HfKIy2xj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31EE10E871
 for <nouveau@lists.freedesktop.org>; Fri,  9 Aug 2024 08:45:03 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a7aa74d1ab8so22065466b.1
 for <nouveau@lists.freedesktop.org>; Fri, 09 Aug 2024 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723193102; x=1723797902; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0WBytM7wTzhcJvPtcOmfU4gEIFq5KXn99Y+uSV4J+Qg=;
 b=HfKIy2xjOHzbs35TaXT3pSbIZMuSdLa9Rwd3mwnkvKOD72two9cirkJudr2w8i/Owk
 2iK5KCwv4ysqildXoT1dV6Wr4zWieQQ/+TL0x5VZsYEl9QbEb/ppMClpdYqXniq7YuBk
 TZ33VCK+w9/92eGpJkN7z6qOh+2VwVtwGEc1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723193102; x=1723797902;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0WBytM7wTzhcJvPtcOmfU4gEIFq5KXn99Y+uSV4J+Qg=;
 b=SW7f0zndBw7XtZqhCWVk5TFL45CCQMjEVjsr7PcTLqpUzaeF43PRQq0DvUzmI8gNW3
 sLMc6jGzYLMy1BVE72Jk+HYOl0opquhKZLSUVdwk2Sc8VQoaNMoLu1kXa6HMIxfIkpQ0
 kMyL9CHUiEPZ3aOi8kNkJb+3j4rrdrEqyaM+U//SVS28uz622niZZaGjrYgsa+ScxhB3
 J/m7MSd94gY/CnM+QUkb0jzuxqdi4RWNxaqIy39nvRbjzSaKxsgut5u+BwYUgY6Qtq8U
 mi1cNbV4SsYCmYh/O+ggDF3rpcla1YKfxnPF4ZcN8MkiMxAuVzjW2M8BrJciaSIoM/Py
 U5lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUli59kKuujyd5WriZtxw32GR7Dzyav60a+JhtZxbpquQfAyAZqg1E2tdUaIoW6J9yXBb0Og81k@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPMowKRP9eHYx4e0k5XnWBrig5KqFaHNVi2DcktbexOthpxM9y
 k3nfhPiU+zQBbfrIP9Td1Fv5wPUpwc1WU5LFe163EQ8B9wPVk4E3IvckOgZPdP0=
X-Google-Smtp-Source: AGHT+IGCRut9FWqfZ7C0QLGHRt+8oBGMHo6MzHx1/mYIiCCd2plQ8yWa0/xYu+IH/8DHvY1nJCE9Qg==
X-Received: by 2002:a17:907:7242:b0:a7a:a3ad:6007 with SMTP id
 a640c23a62f3a-a80aa677686mr35616366b.8.1723193101599; 
 Fri, 09 Aug 2024 01:45:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d43777sm814854366b.136.2024.08.09.01.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 01:45:01 -0700 (PDT)
Date: Fri, 9 Aug 2024 10:44:58 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/8] drm/fbdev-helper: Do delayed switcheroo in lastclose
 helper
Message-ID: <ZrXXCkyIrUDu0qVr@phenom.ffwll.local>
References: <20240807084539.304014-1-tzimmermann@suse.de>
 <20240807084539.304014-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807084539.304014-2-tzimmermann@suse.de>
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

On Wed, Aug 07, 2024 at 10:41:33AM +0200, Thomas Zimmermann wrote:
> Amdgpu and nouveau call vga_switcheroo_process_delayed_switch() from
> their lastclose callbacks. Call it from the fbdev lastclose helper,
> so that the driver functions can finally be removed.
> 
> The fbdev call is part of all lastclose handling that restores the
> DRM fbcon terminal. Only PCI devices with enabled switcheroo do the
> delayed switching. The call has no effect on other drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 3f7da78849e4..f6667dfba8a2 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2009,6 +2009,10 @@ EXPORT_SYMBOL(drm_fb_helper_hotplug_event);
>  void drm_fb_helper_lastclose(struct drm_device *dev)
>  {
>  	drm_fb_helper_restore_fbdev_mode_unlocked(dev->fb_helper);
> +
> +	if (dev_is_pci(dev->dev))
> +		vga_switcheroo_process_delayed_switch();

I think if you want to move this, it needs to be in drm core. Otherwise
the vgaswitcheroo delayed switching stops working if you disable fbdev
support. Which doesn't make much sense.
-Sima

> +
>  }
>  EXPORT_SYMBOL(drm_fb_helper_lastclose);
>  
> -- 
> 2.46.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
