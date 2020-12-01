Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 972B92CA99B
	for <lists+nouveau@lfdr.de>; Tue,  1 Dec 2020 18:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF236E86B;
	Tue,  1 Dec 2020 17:27:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4506E842
 for <nouveau@lists.freedesktop.org>; Tue,  1 Dec 2020 17:27:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g14so3838253wrm.13
 for <nouveau@lists.freedesktop.org>; Tue, 01 Dec 2020 09:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4F7GIrKr1vSitlbzRhH7CJR5DFiYhTlR3eyhq6Rr0Xs=;
 b=e5EDI0loM+wstdqOwnsGPZJuhHfY1EGPNjVP3+j9BXU2WhvM2KE61UmyVliWiCctTI
 a0OQIRIav+L8IFpkqSTp8xMjR2uAUIgP7yMnVeyV8LHNC9L2GUdrLcRMTQgAPsPlvUUU
 QvMpLZ3MKnOCmLw9rqomM4ppuafySbdvjBrrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4F7GIrKr1vSitlbzRhH7CJR5DFiYhTlR3eyhq6Rr0Xs=;
 b=qxodk3khfo77CXL7uNZ1/Zu92tzg3JIj7p9k+Cln4IIKR9ta/CugJD6/3hrcwKOQk7
 P1D00OtPnt/Ax2vKXtKb7/GpnTbnwEyWKmbO25nxW/63GFdeSSUmUcYapBdum0GLa4/u
 ZvVucA6CHu12PDudufPwnCQZObCAKmEpZG/TFbcS8Bl3RMJc04pR1Yi1vPRf+iqydDQ6
 znA10DHngp+SviKWRSQ6HSClaAF23Kr3L4UWRWEfoX5BbjZi8kGqlJ4QT24zp7k58V2g
 2lKeq7/AfY9YDB8Dr9cYmcEMXM6hm3dUrSFDTDmRSBdHULN1NYS4m+Z8/qJJI6Me9H2B
 ah2w==
X-Gm-Message-State: AOAM531k3o1nMzeMC30CuuBJKXvGH4Lln1eO5VLG28GmFuj8NsxyGO7/
 W7bVGcQtbuAWrgiUbdG7yZIzVA==
X-Google-Smtp-Source: ABdhPJzLh/WNxS6a40svervdfVkLIaXd61rea3kRS8Y9E0gZxJwgZtgKJAi5HZnFTG8FXjQtGBk3vA==
X-Received: by 2002:adf:e84e:: with SMTP id d14mr5066602wrn.190.1606843662752; 
 Tue, 01 Dec 2020 09:27:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d16sm419732wrw.17.2020.12.01.09.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 09:27:42 -0800 (PST)
Date: Tue, 1 Dec 2020 18:27:40 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Message-ID: <20201201172740.GZ401619@phenom.ffwll.local>
References: <20201127163528.2221671-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127163528.2221671-1-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Nouveau] [PATCH RESEND] drm/nouveau: Drop mutex_lock_nested
 for atomic
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
Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Nov 27, 2020 at 05:35:28PM +0100, Daniel Vetter wrote:
> Purely conjecture, but I think the original locking inversion with the
> legacy page flip code between flipping and ttm's bo move function
> shoudn't exist anymore with atomic: With atomic the bo pinning and
> actual modeset commit is completely separated in the code patsh.
> 
> This annotation was originally added in
> 
> commit 060810d7abaabcab282e062c595871d661561400
> Author: Ben Skeggs <bskeggs@redhat.com>
> Date:   Mon Jul 8 14:15:51 2013 +1000
> 
>     drm/nouveau: fix locking issues in page flipping paths
> 
> due to
> 
> commit b580c9e2b7ba5030a795aa2fb73b796523d65a78
> Author: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> Date:   Thu Jun 27 13:48:18 2013 +0200
> 
>     drm/nouveau: make flipping lockdep safe
> 
> Acked-by: Ben Skeggs <bskeggs@redhat.com>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: nouveau@lists.freedesktop.org

I stuffed this one into drm-misc-next now.
-Daniel

> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 1386b0fc1640..43069dd8b027 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -774,7 +774,10 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
>  			return ret;
>  	}
>  
> -	mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> +	if (drm_drv_uses_atomic_modeset(drm->dev))
> +		mutex_lock(&cli->mutex);
> +	else
> +		mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
>  	ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, ctx->interruptible);
>  	if (ret == 0) {
>  		ret = drm->ttm.move(chan, bo, &bo->mem, new_reg);
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
