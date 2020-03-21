Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 074B518DEBF
	for <lists+nouveau@lfdr.de>; Sat, 21 Mar 2020 09:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6128B6E0DB;
	Sat, 21 Mar 2020 08:22:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72E26E0DB;
 Sat, 21 Mar 2020 08:22:39 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D1BDB68AFE; Sat, 21 Mar 2020 09:22:36 +0100 (CET)
Date: Sat, 21 Mar 2020 09:22:36 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20200321082236.GB28613@lst.de>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-5-hch@lst.de> <20200320134109.GA30230@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320134109.GA30230@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 4/4] mm: check the device private page owner
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Mar 20, 2020 at 10:41:09AM -0300, Jason Gunthorpe wrote:
> Thinking about this some more, does the locking work out here?
> 
> hmm_range_fault() runs with mmap_sem in read, and does not lock any of
> the page table levels.
> 
> So it relies on accessing stale pte data being safe, and here we
> introduce for the first time a page pointer dereference and a pgmap
> dereference without any locking/refcounting.
> 
> The get_dev_pagemap() worked on the PFN and obtained a refcount, so it
> created safety.
> 
> Is there some tricky reason this is safe, eg a DEVICE_PRIVATE page
> cannot be removed from the vma without holding mmap_sem in write or
> something?

I don't think there is any specific protection.  Let me see if we
can throw in a get_dev_pagemap here - note that current mainline doesn't
even use it for this path..
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
