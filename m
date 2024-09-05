Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061196D6BA
	for <lists+nouveau@lfdr.de>; Thu,  5 Sep 2024 13:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C6910E861;
	Thu,  5 Sep 2024 11:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rn+wQ/2+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813CC10E861
 for <nouveau@lists.freedesktop.org>; Thu,  5 Sep 2024 11:07:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 297C85C3F2F;
 Thu,  5 Sep 2024 11:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4921C4CEC3;
 Thu,  5 Sep 2024 11:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725534438;
 bh=hTXEJVQxIhCGvIuYh9OBYWtx1WlHdmLiA/HeifqItAk=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=rn+wQ/2+5+OPb+N8XO++vBXggLtHECpYLRx3cEJVRwJ/7x7TLEo5sOtiZdp6vf6rj
 8DykOD5/aDS3s1IKkULkZIrL1cZ+YVv3uMSeQU+OK2D8df14YuEpN+urc+ssPez01Z
 df/3vsOh+2a9LZfN8lrAt2EkQCmVjrIRtr06fzjaQiu9lWoxMQxtykbm4GdYm4WYgN
 ert2qHtwjkkoNSJN6O1kPirO5a/nj5e0LNYZjqWIdlYv0YAlH5VE+WdP4szTK0Pf/K
 GY/AZ3/zXO1bCa/c06Uq1XscsDAEzkmfZzoQOfwkoGXzIcS4rhB1vm3Q4FENlehpzo
 APvJ5PMX2Vihg==
Message-ID: <031a620d-50ce-4864-bc55-3c2cf472b2ab@kernel.org>
Date: Thu, 5 Sep 2024 13:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/fb: restore init() for ramgp102
To: Ben Skeggs <bskeggs@nvidia.com>
References: <20240903231631.3398-1-bskeggs@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org
Content-Language: en-US
In-Reply-To: <20240903231631.3398-1-bskeggs@nvidia.com>
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

Hi Ben,

On 9/4/24 1:16 AM, Ben Skeggs wrote:
> init() was removed from ramgp102 when reworking the memory detection, as
> it was thought that the code was only necessary when the driver performs
> mclk changes, which nouveau doesn't support on pascal.
> 
> However, it turns out that we still need to execute this on some GPUs to
> restore settings after DEVINIT, so revert to the original behaviour.
> 
> Bug: https://gitlab.freedesktop.org/drm/nouveau/-/issues/319

Please use 'Closes:' instead and CC stable.

- Danilo

> Fixes: 2c0c15a22fa0 ("drm/nouveau/fb/gp102-ga100: switch to simpler vram size detection method")
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
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
