Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55439839EE
	for <lists+nouveau@lfdr.de>; Tue, 24 Sep 2024 01:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A7010E0D4;
	Mon, 23 Sep 2024 22:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ljHHfAAt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B15010E0D4
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2024 22:51:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F7F65C486B;
 Mon, 23 Sep 2024 22:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622E3C4CEC4;
 Mon, 23 Sep 2024 22:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727131860;
 bh=8noWtyjIGux9sVydkc6f0bWiMNZS85PAHcHlmEf+12E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ljHHfAAt6110D1DNsnx+Su/WukODjxIzg9ZQa3AD6bMSdM0KAeojlK7TSSDxUTb2F
 dS4WgMvbkT/qpC364ts2uKsCg1LgjvJS6gw75QIYMEmM0rn4jIrtpoQMNllRwxAWhU
 /JSsrBUOwQcU210Wp/hmemvReJPFOkU/B0eylcq+7/p5iDf482VzCVXfBUZBXSFiS9
 lnBMvtP5HRyX55asUu4NmYs82H4A4VWU4OyXABmN6OZSh8PcJg2LunISKiBc7pP9MM
 //wm0ngHVDUk8K+m3ooTYgqybIxXRvQXVs+qHWvkpWJb7xVqtU3dHU6d1Gwe1rVtGX
 1eEI2Vb/pM1uw==
Date: Tue, 24 Sep 2024 00:50:55 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Zhi Wang <zhiw@nvidia.com>, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, alex.williamson@redhat.com,
 kevin.tian@intel.com, airlied@gmail.com, daniel@ffwll.ch,
 acurrid@nvidia.com, cjia@nvidia.com, smitra@nvidia.com,
 ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 00/29] Introduce NVIDIA GPU Virtualization (vGPU) Support
Message-ID: <ZvHwzzp2F71W8TAs@pollux.localdomain>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <ZvErg51xH32b8iW6@pollux> <20240923150140.GB9417@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923150140.GB9417@nvidia.com>
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

On Mon, Sep 23, 2024 at 12:01:40PM -0300, Jason Gunthorpe wrote:
> On Mon, Sep 23, 2024 at 10:49:07AM +0200, Danilo Krummrich wrote:
> > > 2. Proposal for upstream
> > > ========================
> > 
> > What is the strategy in the mid / long term with this?
> > 
> > As you know, we're trying to move to Nova and the blockers with the device /
> > driver infrastructure have been resolved and we're able to move forward. Besides
> > that, Dave made great progress on the firmware abstraction side of things.
> > 
> > Is this more of a proof of concept? Do you plan to work on Nova in general and
> > vGPU support for Nova?
> 
> This is intended to be a real product that customers would use, it is
> not a proof of concept. There is alot of demand for this kind of
> simplified virtualization infrastructure in the host side.

I see...

> The series
> here is the first attempt at making thin host infrastructure and
> Zhi/etc are doing it with an upstream-first approach.

This is great!

> 
> From the VFIO side I would like to see something like this merged in
> nearish future as it would bring a previously out of tree approach to
> be fully intree using our modern infrastructure. This is a big win for
> the VFIO world.
> 
> As a commercial product this will be backported extensively to many
> old kernels and that is harder/impossible if it isn't exclusively in
> C. So, I think nova needs to co-exist in some way.

We'll surely not support two drivers for the same thing in the long term,
neither does it make sense, nor is it sustainable.

We have a lot of good reasons why we decided to move forward with Nova as a
successor of Nouveau for GSP-based GPUs in the long term -- I also just held a
talk about this at LPC.

For the short/mid term I think it may be reasonable to start with Nouveau, but
this must be based on some agreements, for instance:

- take responsibility, e.g. commitment to help with maintainance with some of
  NVKM / NVIDIA GPU core (or whatever we want to call it) within Nouveau
- commitment to help with Nova in general and, once applicable, move the vGPU
  parts over to Nova

But I think the very last one naturally happens if we stop further support for
new HW in Nouveau at some point.

> 
> Jason
> 
