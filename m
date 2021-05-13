Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C52537F872
	for <lists+nouveau@lfdr.de>; Thu, 13 May 2021 15:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7B26E883;
	Thu, 13 May 2021 13:15:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AC56E883
 for <nouveau@lists.freedesktop.org>; Thu, 13 May 2021 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CqhS/DjApfCwkLFCvP6kllDyz5SMs1FoNvFzUNiKyfA=; b=d8SS8qgwVEBfC/z564sa+2N9DF
 Wzl+TkORKwOMT+wsnvHLbotWjCbktxMqEnEd2QDACc1JoP6nuoT0gG+x6tSw0bH/nMZmg3vcFw6bk
 T9uVRNj0t06RnJG86r4+uzrnLHwlQSMb56hyRRPYQTBnk6U+x/MSZe3SCKnWIz/ozlPPAYy1gj+4q
 HvSfyuYYfdpXO5LS6n3ggU8Sml9RM0tpfiBgwZrFWjnivtBXZC1AjPstssMqYjg0jJRha16bVMCV1
 kn3Rz01pS2/4jQSLQY4ZUixfzSpIiGfI8UfZ528pvwk//NUchwwjGJ7iq2xlPLP94iBxGBki80CBw
 OJddTV1Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lhBB6-009RwN-5m; Thu, 13 May 2021 13:15:10 +0000
Date: Thu, 13 May 2021 14:15:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <YJ0mVAK7OjwIGnMe@casper.infradead.org>
References: <20201001181715.17416-1-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201001181715.17416-1-rcampbell@nvidia.com>
Subject: Re: [Nouveau] [RFC PATCH v3 0/2] mm: remove extra ZONE_DEVICE
 struct page refcount
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
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Oct 01, 2020 at 11:17:13AM -0700, Ralph Campbell wrote:
> This is still an RFC because after looking at the pmem/dax code some
> more, I realized that the ZONE_DEVICE struct pages are being inserted
> into the process' page tables with vmf_insert_mixed() and a zero
> refcount on the ZONE_DEVICE struct page. This is sort of OK because
> insert_pfn() increments the reference count on the pgmap which is what
> prevents memunmap_pages() from freeing the struct pages and it doesn't
> check for a non-zero struct page reference count.
> But, any calls to get_page() will hit the VM_BUG_ON_PAGE() that
> checks for a reference count == 0.

This seems to have gone quiet.  What needs to happen to resurrect this?
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
