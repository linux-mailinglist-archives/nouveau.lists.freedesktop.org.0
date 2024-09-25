Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D11B98576C
	for <lists+nouveau@lfdr.de>; Wed, 25 Sep 2024 12:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9883310E055;
	Wed, 25 Sep 2024 10:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fXVw64MJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED0D10E055
 for <nouveau@lists.freedesktop.org>; Wed, 25 Sep 2024 10:55:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3A3F05C5D3F;
 Wed, 25 Sep 2024 10:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E632C4CEC7;
 Wed, 25 Sep 2024 10:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727261750;
 bh=w59fsBYTm2jesRnmJ5WyaPgj8Bmrwwx6gRDeIrJFrxY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fXVw64MJk4YqlwPDzVRI0omGyDr7fUFkELy+vSfBpmAwUaFMZRF0TIFoDoBYJroPk
 EtclFOr2lRCQrLD0hY9fAqjCSn4RFri/8wKDBA7Zu3f/D0LD9uBBPWcbr5ENAK9fqx
 iwQHJGADlWjklHlrm1wUyczBUNl02y0cczQe/6GZski54AL92+PUr3xkcPb3INXXVR
 OxpGCIA9ueXmNuKaTPZ8vqnxoGOcOYHxJw26TZuWSgY9164oQKRhfuy4Hnf9XTqQro
 rm2f/0UGTbSrejLj9ucf296StNFjjWioNrAuaaDb8QTLxdFFFXe1t2CZ+Gde07rYr8
 VjJoEayBpe3zQ==
Date: Wed, 25 Sep 2024 12:55:44 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Zhi Wang <zhiw@nvidia.com>, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, alex.williamson@redhat.com,
 kevin.tian@intel.com, airlied@gmail.com, daniel@ffwll.ch,
 acurrid@nvidia.com, cjia@nvidia.com, smitra@nvidia.com,
 ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 00/29] Introduce NVIDIA GPU Virtualization (vGPU) Support
Message-ID: <ZvPsMKytGbcSLACo@pollux>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <ZvErg51xH32b8iW6@pollux> <20240923150140.GB9417@nvidia.com>
 <ZvHwzzp2F71W8TAs@pollux.localdomain>
 <20240924164151.GJ9417@nvidia.com> <ZvMZisyZFO888N0E@cassiopeiae>
 <20240925005319.GP9417@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925005319.GP9417@nvidia.com>
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

On Tue, Sep 24, 2024 at 09:53:19PM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 24, 2024 at 09:56:58PM +0200, Danilo Krummrich wrote:
> 
> > Currently - and please correct me if I'm wrong - you make it sound to me as if
> > you're not willing to respect the decisions that have been taken by Nouveau and
> > DRM maintainers.
> 
> I've never said anything about your work, go do Nova, have fun.

See, that's the attitude that doesn't get us anywhere.

You act as if we'd just be toying around to have fun, position yourself as the
one who wants to do the "real deal" and just claim that our decisions would harm
users.

And at the same time you proof that you did not get up to speed on what were the
reasons to move in this direction and what are the problems we try to solve.

This just won't lead to a constructive discussion that addresses your concerns.

Try to not go like a bull at a gate. Instead start with asking questions to
understand why we chose this direction and then feel free to raise concerns.

I assure you, we will hear and recognize them! And I'm also sure that we'll find
solutions and compromises.

> 
> I'm just not agreeing to being forced into taking Rust dependencies in
> VFIO because Nova is participating in the Rust Experiment.
> 
> I think the reasonable answer is to accept some code duplication, or
> try to consolidate around a small C core. I understad this is
> different than you may have planned so far for Nova, but all projects
> are subject to community feedback, especially when faced with new
> requirements.

Fully agree, and I'm absolutely open to consider feedback and new requirements.

But again, consider what I said above -- you're creating counterproposals out of
thin air, without considering what we have planned for so far at all.

So, I wonder what kind of reaction you expect approaching things this way?

> 
> I think this discussion is getting a little overheated, there is lots
> of space here for everyone to do their things. Let's not get too
> excited.
> 
> > I encourage that NVIDIA wants to move things upstream and I'm absolutely willing
> > to collaborate and help with the use-cases and goals NVIDIA has. But it really
> > has to be a collaboration and this starts with acknowledging the goals of *each
> > other*.
> 
> I've always acknowledged Nova's goal - it is fine.
> 
> It is just quite incompatible with the VFIO side requirement of no
> Rust in our stack until the ecosystem can consume it.
> 
> I belive there is no reason we can't find an agreeable compromise.

I'm pretty sure we indeed can find agreeable compromise. But again, please
understand that the way of approaching this you've chosen so far won't get us
there.

> 
> > > I expect the core code would continue to support new HW going forward
> > > to support the VFIO driver, even if nouveau doesn't use it, until Rust
> > > reaches some full ecosystem readyness for the server space.
> > 
> > From an upstream perspective the kernel doesn't need to consider OOT drivers,
> > i.e. the guest driver.
> 
> ?? VFIO already took the decision that it is agnostic to what is
> running in the VM. Run Windows-only VMs for all we care, it is still
> supposed to be virtualized correctly.
> 
> > > There are going to be a lot of users of this code, let's not rush to
> > > harm them please.
> > 
> > Please abstain from such kind of unconstructive insinuations; it's ridiculous to
> > imply that upstream kernel developers and maintainers would harm the users of
> > NVIDIA GPUs.
> 
> You literally just said you'd want to effectively block usable VFIO
> support for new GPU HW when "we stop further support for new HW in
> Nouveau at some point" and "move the vGPU parts over to Nova(& rust)".

Well, working on a successor means that once it's in place the support for the
replaced thing has to end at some point.

This doesn't mean that we can't work out ways to address your concerns.

You just make it a binary thing and claim that if we don't choose 1 we harm
users.

This effectively denies looking for solutions of your concerns in the first
place. And again, this won't get us anywhere. It just creates the impression
that you're not interested in solutions, but push through your agenda.

> 
> I don't agree to that, it harms VFIO users, and is not acknowledging
> that conflicting goals exist.
> 
> VFIO will decide when it starts to depend on rust, Nova should not
> force that decision on VFIO. They are very different ecosystems with
> different needs.
> 
> Jason
> 
