Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDAFA82303
	for <lists+nouveau@lfdr.de>; Wed,  9 Apr 2025 13:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CC210E841;
	Wed,  9 Apr 2025 11:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R1RJ4UVM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC5D10E841
 for <nouveau@lists.freedesktop.org>; Wed,  9 Apr 2025 11:02:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9118A5C4774;
 Wed,  9 Apr 2025 10:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74049C4CEE3;
 Wed,  9 Apr 2025 11:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744196530;
 bh=nSzqOWI3rZXEaJ3L9FxTC+hfQE5GBdW8UHo8Bfm3AHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R1RJ4UVMqGdomsDQ/gi4j40D/zJh5/2OYABZavVV2iLEMjAyP06PYQXY7bSq14Z+7
 FJFauOCPTioQa7F3JPobJ3icgn2WwZ2KJLFe5SRyVQYIxW88qBQruGXS2RERLsZNtm
 VIbcZX6M/BQxz7YX9qZPN5PCa+V6flR3PjIXl9ByZDO66a+DfJSWVQ6FKxvqhQIVTR
 kV4hbQf/+QTFgCPDnKTs5Y9r8zvQvsEL6Ft+QMwpkT/+HCsbmPVXByk/cMwecCSVUP
 gHLqV1xzwrzXEa5G1mYhHrB2BGPRSxzzyolEPSa+rTDnn1TO6ZZi4YTUXGWe1wO12Z
 qHYTL5NRE6dXw==
Date: Wed, 9 Apr 2025 13:02:05 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 lists.freedesktop.org@cassiopeiae, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/nouveau: Remove forgotten TODO
Message-ID: <Z_ZTrZ-dcD5YiSm4@cassiopeiae>
References: <20250409091413.94102-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409091413.94102-2-phasta@kernel.org>
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

(+ Ben)

On Wed, Apr 09, 2025 at 11:14:14AM +0200, Philipp Stanner wrote:
> commit ebb945a94bba ("drm/nouveau: port all engines to new engine module
> format") introduced a TODO to nouveau_chan.h, stating that an
> unspecified rework would take place in the "near future".
> 
> Almost 13 years have passed since this "near future", so it can be
> safely assumed that the TODO is not needed anymore. Besides, its content
> is useless anyways since it does not specify *what* should have been
> done.
> 
> Remove the TODO.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_chan.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
> index 016f668c0bc1..3b73ec91c4ff 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
> @@ -33,7 +33,6 @@ struct nouveau_channel {
>  		u64 addr;
>  	} push;
>  
> -	/* TODO: this will be reworked in the near future */
>  	bool accel_done;

After having a brief look, it seems that it may has actually been reworked;
there is only a single use of accel_done, which is in FIRE_RING(), where it is
set to true. But it doesn't seem to be read from anywhere.

So, I think we should remove both, the TODO and the accel_done field.

@Ben: Maybe you remember the history of this.

- Danilo
