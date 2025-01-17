Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A19A152CF
	for <lists+nouveau@lfdr.de>; Fri, 17 Jan 2025 16:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B9D10EAF4;
	Fri, 17 Jan 2025 15:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p5tltN92";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FAD10EB1C
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jan 2025 15:24:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9AC3EA43101;
 Fri, 17 Jan 2025 15:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7C6C4CEDD;
 Fri, 17 Jan 2025 15:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737127461;
 bh=LAPCByrbLFbwHBMRKAWpW2PZX1G+a0hiGeb2ceOS8Rw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p5tltN92WOsRoMAXqEyjPv9SHJbsbT/YeZuJb8DqaHxiPN6DSPYKqymWxCfP3X7Yl
 9i8LOaAogNbw2QDbx3lLzUilfCQHg7Yf+wkdE60YJlWix417BuFDiNhkmBab/UdNJp
 EokAPOOB7tNsQbOOkFOLHGtDrmgk/orwoY4yfR4L1AYccUjlbVwRU7YkqzEReU+TvE
 TWJhjsqst3uD21CahvAHPAUMjVNzBOVcmhWgnstUGtCVugG7pbYcWH5CuXrFDiPamR
 vq7dK1Mc9gpOOqhQpPxAzCzG+ra7QUDhPXvXj/GiVeSk/GMoGg365LD2f7gbYLTx+j
 CUdNEGotmMn4w==
Date: Fri, 17 Jan 2025 16:24:15 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, mtijanic@nvidia.com, jgg@nvidia.com,
 acurrid@nvidia.com, cjia@nvidia.com, smitra@nvidia.com,
 ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 7/8] drm/nouveau: set max supported vGPU count when SRIOV
 is supported
Message-ID: <Z4p2H40xQonsQWRY@pollux>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
 <20241122125712.3653406-8-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122125712.3653406-8-zhiw@nvidia.com>
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

On Fri, Nov 22, 2024 at 04:57:11AM -0800, Zhi Wang wrote:
> Set the max supported vGPU count according to the number of VFs when
> SRIOV is supported on Ada.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Surath Mitra <smitra@nvidia.com>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   | 4 +++-
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 1 +
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index c6fe2d9d47de..6e244af1e815 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -64,6 +64,7 @@ struct nvkm_gsp {
>  			} frts, boot, elf, heap;
>  			u64 addr;
>  			u64 size;
> +			u64 max_vgpu_count;
>  		} wpr2;
>  		struct {
>  			u64 addr;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> index 1e403dbd7323..80d6d73fe352 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> @@ -69,8 +69,10 @@ ad102_gsp_init_fw_heap(struct nvkm_gsp *gsp)
>  	num_vfs = pci_sriov_get_totalvfs(device_pci->pdev);
>  	if (!num_vfs)
>  		nvkm_gsp_init_fw_heap(gsp, 0);
> -	else
> +	else {
>  		nvkm_gsp_init_fw_heap(gsp, 576 * SZ_1M);
> +		gsp->fb.wpr2.max_vgpu_count = num_vfs;
> +	}

Please also add braces on the if block.

>  
>  	if (gsp->fb.wpr2.heap.size <= SZ_256M)
>  		return 0;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 5a47201bf0c4..2647a83773d2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1968,6 +1968,7 @@ r535_gsp_wpr_meta_init(struct nvkm_gsp *gsp)
>  	meta->partitionRpcAddr = 0;
>  	meta->partitionRpcRequestOffset = 0;
>  	meta->partitionRpcReplyOffset = 0;
> +	meta->gspFwHeapVfPartitionCount = gsp->fb.wpr2.max_vgpu_count;
>  	meta->verified = 0;
>  	return 0;
>  }
> -- 
> 2.34.1
> 
