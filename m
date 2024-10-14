Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E403B99D478
	for <lists+nouveau@lfdr.de>; Mon, 14 Oct 2024 18:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB37A10E1E0;
	Mon, 14 Oct 2024 16:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZCAMPOq1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FF710E1E0
 for <nouveau@lists.freedesktop.org>; Mon, 14 Oct 2024 16:18:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B24F55C5803;
 Mon, 14 Oct 2024 16:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDD8C4CEC3;
 Mon, 14 Oct 2024 16:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728922714;
 bh=EE8ZAHy6yYFPBwcoF5mopLpCJUSiOfcz+F/jv677e48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZCAMPOq1xwMFFeNtGD+Ix+ltYmgZGkSp1CpSGqDevimf5uT8LGYQSxlrK6TPPkiqI
 8tsYr9OUIXGGOIH6UgMDXV7/GdgYN8xHP4tQcHSNQjfE8wBzOAvcVNZaAyyzEemfbC
 Zu8R+AapzCvNfIYKEj65A4jDi0DMZMrYZOOxzgRBGu5TXP+r6we7kx9iH0AZ4on9A4
 JYvVVXEcJbpZUy7BiNVk3JKha0hZejdXEAn4OGOKmPnmPFg1J8cqDXy7VlHh/Z5Va/
 9Cy+n9y6gm4QNF4zpotipj692vA6v51aOjbPZHiAGQcC13LAZ0uXe8CqiFMllZ2Ixk
 NfVILgsLrpO+A==
Date: Mon, 14 Oct 2024 18:18:26 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [PATCH 3/3] nvkm/gsp: handle the return of large RPC
Message-ID: <Zw1EUlV6QvaxnCam@pollux>
References: <20240922130709.1946893-1-zhiw@nvidia.com>
 <20240922130709.1946893-4-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922130709.1946893-4-zhiw@nvidia.com>
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

On Sun, Sep 22, 2024 at 06:07:09AM -0700, Zhi Wang wrote:
> The max RPC size is 16 pages (including the RPC header). To send an RPC
> larger than 16 pages, nvkm should split it into multiple RPCs and send
> it accordingly. The first of the split RPCs has the expected function
> number, while the rest of the split RPCs are sent with function number
> as NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD. GSP will consume the split
> RPCs from the cmdq and always write the result back to the msgq. The
> result is also formed as split RPCs.
> 
> However, NVKM is able to send split RPC when dealing with large RPCs,
> but totally not aware of handling the return of the large RPCs, which
> are the split RPC in the msgq. Thus, it keeps dumping the unknown RPC
> messages from msgq, which is actually CONTINUATION_RECORD message,
> discard them unexpectly. Thus, the caller will not be able to consume
> the result from GSP.
> 
> Introduce the handling of split RPCs on the msgq path. Slightly
> re-factor the low-level part of receiving RPCs from the msgq, RPC
> vehicle handling to merge the split RPCs back into a large RPC before
> handling it to the upper level. Thus, the upper-level of RPC APIs don't
> need to be heavily changed.
> 
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 172 ++++++++++++------
>  1 file changed, 121 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 49721935013b..ec4ab732997a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -72,6 +72,21 @@ struct r535_gsp_msg {
>  
>  #define GSP_MSG_HDR_SIZE offsetof(struct r535_gsp_msg, data)
>  
> +struct nvfw_gsp_rpc {
> +	u32 header_version;
> +	u32 signature;
> +	u32 length;
> +	u32 function;
> +	u32 rpc_result;
> +	u32 rpc_result_private;
> +	u32 sequence;
> +	union {
> +		u32 spare;
> +		u32 cpuRmGfid;
> +	};
> +	u8  data[];
> +};
> +
>  static int
>  r535_rpc_status_to_errno(uint32_t rpc_status)
>  {
> @@ -87,12 +102,12 @@ r535_rpc_status_to_errno(uint32_t rpc_status)
>  }
>  
>  static void *
> -r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
> +r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime,
> +		   u8 *msg, bool skip_copy_rpc_header)

This function now has very specific expectations on the memory that has to be
allocated by the caller, which is dependent on multiple factors, i.e.
`skip_copy_rpc_header`, `prepc`, etc. and also exposes the burden to free the
memory on failure to the caller.

Besides that, I think the name `r535_gsp_msgq_wait` becomes misleading, it has
quite some more semantics than just that meanwhile.

I think shouldn't open-code all this, instead I think it would be better to wrap
all relevant arguments in a dedicated state structure that explains all the
different cases and conditionals, and build a properly documented state machine
around it.

>  {
>  	struct r535_gsp_msg *mqe;
>  	u32 size, rptr = *gsp->msgq.rptr;
>  	int used;
> -	u8 *msg;
>  	u32 len;
>  
>  	size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + repc, GSP_PAGE_SIZE);
> @@ -123,13 +138,13 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
>  
>  	size = ALIGN(repc + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
>  
> -	msg = kvmalloc(repc, GFP_KERNEL);
> -	if (!msg)
> -		return ERR_PTR(-ENOMEM);
> -
>  	len = ((gsp->msgq.cnt - rptr) * GSP_PAGE_SIZE) - sizeof(*mqe);
>  	len = min_t(u32, repc, len);
> -	memcpy(msg, mqe->data, len);
> +	if (!skip_copy_rpc_header)
> +		memcpy(msg, mqe->data, len);
> +	else
> +		memcpy(msg, mqe->data + sizeof(struct nvfw_gsp_rpc),
> +		       len - sizeof(struct nvfw_gsp_rpc));
>  
>  	repc -= len;
>  
> @@ -145,10 +160,91 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
>  	return msg;
>  }
>  
> +static void
> +r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl)
> +{
> +	if (gsp->subdev.debug >= lvl) {
> +		nvkm_printk__(&gsp->subdev, lvl, info,
> +			      "msg fn:%d len:0x%x/0x%zx res:0x%x resp:0x%x\n",
> +			      msg->function, msg->length, msg->length - sizeof(*msg),
> +			      msg->rpc_result, msg->rpc_result_private);
> +		print_hex_dump(KERN_INFO, "msg: ", DUMP_PREFIX_OFFSET, 16, 1,
> +			       msg->data, msg->length - sizeof(*msg), true);
> +	}
> +}
> +
>  static void *
> -r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 repc, int *ptime)
> +r535_gsp_msgq_recv_continuation(struct nvkm_gsp *gsp, u32 *payload_size,
> +				u8 *buf, int *ptime)
>  {
> -	return r535_gsp_msgq_wait(gsp, repc, NULL, ptime);
> +	struct nvkm_subdev *subdev = &gsp->subdev;
> +	struct nvfw_gsp_rpc *msg;
> +	u32 size;
> +
> +	/* Peek next message */
> +	msg = r535_gsp_msgq_wait(gsp, sizeof(*msg), &size, ptime, NULL,
> +				 false);
> +	if (IS_ERR_OR_NULL(msg))
> +		return msg;
> +
> +	if (msg->function != NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD) {
> +		nvkm_error(subdev, "Not a continuation of a large RPC\n");
> +		r535_gsp_msg_dump(gsp, msg, NV_DBG_ERROR);
> +		return ERR_PTR(-EIO);
> +	}
> +
> +	*payload_size = msg->length - sizeof(*msg);
> +	return r535_gsp_msgq_wait(gsp, msg->length, NULL, ptime, buf,
> +				  true);
> +}
> +
> +static void *
> +r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 msg_repc, u32 total_repc,
> +		   int *ptime)
> +{
> +	struct nvfw_gsp_rpc *msg;
> +	const u32 max_msg_size = (16 * 0x1000) - sizeof(struct r535_gsp_msg);
> +	const u32 max_rpc_size = max_msg_size - sizeof(*msg);
> +	u32 repc = total_repc;
> +	u8 *buf, *next;
> +
> +	if (WARN_ON(msg_repc > max_msg_size))
> +		return NULL;
> +
> +	buf = kvmalloc(max_t(u32, msg_repc, total_repc + sizeof(*msg)), GFP_KERNEL);
> +	if (!buf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	msg = r535_gsp_msgq_wait(gsp, msg_repc, NULL, ptime, buf, false);
> +	if (IS_ERR_OR_NULL(msg)) {
> +		kfree(buf);
> +		return msg;
> +	}
> +
> +	if (total_repc <= max_rpc_size)
> +		return buf;
> +
> +	next = buf;
> +
> +	next += msg_repc;
> +	repc -= msg_repc - sizeof(*msg);
> +
> +	while (repc) {
> +		struct nvfw_gsp_rpc *cont_msg;
> +		u32 size;
> +
> +		cont_msg = r535_gsp_msgq_recv_continuation(gsp, &size, next,
> +						      ptime);
> +		if (IS_ERR_OR_NULL(cont_msg)) {
> +			kfree(buf);
> +			return cont_msg;
> +		}
> +		repc -= size;
> +		next += size;
> +	}
> +
> +	msg->length = total_repc + sizeof(*msg);
> +	return buf;
>  }
>  
>  static int
> @@ -236,40 +332,12 @@ r535_gsp_cmdq_get(struct nvkm_gsp *gsp, u32 argc)
>  	return cmd->data;
>  }
>  
> -struct nvfw_gsp_rpc {
> -	u32 header_version;
> -	u32 signature;
> -	u32 length;
> -	u32 function;
> -	u32 rpc_result;
> -	u32 rpc_result_private;
> -	u32 sequence;
> -	union {
> -		u32 spare;
> -		u32 cpuRmGfid;
> -	};
> -	u8  data[];
> -};
> -
>  static void
>  r535_gsp_msg_done(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg)
>  {
>  	kvfree(msg);
>  }
>  
> -static void
> -r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl)
> -{
> -	if (gsp->subdev.debug >= lvl) {
> -		nvkm_printk__(&gsp->subdev, lvl, info,
> -			      "msg fn:%d len:0x%x/0x%zx res:0x%x resp:0x%x\n",
> -			      msg->function, msg->length, msg->length - sizeof(*msg),
> -			      msg->rpc_result, msg->rpc_result_private);
> -		print_hex_dump(KERN_INFO, "msg: ", DUMP_PREFIX_OFFSET, 16, 1,
> -			       msg->data, msg->length - sizeof(*msg), true);
> -	}
> -}
> -
>  static struct nvfw_gsp_rpc *
>  r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 repc)
>  {
> @@ -279,11 +347,11 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 repc)
>  	u32 size;
>  
>  retry:
> -	msg = r535_gsp_msgq_wait(gsp, sizeof(*msg), &size, &time);
> +	msg = r535_gsp_msgq_wait(gsp, sizeof(*msg), &size, &time, NULL, false);
>  	if (IS_ERR_OR_NULL(msg))
>  		return msg;
>  
> -	msg = r535_gsp_msgq_recv(gsp, msg->length, &time);
> +	msg = r535_gsp_msgq_recv(gsp, msg->length, repc, &time);
>  	if (IS_ERR_OR_NULL(msg))
>  		return msg;
>  
> @@ -736,6 +804,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
>  	mutex_lock(&gsp->cmdq.mutex);
>  	if (rpc_size > max_rpc_size) {
>  		const u32 fn = rpc->function;
> +		u32 remain_rpc_size = rpc_size;
>  
>  		/* Adjust length, and send initial RPC. */
>  		rpc->length = sizeof(*rpc) + max_rpc_size;
> @@ -746,11 +815,11 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
>  			goto done;
>  
>  		argv += max_rpc_size;
> -		rpc_size -= max_rpc_size;
> +		remain_rpc_size -= max_rpc_size;
>  
>  		/* Remaining chunks sent as CONTINUATION_RECORD RPCs. */
> -		while (rpc_size) {
> -			u32 size = min(rpc_size, max_rpc_size);
> +		while (remain_rpc_size) {
> +			u32 size = min(remain_rpc_size, max_rpc_size);
>  			void *next;
>  
>  			next = r535_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD, size);
> @@ -766,19 +835,20 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
>  				goto done;
>  
>  			argv += size;
> -			rpc_size -= size;
> +			remain_rpc_size -= size;
>  		}
>  
>  		/* Wait for reply. */
> -		if (wait) {
> -			rpc = r535_gsp_msg_recv(gsp, fn, repc);
> -			if (!IS_ERR_OR_NULL(rpc))
> +		rpc = r535_gsp_msg_recv(gsp, fn, rpc_size);
> +		if (!IS_ERR_OR_NULL(rpc)) {
> +			if (wait)
>  				repv = rpc->data;
> -			else
> -				repv = rpc;
> -		} else {
> -			repv = NULL;
> -		}
> +			else {
> +				nvkm_gsp_rpc_done(gsp, rpc);
> +				repv = NULL;
> +			}
> +		} else
> +			repv = wait ? rpc : NULL;
>  	} else {
>  		repv = r535_gsp_rpc_send(gsp, argv, wait, repc);
>  	}
> -- 
> 2.34.1
> 
