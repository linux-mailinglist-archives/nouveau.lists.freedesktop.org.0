Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06A4A152DA
	for <lists+nouveau@lfdr.de>; Fri, 17 Jan 2025 16:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC5610EB1B;
	Fri, 17 Jan 2025 15:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iwdDTcMR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62CD10EB1A
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jan 2025 15:28:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 168B1A43130;
 Fri, 17 Jan 2025 15:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81ED6C4CEDD;
 Fri, 17 Jan 2025 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737127680;
 bh=W9DEelYIaZWF2K42s8972K38PJvf2xoG5DWzJ+nYlQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iwdDTcMRwN3LuAfNxl0XOUZXV4A2LHPhI5lZwQuFk6k5qAl1glYjNIHwPKgLFD1VF
 tL2c6b03L7sv+VrJGWNDg6QA6GAm9Zmm5vXSPM/YUGz+2LxKILE2D/xWe0jNISCpKD
 /MumhgoBH4N5E1R180qVQH0nBLOqVnplj2XAOXVc1KOMudH2gQzeC2bTG9Qlij9Lj3
 hnKZ1bpdc4E6+mWiHIt8HRKTakcjMd1+o5z41dzx+9eYYfagvILiqemGVEpDis0GQ+
 ZpXDDYBAXfbCQM2NQ1LSLK9KGhhOAwFbrGHMq0SNyxT6m2JaRnW7Cuz977dKGwUpPf
 Uebk2t74vJ3RQ==
Date: Fri, 17 Jan 2025 16:27:54 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, mtijanic@nvidia.com, jgg@nvidia.com,
 acurrid@nvidia.com, cjia@nvidia.com, smitra@nvidia.com,
 ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 8/8] drm/nouveau: introduce the scrubber on Ada in a kernel
 doc
Message-ID: <Z4p2-v1RhQwMZ149@pollux>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
 <20241122125712.3653406-9-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122125712.3653406-9-zhiw@nvidia.com>
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

On Fri, Nov 22, 2024 at 04:57:12AM -0800, Zhi Wang wrote:
> Introduce a kernel doc to explain the scrubber on Ada.
> 
> Cc: Milos Tijanic <mtijanic@nvidia.com>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> index 80d6d73fe352..327e733e3e8b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> @@ -24,6 +24,20 @@
>  #include <engine/sec2.h>
>  #include "priv.h"
>  
> +/*
> + * DOC: Pre-scrubbed FB memory on Ada
> + *
> + * https://github.com/NVIDIA/open-gpu-kernel-modules/blob/565.57.01/src/nvidia/src/kernel/gpu/gsp/kernel_gsp.c#L3151
> + *
> + * The size of the pre-scrubbed FB memory on Ada is 256MB. When allocating
> + * a GSP WPR2 heap larger than 256MB, the scrubber ucode image is required
> + * to be exeucted before executing any other ucode images. Or, GSP
> + * firmware hangs when booting.
> + *
> + * The large GSP WPR2 heap is required especially by vGPU when supporting
> + * max vGPU count. The required size on Ada is at least 549MB.
> + */

Thanks for adding this, forget my comment from patch 6 then.

Do we expect this only to be a thing for Ada? If something similar is needed for
Blackwell too, we should probably generalize the code?

> +
>  static bool is_scrubber_completed(struct nvkm_gsp *gsp)
>  {
>  	return ((nvkm_rd32(gsp->subdev.device, 0x001180fc) >> 29) >= 0x3);
> -- 
> 2.34.1
> 
