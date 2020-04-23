Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC85B1B5495
	for <lists+nouveau@lfdr.de>; Thu, 23 Apr 2020 08:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E69F6E13A;
	Thu, 23 Apr 2020 06:10:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C8F6E135;
 Thu, 23 Apr 2020 06:10:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B47E6227A81; Thu, 23 Apr 2020 08:10:23 +0200 (CEST)
Date: Thu, 23 Apr 2020 08:10:23 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20200423061023.GA9856@lst.de>
References: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
 <5-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
 <20200422060329.GD22366@lst.de> <20200422123911.GV26002@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422123911.GV26002@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH hmm 5/5] mm/hmm: remove the customizable pfn
 format from hmm_range_fault
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 09:39:11AM -0300, Jason Gunthorpe wrote:
> > Nice callchain from hell..  Unfortunately such "code listings" tend to
> > get out of date very quickly, so I'm not sure it is worth keeping in
> > the code.  What would be really worthile is consolidating the two
> > different sets of defines (NVIF_VMM_PFNMAP_V0_ vs NVKM_VMM_PFN_)
> > to make the code a little easier to follow.
> 
> I was mainly concerned that this function is using hmm properly,
> becuase it sure looks like it is just forming the CPU physical address
> into a HW specific data. But it turns out it is just an internal data
> for some other code and the dma_map is impossibly far away
> 
> It took forever to find, I figured I'd leave a hint for the next poor
> soul that has to look at this.. 
> 
> Also, I think it shows there is no 'performance' argument here, if
> this path needs more performance the above should be cleaned
> before we abuse hmm_range_fault.
> 
> Put it in the commit message instead?

Yes, the graph itself sounds reasonable for the commit log as a point
of time information.

> > >  	npages = (range->end - range->start) >> PAGE_SHIFT;
> > >  	for (i = 0; i < npages; ++i) {
> > >  		struct page *page;
> > >  
> > > +		if (!(range->hmm_pfns[i] & HMM_PFN_VALID)) {
> > > +			ioctl_addr[i] = 0;
> > >  			continue;
> > > +		}
> > 
> > Can't we rely on the caller pre-zeroing the array?
> 
> This ends up as args.phys in nouveau_svm_fault - I didn't see a
> zeroing?
> 
> I think it makes sense that this routine fully sets the output array
> and does not assume pre-initialize

Ok.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
