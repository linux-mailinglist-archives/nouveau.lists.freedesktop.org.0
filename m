Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0479A10DE
	for <lists+nouveau@lfdr.de>; Wed, 16 Oct 2024 19:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7852D10E74C;
	Wed, 16 Oct 2024 17:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="PNx+SXlF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A5F10E173
 for <nouveau@lists.freedesktop.org>; Wed, 16 Oct 2024 17:44:48 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6cbf0769512so567036d6.3
 for <nouveau@lists.freedesktop.org>; Wed, 16 Oct 2024 10:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1729100687; x=1729705487; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=o35iiCDiZ5eaKfswFFD+TpBr1+3YZIM/Zzff16IB6bs=;
 b=PNx+SXlF5jqQYd4awGxISMld4GLBD9M/rWiTPqO0HkOyU9CiPE30q6P/XNjk1d/iHj
 Zan+5wowInhPxHg1c6WWdwQABOx4i7jh54e1YEmeEaXKtoG0jB5JytrsCrD0tFUqeGzH
 oPli/fxHLWhHrtDBS2FirAbcISKRYPa/sH9BPXkP2+wRgWuZ/tpd3VL4EoLh5w2Rl2Zi
 xEfnJqHE6SUw/sfaZk65yxa8A0KaTGflXxU+F/aPMA6yDBYnahHogD0PsjuhTeb8w71e
 guX+0nv0XYAXHoAeMZico6ifl+AkROunSGDEAWyI1mf+ubKM1Q6UWq7szxrw2viEViQj
 tEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729100687; x=1729705487;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o35iiCDiZ5eaKfswFFD+TpBr1+3YZIM/Zzff16IB6bs=;
 b=hP7GqG9rGhbqjN4+RacPvDsosD1wGTfKjsVybzaHq7hO9xVlHdRsbNe0cFKU9VJlaJ
 Oe4HBkL1+PiEhOME3T6PqwpDAmw96Sv8L8YAhnDnjTBb6EvtAZaVIWq/vfBu1h+8WuTo
 jIU/SzNjHMfZP+nuOzlLmJd+X42EmjzP85jqDcULO/1Qqr7eHKzNEh24iVYfWLHccZeM
 NmQRd75WfNZAI0Sj0THeTfx3k2KKQpulpsLp+9zenO6OlfF95LLskjw0VKAJGnAKtPoo
 MsVGkZSiE+BSMBEaNYWp/9iaQ7xIuCKrC5vIYNL5/LZEC97/7Qf4AkYjRAH0NiW0YCzT
 fMBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBoks9zlyQE52xcpWcR00YY9N1bUkwaAQv19cr38ikc+tYyu532KIIz6FOBNDSUk94xygdLl0F@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpCs+QtgJL4WdNNMluLGLI+0qysZBoIGQ4y8xwOn/dqTnUhMn0
 +KJqPns0NoCaV+qCGoZ85HLT8P2Of4WIio8IMMgyoK3eYR6tAGN7tUpna8XaDq0=
X-Google-Smtp-Source: AGHT+IHcb2p/EJ+d36NHl0163jeyLVI0sDHNW9tlAjYiB2BbJs8req4vjOwcR9cJR+8TMnyYMuXpMQ==
X-Received: by 2002:a05:6214:5b06:b0:6cb:d1ae:27a6 with SMTP id
 6a1803df08f44-6cbf0095668mr259975216d6.24.1729100687504; 
 Wed, 16 Oct 2024 10:44:47 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cc22961bbasm19822836d6.108.2024.10.16.10.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 10:44:45 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1t184j-000h5k-5X;
 Wed, 16 Oct 2024 14:44:45 -0300
Date: Wed, 16 Oct 2024 14:44:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Cc: Yonatan Maman <ymaman@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, herbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
 dri-devel@lists.freedesktop.org, apopple@nvidia.com,
 bskeggs@nvidia.com, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v1 1/4] mm/hmm: HMM API for P2P DMA to device zone pages
Message-ID: <20241016174445.GF4020792@ziepe.ca>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-2-ymaman@nvidia.com>
 <Zw9F2uiq6-znYmTk@infradead.org>
 <20241016154428.GD4020792@ziepe.ca>
 <Zw_sn_DdZRUw5oxq@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw_sn_DdZRUw5oxq@infradead.org>
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

On Wed, Oct 16, 2024 at 09:41:03AM -0700, Christoph Hellwig wrote:
> On Wed, Oct 16, 2024 at 12:44:28PM -0300, Jason Gunthorpe wrote:
> > > We are talking about P2P memory here.  How do you manage to get a page
> > > that dma_map_page can be used on?  All P2P memory needs to use the P2P
> > > aware dma_map_sg as the pages for P2P memory are just fake zone device
> > > pages.
> > 
> > FWIW, I've been expecting this series to be rebased on top of Leon's
> > new DMA API series so it doesn't have this issue..
> 
> That's not going to make a difference at this level.

I'm not sure what you are asking then.

Patch 2 does pci_p2pdma_add_resource() and so a valid struct page with
a P2P ZONE_DEVICE type exists, and that gets returned back to the
hmm/odp code.

Today odp calls dma_map_page() which only works by chance in limited
cases. With Leon's revision it will call hmm_dma_map_pfn() ->
dma_iova_link() which does call pci_p2pdma_map_type() and should do
the right thing.

> > I'm guessing they got their testing done so far on a system without an
> > iommu translation?
> 
> IOMMU or not doens't matter much for P2P.  The important difference is
> through the host bridge or through a switch.  dma_map_page will work
> for P2P through the host brige (assuming the host bridge even support
> it as it also lacks the error handling for when not), but it lacks the
> handling for P2P through a switch.

On most x86 systems the BAR/bus address of the P2P memory is the same
as the CPU address, so without an IOMMU translation dma_map_page()
will return the CPU/host physical address which is the same as the
BAR/bus address and that will take the P2P switch path for testing.

Jason
