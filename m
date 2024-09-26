Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E95986FB3
	for <lists+nouveau@lfdr.de>; Thu, 26 Sep 2024 11:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B9610E079;
	Thu, 26 Sep 2024 09:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ijv7+ahb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350E310E079
 for <nouveau@lists.freedesktop.org>; Thu, 26 Sep 2024 09:14:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 160EAA44CA0;
 Thu, 26 Sep 2024 09:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28295C4CEC5;
 Thu, 26 Sep 2024 09:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1727342070;
 bh=XS7pIhVuGftzBcIudpqgE2j6Up34ez13SrgcTZaEytE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ijv7+ahb6OK1eg39Vq41t+Wcb0XJvjHAwuL1oa2X1qLY57SL8u0XqrTlLH5x9rum2
 d2yfH23EOqxM4UfVS/CBi7Wb0Mblj0RpSoVxgdPLqmw6e5rIR30Mp3NobQiEjNxdBJ
 s5z3JGrqKh6gzIhJIAcgrn2BvdeVuEx2z6n/lwqE=
Date: Thu, 26 Sep 2024 11:14:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 alex.williamson@redhat.com, kevin.tian@intel.com, airlied@gmail.com,
 daniel@ffwll.ch, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 00/29] Introduce NVIDIA GPU Virtualization (vGPU) Support
Message-ID: <2024092614-fossil-bagful-1d59@gregkh>
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
> simplified virtualization infrastructure in the host side. The series
> here is the first attempt at making thin host infrastructure and
> Zhi/etc are doing it with an upstream-first approach.
> 
> >From the VFIO side I would like to see something like this merged in
> nearish future as it would bring a previously out of tree approach to
> be fully intree using our modern infrastructure. This is a big win for
> the VFIO world.
> 
> As a commercial product this will be backported extensively to many
> old kernels and that is harder/impossible if it isn't exclusively in
> C. So, I think nova needs to co-exist in some way.

Please never make design decisions based on old ancient commercial
kernels that have any relevance to upstream kernel development today.
If you care about those kernels, work with the companies that get paid
to support such things.  Otherwise development upstream would just
completely stall and never go forward, as you well know.

As it seems that future support for this hardware is going to be in
rust, just use those apis going forward and backport the small number of
missing infrastructure patches to the relevant ancient kernels as well,
it's not like that would even be noticed in the overall number of
patches they take for normal subsystem improvements :)

thanks,

greg k-h
