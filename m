Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED3EA15285
	for <lists+nouveau@lfdr.de>; Fri, 17 Jan 2025 16:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4483410EB14;
	Fri, 17 Jan 2025 15:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RhS0CkV1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608B810EB1D
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jan 2025 15:13:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AB2FBA43124;
 Fri, 17 Jan 2025 15:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F16EC4CEDD;
 Fri, 17 Jan 2025 15:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737126829;
 bh=1NYI5sYKyqn/tQ7Tc60gubfuGvDSdhWCLWXYdKCvLDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RhS0CkV1CD/qrBH1BMPCyNAIg5gff1LcBXLfy4jZB7e3r3sbSd2ueFt6RcdL6I3Ls
 2QvmDm57HFAigirBUCgdc6wgVptT0TvcbPBh9xWBswp8Eyb3y+Cy5kd/nwj3YoRJzz
 T0Nsxbk0aoNUQS65p3obiVkHi6TEqEKAGIFbltKxWK/Rf5//D+lxOkZzKDJ/MfqvXA
 Cf3ZFTh6duqBvQ0ZrRon0napBB8f5IK4N4ytCt+l4/7kRfsH/E0zYbiJCn/jl2ByuZ
 PueOd59vHYVzD9SasPM0yzXsPqdR+wGLEKjxbGO7K9n5YD3eD49AUa1W75/7lxYbOW
 2sUkCd6lj+Onw==
Date: Fri, 17 Jan 2025 16:13:43 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, mtijanic@nvidia.com, jgg@nvidia.com,
 acurrid@nvidia.com, cjia@nvidia.com, smitra@nvidia.com,
 ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 1/8] drm/nouveau: factor out nvkm_gsp_init_fw_heap()
Message-ID: <Z4pzp6lPPetvlyua@pollux>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
 <20241122125712.3653406-2-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122125712.3653406-2-zhiw@nvidia.com>
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

On Fri, Nov 22, 2024 at 04:57:05AM -0800, Zhi Wang wrote:
> To support the per-SKU GSP WPR2 heap initialization, first, factor out the
> common routine for all the SKUs.
> 
> Factor out nvkm_gsp_init_fw_heap(). Adjust some indent to make
> checkpatch.pl happy.
> 
> No functional change is intended.
> 
> Cc: Milos Tijanic <mtijanic@nvidia.com>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  1 +
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 69 +++++++++++--------
>  2 files changed, 40 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> index 9f4a62375a27..579d83048164 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> @@ -58,6 +58,7 @@ int ga102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct firmware
>  int ga102_gsp_reset(struct nvkm_gsp *);
>  
>  void r535_gsp_dtor(struct nvkm_gsp *);
> +void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp);
>  int r535_gsp_oneinit(struct nvkm_gsp *);
>  int r535_gsp_init(struct nvkm_gsp *);
>  int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index cf58f9da9139..6f2319845322 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -2517,6 +2517,44 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
>  	nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
>  }
>  
> +void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp)

Is this really independent from the GSP version? Otherwise this should start
with r535.

> +{
> +	/* Calculate FB layout. */
> +	gsp->fb.wpr2.frts.size = 0x100000;
> +	gsp->fb.wpr2.frts.addr = ALIGN_DOWN(gsp->fb.bios.addr, 0x20000) - gsp->fb.wpr2.frts.size;
> +
> +	gsp->fb.wpr2.boot.size = gsp->boot.fw.size;
> +	gsp->fb.wpr2.boot.addr = ALIGN_DOWN(gsp->fb.wpr2.frts.addr - gsp->fb.wpr2.boot.size,
> +					    0x1000);
> +
> +	gsp->fb.wpr2.elf.size = gsp->fw.len;
> +	gsp->fb.wpr2.elf.addr = ALIGN_DOWN(gsp->fb.wpr2.boot.addr - gsp->fb.wpr2.elf.size,
> +					   0x10000);
> +
> +	{
> +		u32 fb_size_gb = DIV_ROUND_UP_ULL(gsp->fb.size, 1 << 30);
> +
> +		gsp->fb.wpr2.heap.size =
> +			gsp->func->wpr_heap.os_carveout_size +
> +			gsp->func->wpr_heap.base_size +
> +			ALIGN(GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB * fb_size_gb, 1 << 20) +
> +			ALIGN(GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE, 1 << 20);
> +
> +		gsp->fb.wpr2.heap.size = max(gsp->fb.wpr2.heap.size, gsp->func->wpr_heap.min_size);
> +	}
> +
> +	gsp->fb.wpr2.heap.addr = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.size,
> +					    0x100000);
> +	gsp->fb.wpr2.heap.size = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.addr,
> +					    0x100000);
> +
> +	gsp->fb.wpr2.addr = ALIGN_DOWN(gsp->fb.wpr2.heap.addr - sizeof(GspFwWprMeta), 0x100000);
> +	gsp->fb.wpr2.size = gsp->fb.wpr2.frts.addr + gsp->fb.wpr2.frts.size - gsp->fb.wpr2.addr;
> +
> +	gsp->fb.heap.size = 0x100000;
> +	gsp->fb.heap.addr = gsp->fb.wpr2.addr - gsp->fb.heap.size;
> +}
> +
>  int
>  r535_gsp_oneinit(struct nvkm_gsp *gsp)
>  {
> @@ -2581,36 +2619,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
>  	/* Release FW images - we've copied them to DMA buffers now. */
>  	r535_gsp_dtor_fws(gsp);
>  
> -	/* Calculate FB layout. */
> -	gsp->fb.wpr2.frts.size = 0x100000;
> -	gsp->fb.wpr2.frts.addr = ALIGN_DOWN(gsp->fb.bios.addr, 0x20000) - gsp->fb.wpr2.frts.size;
> -
> -	gsp->fb.wpr2.boot.size = gsp->boot.fw.size;
> -	gsp->fb.wpr2.boot.addr = ALIGN_DOWN(gsp->fb.wpr2.frts.addr - gsp->fb.wpr2.boot.size, 0x1000);
> -
> -	gsp->fb.wpr2.elf.size = gsp->fw.len;
> -	gsp->fb.wpr2.elf.addr = ALIGN_DOWN(gsp->fb.wpr2.boot.addr - gsp->fb.wpr2.elf.size, 0x10000);
> -
> -	{
> -		u32 fb_size_gb = DIV_ROUND_UP_ULL(gsp->fb.size, 1 << 30);
> -
> -		gsp->fb.wpr2.heap.size =
> -			gsp->func->wpr_heap.os_carveout_size +
> -			gsp->func->wpr_heap.base_size +
> -			ALIGN(GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB * fb_size_gb, 1 << 20) +
> -			ALIGN(GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE, 1 << 20);
> -
> -		gsp->fb.wpr2.heap.size = max(gsp->fb.wpr2.heap.size, gsp->func->wpr_heap.min_size);
> -	}
> -
> -	gsp->fb.wpr2.heap.addr = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.size, 0x100000);
> -	gsp->fb.wpr2.heap.size = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.addr, 0x100000);
> -
> -	gsp->fb.wpr2.addr = ALIGN_DOWN(gsp->fb.wpr2.heap.addr - sizeof(GspFwWprMeta), 0x100000);
> -	gsp->fb.wpr2.size = gsp->fb.wpr2.frts.addr + gsp->fb.wpr2.frts.size - gsp->fb.wpr2.addr;
> -
> -	gsp->fb.heap.size = 0x100000;
> -	gsp->fb.heap.addr = gsp->fb.wpr2.addr - gsp->fb.heap.size;
> +	nvkm_gsp_init_fw_heap(gsp);
>  
>  	ret = nvkm_gsp_fwsec_frts(gsp);
>  	if (WARN_ON(ret))
> -- 
> 2.34.1
> 
