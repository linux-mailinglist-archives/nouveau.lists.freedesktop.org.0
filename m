Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE17DA58427
	for <lists+nouveau@lfdr.de>; Sun,  9 Mar 2025 14:00:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E1410E26F;
	Sun,  9 Mar 2025 13:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Uy/LjoPt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DFA10E26F
 for <nouveau@lists.freedesktop.org>; Sun,  9 Mar 2025 13:00:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 04AA8A45BA5;
 Sun,  9 Mar 2025 12:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D86C4CEE3;
 Sun,  9 Mar 2025 13:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741525235;
 bh=LM6x17PTek7P0oPyqJLxOZVRMNgcblp3YGqxi72NPeI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uy/LjoPt9+DRDTYQa4Ycszj08OwDvcWAjNsvGJmPSUQr2817rUIy0blU7o3ByHXS2
 HQlrkN1KCU7PZM0obO/CNkP51m6QAOmyBVWIQ0bcDeWab46w0T4w9EEwq2bk+MGz+J
 AyHmjWD2PKOfExKIoiKolf9vshad4iI3wqTtJ+LhxIwx5TGVIlUiJF1m2Er9RE4Oo0
 GgmJBGorVVEPCuJsMrDgSuErJLSHEnoMeJsjqZS14VUrElSbAN/uCyPHufT1uMdWbL
 nvvQwi6UCNzwO+YNdo+YnBUlHcHXj/TbtIhaOYc7q0MFWUkPqwOgK6IIL2ykldh2sY
 nZ17lJ7cv8oeg==
Date: Sun, 9 Mar 2025 14:00:29 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 lyude@redhat.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 cjia@nvidia.com, smitra@nvidia.com, ankita@nvidia.com,
 aniketa@nvidia.com, kwankhede@nvidia.com, targupta@nvidia.com,
 zhiwang@kernel.org
Subject: Re: [PATCH v3 0/2] NVKM GSP RPC message handling policy
Message-ID: <Z82Q7edxvy3_H4DT@cassiopeiae>
References: <20250227013554.8269-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227013554.8269-1-zhiw@nvidia.com>
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

On Thu, Feb 27, 2025 at 01:35:52AM +0000, Zhi Wang wrote:
> Hi folks:
> 
> Here are the v3 version of NVKM GSP RPC message handling policy which
> solves the issue reported by Ben. More details can be found in v1 [1].
> 
> v3:
> 
> - Fix a hidden use-after-free caught by KFENCE in PATCH 1,
>   r535_gsp_rpc_send(). (Ben)
> 
> Zhi Wang (2):
>   drm/nouveau/nvkm: factor out current GSP RPC command policies
>   drm/nouveau/nvkm: introduce new GSP reply policy
>     NVKM_GSP_RPC_REPLY_POLL
> 
>  Documentation/gpu/nouveau.rst                 |  3 +
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 38 +++++++--
>  .../gpu/drm/nouveau/nvkm/subdev/bar/r535.c    |  2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 78 ++++++++++---------
>  .../drm/nouveau/nvkm/subdev/instmem/r535.c    |  2 +-
>  5 files changed, 79 insertions(+), 44 deletions(-)

Applied to drm-misc-next, thanks!
