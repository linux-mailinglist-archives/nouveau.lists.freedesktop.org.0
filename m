Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D044987B37
	for <lists+nouveau@lfdr.de>; Fri, 27 Sep 2024 00:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B5D10E323;
	Thu, 26 Sep 2024 22:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N0lrvvWw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4084410E323
 for <nouveau@lists.freedesktop.org>; Thu, 26 Sep 2024 22:43:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 74B9C5C5419;
 Thu, 26 Sep 2024 22:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964E5C4CEC9;
 Thu, 26 Sep 2024 22:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727390582;
 bh=ic6z+f0J1Xsp+C21vp8z/xXHOYGJryS4zzfUY8FpcwM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N0lrvvWwBH2z40tuwnArLpzYdIYn8YxUQ0Sv18u1UyYrfHGEkzmsy6+tWwAlGbEsy
 pJNAx3ZWsFk+xbJyrQhJUL0AcG1sqYpTp3fNZHO7DfTtkczUuZQe7s9TDm6//Nxp7e
 9cJ98hUPhBOZ53aFA9E2bZRY9FgjVdTQT9PPkxbaL4CrShl51q4HDJ3Dd/kFJWzWNw
 3GhQlsmvY0UTlLLKKvxTbqjGKChl/JU98WlKGSbTRD/U4dC6AKBzWJCm6EN1A7eQRQ
 eV3iauiYiqvuU1haZ3kEpeqJpEeeZBRc1/Cf0ZVCVNjzQdqANRsEDtriG2gDWs2JUP
 9rG64TWRZIiyg==
Date: Fri, 27 Sep 2024 00:42:56 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Zhi Wang <zhiw@nvidia.com>,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 alex.williamson@redhat.com, kevin.tian@intel.com, airlied@gmail.com,
 daniel@ffwll.ch, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 00/29] Introduce NVIDIA GPU Virtualization (vGPU) Support
Message-ID: <ZvXjcPOCVUSlALZZ@pollux.localdomain>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <ZvErg51xH32b8iW6@pollux> <20240923150140.GB9417@nvidia.com>
 <2024092614-fossil-bagful-1d59@gregkh>
 <20240926124239.GX9417@nvidia.com>
 <2024092619-unglazed-actress-0a0f@gregkh>
 <20240926144057.GZ9417@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926144057.GZ9417@nvidia.com>
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

On Thu, Sep 26, 2024 at 11:40:57AM -0300, Jason Gunthorpe wrote:
> On Thu, Sep 26, 2024 at 02:54:38PM +0200, Greg KH wrote:
> > 
> > No, I do object to "we are ignoring the driver being proposed by the
> > developers involved for this hardware by adding to the old one instead"
> > which it seems like is happening here.
> 
> That is too harsh. We've consistently taken a community position that
> OOT stuff doesn't matter, and yes that includes OOT stuff that people
> we trust and respect are working on. Until it is ready for submission,
> and ideally merged, it is an unknown quantity. Good well meaning
> people routinely drop their projects, good projects run into
> unexpected roadblocks, and life happens.

That's not the point -- at least it never was my point.

Upstream has set a strategy, and it's totally fine to raise concerns, discuss
them, look for solutions, draw conclusions and do adjustments where needed.

But, we have to agree on a long term strategy and work towards the corresponding
goals *together*.

I don't want to end up in a situation where everyone just does their own thing.

So, when you say things like "go do Nova, have fun", it really just sounds like
as if you just want to do your own thing and ignore the existing upstream
strategy instead of collaborate and shape it.
