Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BBEA1BF4C
	for <lists+nouveau@lfdr.de>; Sat, 25 Jan 2025 00:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1677E10E0C5;
	Fri, 24 Jan 2025 23:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o8ryGdv+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFD610E0C5
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 23:57:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 028D6A42021;
 Fri, 24 Jan 2025 23:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D03FC4CED2;
 Fri, 24 Jan 2025 23:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737763075;
 bh=TNktbfzOYZQmtsTDwwgetABRNUkuTmtWxbkRQKVb2hQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o8ryGdv+AGrNVco5Yrg8XUSd5lwqqKeidiM53TphIJO3vf9t6uVuxFvBUDwGiYej1
 eIVDPTGITI15aagR2ZH3+zv2wL/sueKETGFPhsK5ij33Zu6BQur1mMxHoQqSLUVxft
 arc9XpCiz372tOlLIpd3sOiHUHrZwAAQyx/30l4ihaWDERQA894qnVpx5yIYVEmpao
 EoLTPxbwRIsNePoIMoOULGcP1IjRqOJepisB7In8WowaNYELzhYKSrxXPUafQTIVZl
 h++hjLjbKBwioC9Vb8tBAX4n3OuWuTkyCq4kUMJ5c2UHEg9ZnKUmss3ULJouNEThe+
 a04Wp8tGjFDOA==
Date: Sat, 25 Jan 2025 00:57:50 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [PATCH v4 00/15] NVKM GSP RPC kernel docs, cleanups and fixes
Message-ID: <Z5Qo_gPB_ySj4zSb@pollux>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
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

On Fri, Jan 24, 2025 at 10:29:43AM -0800, Zhi Wang wrote:
> Hi folks:
> 
> Here is another re-spin of handling the large GSP message return.
> 
> Besides the support of the large GSP message, kernel doc and many cleanups
> are introduced according to the comments in the previous spin [1].
> 
> For testing, I tried the following without any problem:
> 
> - run Uniengine Heaven [2] on my RTX 4060 for 8 hours
> - the GL CTS runner [3] (commandline: ./cts-runner --type-gl40) from
> Khronos
> - with the vGPU RFC patches [4], boot up a ubuntu VM with a vGPU on a L40
> and run glmark2.

Applied to drm-misc-next.

Thanks a lot for this series and the iterations -- those are really good
improvements.

I fixed up the first commit "drm/nouveau: add a kernel doc to introduce the GSP
RPC", which had some indentation issues in the bullet list and the new file was
missing the SPDX-License-Identifier.

When adding documentation, please make sure to check the result after running
the htmldocs make target.

I also fixed up one minor indentation issue in one of the other patches.

Again, thanks for the series!

- Danilo

> 
> v4:
> - Introduce a documentation in Documentation/gpu/nouveau.rst.
> - Fix the reference link of NVIDIA SDK headers in the document.
> - Replace the "decoders" term with "terminology".
> - Explain the adding offset in r535_gsp_msgq_get_entry().
> - Replace the magic number 0x1000 with GSP_PAGE_SIZE in the re-factor.
> - Introduce a DOC to explain the GSP message receiving flow.
> 
> v3:
> 
> - Add a kernel doc and chart to introduce the GSP message and denote the
> memory layout.
> - Add a decoder section in the kernel doc to explain the terms in the code.
> - Refine the many confusing variable names to align with the terms in the
> kernel doc.
> - Introduce the continaution records in the kernel doc.
> - Re-factor the complicated function r535_gsp_msgq_wait().
> - Other minor cleanups.
> 
> v2:
> 
> - Remove the Fixes: tags as the vanilla nouveau aren't going to hit these bugs. (Danilo)
> - Test the patchset on VK-GL-CTS. (Danilo)
> - Remove the ambiguous empty line in PATCH 2. (Danilo)
> - Rename the r535_gsp_msgq_wait to gsp_msgq_recv. (Danilo)
> - Introduce a data structure to hold the params of gsp_msgq_recv(). (Danilo)
> - Document the params and the states they are related to. (Danilo)
> 
> [1] https://lore.kernel.org/nouveau/20241031085250.2941482-1-zhiw@nvidia.com/
> [2] https://benchmark.unigine.com/heaven
> [3] https://github.com/KhronosGroup/VK-GL-CTS
> [4] https://lore.kernel.org/kvm/20240922124951.1946072-1-zhiw@nvidia.com/T/#t
> 
> 
> Zhi Wang (15):
>   drm/nouveau: add a kernel doc to introduce the GSP RPC
>   drm/nouveau: rename "repc" to "gsp_rpc_len" on the GSP message recv
>     path
>   drm/nouveau: rename "argv" to what it represents on the GSP message
>     send path
>   drm/nouveau: remove unused param repc in *rm_alloc_push()
>   drm/nouveau: rename "argv" to what it represents in *rm_{alloc,
>     ctrl}_*()
>   drm/nouveau: rename "argc" to what it represents in GSP RPC routines
>   drm/nouveau: fix the broken marco GSP_MSG_MAX_SIZE
>   drm/nouveau: remove the magic number in r535_gsp_rpc_push()
>   drm/nouveau: refine the variable names in r535_gsp_rpc_push()
>   drm/nouveau: refine the variable names in r535_gsp_msg_recv()
>   drm/nouveau: rename the variable "cmd" to "msg" in r535_gsp_cmdq_{get,
>     push}()
>   drm/nouveau: factor out r535_gsp_msgq_peek()
>   drm/nouveau: factor out r535_gsp_msgq_recv_one_elem()
>   drm/nouveau: support handling the return of large GSP message
>   drm/nouveau: consume the return of large GSP message
> 
>  Documentation/gpu/drivers.rst                 |   1 +
>  Documentation/gpu/nouveau.rst                 |  27 +
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |   8 +-
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 526 +++++++++++++-----
>  4 files changed, 409 insertions(+), 153 deletions(-)
>  create mode 100644 Documentation/gpu/nouveau.rst
> 
> -- 
> 2.34.1
> 
