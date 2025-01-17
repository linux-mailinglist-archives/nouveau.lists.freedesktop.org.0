Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A1A1525F
	for <lists+nouveau@lfdr.de>; Fri, 17 Jan 2025 16:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B25B10EB13;
	Fri, 17 Jan 2025 15:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pBKwcL7+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2863A10EB14
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jan 2025 15:04:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7C80FA43107;
 Fri, 17 Jan 2025 15:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE098C4CEDD;
 Fri, 17 Jan 2025 15:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737126278;
 bh=oNEicZwN70WfZ+1mbcfM3N7DFBV/qo+oRqWLRaijabo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pBKwcL7+INuKyZs19A1GuZAuJDRIs68CBdN2sAUMHAt0zTzZEn6GQsHDdVtDSJ6ir
 dnOPymU8DJKf8zLkQhcoB648CLWZLJsqAetp0LRhhAahwxYs/+pZoJFfd5VYtgiZ9V
 3QAm/IIpV//tQhwiEgoqUvYvlSZJIE8DcQ710d+4ojcCclxw3aF98jNG7CZwcnW1h0
 TmL+hHlXQQ49jRxuYajucnWVyHxMwK8p7E+KWUJZNLGkEXMlYo+ahKbncG6Fv2Da5c
 /zrFg+MIQTU6fVPC+Z8CCo44MOHm4fHa7c/5AfX3FFAiwfWpLkthQqYr58FcaBjBxC
 WgYMbK4kzhR5g==
Date: Fri, 17 Jan 2025 16:04:32 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, mtijanic@nvidia.com, jgg@nvidia.com,
 acurrid@nvidia.com, cjia@nvidia.com, smitra@nvidia.com,
 ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 3/8] drm/nouveau: load scrubber ucode image when WPR2 heap
 size > 256MB
Message-ID: <Z4pxgD2Dntr_PWWj@pollux>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
 <20241122125712.3653406-4-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122125712.3653406-4-zhiw@nvidia.com>
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

On Fri, Nov 22, 2024 at 04:57:07AM -0800, Zhi Wang wrote:
> When WPR2 heap size > 256MB, the FB memory needs to be scrubbed before
> use.
> 
> If not, the GSP firmware hangs when booting.
> 
> Introduce ad102_gsp_init_fw_heap(). Load scrubber ucode image when
> WRP2 heap size > 256MB after the FB memory layout initialization. Save the

WPR

> fwif in nvkm_gsp for firmware loading in ad102_gsp_init_fw_heap().
> 
> Cc: Surath Mitra <smitra@nvidia.com>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  3 ++-
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   | 21 ++++++++++++++++++-
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  4 +++-
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |  6 +++++-
>  4 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index a2055f2a014a..c6fe2d9d47de 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -33,7 +33,7 @@ struct nvkm_gsp {
>  	struct nvkm_subdev subdev;
>  
>  	struct nvkm_falcon falcon;
> -
> +	const struct nvkm_gsp_fwif *fwif;
>  	struct {
>  		struct {
>  			const struct firmware *load;
> @@ -41,6 +41,7 @@ struct nvkm_gsp {
>  		} booter;
>  		const struct firmware *bl;
>  		const struct firmware *rm;
> +		const struct firmware *scrubber;
>  	} fws;
>  
>  	struct nvkm_firmware fw;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> index 00a7ec875400..bd8bd37955fa 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> @@ -21,6 +21,25 @@
>   */
>  #include "priv.h"
>  
> +static int
> +ad102_gsp_init_fw_heap(struct nvkm_gsp *gsp)
> +{
> +	int ret;
> +
> +	nvkm_gsp_init_fw_heap(gsp);
> +
> +	if (gsp->fb.wpr2.heap.size <= SZ_256M)
> +		return 0;
> +
> +	/* Load scrubber ucode image */
> +	ret = r535_gsp_load_fw(gsp, "scrubber", gsp->fwif->ver,
> +			       &gsp->fws.scrubber);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static const struct nvkm_gsp_func
>  ad102_gsp_r535_113_01 = {
>  	.flcn = &ga102_gsp_flcn,
> @@ -31,7 +50,7 @@ ad102_gsp_r535_113_01 = {
>  	.wpr_heap.os_carveout_size = 20 << 20,
>  	.wpr_heap.base_size = 8 << 20,
>  	.wpr_heap.min_size = 84 << 20,
> -	.wpr_heap.init_fw_heap = tu102_gsp_init_fw_heap,
> +	.wpr_heap.init_fw_heap = ad102_gsp_init_fw_heap,
>  
>  	.booter.ctor = ga102_gsp_booter_ctor,
>  
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> index dfb41be3d677..a89ab7b22263 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> @@ -16,7 +16,9 @@ struct nvkm_gsp_fwif {
>  };
>  
>  int gv100_gsp_nofw(struct nvkm_gsp *, int, const struct nvkm_gsp_fwif *);
> -int  r535_gsp_load(struct nvkm_gsp *, int, const struct nvkm_gsp_fwif *);
> +int r535_gsp_load_fw(struct nvkm_gsp *gsp, const char *name,
> +		     const char *ver, const struct firmware **pfw);
> +int r535_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif);
>  
>  struct nvkm_gsp_func {
>  	const struct nvkm_falcon_func *flcn;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index c56c545f2bdb..ef867eb20cff 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -2489,6 +2489,8 @@ r535_gsp_dtor_fws(struct nvkm_gsp *gsp)
>  	gsp->fws.booter.load = NULL;
>  	nvkm_firmware_put(gsp->fws.rm);
>  	gsp->fws.rm = NULL;
> +	nvkm_firmware_put(gsp->fws.scrubber);
> +	gsp->fws.scrubber = NULL;
>  }
>  
>  void
> @@ -2656,7 +2658,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
>  	return 0;
>  }
>  
> -static int
> +int
>  r535_gsp_load_fw(struct nvkm_gsp *gsp, const char *name, const char *ver,
>  		 const struct firmware **pfw)
>  {
> @@ -2687,6 +2689,8 @@ r535_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
>  		return ret;
>  	}
>  
> +	gsp->fwif = fwif;
> +
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
