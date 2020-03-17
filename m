Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92277188420
	for <lists+nouveau@lfdr.de>; Tue, 17 Mar 2020 13:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9226E0E8;
	Tue, 17 Mar 2020 12:28:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9639D6E0E8;
 Tue, 17 Mar 2020 12:28:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1763568BFE; Tue, 17 Mar 2020 13:28:14 +0100 (CET)
Date: Tue, 17 Mar 2020 13:28:13 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20200317122813.GA11866@lst.de>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
 <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
 <20200317121536.GQ20941@ziepe.ca> <20200317122445.GA11662@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317122445.GA11662@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 3/4] mm: simplify device private page handling
 in hmm_range_fault
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kvm-ppc@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 01:24:45PM +0100, Christoph Hellwig wrote:
> On Tue, Mar 17, 2020 at 09:15:36AM -0300, Jason Gunthorpe wrote:
> > > Getting rid of HMM_PFN_DEVICE_PRIVATE seems reasonable to me since a driver can
> > > look at the struct page but what if a driver needs to fault in a page from
> > > another device's private memory? Should it call handle_mm_fault()?
> > 
> > Isn't that what this series basically does?
> >
> > The dev_private_owner is set to the type of pgmap the device knows how
> > to handle, and everything else is automatically faulted for the
> > device.
> > 
> > If the device does not know how to handle device_private then it sets
> > dev_private_owner to NULL and it never gets device_private pfns.
> > 
> > Since the device_private pfn cannot be dma mapped, drivers must have
> > explicit support for them.
> 
> No, with this series (and all actual callers before this series)
> we never fault in device private pages.

IFF we want to fault it in we'd need something like this.  But I'd
really prefer to see test cases for that first.

diff --git a/mm/hmm.c b/mm/hmm.c
index b75b3750e03d..2884a3d11a1f 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -276,7 +276,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		if (!fault && !write_fault)
 			return 0;
 
-		if (!non_swap_entry(entry))
+		if (!non_swap_entry(entry) || is_device_private_entry(entry))
 			goto fault;
 
 		if (is_migration_entry(entry)) {
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
