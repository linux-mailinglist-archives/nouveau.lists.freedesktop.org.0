Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D377B9ECA09
	for <lists+nouveau@lfdr.de>; Wed, 11 Dec 2024 11:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E2310E3E4;
	Wed, 11 Dec 2024 10:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o4Uxy/By";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4039B10E3E4
 for <nouveau@lists.freedesktop.org>; Wed, 11 Dec 2024 10:14:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EDBFA5C48EC;
 Wed, 11 Dec 2024 10:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500C8C4CED2;
 Wed, 11 Dec 2024 10:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733912046;
 bh=9MVmpczhf6Oe9zmO3jsPZlBs2yWTcsAGWBWn3KdaczY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o4Uxy/ByJ4Mq32uqSLBPh27Vfdb/v03t/Cdv+Vvzi+7IeA+zzEnnuy4LwDJn4n+b7
 ijAGRjl+EhvAkIf2IYdDFY2WlZ/J0CJBEmevJDwP2QQzzrTXzE/KgLPYDhDiSumN6A
 fnHayUHotPLxO1qfa7AMVZRKbgDDO2Z/2LR+w6PisLqJ/68jdPrQlC//IWzqGmuHa/
 0VXiPyEsgSFsgbQVP41OkYEk7myNt4cZ3hgg9BuAJZCl7WaIi+aZbBBr5CxhU4I5gw
 mVHW5UGC1+yPxVMiLqiOdVDp1gCV1L7VnePtQuubqk1hmzfuVf7tisFC9E12foPp38
 1B4da9JLDq0zA==
Date: Wed, 11 Dec 2024 11:14:00 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [PATCH v3 01/15] nvkm: add a kernel doc to introduce the GSP RPC
Message-ID: <Z1ll6LMzGNlQuR0O@pollux.localdomain>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
 <20241031085250.2941482-2-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031085250.2941482-2-zhiw@nvidia.com>
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

Hi Zhi,

On Thu, Oct 31, 2024 at 01:52:36AM -0700, Zhi Wang wrote:
> In order to explain the name clean-ups in GSP RPC routines, a kernel
> doc to explain the memory layout and terms is required.
> 
> Add a kernel doc to introduce the GSP RPC.

Thanks for adding this -- very much appreciated!

> 
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index a4b8381c4e3e..1a07c0191356 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

I assume the idea is to add this documentation r535 specifically and for it for
new firmware versions?

> @@ -60,6 +60,52 @@
>  #define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
>  #define GSP_MSG_MAX_SIZE GSP_PAGE_MIN_SIZE * 16
>  
> +/**
> + * DOC: GSP message queue element

We should probably include those DOCs into a Documentation/gpu/nouveau.rst (which
would need to be created, now that we add documentation).

> + *
> + * https://github.com/NVIDIA/open-gpu-kernel-modules/blob/main/src/nvidia/inc/kernel/gpu/gsp/message_queue_priv.h

If so, this should not reference the main branch, but rather the corresponding
r535 release?

> + *
> + * The GSP command queue and status queue are message queues for the
> + * communication between software and GSP. The software submits the GSP
> + * RPC via the GSP command queue, GSP writes the status of the submitted
> + * RPC in the status queue.
> + *
> + * A GSP message queue element consists of three parts:
> + *
> + * - message element header (struct r535_gsp_msg), which mostly maintains
> + * the metadata for queuing the element.
> + *
> + * - RPC message header (struct nvfw_gsp_rpc), which maintains the info
> + * of the RPC. E.g., the RPC function number.
> + *
> + * - The payload, where the RPC message stays. E.g. the params of a
> + * specific RPC function. Some RPC functions also have their headers
> + * in the payload. E.g. rm_alloc, rm_control.
> + *
> + * The memory layout of a GSP message element can be illustrated below:
> + *
> + * +------------------------+
> + * | Message Element Header |
> + * |    (r535_gsp_msg)      |
> + * |                        |
> + * | (r535_gsp_msg.data)    |
> + * |          |             |
> + * |----------V-------------|
> + * |    GSP RPC Header      |
> + * |    (nvfw_gsp_rpc)      |
> + * |                        |
> + * | (nvfw_gsp_rpc.data)    |
> + * |          |             |
> + * |----------V-------------|
> + * |                        |
> + * |       Payload          |
> + * |                        |
> + * |   header(optional)     |
> + * |        params          |
> + * +------------------------+
> + *
> + */
> +
>  struct r535_gsp_msg {
>  	u8 auth_tag_buffer[16];
>  	u8 aad_buffer[16];
> -- 
> 2.34.1
> 
