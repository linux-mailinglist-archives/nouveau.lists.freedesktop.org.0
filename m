Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F1098A02C
	for <lists+nouveau@lfdr.de>; Mon, 30 Sep 2024 13:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BD810E3E7;
	Mon, 30 Sep 2024 11:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tO+PK3cm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AD710E034
 for <nouveau@lists.freedesktop.org>; Mon, 30 Sep 2024 11:20:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 768895C2B52;
 Mon, 30 Sep 2024 11:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B550C4CEC7;
 Mon, 30 Sep 2024 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727695236;
 bh=D34FnNso2mKyPNtD5emxnQNZ3judy8F+Azic7aL00nA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tO+PK3cmdfy9L3eXnGb+iUvjClDBDwYQPntgvSbnZc7GTJ6m93fuAhJoWuu9J/2MH
 2Ds047ggO3Idju6tMUzDu7hrbGuosWAXMJHNbokooYSxM+bgNZuQsvcrlIfFB2NTu5
 ZxBPszz7kyX1ZcJ9VsUWt38xk6LUnS3rFJhrf/K22G2xY3tXxGD3eliHEN+llx0+O7
 UggIDgTz80xe229OFvFzjakDql5A9xeMIAHXSdNEMgvN0B6lqdT7ZY6UNVVM9SZGF6
 3hrdTFkwl5hJGhnqC2R5Z/24WnQ+jReung9rjSaQUyiUS5qvEsYerpfNT24zgRl3TA
 8lsPk90fDG0YQ==
Date: Mon, 30 Sep 2024 13:20:32 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Yonatan Maman <Ymaman@nvidia.com>
Cc: nouveau@lists.freedesktop.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH 2/2] nouveau/dmem: Fix memory leak in `migrate_to_ram`
 upon copy error
Message-ID: <ZvqJgMVBs2kAWguk@pollux>
References: <20240923135449.356244-1-Ymaman@Nvidia.com>
 <20240923135449.356244-3-Ymaman@Nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923135449.356244-3-Ymaman@Nvidia.com>
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

On Mon, Sep 23, 2024 at 01:54:58PM +0000, Yonatan Maman wrote:
> A copy push command might fail, causing `migrate_to_ram` to return a
> dirty HIGH_USER page to the user.
> 
> This exposes a security vulnerability in the nouveau driver. To prevent
> memory leaks in `migrate_to_ram` upon a copy error, allocate a zero
> page for the destination page.

So, you refer to the case where this function fails in nouveau_dmem_copy_one()?

If so, can you please explain why adding __GFP_ZERO to alloc_page_vma() helps
with that?

> 
> Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
> Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>

Since this is a bug, please also add a 'Fixes' tag, CC stable and add a
'Co-developed-by' tag if appropriate.

> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 6fb65b01d778..097bd3af0719 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -193,7 +193,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>  	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
>  		goto done;
>  
> -	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
> +	dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
>  	if (!dpage)
>  		goto done;
>  
> -- 
> 2.34.1
> 
