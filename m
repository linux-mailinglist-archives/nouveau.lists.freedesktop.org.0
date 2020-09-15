Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8069426B9FE
	for <lists+nouveau@lfdr.de>; Wed, 16 Sep 2020 04:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7556E98F;
	Wed, 16 Sep 2020 02:22:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9276A6E887
 for <nouveau@lists.freedesktop.org>; Tue, 15 Sep 2020 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=h6yEPMjFBbOeI1nHQxJaBbzOjrvp/dwKRkVIewBPplw=; b=FhtjCj8afEHB9EsdL/O1b5MO2/
 OK+N3R3WT5KgfOVCwmnc4a/n2dIKiQ+/ejDpcIeJqi74/LSP+Gxn40SlUAvdZt7qDk0x/I7C7w7Ju
 AU9ZCb42uRy0emXWZNFN8nicvRtWmp8LJ+9zQOZ9IigttQPMYeLnHrp3vIkvVEL3Ef4v5NWOC5D9U
 stSRHSZTECQC2/tBVGL+C81bj3RqCLcB51xuge5sg1Dz7j2rGWv96p2WryvB9TkexpZTDrTeU8aGE
 QoY/NV7HTkDRAwMNETwcmEuHQsF+nv10JLN9MO8biw9/i7BcL7QTtszMrTYStLcdfTttoZH/dX9Re
 pb+bIffw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kIDq8-0005vd-4q; Tue, 15 Sep 2020 16:29:56 +0000
Date: Tue, 15 Sep 2020 17:29:56 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200915162956.GA21990@infradead.org>
References: <20200914224509.17699-1-rcampbell@nvidia.com>
 <CAPcyv4gVJuWsOtejrKvWgByq=c1niwQOZ0HHYaSo4h6vc-Xw+Q@mail.gmail.com>
 <10b4b85c-f1e9-b6b5-74cd-6190ee0aca5d@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10b4b85c-f1e9-b6b5-74cd-6190ee0aca5d@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 16 Sep 2020 02:22:34 +0000
Subject: Re: [Nouveau] [PATCH] mm: remove extra ZONE_DEVICE struct page
 refcount
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
Cc: Yang Shi <yang.shi@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Sep 14, 2020 at 04:53:25PM -0700, Ralph Campbell wrote:
> Since set_page_refcounted() is defined in mm_interal.h I would have to
> move the definition to someplace like page_ref.h or have the drivers
> cal init_page_count() or set_page_count() since get_page() calls
> VM_BUG_ON_PAGE() if refcount == 0.
> I'll move set_page_refcounted() since that is what the page allocator
> uses and seems named for the purpose.

I don't think any of the three ->page_free instances even cares about
the page refcount.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
