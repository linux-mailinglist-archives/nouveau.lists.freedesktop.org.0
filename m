Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BA620FF60
	for <lists+nouveau@lfdr.de>; Tue, 30 Jun 2020 23:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4456E503;
	Tue, 30 Jun 2020 21:43:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1180 seconds by postgrey-1.36 at gabe;
 Tue, 30 Jun 2020 21:43:30 UTC
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7FF6E4B1
 for <nouveau@lists.freedesktop.org>; Tue, 30 Jun 2020 21:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=n8SHJfzy7p8PW3wOzwIG1BQWiEf6w6qyoS+BP0Vtvzc=; b=CWOPBHTbbV7jN6/0NnoGwn1IDU
 /8KBtqnWiJHtbzZnkwChwmYJjDAb2XDLufpU89h7mqwO7TlRcjxxI6rjcpTKLMx6q0Ff7L2fgDHmO
 DRsSGKj2b5iviSdaZSUjHgmK6nzwT7QXmpDPtFAA/CgPqJpNdmN5cJZhkbGZtrfYyBUuRpPE6pQ/D
 fhrlZYuY5B3JC8jSeH9oPEyVT7vUzZwwZOItAp00BZLjBSCipFKj1lWvQoNNkHIIbc/nmOp3Uh4fm
 AgPWvtO+pb0HLSss5V8jEjJebl1GuZvzjDkD8LqeTRHug9r51lYFKveyh+de9kE2sdRSrg8bliJHF
 wAIENPMQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jqNjD-00007m-C1; Tue, 30 Jun 2020 21:23:43 +0000
Date: Tue, 30 Jun 2020 22:23:43 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200630212343.GP25523@casper.infradead.org>
References: <20200630195737.8667-1-rcampbell@nvidia.com>
 <20200630195737.8667-3-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630195737.8667-3-rcampbell@nvidia.com>
Subject: Re: [Nouveau] [PATCH v2 2/5] mm/hmm: add output flags for PMD/PUD
 page mapping
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
Cc: linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-kselftest@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Jun 30, 2020 at 12:57:34PM -0700, Ralph Campbell wrote:
> hmm_range_fault() returns an array of page frame numbers and flags for
> how the pages are mapped in the requested process' page tables. The PFN
> can be used to get the struct page with hmm_pfn_to_page() and the page
> size order can be determined with compound_order(page) but if the page
> is larger than order 0 (PAGE_SIZE), there is no indication that a
> compound page is mapped by the CPU using a larger page size. Without
> this information, the caller can't safely use a large device PTE to map
> the compound page because the CPU might be using smaller PTEs with
> different read/write permissions.
> 
> Add two new output flags to indicate the mapping size (PMD or PUD sized)
> so that callers know the pages are being mapped with consistent permissions
> and a large device page table mapping can be used if one is available.

The problem I have with this is that PTE/PMD/PUD are not the only choices
for how the CPU might choose to map something.  For example, ARM has
the ability to map 64kB pages using 16 consecutive page table entries
(marked specially so the CPU knows to use a single TLB entry for the
64kB range).  Some other CPUs have similar capabilities.

I'd rather you encoded the order of the mapping in the flags (eg a
number between 0 and 31) so that we have the flexibility in the future
to describe how memory is mapped.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
