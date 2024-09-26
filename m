Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2C798742B
	for <lists+nouveau@lfdr.de>; Thu, 26 Sep 2024 15:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DF910EB40;
	Thu, 26 Sep 2024 13:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q3wf+1Om";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E8210EB2C
 for <nouveau@lists.freedesktop.org>; Thu, 26 Sep 2024 13:07:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 84F335C5761;
 Thu, 26 Sep 2024 13:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C603C4CEC5;
 Thu, 26 Sep 2024 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727356069;
 bh=b6uepNoKGBmNgWNv12pM51LJzIsTrpLZkdikjVf8S5U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q3wf+1Om0DN5ukH4JzcaCRMqQIbx7NgUmuTqWlefv/XOzQZi4lXCjzx2Ms6a+sci+
 1NmdmJTk0yXFs8EXoCIz/Sw/zWp+KRTzEdfIdnSNPgjNaKjj3QgYUwUlJvthoZCGOR
 5YtO2ffPcE5v0mczLmpjApOhpAlB64qvW3a3zXKLn2woPfs6Tc4fWdJ8u9UvDF6OkK
 2zsncgJ8syz87Iv9egN4jwWoYAOgOQ4kbCDUlwn5cIJNUljdAGlujfENTkoNuJXGI7
 j+A+M09Sg4wq5FTad9Hf2Gv1lvTmvcK/gN/syaD7BEpwwxpLODlDIb5NhQ9xz/037o
 UkusMmzvp2Smg==
Date: Thu, 26 Sep 2024 15:07:40 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: Zhi Wang <zhiw@nvidia.com>, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, alex.williamson@redhat.com,
 kevin.tian@intel.com, airlied@gmail.com, daniel@ffwll.ch,
 acurrid@nvidia.com, cjia@nvidia.com, smitra@nvidia.com,
 ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 00/29] Introduce NVIDIA GPU Virtualization (vGPU) Support
Message-ID: <ZvVcnCRLd8B3Jilh@cassiopeiae>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <ZvErg51xH32b8iW6@pollux> <20240923150140.GB9417@nvidia.com>
 <2024092614-fossil-bagful-1d59@gregkh>
 <20240926124239.GX9417@nvidia.com>
 <2024092619-unglazed-actress-0a0f@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024092619-unglazed-actress-0a0f@gregkh>
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

On Thu, Sep 26, 2024 at 02:54:38PM +0200, Greg KH wrote:
> On Thu, Sep 26, 2024 at 09:42:39AM -0300, Jason Gunthorpe wrote:
> > On Thu, Sep 26, 2024 at 11:14:27AM +0200, Greg KH wrote:
> > > On Mon, Sep 23, 2024 at 12:01:40PM -0300, Jason Gunthorpe wrote:
> > > > On Mon, Sep 23, 2024 at 10:49:07AM +0200, Danilo Krummrich wrote:
> > > > > > 2. Proposal for upstream
> > > > > > ========================
> > > > > 
> > > > > What is the strategy in the mid / long term with this?
> > > > > 
> > > > > As you know, we're trying to move to Nova and the blockers with the device /
> > > > > driver infrastructure have been resolved and we're able to move forward. Besides
> > > > > that, Dave made great progress on the firmware abstraction side of things.
> > > > > 
> > > > > Is this more of a proof of concept? Do you plan to work on Nova in general and
> > > > > vGPU support for Nova?
> > > > 
> > > > This is intended to be a real product that customers would use, it is
> > > > not a proof of concept. There is alot of demand for this kind of
> > > > simplified virtualization infrastructure in the host side. The series
> > > > here is the first attempt at making thin host infrastructure and
> > > > Zhi/etc are doing it with an upstream-first approach.
> > > > 
> > > > >From the VFIO side I would like to see something like this merged in
> > > > nearish future as it would bring a previously out of tree approach to
> > > > be fully intree using our modern infrastructure. This is a big win for
> > > > the VFIO world.
> > > > 
> > > > As a commercial product this will be backported extensively to many
> > > > old kernels and that is harder/impossible if it isn't exclusively in
> > > > C. So, I think nova needs to co-exist in some way.
> > > 
> > > Please never make design decisions based on old ancient commercial
> > > kernels that have any relevance to upstream kernel development
> > > today.
> > 
> > Greg, you are being too extreme. Those "ancient commercial kernels"
> > have a huge relevance to alot of our community because they are the
> > users that actually run the code we are building and pay for it to be
> > created. Yes we usually (but not always!) push back on accommodations
> > upstream, but taking hard dependencies on rust is currently a very
> > different thing.
> 
> That's fine, but again, do NOT make design decisions based on what you
> can, and can not, feel you can slide by one of these companies to get it
> into their old kernels.  That's what I take objection to here.
> 
> Also always remember please, that the % of overall Linux kernel
> installs, even counting out Android and embedded, is VERY tiny for these
> companies.  The huge % overall is doing the "right thing" by using
> upstream kernels.  And with the laws in place now that % is only going
> to grow and those older kernels will rightfully fall away into even
> smaller %.
> 
> I know those companies pay for many developers, I'm not saying that
> their contributions are any less or more important than others, they all
> are equal.  You wouldn't want design decisions for a patch series to be
> dictated by some really old Yocto kernel restrictions that are only in
> autos, right?  We are a large community, that's what I'm saying.
> 
> > Otherwise, let's slow down here. Nova is still years away from being
> > finished. Nouveau is the in-tree driver for this HW. This series
> > improves on Nouveau. We are definitely not at the point of refusing
> > new code because it is not writte in Rust, RIGHT?

Just a reminder on what I said and not said, respectively. I never said we can't
support this in Nouveau for the short and mid term.

But we can't add new features and support new use-cases in Nouveau *without*
considering the way forward to the new driver.

> 
> No, I do object to "we are ignoring the driver being proposed by the
> developers involved for this hardware by adding to the old one instead"
> which it seems like is happening here.
> 
> Anyway, let's focus on the code, there's already real issues with this
> patch series as pointed out by me and others that need to be addressed
> before it can go anywhere.
> 
> thanks,
> 
> greg k-h
> 
