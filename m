Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709A9326527
	for <lists+nouveau@lfdr.de>; Fri, 26 Feb 2021 17:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D476B6EE0F;
	Fri, 26 Feb 2021 16:01:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF1D6EE0E;
 Fri, 26 Feb 2021 16:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=K+eqvkP8AJTMZD+lmlvgsFHKMBlDoaA3WKhboefhy+0=; b=gF1fSE3K6s1efQMQu0eJjUR6PV
 XRNovWxLRNzb/56kmzR67SWUfqlAiC/1M0OFuGrxuZAYN6YMQX927zF6lg7aRO+6QCS+AS4mPmuMD
 0n11lBCsrTs5Fszlhf+PsaaQSVA0hrheUXtB/HelGBomDgiTK21sl0mPHgrPyPyrSjqNtyEkZA2+j
 PjG4mNC1Kp16wof9FXPBGQHaJB4LMagg9RJTuIV7NMiE/NmHcMyqWWHTZ38XQz9tVNetd9qUNFHC9
 X6FXMaHoIExpPdIrTsNCFxj6jABcTF4NRDJNBwKNLgAa/+gMqszVDSErehvXUlsNJK4ujjqATqtao
 N2xvsrcg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lFfYd-00CDEw-0B; Fri, 26 Feb 2021 16:01:35 +0000
Date: Fri, 26 Feb 2021 16:01:34 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <20210226160134.GC2907711@infradead.org>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-4-apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210226071832.31547-4-apopple@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Nouveau] [PATCH v3 3/8] mm/rmap: Split try_to_munlock from
 try_to_unmap
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
Cc: rcampbell@nvidia.com, daniel@ffwll.ch, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 bskeggs@redhat.com, jgg@nvidia.com, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

> +	while (page_vma_mapped_walk(&pvmw)) {
> +		/*
> +		 * If the page is mlock()d, we cannot swap it out.
> +		 * If it's recently referenced (perhaps page_referenced
> +		 * skipped over this mm) then we should reactivate it.
> +		 */
> +		if (vma->vm_flags & VM_LOCKED) {
> +			/* PTE-mapped THP are never mlocked */
> +			if (!PageTransCompound(page)) {
> +				/*
> +				 * Holding pte lock, we do *not* need
> +				 * mmap_lock here
> +				 */
> +				mlock_vma_page(page);
> +			}
> +			ret = false;
> +			page_vma_mapped_walk_done(&pvmw);
> +			break;

Just return false here directly and remove the ret variable?

Very nice cleanup!

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
