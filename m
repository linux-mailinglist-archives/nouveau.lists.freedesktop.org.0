Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8D198A943
	for <lists+nouveau@lfdr.de>; Mon, 30 Sep 2024 18:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0271410E542;
	Mon, 30 Sep 2024 16:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lJTWCMdV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78AF310E542
 for <nouveau@lists.freedesktop.org>; Mon, 30 Sep 2024 16:00:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BED405C019D;
 Mon, 30 Sep 2024 15:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017BFC4CEC7;
 Mon, 30 Sep 2024 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727712002;
 bh=xpl15b9FyDkcN8x9JvtrD+Sty/utwKCzq04E/ZiAnmM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lJTWCMdVUT1qkIF+nZtNE9OtRn9uJAp5uH9XE5HbZQU+zRc7ZoM5L4U3m7b3SYS0T
 8h4bw4fjMuV9u8XnTgdSgB5RDJgBK8zUL4itI16ADTRme0clGjTHVwkMXYTVitIbv9
 raPsNuNi5bNC1Cjy7WHFUBUp75+xVztFKQLs5Ih2MsAf6KYe8hN+weLY6/CIE18lNQ
 wqjLQft2ypTXR8dq2C09Un1BpVi4ZRS17EPmi4YRVKTV1ukNnOEolr61sOzzgTbDsz
 HkwDK9yrYKpeIVLDXG//sdfcfcRjzG5nvidJVqgG11DT/5Gs1GWvDtgBvLFYv+aan3
 A51do83VMrxsg==
Date: Mon, 30 Sep 2024 17:59:56 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Zhi Wang <zhiw@nvidia.com>,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 alex.williamson@redhat.com, kevin.tian@intel.com, airlied@gmail.com,
 daniel@ffwll.ch, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 00/29] Introduce NVIDIA GPU Virtualization (vGPU) Support
Message-ID: <ZvrK_H0RUpglhdaz@pollux>
References: <ZvErg51xH32b8iW6@pollux> <20240923150140.GB9417@nvidia.com>
 <2024092614-fossil-bagful-1d59@gregkh>
 <20240926124239.GX9417@nvidia.com>
 <2024092619-unglazed-actress-0a0f@gregkh>
 <20240926144057.GZ9417@nvidia.com>
 <ZvXjcPOCVUSlALZZ@pollux.localdomain>
 <20240927125115.GZ9417@nvidia.com> <Zva_qP2B4rndSiCw@pollux>
 <20240927152724.GC4568@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927152724.GC4568@nvidia.com>
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

On Fri, Sep 27, 2024 at 12:27:24PM -0300, Jason Gunthorpe wrote:
> On Fri, Sep 27, 2024 at 04:22:32PM +0200, Danilo Krummrich wrote:
> > > When you say things like this it comes across as though you are
> > > implying there are two tiers to the community. Ie those that set the
> > > strategy and those that don't.
> > 
> > This isn't true, I just ask you to consider the goals that have been set
> > already, because we have been working on this already.
> 
> Why do keep saying I haven't?

Because I haven't seen you to acknowlege that the current direction we're moving
to is that we're trying to move away from Nouveau and start over with a new
GSP-only solution.

Instead you propose a huge architectural rework of Nouveau, extract a core
driver from Nouveau and make this the long term solution.

> 
> I have no intention of becoming involved in your project or
> nouveau. My only interest here is to get an agreement that we can get
> a VFIO driver (to improve the VFIO subsystem and community!) in the
> near term on top of in-tree nouveau.

Two aspects about this.

First, Nova isn't a different project in this sense, it's the continuation of
Nouveau to overcome several problems we have with Nouveau.

Second, of course you have the intention of becoming involved in the Nouveau /
Nova project. You ask for huge architectural changes of Nouveau, including new
interfaces for a VFIO driver on top. If that's not becoming involved what else
would it be?

> 
> > > > But, we have to agree on a long term strategy and work towards the corresponding
> > > > goals *together*.
> > > 
> > > I think we went over all the options already. IMHO the right one is
> > > for nova and vfio to share some kind of core driver. The choice of
> > > Rust for nova complicates planning this, but it doesn't mean anyone is
> > > saying no to it.
> > 
> > This is the problem, you're many steps ahead.
> > 
> > You should start with understanding why we want the core driver to be in Rust.
> > You then can raise your concerns about it and then we can discuss them and see
> > if we can find solutions / consensus.
> 
> I don't want to debate with you about Nova. It is too far in the
> future, and it doesn't intersect with anything I am doing.

Sure it does. Again, Nova is intended to be the continuation of Nouveau. So, if
you want to do a major rework in Nouveau (and hence become involved in the
project) we have to make sure that we progress things in the same direction.

How do you expect the project to be successful in the long term, if the involved
parties are not willing to agree at a direction and common goals for the
project?

Or is it that you are simply not interested in long term? Do you have reasons to
think that the problems we have with Nouveau just go away in the long term? Do
you plan to solve them within Nouveau? If so, how do you plan to do that?

> 
> > But you're not even considering it, and instead start with a counter proposal.
> > This isn't acceptable to me.
> 
> I'm even agreeing to a transition into a core driver in Rust, someday,
> when the full community can agree it is the right time.
> 
> What more do you want from me?

I want that the people involved in the project seriously discuss and align on
the direction and goals for the project in the long term and work towards them
together.
