Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987ECADD5F9
	for <lists+nouveau@lfdr.de>; Tue, 17 Jun 2025 18:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E514A10E1A3;
	Tue, 17 Jun 2025 16:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N3cbpclK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7208B10E1A3
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jun 2025 16:28:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 73FC7A511CF;
 Tue, 17 Jun 2025 16:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471FDC4CEE7;
 Tue, 17 Jun 2025 16:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750177728;
 bh=b4CJeJw4jOTC2x3lYCvG/aQ+i7H1ChuAnfzCcTafeJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N3cbpclKnZVZ+InfoUxAOkDLoNvukRy8KjSRJiVSLp2Tbskf87xhEuHqzMQAv72n3
 9DzfE9d+WgDDXDu5dicAT4o8lBb1suumHoUTUK2zh1fqtmFhAQs+Ln8k/wlSONUbjJ
 zX5xUBD2wyNXawgaVo621+TpAob5HPu1mL+MC9O0uSdtD0vYfEzlEJjhwiLcMfLfIw
 mAn+/R7XkENxash1ZUwRF3khCcPNefVva2xChCI5AZKpkc+JN5/OYRsn5mB03DaNHn
 jY9gsZM44Rrj1ME9GOXJTTd7UMDQR10FOp6rae9tJ0mcs3gA1/tJFBlkWTYsY/ExfS
 MXCAODgdBZWtQ==
Date: Tue, 17 Jun 2025 18:28:44 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH] drm/nouveau/gsp: fix potential leak of memory used
 during acpi init
Message-ID: <aFGXvETf71MSN8si@pollux>
References: <20250617040036.2932-1-bskeggs@nvidia.com>
 <f09b10e30f38cc094c4070e318d41262c0118f31.camel@redhat.com>
 <aFFoAnIO4bjupYT2@pollux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFFoAnIO4bjupYT2@pollux>
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

On Tue, Jun 17, 2025 at 03:05:10PM +0200, Danilo Krummrich wrote:
> On Tue, Jun 17, 2025 at 01:29:20PM +0200, Philipp Stanner wrote:
> > On Tue, 2025-06-17 at 14:00 +1000, Ben Skeggs wrote:
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > > b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > > index baf42339f93e..b098a7555fde 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > 
> > This seems to be based on a code move that is not yet in mainline.
> 
> It is, it did land with v6.16-rc1.
> 
> > Therefore, backporting the bugfix to stable seems difficult. Since that
> > code move is already in drm-misc-next, it would seem that it can only
> > be solved with two distinct patches for stable and for -next.
> 
> drm-misc-fixes is the relevant target branch and given the above, it contains
> the code move as well.
> 
> However, you're right that this fix won't apply to anything before v6.16-rc1.
> Given that, it makes sense to leave a note below the '---' line that this fix
> won't apply before v6.16-rc1 and that a backported patch will be sent to stable
> once this one hit Linus' tree.

Nevermind, I think this file wasn't split up and is correctly considered as
moved by git, so I think the patch should apply as is.
