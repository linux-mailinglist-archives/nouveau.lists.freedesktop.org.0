Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F2C2A90E2
	for <lists+nouveau@lfdr.de>; Fri,  6 Nov 2020 09:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023216E197;
	Fri,  6 Nov 2020 08:01:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94186E197
 for <nouveau@lists.freedesktop.org>; Fri,  6 Nov 2020 08:01:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A9C9068B05; Fri,  6 Nov 2020 09:01:47 +0100 (CET)
Date: Fri, 6 Nov 2020 09:01:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20201106080147.GD31341@lst.de>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
 <20201106005147.20113-5-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106005147.20113-5-rcampbell@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH v3 4/6] mm/thp: add THP allocation helper
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
Cc: Yang Shi <yang.shi@linux.alibaba.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-kselftest@vger.kernel.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Zi Yan <ziy@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +extern struct page *alloc_transhugepage(struct vm_area_struct *vma,
> +					unsigned long addr);

No need for the extern.  And also here: do we actually need the stub,
or can the caller make sure (using IS_ENABLED and similar) that the
compiler knows the code is dead?

> +struct page *alloc_transhugepage(struct vm_area_struct *vma,
> +				 unsigned long haddr)
> +{
> +	gfp_t gfp;
> +	struct page *page;
> +
> +	gfp = alloc_hugepage_direct_gfpmask(vma);
> +	page = alloc_hugepage_vma(gfp, vma, haddr, HPAGE_PMD_ORDER);
> +	if (page)
> +		prep_transhuge_page(page);
> +	return page;

I think do_huge_pmd_anonymous_page should be switched to use this
helper as well.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
