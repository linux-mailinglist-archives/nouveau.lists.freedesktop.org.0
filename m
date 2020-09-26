Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BB0279B5B
	for <lists+nouveau@lfdr.de>; Sat, 26 Sep 2020 19:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11A96E213;
	Sat, 26 Sep 2020 17:26:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6D06E161
 for <nouveau@lists.freedesktop.org>; Sat, 26 Sep 2020 06:35:43 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4A4B268AFE; Sat, 26 Sep 2020 08:35:40 +0200 (CEST)
Date: Sat, 26 Sep 2020 08:35:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200926063539.GA3540@lst.de>
References: <20200925204442.31348-1-rcampbell@nvidia.com>
 <20200925204442.31348-2-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925204442.31348-2-rcampbell@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Sat, 26 Sep 2020 17:26:05 +0000
Subject: Re: [Nouveau] [PATCH 1/2] ext4/xfs: add page refcount helper
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
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2020 at 01:44:41PM -0700, Ralph Campbell wrote:
>  		error = ___wait_var_event(&page->_refcount,
> -				atomic_read(&page->_refcount) == 1,
> +				dax_layout_is_idle_page(page),
>  				TASK_INTERRUPTIBLE, 0, 0,
>  				ext4_wait_dax_page(ei));

> +++ b/fs/xfs/xfs_file.c
> @@ -750,7 +750,7 @@ xfs_break_dax_layouts(
>  
>  	*retry = true;
>  	return ___wait_var_event(&page->_refcount,
> -			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
> +			dax_layout_is_idle_page(page), TASK_INTERRUPTIBLE,
>  			0, 0, xfs_wait_dax_page(inode));
>  }

I still think a litte helper macro would be nice here:

#define dax_wait_page(_inode, _page, _wait_cb)				\
  	___wait_var_event(&(_page)->_refcount,				\
		atomic_read(&(_page)->_refcount) == 1,			\
		TASK_INTERRUPTIBLE, dax_layout_is_idle_page(_page),	\
		TASK_INTERRUPTIBLE, 0, 0, _wait_cb(_inode));
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
