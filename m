Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6196F9886FF
	for <lists+nouveau@lfdr.de>; Fri, 27 Sep 2024 16:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7BE10EC5F;
	Fri, 27 Sep 2024 14:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WuDB5ZFd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB82B10EC5F
 for <nouveau@lists.freedesktop.org>; Fri, 27 Sep 2024 14:22:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DC4E75C0061;
 Fri, 27 Sep 2024 14:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19117C4CECE;
 Fri, 27 Sep 2024 14:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727446958;
 bh=A1PgpXPfAVOOpNUrS1DLHR5nv951c/mmKxo+FSRbEfw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WuDB5ZFdJ97sLE5y7JpTD2s5k6uqWKmDVD2jj+6Nz8qBzK7WJRwe6ZVBbtWAcsJoE
 ioZ41PE2RSqVoTbLbWm/M8qm9bocumkqMfANSi2Pqd1xIlo0RtDg94wLfwR3+5FBhd
 /SybbFZe4J7C0LHSjECGgFKg6KCVErWVZ4zqAMtjvnETskestmu74pttYIpEQQVueM
 GbOrD3SnPOpFUZPUDJS9qZiq9xUjX+N8N6hUkUVyZJ07PpLSI6xfH/uNNxGAu2+B1K
 NEucUHZBvam/B4q3RTlA/gAtRLxDEhcYgGm0rzVJZKBFsKuxPPc5RHUqTE9inBcIsj
 P2vcqeyPis4WQ==
Date: Fri, 27 Sep 2024 16:22:32 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Zhi Wang <zhiw@nvidia.com>,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 alex.williamson@redhat.com, kevin.tian@intel.com, airlied@gmail.com,
 daniel@ffwll.ch, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 00/29] Introduce NVIDIA GPU Virtualization (vGPU) Support
Message-ID: <Zva_qP2B4rndSiCw@pollux>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <ZvErg51xH32b8iW6@pollux> <20240923150140.GB9417@nvidia.com>
 <2024092614-fossil-bagful-1d59@gregkh>
 <20240926124239.GX9417@nvidia.com>
 <2024092619-unglazed-actress-0a0f@gregkh>
 <20240926144057.GZ9417@nvidia.com>
 <ZvXjcPOCVUSlALZZ@pollux.localdomain>
 <20240927125115.GZ9417@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927125115.GZ9417@nvidia.com>
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

On Fri, Sep 27, 2024 at 09:51:15AM -0300, Jason Gunthorpe wrote:
> On Fri, Sep 27, 2024 at 12:42:56AM +0200, Danilo Krummrich wrote:
> > On Thu, Sep 26, 2024 at 11:40:57AM -0300, Jason Gunthorpe wrote:
> > > On Thu, Sep 26, 2024 at 02:54:38PM +0200, Greg KH wrote:
> > > > 
> > > > No, I do object to "we are ignoring the driver being proposed by the
> > > > developers involved for this hardware by adding to the old one instead"
> > > > which it seems like is happening here.
> > > 
> > > That is too harsh. We've consistently taken a community position that
> > > OOT stuff doesn't matter, and yes that includes OOT stuff that people
> > > we trust and respect are working on. Until it is ready for submission,
> > > and ideally merged, it is an unknown quantity. Good well meaning
> > > people routinely drop their projects, good projects run into
> > > unexpected roadblocks, and life happens.
> > 
> > That's not the point -- at least it never was my point.
> > 
> > Upstream has set a strategy, and it's totally fine to raise concerns, discuss
> > them, look for solutions, draw conclusions and do adjustments where needed.
> 
> We don't really do strategy in the kernel. This language is a bit
> off putting. Linux runs on community consensus and if any strategy
> exists it is reflected by the code actually merged.

We can also just call it "goals", but either way, of course maintainers set
goals for the components they maintain and hence have some sort of "strategy"
how they want to evolve their components, to solve existing or foreseeable
problems.

However, I agree that those things may be reevaluated based on community
feedback and consensus. And I'm happy to do that.

See, you're twisting my words and imply that we wouldn't look for community
consensus, while I'm *explicitly* asking you to let us do exactly that. I want
to find consensus on the long term goals that we all work on *together*, because
I don't want to end up with competing projects.

And I think it's reasonable to first consider the goals that have been set
already. Again, feel free to raise concerns and we'll discuss them and look for
solutions, but please not just ignore the existing goals.

> 
> When you say things like this it comes across as though you are
> implying there are two tiers to the community. Ie those that set the
> strategy and those that don't.

This isn't true, I just ask you to consider the goals that have been set
already, because we have been working on this already.

*We can discuss them*, but I indeed ask you to accept the current direction as a
baseline for discussion. I don't think this is unreasonable, is it?

> 
> > But, we have to agree on a long term strategy and work towards the corresponding
> > goals *together*.
> 
> I think we went over all the options already. IMHO the right one is
> for nova and vfio to share some kind of core driver. The choice of
> Rust for nova complicates planning this, but it doesn't mean anyone is
> saying no to it.

This is the problem, you're many steps ahead.

You should start with understanding why we want the core driver to be in Rust.
You then can raise your concerns about it and then we can discuss them and see
if we can find solutions / consensus.

But you're not even considering it, and instead start with a counter proposal.
This isn't acceptable to me.

> 
> My main point is when this switches from VFIO on nouveau to VFIO on
> Nova is something that needs to be a mutual decision with the VFIO
> side and user community as well.

To me it's important that we agree on the goals and work towards them together.
If we seriously do that, then the "when" should be trival to agree on.

> 
> > So, when you say things like "go do Nova, have fun", it really just sounds like
> > as if you just want to do your own thing and ignore the existing upstream
> > strategy instead of collaborate and shape it.
> 
> I am saying I have no interest in interfering with your
> project. Really, I read your responses as though you feel Nova is
> under attack and I'm trying hard to say that is not at all my
> intention.

I don't read this as Nova "being under attack" at all. I read it as "I don't
care about the goal to have the core driver in Rust, nor do I care about the
reasons you have for this.".

> 
> Jason
> 
