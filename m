Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFA3A842E6
	for <lists+nouveau@lfdr.de>; Thu, 10 Apr 2025 14:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF3710E370;
	Thu, 10 Apr 2025 12:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NdthYEZk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E209C10E370;
 Thu, 10 Apr 2025 12:21:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1489F5C2F22;
 Thu, 10 Apr 2025 12:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A99C4CEDD;
 Thu, 10 Apr 2025 12:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744287679;
 bh=gLkvAYSQ7cecej2XzIZRywC0M1m7Zb0gAcMol3kJqPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NdthYEZkMWyrP+LKXotbmMlg4KTU8eyWDHhd1oEb9behJSKObXe83ucgu1ExwQv9R
 ebVsxRZCGqoboeakzE1jLZ2zPMFAmBl5CsGt74Ff9tjjvLvdOnSK7PEXRNZf+mErjZ
 gzQaDXlVPKowrNeO2FDq0yZwHWegxa5uZwqwz6nuqEiRyO/sBYDv8c4OGaL0t4VzmN
 FdnO4MrA4pze0MwCSVtZMTPemW2kqjJm9FAenr0KgAEd0IzLM7rdzKxWLQtnYTCzMq
 AfI85JjO6lvwj8tlL0BT5/MEt2lp17zxOl2rj/uGDRrdpkCF3uTvrVkjsGJ0V199dP
 rteTIbizdMJzw==
Date: Thu, 10 Apr 2025 14:21:14 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
Message-ID: <Z_e3uihgYFvwmQ7C@pollux>
References: <20250410092418.135258-2-phasta@kernel.org>
 <20250410092418.135258-3-phasta@kernel.org>
 <d03c618e-aa4b-423b-9c50-143b8a197cac@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d03c618e-aa4b-423b-9c50-143b8a197cac@amd.com>
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

On Thu, Apr 10, 2025 at 02:13:34PM +0200, Christian K�nig wrote:
> Am 10.04.25 um 11:24 schrieb Philipp Stanner:
> > Nouveau currently relies on the assumption that dma_fences will only
> > ever get signaled through nouveau_fence_signal(), which takes care of
> > removing a signaled fence from the list nouveau_fence_chan.pending.
> >
> > This self-imposed rule is violated in nouveau_fence_done(), where
> > dma_fence_is_signaled() (somewhat surprisingly, considering its name)
> > can signal the fence without removing it from the list. This enables
> > accesses to already signaled fences through the list, which is a bug.
> >
> > In particular, it can race with nouveau_fence_context_kill(), which
> > would then attempt to set an error code on an already signaled fence,
> > which is illegal.
> >
> > In nouveau_fence_done(), the call to nouveau_fence_update() already
> > ensures to signal all ready fences. Thus, the signaling potentially
> > performed by dma_fence_is_signaled() is actually not necessary.
> >
> > Replace the call to dma_fence_is_signaled() with
> > nouveau_fence_base_is_signaled().
> >
> > Cc: <stable@vger.kernel.org> # 4.10+, precise commit not to be determined
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index 7cc84472cece..33535987d8ed 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -274,7 +274,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
> >  			nvif_event_block(&fctx->event);
> >  		spin_unlock_irqrestore(&fctx->lock, flags);
> >  	}
> > -	return dma_fence_is_signaled(&fence->base);
> > +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags);
> 
> See the code above that:
> 
> ������� if (fence->base.ops == &nouveau_fence_ops_legacy ||
> ����������� fence->base.ops == &nouveau_fence_ops_uevent) {

I think this check is a bit pointless given that fence is already a struct
nouveau_fence. :)
