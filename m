Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193F312B2A1
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFB089DA7;
	Fri, 27 Dec 2019 08:13:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BD66E31C
 for <nouveau@lists.freedesktop.org>; Fri,  1 Nov 2019 19:54:08 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id z17so14446770qts.9
 for <nouveau@lists.freedesktop.org>; Fri, 01 Nov 2019 12:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z+FjZERGJpTwj4Fyw0MaJE9Sqa2BYsQ42uoE0CYrL0A=;
 b=YeDYRdeeYeznofBfYHEGTgJUYYibnJM0tHbeYYbzhUa89eqWcwDFuoBvkqzuDcLc2T
 ofUfxex6y2BB77lEIINYfCe3LRDUm2ccatiS5G5es+IEQBkayJMlTpCysQ5WVX1USGCS
 jgTaU5H2sKmYyCCp5OAsj9y1/GibOpmNaDDE7+kpDMj1ch/KbEMGdmr4C8OACqF5MRIR
 AUJyBIqsDG9vpkYNm8vhMLDcsm1loVPhr52oeBb6m4QlAeB/pAlZ5GeOmXDE0INv1FyD
 pucRz+47DC7NbtxxhTdRuHewQn65NgI1RX8osOjLNPQ54S6sL1WB7AFJyClzypTR7d0s
 bh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z+FjZERGJpTwj4Fyw0MaJE9Sqa2BYsQ42uoE0CYrL0A=;
 b=VDk0k7WwY9Ahf0P71Fn3tqBo+Nn7xa5S7/RmKCu8oK4jP33bNYwx2U35tiVquQBUqK
 y3F23Nn81aLdJp+h3wPOzNLyq3WOrzBmAI7UrmujQtJBxRG9Klo3vyhdS5iNoAbEXcKv
 04xkR8ZQpNkuC1RqYVKnWGzCB4HBIuw3sBl+sFkZ01/CqWcDfZxCU5P1LlErJyQxq9Dg
 ZeeZcBZQI+zV6g3geAf2L7TnPNYgiOoCNPrBPNLXjZncxEUb7A3oVxlwtQsfaVDyOmIn
 Hw+tAZg/PX49mwAznDGSwVf8/CFML/+b8jkqLVs/VJnJXX1q09faApaELmhaDoaCsf1V
 NSMA==
X-Gm-Message-State: APjAAAWM8LicoAdVfKJfH3xIC8jGKvny+GRNGLV1ITq7uiC0I5ZkFXHB
 coUXiI+32OwH6Uklb8mfoUqeNw==
X-Google-Smtp-Source: APXvYqwugaF2JaYgADF6rOYRryDEd9+U+cO7L5fZ9F8hMoRL3wZJoN0ghN8hXeUNkkXowjkn9kbsRA==
X-Received: by 2002:a0c:fdcc:: with SMTP id g12mr11930964qvs.104.1572638047703; 
 Fri, 01 Nov 2019 12:54:07 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id a18sm4727748qkc.2.2019.11.01.12.54.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Nov 2019 12:54:07 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iQczm-00025n-Ng; Fri, 01 Nov 2019 16:54:06 -0300
Date: Fri, 1 Nov 2019 16:54:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Message-ID: <20191101195406.GA6732@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: Re: [Nouveau] [PATCH v2 00/15] Consolidate the mmu notifier
 interval_tree and locking
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Petr Cvek <petrcvekcz@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Oct 28, 2019 at 05:10:17PM -0300, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> 8 of the mmu_notifier using drivers (i915_gem, radeon_mn, umem_odp, hfi1,
> scif_dma, vhost, gntdev, hmm) drivers are using a common pattern where
> they only use invalidate_range_start/end and immediately check the
> invalidating range against some driver data structure to tell if the
> driver is interested. Half of them use an interval_tree, the others are
> simple linear search lists.

Now that we have the most of the driver changes tested and reviewed
I'm going to move this series into linux-next via the hmm tree, minus
the xen gntdev patches as they are not working yet.

I will keep collecting acks and any additional changes.

Thanks,
Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
