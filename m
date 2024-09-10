Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB5B973309
	for <lists+nouveau@lfdr.de>; Tue, 10 Sep 2024 12:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2F910E77B;
	Tue, 10 Sep 2024 10:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qqQOuWIe";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E3310E77B
 for <nouveau@lists.freedesktop.org>; Tue, 10 Sep 2024 10:28:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 92E115C02D6;
 Tue, 10 Sep 2024 10:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28407C4CEC3;
 Tue, 10 Sep 2024 10:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725964093;
 bh=ZQp6yIcnl8l2XxeN3rYblPdnQi7olLMlw6LPzBLJN5M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qqQOuWIer2Jh9SIDWgHoFcyynKz9sH3lSCjaBqYfpYLfAYA/rFYGsPeuhjnH1Dvss
 2I2X3bSubAkqOYzb23Xh5VV/G+1KkU40xrM8GCJIBZt46FWTPGlPujrcgGbRwgFnBD
 +ZUH/hqGF7aunexGEi+UZWiqrmU9DzfwwswCY9gOqanop8kAyvsC+hIrC3Wf7fGgBD
 1yXN/beZ1U9NnLkTQAXib/uizA4m3PvhgasmFSgEGv0ARjfkPoviEE1Uku34IeJqPf
 JtnEMbAI9wGsnkG7lwmMI1hLAWz/JenSvu0a8vYwwKDvkL4LwH04+gjM8L7KLtqL3y
 6I99ionpXxr0Q==
Message-ID: <6d2da30d-96ed-4a55-97f2-50a0eadbb41f@kernel.org>
Date: Tue, 10 Sep 2024 12:28:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau/fb: restore init() for ramgp102
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org
References: <20240904232418.8590-1-bskeggs@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20240904232418.8590-1-bskeggs@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 9/5/24 1:24 AM, Ben Skeggs wrote:
> init() was removed from ramgp102 when reworking the memory detection, as
> it was thought that the code was only necessary when the driver performs
> mclk changes, which nouveau doesn't support on pascal.
> 
> However, it turns out that we still need to execute this on some GPUs to
> restore settings after DEVINIT, so revert to the original behaviour.
> 
> v2: fix tags in commit message, cc stable
> 
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/319
> Fixes: 2c0c15a22fa0 ("drm/nouveau/fb/gp102-ga100: switch to simpler vram size detection method")
> Cc: <stable@vger.kernel.org> # 6.6+
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>

Applied to drm-misc-fixes, thanks!

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h      | 2 ++
>   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c | 1 +
>   3 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
> index 50f0c1914f58..4c3f74396579 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
> @@ -46,6 +46,8 @@ u32 gm107_ram_probe_fbp(const struct nvkm_ram_func *,
>   u32 gm200_ram_probe_fbp_amount(const struct nvkm_ram_func *, u32,
>   			       struct nvkm_device *, int, int *);
>   
> +int gp100_ram_init(struct nvkm_ram *);
> +
>   /* RAM type-specific MR calculation routines */
>   int nvkm_sddr2_calc(struct nvkm_ram *);
>   int nvkm_sddr3_calc(struct nvkm_ram *);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> index 378f6fb70990..8987a21e81d1 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> @@ -27,7 +27,7 @@
>   #include <subdev/bios/init.h>
>   #include <subdev/bios/rammap.h>
>   
> -static int
> +int
>   gp100_ram_init(struct nvkm_ram *ram)
>   {
>   	struct nvkm_subdev *subdev = &ram->fb->subdev;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
> index 8550f5e47347..b6b6ee59019d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
> @@ -5,6 +5,7 @@
>   
>   static const struct nvkm_ram_func
>   gp102_ram = {
> +	.init = gp100_ram_init,
>   };
>   
>   int
