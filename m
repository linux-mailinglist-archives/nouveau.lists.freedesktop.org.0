Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173309A004E
	for <lists+nouveau@lfdr.de>; Wed, 16 Oct 2024 06:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31EF10E66F;
	Wed, 16 Oct 2024 04:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="MqV+qFQc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7493C10E66F;
 Wed, 16 Oct 2024 04:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kxyPD5bG6ZQ9YWFtuWdz5TSG4aAx8Z8FeonMRrsbG2Y=; b=MqV+qFQc92N3CL/ic5ApcrdMw2
 c24JnpTSRS5PAr8laq3vclDbHiC6L0/MRDr8JVgE/EsQukR0EE6g4rPwEJaEdUlUpBkE/+wzFpauT
 bxG6GsG9/5BgqmfpGX1IO5RqAZswJUoLsESFQJIToTz03iIPPK2sqTVnXcvte/MAYAQakMxzxd7BA
 3+1XPhuEQERK61zayh0nfC8QteteaigVzouwtESK8HIdZOl2kU2aoBGFwfM31U+5stL/bkQpOCl0S
 u5Pac120Gt8yJfbhXtDYfv+Qkv2ytyAtql74XxyRz4n9kNfBgwcwFdcDgkAF4fFX3QpdfCEn3t35Z
 mbbl8dww==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1t0vyU-0000000AWGS-1PeP; Wed, 16 Oct 2024 04:49:30 +0000
Date: Tue, 15 Oct 2024 21:49:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Yonatan Maman <ymaman@nvidia.com>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, herbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, jgg@ziepe.ca, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, dri-devel@lists.freedesktop.org,
 apopple@nvidia.com, bskeggs@nvidia.com, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v1 1/4] mm/hmm: HMM API for P2P DMA to device zone pages
Message-ID: <Zw9F2uiq6-znYmTk@infradead.org>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-2-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015152348.3055360-2-ymaman@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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

The subject does not make sense.  All P2P is on ZONE_DEVICE pages.
It seems like this is about device private memory?

On Tue, Oct 15, 2024 at 06:23:45PM +0300, Yonatan Maman wrote:
> From: Yonatan Maman <Ymaman@Nvidia.com>
> 
> hmm_range_fault() natively triggers a page fault on device private
> pages, migrating them to RAM.

That "natively" above doesn't make sense to me.

> In some cases, such as with RDMA devices,
> the migration overhead between the device (e.g., GPU) and the CPU, and
> vice-versa, significantly damages performance. Thus, enabling Peer-to-

s/damages/degrades/

> Peer (P2P) DMA access for device private page might be crucial for
> minimizing data transfer overhead.
> 
> This change introduces an API to support P2P connections for device
> private pages by implementing the following:

"This change.. " or "This patch.." is pointless, just explain what you
are doing.

> 
>  - Leveraging the struct pagemap_ops for P2P Page Callbacks. This
>    callback involves mapping the page to MMIO and returning the
>    corresponding PCI_P2P page.

While P2P uses the same underlying PCIe TLPs as MMIO, it is not
MMIO by definition, as memory mapped I/O is by definition about
the CPU memory mappping so that load and store instructions cause
the I/O.  It also uses very different concepts in Linux.

>  - Utilizing hmm_range_fault for Initializing P2P Connections. The API

There is no concept of a "connection" in PCIe dta transfers.

>    also adds the HMM_PFN_REQ_TRY_P2P flag option for the
>    hmm_range_fault caller to initialize P2P. If set, hmm_range_fault
>    attempts initializing the P2P connection first, if the owner device
>    supports P2P, using p2p_page. In case of failure or lack of support,
>    hmm_range_fault will continue with the regular flow of migrating the
>    page to RAM.

What is the need for the flag?  As far as I can tell from reading
the series, the P2P mapping is entirely transparent to the callers
of hmm_range_fault.

> +	/*
> +	 * Used for private (un-addressable) device memory only. Return a
> +	 * corresponding struct page, that can be mapped to device
> +	 * (e.g using dma_map_page)
> +	 */
> +	struct page *(*get_dma_page_for_device)(struct page *private_page);

We are talking about P2P memory here.  How do you manage to get a page
that dma_map_page can be used on?  All P2P memory needs to use the P2P
aware dma_map_sg as the pages for P2P memory are just fake zone device
pages.


> +		 * P2P for supported pages, and according to caller request
> +		 * translate the private page to the match P2P page if it fails
> +		 * continue with the regular flow
> +		 */
> +		if (is_device_private_entry(entry)) {
> +			get_dma_page_handler =
> +				pfn_swap_entry_to_page(entry)
> +					->pgmap->ops->get_dma_page_for_device;
> +			if ((hmm_vma_walk->range->default_flags &
> +			    HMM_PFN_REQ_ALLOW_P2P) &&
> +			    get_dma_page_handler) {
> +				dma_page = get_dma_page_handler(
> +					pfn_swap_entry_to_page(entry));

This is really messy.  You probably really want to share a branch
with the private page handling for the owner so that you only need
a single is_device_private_entry and can use a local variable for
to shortcut finding the page.  Probably best done with a little helper:

Then  this becomes:

static bool hmm_handle_device_private(struct hmm_range *range,
		swp_entry_t entry, unsigned long *hmm_pfn)
{
	struct page *page = pfn_swap_entry_to_page(entry);
	struct dev_pagemap *pgmap = page->pgmap;

	if (pgmap->owner == range->dev_private_owner) {
		*hmm_pfn = swp_offset_pfn(entry);
		goto found;
	}

	if (pgmap->ops->get_dma_page_for_device) {
		*hmm_pfn =
			page_to_pfn(pgmap->ops->get_dma_page_for_device(page));
		goto found;
	}

	return false;

found:
	*hmm_pfn |= HMM_PFN_VALID
	if (is_writable_device_private_entry(entry))
		*hmm_pfn |= HMM_PFN_WRITE;
	return true;
}

which also makes it clear that returning a page from the method is
not that great, a PFN might work a lot better, e.g.

	unsigned long (*device_private_dma_pfn)(struct page *page);
