Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413871CB8B6
	for <lists+nouveau@lfdr.de>; Fri,  8 May 2020 21:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEE96EB5D;
	Fri,  8 May 2020 19:59:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2DD6EB5D
 for <nouveau@lists.freedesktop.org>; Fri,  8 May 2020 19:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gAppywnHh153AQRT3TEcx+if6lH9LfxxNVXC5Eam2gE=; b=LO1NDtV4fUL1HsosKlFp07Jetj
 ZmER83mcVniQHSmsmQkEliW+bBwKDjDgvgHLyNfoZZQSQ2d8d6uJ/E93YkCE/Pv2h22093IcHQJF/
 CQ6TzUSGi2xhmQNj1rMfTNImRqt5Y+XlZHAUWdcvwdS3kCoksTLwVBiGa5dzHrkLrC81Z5Bsx81w+
 vyMbYl3ABhhKu06mw/+kcUdRP4+2TYYCG7oCVYeSGa4gaBSaZTNDx7mUpGnSFcUEZZ5HfgBBuomDu
 MAZ3piEgZS2Htb32yXrt2sUDxPwPRqVjJHOn0ESp05K4R/E6t0rB+N92zScazXyjIB7muAAe5G5O9
 K8Pn+buQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jX99K-0004bs-6g; Fri, 08 May 2020 19:59:10 +0000
Date: Fri, 8 May 2020 12:59:10 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200508195910.GR16070@bombadil.infradead.org>
References: <20200508192009.15302-1-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508192009.15302-1-rcampbell@nvidia.com>
Subject: Re: [Nouveau] [PATCH 0/6] nouveau/hmm: add support for mapping
 large pages
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
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, May 08, 2020 at 12:20:03PM -0700, Ralph Campbell wrote:
> hmm_range_fault() returns an array of page frame numbers and flags for
> how the pages are mapped in the requested process' page tables. The PFN
> can be used to get the struct page with hmm_pfn_to_page() and the page size
> order can be determined with compound_order(page) but if the page is larger
> than order 0 (PAGE_SIZE), there is no indication that the page is mapped
> using a larger page size. To be fully general, hmm_range_fault() would need
> to return the mapping size to handle cases like a 1GB compound page being
> mapped with 2MB PMD entries. However, the most common case is the mapping
> size the same as the underlying compound page size.
> This series adds a new output flag to indicate this so that callers know it
> is safe to use a large device page table mapping if one is available.
> Nouveau and the HMM tests are updated to use the new flag.

This explanation doesn't make any sense.  It doesn't matter how somebody
else has it mapped; if it's a PMD-sized page, you can map it with a
2MB mapping.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
