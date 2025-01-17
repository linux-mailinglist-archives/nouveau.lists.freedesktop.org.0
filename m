Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1423A15246
	for <lists+nouveau@lfdr.de>; Fri, 17 Jan 2025 15:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0A310E321;
	Fri, 17 Jan 2025 14:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HhvXN++y";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A851B10E321
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jan 2025 14:57:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E0EEDA430F6;
 Fri, 17 Jan 2025 14:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0928C4CEDD;
 Fri, 17 Jan 2025 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737125877;
 bh=qQ63SjMNSk2itqZbffb1EBd9Sm2gvg8zFqcFZkjO6fo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HhvXN++y9BpXrGVhc1LpYnMljxMZIZuk1TfuFwdMfsRqhyeEa0RNjDkUY1LG2V26B
 4aRbnzQhv1iER2xCgRywCrW9kcFe1RqBpmpBhPe/Q8hDXslHl6thqOt2edZIM0F0ga
 aLT3JTvYmbS6d7mP/0xnPMelpGbPv5ZJmcCHstwYHX1dWUuRw96W/sRxF+fFECoYU1
 FDa+IbktfUFBGkew0NRUDfkBPELuRVw+m0Ibym4SHPUTrlYx/Ki/BCeuvGr8kMpm82
 4osklqoja5XIIHZhLLufoOSg8lfOkcNj6UjyfHnPR5iXIVmIqvThheb1Q8zhO0O8Z/
 vFDRrT6Gnj2Ew==
Date: Fri, 17 Jan 2025 15:57:51 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, mtijanic@nvidia.com, jgg@nvidia.com,
 acurrid@nvidia.com, cjia@nvidia.com, smitra@nvidia.com,
 ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 4/8] drm/nouveau: scrub the FB memory when scrubber
 firmware is loaded
Message-ID: <Z4pv7wy3qj3bkU9s@pollux>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
 <20241122125712.3653406-5-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122125712.3653406-5-zhiw@nvidia.com>
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

On Fri, Nov 22, 2024 at 04:57:08AM -0800, Zhi Wang wrote:
> When WPR2 heap size > 256MB, the FB memory needs to be scrubbed
> before use.
> 
> If not, the GSP firmware hangs when booting.
> 
> If the scrubber firmware presents, execute it to scrub the FB memory
> before executing any other ucode images.
> 
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   | 35 +++++++++++++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  1 +
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 12 +++++--
>  3 files changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> index bd8bd37955fa..596ccd758e66 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> @@ -19,8 +19,42 @@
>   * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>   * OTHER DEALINGS IN THE SOFTWARE.
>   */
> +
> +#include <engine/sec2.h>
>  #include "priv.h"
>  
> +static bool is_scrubber_completed(struct nvkm_gsp *gsp)
> +{
> +	return ((nvkm_rd32(gsp->subdev.device, 0x001180fc) >> 29) >= 0x3);

Please, no more magic values.

Please add proper defines for the base address, register offset, shift and
value.

I think include/nvkm/regs/ would be a good place for that.

> +}
> +
> +static int
> +ad102_execute_scrubber(struct nvkm_gsp *gsp)
> +{
> +	struct nvkm_falcon_fw fw = {0};
> +	struct nvkm_subdev *subdev = &gsp->subdev;
> +	struct nvkm_device *device = subdev->device;
> +	int ret;
> +
> +	if (!gsp->fws.scrubber || is_scrubber_completed(gsp))
> +		return 0;
> +
> +	ret = gsp->func->booter.ctor(gsp, "scrubber", gsp->fws.scrubber,
> +				     &device->sec2->falcon, &fw);
> +	if (ret)
> +		return ret;
> +
> +	ret = nvkm_falcon_fw_boot(&fw, subdev, true, NULL, NULL, 0, 0);
> +	nvkm_falcon_fw_dtor(&fw);
> +	if (ret)
> +		return ret;
> +
> +	if (WARN_ON(!is_scrubber_completed(gsp)))
> +		return -ENOSPC;
> +
> +	return 0;
> +}
> +
>  static int
>  ad102_gsp_init_fw_heap(struct nvkm_gsp *gsp)
>  {
> @@ -51,6 +85,7 @@ ad102_gsp_r535_113_01 = {
>  	.wpr_heap.base_size = 8 << 20,
>  	.wpr_heap.min_size = 84 << 20,
>  	.wpr_heap.init_fw_heap = ad102_gsp_init_fw_heap,
> +	.wpr_heap.execute_scrubber = ad102_execute_scrubber,
>  
>  	.booter.ctor = ga102_gsp_booter_ctor,
>  
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> index a89ab7b22263..fe56ced9b369 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> @@ -31,6 +31,7 @@ struct nvkm_gsp_func {
>  		u32 base_size;
>  		u64 min_size;
>  		int (*init_fw_heap)(struct nvkm_gsp *gsp);
> +		int (*execute_scrubber)(struct nvkm_gsp *gsp);
>  	} wpr_heap;
>  
>  	struct {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index ef867eb20cff..d5d6d0df863e 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -2618,13 +2618,19 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
>  	if (ret)
>  		return ret;
>  
> -	/* Release FW images - we've copied them to DMA buffers now. */
> -	r535_gsp_dtor_fws(gsp);
> -
>  	ret = gsp->func->wpr_heap.init_fw_heap(gsp);
>  	if (WARN_ON(ret))
>  		return ret;
>  
> +	if (gsp->func->wpr_heap.execute_scrubber) {
> +		ret = gsp->func->wpr_heap.execute_scrubber(gsp);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Release FW images - we've copied them to DMA buffers now. */
> +	r535_gsp_dtor_fws(gsp);
> +
>  	ret = nvkm_gsp_fwsec_frts(gsp);
>  	if (WARN_ON(ret))
>  		return ret;
> -- 
> 2.34.1
> 
