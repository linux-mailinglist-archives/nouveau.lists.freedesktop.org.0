Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AA612B2FA
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F89A6E17F;
	Fri, 27 Dec 2019 08:14:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0836ED1E;
 Wed, 13 Nov 2019 13:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mr4RY3jvcUlwtWVilQSRD7aASsaH0ZVmNXKgXD4ar2I=; b=L4pEOF8gToeI1wxRP1AwsUyj7
 it0aZ/H3gzMqN/frlWv7pf8ACU3+ysRk7aQMNDAwKSfgsnYZtpbRLVOgl2xWx2oZDjs6GDaFt9WvR
 l/NQ2gO/K3Ot7KXxQGR4VKhxlIaN3GUEGwzrCHmhIUE4AAL0RvwNFG3C6vKao2bg2rryraoP9pDjJ
 M9IDd6BxvnT2iTiJ3v7dvNhUY1+or3v58FJ4rYsLWxgRZsp54JWPrtILV8uaQiYhqnc+PE8/Af1RU
 FAMu2LxxYuyc1s+r4BStFsKVk8JJ0/AZtijke8xPvXEVjlaYoNKs52mvNP7KuysuicWSP/O+gJLCs
 9wgg5VPgA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iUtBY-0001WY-NU; Wed, 13 Nov 2019 13:59:52 +0000
Date: Wed, 13 Nov 2019 05:59:52 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20191113135952.GB20531@infradead.org>
References: <20191112202231.3856-1-jgg@ziepe.ca>
 <20191112202231.3856-3-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112202231.3856-3-jgg@ziepe.ca>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:30 +0000
Subject: Re: [Nouveau] [PATCH v3 02/14] mm/mmu_notifier: add an interval
 tree notifier
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, David Zhou <David1.Zhou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, xen-devel@lists.xenproject.org,
 Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Felix.Kuehling@amd.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

> +int mmu_interval_notifier_insert(struct mmu_interval_notifier *mni,
> +				 struct mm_struct *mm, unsigned long start,
> +				 unsigned long length,
> +				 const struct mmu_interval_notifier_ops *ops);
> +int mmu_interval_notifier_insert_locked(
> +	struct mmu_interval_notifier *mni, struct mm_struct *mm,
> +	unsigned long start, unsigned long length,
> +	const struct mmu_interval_notifier_ops *ops);

Very inconsistent indentation between these two related functions.

> +	/*
> +	 * The inv_end incorporates a deferred mechanism like
> +	 * rtnl_unlock(). Adds and removes are queued until the final inv_end
> +	 * happens then they are progressed. This arrangement for tree updates
> +	 * is used to avoid using a blocking lock during
> +	 * invalidate_range_start.

Nitpick:  That comment can be condensed into one less line:

	/*
	 * The inv_end incorporates a deferred mechanism like rtnl_unlock().
	 * Adds and removes are queued until the final inv_end happens then
	 * they are progressed. This arrangement for tree updates is used to
	 * avoid using a blocking lock during invalidate_range_start.
	 */

> +	/*
> +	 * TODO: Since we already have a spinlock above, this would be faster
> +	 * as wake_up_q
> +	 */
> +	if (need_wake)
> +		wake_up_all(&mmn_mm->wq);

So why is this important enough for a TODO comment, but not important
enough to do right away?

> +	 * release semantics on the initialization of the mmu_notifier_mm's
> +         * contents are provided for unlocked readers.  acquire can only be
> +         * used while holding the mmgrab or mmget, and is safe because once
> +         * created the mmu_notififer_mm is not freed until the mm is
> +         * destroyed.  As above, users holding the mmap_sem or one of the
> +         * mm_take_all_locks() do not need to use acquire semantics.
>  	 */

Some spaces instead of tabs here.

> +static int __mmu_interval_notifier_insert(
> +	struct mmu_interval_notifier *mni, struct mm_struct *mm,
> +	struct mmu_notifier_mm *mmn_mm, unsigned long start,
> +	unsigned long length, const struct mmu_interval_notifier_ops *ops)

Odd indentation - we usuall do two tabs (my preference) or align after
the opening brace.

> + * This function must be paired with mmu_interval_notifier_insert(). It cannot be

line > 80 chars.

Otherwise this looks good and very similar to what I reviewed earlier:

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
