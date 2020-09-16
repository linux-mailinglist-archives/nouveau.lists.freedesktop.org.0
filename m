Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EED26B9E5
	for <lists+nouveau@lfdr.de>; Wed, 16 Sep 2020 04:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11E66E95D;
	Wed, 16 Sep 2020 02:22:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439396E109;
 Tue, 15 Sep 2020 15:55:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FA56276;
 Tue, 15 Sep 2020 17:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1600185256;
 bh=XzPEATglwb8mJLD0DYu0V5mnVt9Rmyb4GFF3M0n1BQw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k/TxRWDwAUeEA/mxOqDGy3dXpqZvHw1rgu/hfc6AZ+2kJHV8nY1aZQ1niwJxXM2on
 uMm8kF40aJQq8Y3LJa+B/xGzPCzryGwMdT5H5oWYJQ48rRZEb8n/CrAkn0VvMZEJAK
 zd/EMFYW53+dug8ySJGu6EPKXShM0dS8ZH8bQ3S8=
Date: Tue, 15 Sep 2020 18:53:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20200915155346.GA26029@pendragon.ideasonboard.com>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-21-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-21-tzimmermann@suse.de>
X-Mailman-Approved-At: Wed, 16 Sep 2020 02:22:34 +0000
Subject: Re: [Nouveau] [PATCH v2 20/21] drm/xlnx: Initialize DRM driver
 instance with CMA helper macro
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
 intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 chunkuang.hu@kernel.org, andi.shyti@intel.com, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, marek.olsak@amd.com, tianci.yin@amd.com,
 maarten.lankhorst@linux.intel.com, etnaviv@lists.freedesktop.org,
 jani.nikula@linux.intel.com, inki.dae@samsung.com, hdegoede@redhat.com,
 christian.gmeiner@gmail.com, linux-mediatek@lists.infradead.org,
 mripard@kernel.org, rodrigo.vivi@intel.com, matthias.bgg@gmail.com,
 evan.quan@amd.com, sean@poorly.run, linux-arm-kernel@lists.infradead.org,
 tvrtko.ursulin@linux.intel.com, amd-gfx@lists.freedesktop.org,
 chris@chris-wilson.co.uk, hyun.kwon@xilinx.com, rodrigosiqueiramelo@gmail.com,
 aaron.liu@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, miaoqinglang@huawei.com,
 kyungmin.park@samsung.com, nirmoy.das@amd.com, p.zabel@pengutronix.de,
 alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com,
 l.stach@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Thomas,

Thank you for the patch.

On Tue, Sep 15, 2020 at 04:59:57PM +0200, Thomas Zimmermann wrote:
> The xlnx driver uses CMA helpers with default callback functions.
> Initialize the driver structure with the rsp CMA helper macro. The
> driver is being converted to use GEM object functions as part of
> this change.
> 
> Two callbacks, .dumb_destroy and .gem_prime_import, were initialized
> to their default implementations, so they are just kept empty now.
> 
> v2:
> 	* initialize with DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE (Laurent)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index 8e69303aad3f..f3ffc3703a0e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -80,19 +80,7 @@ static struct drm_driver zynqmp_dpsub_drm_driver = {
>  	.driver_features		= DRIVER_MODESET | DRIVER_GEM |
>  					  DRIVER_ATOMIC,
>  
> -	.prime_handle_to_fd		= drm_gem_prime_handle_to_fd,
> -	.prime_fd_to_handle		= drm_gem_prime_fd_to_handle,
> -	.gem_prime_export		= drm_gem_prime_export,
> -	.gem_prime_import		= drm_gem_prime_import,
> -	.gem_prime_get_sg_table		= drm_gem_cma_prime_get_sg_table,
> -	.gem_prime_import_sg_table	= drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_vmap			= drm_gem_cma_prime_vmap,
> -	.gem_prime_vunmap		= drm_gem_cma_prime_vunmap,
> -	.gem_prime_mmap			= drm_gem_cma_prime_mmap,
> -	.gem_free_object_unlocked	= drm_gem_cma_free_object,
> -	.gem_vm_ops			= &drm_gem_cma_vm_ops,
> -	.dumb_create			= zynqmp_dpsub_dumb_create,
> -	.dumb_destroy			= drm_gem_dumb_destroy,
> +	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(zynqmp_dpsub_dumb_create),
>  
>  	.fops				= &zynqmp_dpsub_drm_fops,
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
