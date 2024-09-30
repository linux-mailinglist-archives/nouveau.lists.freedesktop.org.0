Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A7598A01D
	for <lists+nouveau@lfdr.de>; Mon, 30 Sep 2024 13:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E2C10E3EB;
	Mon, 30 Sep 2024 11:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kRVKwZrR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4462410E034
 for <nouveau@lists.freedesktop.org>; Mon, 30 Sep 2024 11:10:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 02672A418E8;
 Mon, 30 Sep 2024 11:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16574C4CEC7;
 Mon, 30 Sep 2024 11:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727694599;
 bh=pzBdeaLGUF4+8kO8nklskpS3IYxNLey+38OIU2bKmbY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kRVKwZrRMRueCbAlGZtCh+6luFKe+3pV4xyPbwd8ct8Jaw2BnnKE6SjEAi03QqZUK
 D95lJ2hvyfMAc7hA7IhnPALbEA/mv2DM4Ck7807uGtxDq1EXGOFSohtTZDkXKaLHFJ
 jdj/G41LhxtX/bcfWGRqWgSoSkJMR2jyHPYF9cF+PY4hyghNxb5NdNY8i6qMOB3siU
 q/BqlGslQ9QpVebwSYfqVZ5JBUXTJVx1eYeeJdY7Y/319M9BJyJqTJpOhUUrY5lkNN
 HjTBpC+VpklZEVvHDrcEk/bQtLIAiU3W7wgteTIUzgK2/qomVDIwm6R/t5tSIe2ruI
 TzxxdTlZq+/mg==
Date: Mon, 30 Sep 2024 13:09:55 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Yonatan Maman <Ymaman@nvidia.com>
Cc: nouveau@lists.freedesktop.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH 1/2] nouveau/dmem: Fix privileged error in copy engine
 channel
Message-ID: <ZvqHA76iSOYJexSh@pollux>
References: <20240923135449.356244-1-Ymaman@Nvidia.com>
 <20240923135449.356244-2-Ymaman@Nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923135449.356244-2-Ymaman@Nvidia.com>
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

Hi Yonatan,

On Mon, Sep 23, 2024 at 01:54:56PM +0000, Yonatan Maman wrote:
> When `nouveau_dmem_copy_one` is called, the following error occurs:
> 
> [272146.675156] nouveau 0000:06:00.0: fifo: PBDMA9: 00000004 [HCE_PRIV]
> ch 1 00000300 00003386
> 
> This indicates that a copy push command triggered a Host Copy Engine
> Privileged error on channel 1 (Copy Engine channel). To address this
> issue, modify the Copy Engine channel to allow privileged push commands
> 
> Fixes: 6de125383a5cc
> Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
> Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>

Please read [1] and use scripts/checkpatch.pl and scripts/get_maintainer.pl
before sending patches.

In particular, the 'Fixes' tag has a defined format, I recommend:

```
[core]
        abbrev = 12
[pretty]
        fixes = Fixes: %h (\"%s\")
```

in your `.gitconfig`.

Also make sure so use 'Co-developed-by' if there is a co-author; I see that this
patch is also signed off by Gal Shalom.

Please also send the patches to all relevant mailing lists and maintainers to
avoid your patches not getting the required attention.

[1] https://docs.kernel.org/process/submitting-patches.html

> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index a58c31089613..0a75ce4c5021 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -356,7 +356,7 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
>  		return;
>  	}
>  
> -	ret = nouveau_channel_new(drm, device, false, runm, NvDmaFB, NvDmaTT, &drm->cechan);
> +	ret = nouveau_channel_new(drm, device, true, runm, NvDmaFB, NvDmaTT, &drm->cechan);
>  	if (ret)
>  		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
>  }
> -- 
> 2.34.1
> 
