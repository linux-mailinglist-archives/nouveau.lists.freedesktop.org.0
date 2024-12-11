Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28CA9ECCF6
	for <lists+nouveau@lfdr.de>; Wed, 11 Dec 2024 14:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9496110E038;
	Wed, 11 Dec 2024 13:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a4jA6Oef";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968F010E038
 for <nouveau@lists.freedesktop.org>; Wed, 11 Dec 2024 13:16:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A2F2DA420F8;
 Wed, 11 Dec 2024 13:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A855BC4CED2;
 Wed, 11 Dec 2024 13:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733922979;
 bh=roSmOEVqZYKjxv0XTSHffNybGnh0jNKpaYIcDO96HXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a4jA6OefUE+oLywggbSPqrl4/z+h9rsw7krAwY4nBDt+UeyGsgmg6tgCz6S5fFcoa
 wzeC8YpMGOoS3qT+l/pXYHfaE35a6M1BGsEBPEV2Cv6fVr63tOvCB/Uz3NDZRDUDmh
 5iNMQiPn7UsQonBjSiPPUKMgf0LJFcR+uV1TzCelekEPI3RI7yEL0Lgf6F+F9KcgkD
 WHS/sbmsFxUR1YN8+e7FO8bRGC8WMJE2v+b8i3HWxC/f/2ymohaNVFoRyrrGl+ctfQ
 tmSGpd77wH6h5TVOXumO22Nd/ugz1i3cP6BicIAkP8QIt3t1El8LC6amAmMxIGiYFt
 Cs6y5D2phgcHg==
Date: Wed, 11 Dec 2024 14:16:14 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [PATCH v3 12/15] nvkm: factor out r535_gsp_msgq_peek()
Message-ID: <Z1mQnekcq1b7kCfA@pollux.localdomain>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
 <20241031085250.2941482-13-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031085250.2941482-13-zhiw@nvidia.com>
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

On Thu, Oct 31, 2024 at 01:52:47AM -0700, Zhi Wang wrote:
> To receive a GSP message queue element from the GSP status queue, the
> driver needs to make sure there are available elements in the queue.
> 
> The previous r535_gsp_msgq_wait() consists of three functions, which is
> a little too complicated for a single function:
> - wait for an available element.
> - peek the message element header in the queue.
> - recevice the element from the queue.
> 
> Factor out r535_gsp_msgq_peek() and divide the functions in
> r535_gsp_msgq_wait() into three functions.
> 
> No functional change is intended.
> 
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 68 ++++++++++++-------
>  1 file changed, 45 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 8b507858a63d..7818c0be41f2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -146,20 +146,16 @@ r535_rpc_status_to_errno(uint32_t rpc_status)
>  	}
>  }
>  
> -static void *
> -r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, u32 *prepc,
> -		   int *ptime)
> +static int
> +r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *ptime)
>  {
> -	struct r535_gsp_msg *mqe;
>  	u32 size, rptr = *gsp->msgq.rptr;
>  	int used;
> -	u8 *msg;
> -	u32 len;
>  
>  	size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + gsp_rpc_len,
>  			    GSP_PAGE_SIZE);
>  	if (WARN_ON(!size || size >= gsp->msgq.cnt))
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  
>  	do {
>  		u32 wptr = *gsp->msgq.wptr;
> @@ -174,15 +170,48 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, u32 *prepc,
>  	} while (--(*ptime));
>  
>  	if (WARN_ON(!*ptime))
> -		return ERR_PTR(-ETIMEDOUT);
> +		return -ETIMEDOUT;
>  
> -	mqe = (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + rptr * 0x1000);
> +	return used;
> +}
>  
> -	if (prepc) {
> -		*prepc = (used * GSP_PAGE_SIZE) - sizeof(*mqe);
> -		return mqe->data;
> -	}
> +static struct r535_gsp_msg *
> +r535_gsp_msgq_get_entry(struct nvkm_gsp *gsp)
> +{
> +	u32 rptr = *gsp->msgq.rptr;
>  
> +	return (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + rptr * 0x1000);

I know you did not introduce this, but since you're at it, can you please add
a brief comment about why we need to add does offsets?

Also, I'd replace 0x1000 with GSP_PAGE_SIZE.

> +}
> +
> +static void *
> +r535_gsp_msgq_peek(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
> +{
> +	struct r535_gsp_msg *mqe;
> +	int ret;
> +
> +	ret = r535_gsp_msgq_wait(gsp, gsp_rpc_len, retries);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
> +	mqe = r535_gsp_msgq_get_entry(gsp);
> +
> +	return mqe->data;
> +}
> +
> +static void *
> +r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)

I think it would be good to document how this differs from peek(), i.e. memory
is allocated, the message is copied, the queue pointer is advanced...

I'd also document who's in charge to free the memory allocated by this function,
and how this should be done, i.e. r535_gsp_msg_done().

> +{
> +	u32 rptr = *gsp->msgq.rptr;
> +	struct r535_gsp_msg *mqe;
> +	u32 size, len;
> +	u8 *msg;
> +	int ret;
> +
> +	ret = r535_gsp_msgq_wait(gsp, gsp_rpc_len, retries);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
> +	mqe = r535_gsp_msgq_get_entry(gsp);
>  	size = ALIGN(gsp_rpc_len + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
>  
>  	msg = kvmalloc(gsp_rpc_len, GFP_KERNEL);
> @@ -207,12 +236,6 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, u32 *prepc,
>  	return msg;
>  }
>  
> -static void *
> -r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *ptime)
> -{
> -	return r535_gsp_msgq_wait(gsp, gsp_rpc_len, NULL, ptime);
> -}
> -
>  static int
>  r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
>  {
> @@ -337,15 +360,14 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
>  {
>  	struct nvkm_subdev *subdev = &gsp->subdev;
>  	struct nvfw_gsp_rpc *rpc;
> -	int time = 4000000, i;
> -	u32 size;
> +	int retries = 4000000, i;
>  
>  retry:
> -	rpc = r535_gsp_msgq_wait(gsp, sizeof(*rpc), &size, &time);
> +	rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), &retries);
>  	if (IS_ERR_OR_NULL(rpc))
>  		return rpc;
>  
> -	rpc = r535_gsp_msgq_recv(gsp, rpc->length, &time);
> +	rpc = r535_gsp_msgq_recv(gsp, rpc->length, &retries);
>  	if (IS_ERR_OR_NULL(rpc))
>  		return rpc;
>  
> -- 
> 2.34.1
> 
