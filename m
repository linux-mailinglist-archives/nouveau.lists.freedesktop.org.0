Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF615A152AA
	for <lists+nouveau@lfdr.de>; Fri, 17 Jan 2025 16:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C84E10EB19;
	Fri, 17 Jan 2025 15:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GOhhHPre";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E8510EB17
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jan 2025 15:19:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 806DF5C6338;
 Fri, 17 Jan 2025 15:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6962C4CEDD;
 Fri, 17 Jan 2025 15:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737127157;
 bh=NpdhF5vihhFRkluyihK0d1Q741iW8f63SANnqavoKYA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GOhhHPreJ5xsmX9tFPL/EaGJ1+AxatE9GRH2QJKL1tJovFe4kQ55aoAkpRCQlUQV/
 QIDcMoI1Ie3l1wWAgDJQxHddd5IJxbr/yECsmcxTK/5cT2ij5AWQiB17Cwy0MB1/ja
 XW9tVfiGQyNOLaH1u72z4UtfhN9HTFXwKcj0iNPCOjld1zRiIa/eI1wJPVg6HOHNKI
 cU/YrS5HtPsDbrqo30XG+aaplfX+uez3FL5NYF0lz+iXXOtF5HBnXzKhgZjse3j9zO
 K3gwR82BB9fzz0yXI3P1msFjNyEJRxXEFVPzv/Nx8pzG+iNGkP6Gb4TZ4k99S7Ml3H
 JztecTOORhfcw==
Date: Fri, 17 Jan 2025 16:19:11 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, mtijanic@nvidia.com, jgg@nvidia.com,
 acurrid@nvidia.com, cjia@nvidia.com, smitra@nvidia.com,
 ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 5/8] drm/nouveau: support WPR2 heap size override
Message-ID: <Z4p078QgzPdiU099@pollux>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
 <20241122125712.3653406-6-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122125712.3653406-6-zhiw@nvidia.com>
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

On Fri, Nov 22, 2024 at 04:57:09AM -0800, Zhi Wang wrote:
> To support the maximum vGPUs on the device that support SRIOV, a larger
> WPR2 heap size is required.
> 
> Support WPR2 heap size override when initializing the WPR2 heap memory
> layout. If zero, use the default WRP2 heap size.
> 
> No functional change is intended.
> 
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h  | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c  | 7 ++++---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 2 +-
>  4 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> index 596ccd758e66..3ba67eab08d7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> @@ -60,7 +60,7 @@ ad102_gsp_init_fw_heap(struct nvkm_gsp *gsp)
>  {
>  	int ret;
>  
> -	nvkm_gsp_init_fw_heap(gsp);
> +	nvkm_gsp_init_fw_heap(gsp, 0);
>  
>  	if (gsp->fb.wpr2.heap.size <= SZ_256M)
>  		return 0;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> index fe56ced9b369..fe2ad4753d5e 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> @@ -63,7 +63,7 @@ int ga102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct firmware
>  int ga102_gsp_reset(struct nvkm_gsp *);
>  
>  void r535_gsp_dtor(struct nvkm_gsp *);
> -void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp);
> +void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp, u64 wpr2_heap_size);
>  int r535_gsp_oneinit(struct nvkm_gsp *);
>  int r535_gsp_init(struct nvkm_gsp *);
>  int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index d5d6d0df863e..5a47201bf0c4 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -2519,7 +2519,7 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
>  	nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
>  }
>  
> -void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp)
> +void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp, u64 wpr2_heap_size)
>  {
>  	/* Calculate FB layout. */
>  	gsp->fb.wpr2.frts.size = 0x100000;
> @@ -2533,7 +2533,7 @@ void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp)
>  	gsp->fb.wpr2.elf.addr = ALIGN_DOWN(gsp->fb.wpr2.boot.addr - gsp->fb.wpr2.elf.size,
>  					   0x10000);
>  
> -	{
> +	if (!wpr2_heap_size) {
>  		u32 fb_size_gb = DIV_ROUND_UP_ULL(gsp->fb.size, 1 << 30);
>  
>  		gsp->fb.wpr2.heap.size =
> @@ -2543,7 +2543,8 @@ void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp)
>  			ALIGN(GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE, 1 << 20);
>  
>  		gsp->fb.wpr2.heap.size = max(gsp->fb.wpr2.heap.size, gsp->func->wpr_heap.min_size);
> -	}
> +	} else
> +		gsp->fb.wpr2.heap.size = wpr2_heap_size;

If the if block has braces, the else block should have them too. checkpatch.pl
should also tell you when using --strict.

>  
>  	gsp->fb.wpr2.heap.addr = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.size,
>  					    0x100000);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> index e279a322704a..eb6081946c13 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> @@ -79,7 +79,7 @@ tu102_gsp_booter_ctor(struct nvkm_gsp *gsp, const char *name, const struct firmw
>  int
>  tu102_gsp_init_fw_heap(struct nvkm_gsp *gsp)
>  {
> -	nvkm_gsp_init_fw_heap(gsp);
> +	nvkm_gsp_init_fw_heap(gsp, 0);
>  
>  	return 0;
>  }
> -- 
> 2.34.1
> 
