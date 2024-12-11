Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C929ECA4B
	for <lists+nouveau@lfdr.de>; Wed, 11 Dec 2024 11:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD8310E404;
	Wed, 11 Dec 2024 10:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SqM9DEDj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EAD10E404
 for <nouveau@lists.freedesktop.org>; Wed, 11 Dec 2024 10:26:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2CDBD5C5D4D;
 Wed, 11 Dec 2024 10:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C36C4CED2;
 Wed, 11 Dec 2024 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733912814;
 bh=TquwGf9CR0fiMXf8b2USQRXJ21ytVeqMCXfSFBZoN5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SqM9DEDjxRSk2K7x5OrWgd/pvgZbuDo7iXo2eA7DHDEOBZLQD7RAV6y7NF9xoSvGe
 XzmuqDsaIjv6Sd09lqfDPujZLv1drZ5w0wvki+XRUBpw6Y4diAEuB6Uqn/LpHVINnh
 HCve8uazLIZgunas9L038nPD/siUsApfopJWiFfJGdrEOvNI1dOwTv4vYoN3SavO+M
 TTnOVDuyLN5SxGQ3AhXNrSK7m1ikcP+smOrgE5FrMDBPxUWVAQrsVWXcFliLf0tfmx
 aybJXqXNUQADzCQ2Ju1kryN5neXo4roqqmjh02VuzMxfHx7AHNwtqN7JuNhl/Vj8Md
 e9jVuSkS4JzAA==
Date: Wed, 11 Dec 2024 11:26:48 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [PATCH v3 02/15] nvkm: rename "repc" to "gsp_rpc_len" on the GSP
 message recv path
Message-ID: <Z1lo6Oj_gQ7J2CeE@pollux.localdomain>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
 <20241031085250.2941482-3-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031085250.2941482-3-zhiw@nvidia.com>
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

On Thu, Oct 31, 2024 at 01:52:37AM -0700, Zhi Wang wrote:
> The name "repc" has different meanings in different contexts.
> 
> To improve the readability, it's better to refine it to a name that
> reflects what it actually represents.
> 
> Rename "repc" to "gsp_rpc_len" in the GSP message recv path. Add an
> section in the doc to explain the terms.
> 
> No functional change is intended.
> 
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 46 +++++++++++--------
>  1 file changed, 27 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 1a07c0191356..f6ed51921e50 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -104,6 +104,9 @@
>   * |        params          |
>   * +------------------------+
>   *
> + * decoders:

Maybe nomenclature or terminology instead?

> + *
> + * - gsp_rpc_len: size of (GSP RPC header + payload)
>   */
>  
>  struct r535_gsp_msg {
> @@ -133,7 +136,8 @@ r535_rpc_status_to_errno(uint32_t rpc_status)
>  }
>  
>  static void *
> -r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
> +r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, u32 *prepc,
> +		   int *ptime)
>  {
>  	struct r535_gsp_msg *mqe;
>  	u32 size, rptr = *gsp->msgq.rptr;
> @@ -141,7 +145,8 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
>  	u8 *msg;
>  	u32 len;
>  
> -	size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + repc, GSP_PAGE_SIZE);
> +	size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + gsp_rpc_len,
> +			    GSP_PAGE_SIZE);
>  	if (WARN_ON(!size || size >= gsp->msgq.cnt))
>  		return ERR_PTR(-EINVAL);
>  
> @@ -167,21 +172,21 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
>  		return mqe->data;
>  	}
>  
> -	size = ALIGN(repc + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
> +	size = ALIGN(gsp_rpc_len + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
>  
> -	msg = kvmalloc(repc, GFP_KERNEL);
> +	msg = kvmalloc(gsp_rpc_len, GFP_KERNEL);
>  	if (!msg)
>  		return ERR_PTR(-ENOMEM);
>  
>  	len = ((gsp->msgq.cnt - rptr) * GSP_PAGE_SIZE) - sizeof(*mqe);
> -	len = min_t(u32, repc, len);
> +	len = min_t(u32, gsp_rpc_len, len);
>  	memcpy(msg, mqe->data, len);
>  
> -	repc -= len;
> +	gsp_rpc_len -= len;
>  
> -	if (repc) {
> +	if (gsp_rpc_len) {
>  		mqe = (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + 0 * 0x1000);
> -		memcpy(msg + len, mqe, repc);
> +		memcpy(msg + len, mqe, gsp_rpc_len);
>  	}
>  
>  	rptr = (rptr + DIV_ROUND_UP(size, GSP_PAGE_SIZE)) % gsp->msgq.cnt;
> @@ -192,9 +197,9 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
>  }
>  
>  static void *
> -r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 repc, int *ptime)
> +r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *ptime)
>  {
> -	return r535_gsp_msgq_wait(gsp, repc, NULL, ptime);
> +	return r535_gsp_msgq_wait(gsp, gsp_rpc_len, NULL, ptime);
>  }
>  
>  static int
> @@ -317,7 +322,7 @@ r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl)
>  }
>  
>  static struct nvfw_gsp_rpc *
> -r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 repc)
> +r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
>  {
>  	struct nvkm_subdev *subdev = &gsp->subdev;
>  	struct nvfw_gsp_rpc *msg;
> @@ -342,10 +347,11 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 repc)
>  	r535_gsp_msg_dump(gsp, msg, NV_DBG_TRACE);
>  
>  	if (fn && msg->function == fn) {
> -		if (repc) {
> -			if (msg->length < sizeof(*msg) + repc) {
> +		if (gsp_rpc_len) {
> +			if (msg->length < sizeof(*msg) + gsp_rpc_len) {
>  				nvkm_error(subdev, "msg len %d < %zd\n",
> -					   msg->length, sizeof(*msg) + repc);
> +					   msg->length, sizeof(*msg) +
> +					   gsp_rpc_len);
>  				r535_gsp_msg_dump(gsp, msg, NV_DBG_ERROR);
>  				r535_gsp_msg_done(gsp, msg);
>  				return ERR_PTR(-EIO);
> @@ -414,7 +420,8 @@ r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
>  }
>  
>  static void *
> -r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
> +r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait,
> +		  u32 gsp_rpc_len)
>  {
>  	struct nvfw_gsp_rpc *rpc = container_of(argv, typeof(*rpc), data);
>  	struct nvfw_gsp_rpc *msg;
> @@ -434,7 +441,7 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
>  		return ERR_PTR(ret);
>  
>  	if (wait) {
> -		msg = r535_gsp_msg_recv(gsp, fn, repc);
> +		msg = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
>  		if (!IS_ERR_OR_NULL(msg))
>  			repv = msg->data;
>  		else
> @@ -770,7 +777,8 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
>  }
>  
>  static void *
> -r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
> +r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait,
> +		  u32 gsp_rpc_len)
>  {
>  	struct nvfw_gsp_rpc *rpc = container_of(argv, typeof(*rpc), data);
>  	struct r535_gsp_msg *cmd = container_of((void *)rpc, typeof(*cmd), data);
> @@ -817,7 +825,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
>  
>  		/* Wait for reply. */
>  		if (wait) {
> -			rpc = r535_gsp_msg_recv(gsp, fn, repc);
> +			rpc = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
>  			if (!IS_ERR_OR_NULL(rpc))
>  				repv = rpc->data;
>  			else
> @@ -826,7 +834,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
>  			repv = NULL;
>  		}
>  	} else {
> -		repv = r535_gsp_rpc_send(gsp, argv, wait, repc);
> +		repv = r535_gsp_rpc_send(gsp, argv, wait, gsp_rpc_len);
>  	}
>  
>  done:
> -- 
> 2.34.1
> 
