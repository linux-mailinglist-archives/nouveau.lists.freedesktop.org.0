Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9412626E798
	for <lists+nouveau@lfdr.de>; Thu, 17 Sep 2020 23:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B1E6E3C4;
	Thu, 17 Sep 2020 21:46:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A686E9EC
 for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2020 12:07:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c18so6624847wrm.9
 for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2020 05:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MGCPV3gxMGzqEc3cNJPEYSeaflc+Izh53Gg+hbi1Nhw=;
 b=D8Cn+LnzRzcwcAFRiK+P1SGw66Mhbu0VayIxxEwp3/Ke3uFcgTtEyg2O2TchfbyaU1
 /t1Jed/k7t8UhbtyHLBWwi9QGEEtHwtsdBVK0+CssfY95ypMsX9PNDgpg6PAhXIZmBww
 EM4H0+Gc3gntNd2KUdiNeLGf+3Tz2z1yDgJeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MGCPV3gxMGzqEc3cNJPEYSeaflc+Izh53Gg+hbi1Nhw=;
 b=QiCRAUGKusBlZgjcuIvj7eEmafaeC0bFmLaohLkOJL3Ycc6b93899bJop2V6nGYVog
 il1fCtRHRDtSFckOp+PXJkDMBHbI20hC8aUUjCAIEJsEsJvjRKfdDDO2LCIhW4UDAcFs
 PgD0usI8avXh4JpQHwaYIXz9Y/D+HUbXkd1ZCQUsQTqfp9jVF0pwdpee37nPC9/otjsd
 JSrmD9QkwaZdnPAKujgD60rcD2kb2W/wveKfUslQVP9s0JHl7KX3wicOnVhKbXhZ1euT
 bNtcwTvibjxvPcow1z4ExOltP1CF1vkntG7MYW5ZLim4sJV7Btpe9kikJq+6FkwQo5cn
 6iRQ==
X-Gm-Message-State: AOAM532IvxdY9NCZdMHSF5Y97gOj8RsoMxS695yPwvx+cN0YQqBZ23z0
 Ho4vKho08gmoUBtLkJ9HdiB4mg==
X-Google-Smtp-Source: ABdhPJwrWIpLSYf41av9bZsrjEfrlf4lf8//RpX+N0WUgXGOZN7ZDB+gPcHHEGIp6RA3wivQd9OHbQ==
X-Received: by 2002:a05:6000:1152:: with SMTP id
 d18mr26158129wrx.173.1600258057971; 
 Wed, 16 Sep 2020 05:07:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y2sm4834552wmg.23.2020.09.16.05.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 05:07:36 -0700 (PDT)
Date: Wed, 16 Sep 2020 14:07:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20200916120733.GN438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-14-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-Mailman-Approved-At: Thu, 17 Sep 2020 21:46:51 +0000
Subject: Re: [Nouveau] [PATCH v2 13/21] drm/rockchip: Convert to
 drm_gem_object_funcs
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
Cc: hamohammed.sa@gmail.com, heiko@sntech.de, andrey.grodzovsky@amd.com,
 airlied@linux.ie, nouveau@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 michal.simek@xilinx.com, eric@anholt.net, thierry.reding@gmail.com,
 robdclark@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 sumit.semwal@linaro.org, emil.velikov@collabora.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 oleksandr_andrushchenko@epam.com, tomi.valkeinen@ti.com,
 linux-tegra@vger.kernel.org, linux@armlinux.org.uk,
 patrik.r.jakobsson@gmail.com, linux-rockchip@lists.infradead.org,
 kgene@kernel.org, bskeggs@redhat.com, xen-devel@lists.xenproject.org,
 miaoqinglang@huawei.com, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, chunkuang.hu@kernel.org, andi.shyti@intel.com,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org, marek.olsak@amd.com,
 tianci.yin@amd.com, maarten.lankhorst@linux.intel.com,
 etnaviv@lists.freedesktop.org, jani.nikula@linux.intel.com,
 inki.dae@samsung.com, hdegoede@redhat.com, christian.gmeiner@gmail.com,
 linux-mediatek@lists.infradead.org, mripard@kernel.org, rodrigo.vivi@intel.com,
 matthias.bgg@gmail.com, evan.quan@amd.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com,
 amd-gfx@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 hyun.kwon@xilinx.com, rodrigosiqueiramelo@gmail.com, aaron.liu@amd.com,
 Felix.Kuehling@amd.com, xinhui.pan@amd.com, sw0312.kim@samsung.com,
 hjc@rock-chips.com, chris@chris-wilson.co.uk, kyungmin.park@samsung.com,
 nirmoy.das@amd.com, p.zabel@pengutronix.de, alexander.deucher@amd.com,
 Hawking.Zhang@amd.com, freedreno@lists.freedesktop.org,
 christian.koenig@amd.com, l.stach@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 04:59:50PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in rockchip. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c |  5 -----
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 10 ++++++++++
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index 0f3eb392fe39..b7654f5e4225 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -212,15 +212,10 @@ static const struct file_operations rockchip_drm_driver_fops = {
>  static struct drm_driver rockchip_drm_driver = {
>  	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.lastclose		= drm_fb_helper_lastclose,
> -	.gem_vm_ops		= &drm_gem_cma_vm_ops,
> -	.gem_free_object_unlocked = rockchip_gem_free_object,
>  	.dumb_create		= rockchip_gem_dumb_create,
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> -	.gem_prime_get_sg_table	= rockchip_gem_prime_get_sg_table,
>  	.gem_prime_import_sg_table	= rockchip_gem_prime_import_sg_table,
> -	.gem_prime_vmap		= rockchip_gem_prime_vmap,
> -	.gem_prime_vunmap	= rockchip_gem_prime_vunmap,
>  	.gem_prime_mmap		= rockchip_gem_mmap_buf,
>  	.fops			= &rockchip_drm_driver_fops,
>  	.name	= DRIVER_NAME,
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> index 0055d86576f7..bddc7d99efe3 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -296,6 +296,14 @@ static void rockchip_gem_release_object(struct rockchip_gem_object *rk_obj)
>  	kfree(rk_obj);
>  }
>  
> +static const struct drm_gem_object_funcs rockchip_gem_object_funcs = {
> +	.free = rockchip_gem_free_object,
> +	.get_sg_table = rockchip_gem_prime_get_sg_table,
> +	.vmap = rockchip_gem_prime_vmap,
> +	.vunmap	= rockchip_gem_prime_vunmap,
> +	.vm_ops = &drm_gem_cma_vm_ops,
> +};
> +
>  static struct rockchip_gem_object *
>  	rockchip_gem_alloc_object(struct drm_device *drm, unsigned int size)
>  {
> @@ -310,6 +318,8 @@ static struct rockchip_gem_object *
>  
>  	obj = &rk_obj->base;
>  
> +	obj->funcs = &rockchip_gem_object_funcs;
> +
>  	drm_gem_object_init(drm, obj, size);
>  
>  	return rk_obj;
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
