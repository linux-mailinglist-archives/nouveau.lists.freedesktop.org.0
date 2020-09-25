Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 721172792AB
	for <lists+nouveau@lfdr.de>; Fri, 25 Sep 2020 22:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50B46ED37;
	Fri, 25 Sep 2020 20:51:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4B06ED37
 for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2020 20:51:44 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id n22so3905780edt.4
 for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2020 13:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3mlgRZ8EIdOR1DUsE60QDF3pdVLwyWMe5uQg0KYqZh8=;
 b=lLK1nDqkdE4kFMX940riOKRARxVPqhXy/zVsS1A2BF583+Bs6t1HB1PWpX8FT5fmMG
 kj4laN7PoFAAtTf7nKQSfmgnZthfYdYFaYc0Bz7Y4wYumWs+ZoZt7fmJ8iqWpP6o5/sH
 kFEKtwuYlk8CyIxak76lqkTU29ToFQ6l7KznxP19PVlyKf6+tAzcGhQhn+oCjZs+I/BG
 hZj0p+yuyE04b9WjaCBMYkiqC6sMzMV4Oux/HTOgLFkJAvw3LNpYth20Ega3GkDNOEsf
 zaPOXph5obEzLyOHAdc1MO70dyb/pb3ItgeObMBTO/ckPhs1YDk3R/RfTdj8iII54jF+
 B2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3mlgRZ8EIdOR1DUsE60QDF3pdVLwyWMe5uQg0KYqZh8=;
 b=n+/d74mi6rMBqKqUOo8KY8UETxjmHooLCkmMJRhdmHVKymkKfEG9LTT2dqphQ83asC
 u5bfjaEEegzAjJ8y55bU0uDVCZkrteF2kHHDkb8LHSnlf07xV345w4LmrJKZuTIuJ7TK
 tBYDl73E3uQoNKJGOcthmiTEs0UXS5ug1G0hHDoUOyGhIcrj7vPxP7n43nbLNLYfCmoo
 Qj94pQ7t0C2SOU/bqmuFCHgpupVtEhMoJNAs2gPdLieIbpunrtWq7P3Ew3BOSb4Py2KS
 hm7yNOXnV66VznSCl032kXDRg5MEc6gFcwV5YOtnaw/BOvzBrhiifnYFWO12U3QDmkyX
 PXiA==
X-Gm-Message-State: AOAM532gyOvDpQZfdlCWSksEKzmLhkQb7s5Y+k7odAPBUtoJSwUJak6e
 hysXj7SC8bjpPV7Pd9n5TsgapycrDps2Jmq73cTrRg==
X-Google-Smtp-Source: ABdhPJw5Nq9khn3WBHc4y05yhciUUDN3DTtsOPc4oBfxkZyBg1L19vOrTNS0zLznVWAuuf5nyBS89YukU7GH7FAKcjI=
X-Received: by 2002:aa7:d58e:: with SMTP id r14mr3532250edq.52.1601067103227; 
 Fri, 25 Sep 2020 13:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200925204442.31348-1-rcampbell@nvidia.com>
 <20200925204442.31348-2-rcampbell@nvidia.com>
In-Reply-To: <20200925204442.31348-2-rcampbell@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 25 Sep 2020 13:51:31 -0700
Message-ID: <CAPcyv4iOgN6nmF0N4hQGZo-DJNh3UAf1wDy1ata1Rc+RQWVH=Q@mail.gmail.com>
To: Ralph Campbell <rcampbell@nvidia.com>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Bharata B Rao <bharata@linux.ibm.com>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 kvm-ppc@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2020 at 1:45 PM Ralph Campbell <rcampbell@nvidia.com> wrote:
>
> There are several places where ZONE_DEVICE struct pages assume a reference
> count == 1 means the page is idle and free. Instead of open coding this,
> add a helper function to hide this detail.
>
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>  fs/dax.c            | 8 ++++----
>  fs/ext4/inode.c     | 2 +-
>  fs/xfs/xfs_file.c   | 2 +-
>  include/linux/dax.h | 5 +++++
>  4 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/fs/dax.c b/fs/dax.c
> index 994ab66a9907..8eddbcc0e149 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -358,7 +358,7 @@ static void dax_disassociate_entry(void *entry, struct address_space *mapping,
>         for_each_mapped_pfn(entry, pfn) {
>                 struct page *page = pfn_to_page(pfn);
>
> -               WARN_ON_ONCE(trunc && page_ref_count(page) > 1);
> +               WARN_ON_ONCE(trunc && !dax_layout_is_idle_page(page));
>                 WARN_ON_ONCE(page->mapping && page->mapping != mapping);
>                 page->mapping = NULL;
>                 page->index = 0;
> @@ -372,7 +372,7 @@ static struct page *dax_busy_page(void *entry)
>         for_each_mapped_pfn(entry, pfn) {
>                 struct page *page = pfn_to_page(pfn);
>
> -               if (page_ref_count(page) > 1)
> +               if (!dax_layout_is_idle_page(page))
>                         return page;
>         }
>         return NULL;
> @@ -560,11 +560,11 @@ static void *grab_mapping_entry(struct xa_state *xas,
>
>  /**
>   * dax_layout_busy_page - find first pinned page in @mapping
> - * @mapping: address space to scan for a page with ref count > 1
> + * @mapping: address space to scan for a page with ref count > 0
>   *
>   * DAX requires ZONE_DEVICE mapped pages. These pages are never
>   * 'onlined' to the page allocator so they are considered idle when
> - * page->count == 1. A filesystem uses this interface to determine if
> + * page->count == 0. A filesystem uses this interface to determine if
>   * any page in the mapping is busy, i.e. for DMA, or other
>   * get_user_pages() usages.
>   *
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index bf596467c234..d9f8ad55523a 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -3927,7 +3927,7 @@ int ext4_break_layouts(struct inode *inode)
>                         return 0;
>
>                 error = ___wait_var_event(&page->_refcount,
> -                               atomic_read(&page->_refcount) == 1,
> +                               dax_layout_is_idle_page(page),
>                                 TASK_INTERRUPTIBLE, 0, 0,
>                                 ext4_wait_dax_page(ei));
>         } while (error == 0);
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index a29f78a663ca..29ab96541bc1 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -750,7 +750,7 @@ xfs_break_dax_layouts(
>
>         *retry = true;
>         return ___wait_var_event(&page->_refcount,
> -                       atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
> +                       dax_layout_is_idle_page(page), TASK_INTERRUPTIBLE,
>                         0, 0, xfs_wait_dax_page(inode));
>  }
>
> diff --git a/include/linux/dax.h b/include/linux/dax.h
> index 43b39ab9de1a..3f78ed78d1d6 100644
> --- a/include/linux/dax.h
> +++ b/include/linux/dax.h
> @@ -238,4 +238,9 @@ static inline bool dax_mapping(struct address_space *mapping)
>         return mapping->host && IS_DAX(mapping->host);
>  }
>
> +static inline bool dax_layout_is_idle_page(struct page *page)
> +{
> +       return page_ref_count(page) <= 1;

Why convert the check from "== 1" to "<= 1" and then back to the ==
operator in the next patch? A refcount < 1 in this path before your
other change is a bug.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
