Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D52BA152B4
	for <lists+nouveau@lfdr.de>; Fri, 17 Jan 2025 16:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D18010EB17;
	Fri, 17 Jan 2025 15:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hJs4k8Fg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1520910EB17
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jan 2025 15:19:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 67B77A43142;
 Fri, 17 Jan 2025 15:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0449C4CEDD;
 Fri, 17 Jan 2025 15:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737127196;
 bh=4MoJtGsQp3Qyi5MQEboPTpSXR0tx7FYtZaY2Uveqgi0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hJs4k8FgEaU05uJAVy1c1atyBOsBiB6HlQVcAH1LDmsh2z3Z+5YFLJiQIWTckl4FX
 Kmtz1FCqTlyG9/phketb21MbAkb8DnDSL8xvgwQSQGGeGkTGr7KvRJRV8gDq8n+Vbs
 Qfv79Ukut6AflVqrN3TD0/pmJ7w//kngE2uzpt8NGY6BqtoXBwu4UEHzD2cSl9qZx/
 LPHpDKSfEk1efr9E8vZdzGNhtAbPGjDliIZI2wc4aolhIOdclU/p0cHMdvz9o+Kx+1
 tke7s4r+Q9LaFJ9Jr/pl3vbtM6SnY8kxdDdjj47BMPWxUeMnEqmNSGsCpxGJM5dyE9
 gQkv2RWR7aVHQ==
Date: Fri, 17 Jan 2025 16:19:50 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, mtijanic@nvidia.com, jgg@nvidia.com,
 acurrid@nvidia.com, cjia@nvidia.com, smitra@nvidia.com,
 ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 6/8] drm/nouveau: override the WPR2 heap size when SRIOV is
 supported on Ada
Message-ID: <Z4p1FkTq4ZRj0Kaz@pollux>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
 <20241122125712.3653406-7-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122125712.3653406-7-zhiw@nvidia.com>
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

On Fri, Nov 22, 2024 at 04:57:10AM -0800, Zhi Wang wrote:
> To support the maximum vGPUs on the device that support SRIOV, a larger
> WPR2 heap size is required. On Ada with SRIOV supported, the size should
> be set to at least 549MB. By setting the WPR2 heap size up to 549MB, the
> scrubber ucode image is required to scrub the FB memory before any other
> ucode image is executed.
> 
> Override the default WPR2 heap size on Ada when SRIOV is supported. Set
> the WPR2 heap size up to 576MB when SRIOV is supported on Ada.

Might be worth to also add a brief note about this in the code.

> 
> Cc: Milos Tijanic <mtijanic@nvidia.com>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> index 3ba67eab08d7..1e403dbd7323 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> @@ -20,6 +20,7 @@
>   * OTHER DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <core/pci.h>
>  #include <engine/sec2.h>
>  #include "priv.h"
>  
> @@ -58,9 +59,18 @@ ad102_execute_scrubber(struct nvkm_gsp *gsp)
>  static int
>  ad102_gsp_init_fw_heap(struct nvkm_gsp *gsp)
>  {
> +	struct nvkm_subdev *subdev = &gsp->subdev;
> +	struct nvkm_device *device = subdev->device;
> +	struct nvkm_device_pci *device_pci = container_of(device,
> +			typeof(*device_pci), device);
> +	int num_vfs;
>  	int ret;
>  
> -	nvkm_gsp_init_fw_heap(gsp, 0);
> +	num_vfs = pci_sriov_get_totalvfs(device_pci->pdev);
> +	if (!num_vfs)
> +		nvkm_gsp_init_fw_heap(gsp, 0);
> +	else
> +		nvkm_gsp_init_fw_heap(gsp, 576 * SZ_1M);
>  
>  	if (gsp->fb.wpr2.heap.size <= SZ_256M)
>  		return 0;
> -- 
> 2.34.1
> 
