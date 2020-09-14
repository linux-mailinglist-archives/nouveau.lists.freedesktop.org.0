Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D746F269982
	for <lists+nouveau@lfdr.de>; Tue, 15 Sep 2020 01:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38F06E05A;
	Mon, 14 Sep 2020 23:10:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F40D6E05A
 for <nouveau@lists.freedesktop.org>; Mon, 14 Sep 2020 23:10:51 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id b12so1164709edz.11
 for <nouveau@lists.freedesktop.org>; Mon, 14 Sep 2020 16:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R+itrPmdb1uT2Do7NFJXS/q5A1e11LUUi6cUnbB8ULo=;
 b=OscoufG8IHAPrzgYF4fy7Cn/cK7ubF9tgWt8ZSshsxggI+VMUPvxKjh5r2Y2J5l2uh
 UMyGvicURId/BnfvWei+UmGlQYfxb5gUlFtgYBcc/sJkxR+BZ2rRPTNZH5n/MxAVMRLN
 CezpW17Hi9Ria77HBMgvk5dRIHYzNvD4OTOZUVYZXT31uiRdBc4PlG/C/OYuQ4Untxyu
 kIt724BvF7EyKYooWsH51W5qekRgsO4eUc1/CVX37OQ6wcqYsq+DZM1YYO1oZVsFiCsF
 nflntEDKVeno16Chu1iM5WP+Uts0fcm5u8ZwXwx+sYYJvRnI59vxmBtjLMtucxbocrlI
 NYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R+itrPmdb1uT2Do7NFJXS/q5A1e11LUUi6cUnbB8ULo=;
 b=n0hpSwTtV0oKeRhDUOZVJh2omYw70w3Bv8/serQtc27DZIbsGlfgbMQGieFWFqtcLT
 ObNnKfivLAPx1H1MuZ6uGnc1GsAYza9eQ01gnZnlbN2+FEw+GD2YlJD2dxR+l+IsPNbb
 hdUj3DpuUEYV1Q9jvXLmLLcHvU4/gPdHhFTsLjaD9Yb35QWZpT1LDSrMCzkmFy6pH4IW
 heJjjvGwsWSlK86XTSSHnkbX0OJkRp4ySeQxVEWyvr2BdmUlZ7S9+24IAyfs49HSbwaz
 dkdcMryL0ZY81kt/rMcoe2eKTzF+sTdR6iWr6zaN3Qcus83LYRZyU9VXR9NFPXr09cC5
 wBBA==
X-Gm-Message-State: AOAM532XFFPgYvdPOA446GPCcr7u7X0zNwci4lMjnsvqASn9WkOfR8RI
 Qe/Ne5rirXwa1t0nInEbwIL/N2iuT+1qUy0+aRnPBQ==
X-Google-Smtp-Source: ABdhPJz25sdc/c10PW3FBm8YfGcEy9UNPAY+TzoW85B7fIMK8zMcw5r6ppC0h9BjQjMtQWUZ3domYRB1253CIsTQm98=
X-Received: by 2002:aa7:c511:: with SMTP id o17mr20039691edq.300.1600125049629; 
 Mon, 14 Sep 2020 16:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200914224509.17699-1-rcampbell@nvidia.com>
In-Reply-To: <20200914224509.17699-1-rcampbell@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 14 Sep 2020 16:10:38 -0700
Message-ID: <CAPcyv4gVJuWsOtejrKvWgByq=c1niwQOZ0HHYaSo4h6vc-Xw+Q@mail.gmail.com>
To: Ralph Campbell <rcampbell@nvidia.com>
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

On Mon, Sep 14, 2020 at 3:45 PM Ralph Campbell <rcampbell@nvidia.com> wrote:
>
> ZONE_DEVICE struct pages have an extra reference count that complicates the
> code for put_page() and several places in the kernel that need to check the
> reference count to see that a page is not being used (gup, compaction,
> migration, etc.). Clean up the code so the reference count doesn't need to
> be treated specially for ZONE_DEVICE.
>
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>
> Matthew Wilcox, Ira Weiny, and others have complained that ZONE_DEVICE
> struct page reference counting is ugly/broken. This is my attempt to
> fix it and it works for the HMM migration self tests.

Can you link to a technical description of what's broken? Or better
yet, summarize that argument in the changelog?

> I'm only sending this out as a RFC since I'm not that familiar with the
> DAX, PMEM, XEN, and other uses of ZONE_DEVICE struct pages allocated
> with devm_memremap_pages() or memremap_pages() but my best reading of
> the code looks like it might be OK. I could use help testing these
> configurations.

Back in the 4.15 days I could not convince myself that some code paths
blindly assumed that pages with refcount==0 were on an lru list. Since
then, struct page has been reorganized to not collide the ->pgmap back
pointer with the ->lru list and there have been other cleanups for
page pinning that might make this incremental cleanup viable.

You also need to fix up ext4_break_layouts() and
xfs_break_dax_layouts() to expect ->_refcount is 0 instead of 1. This
also needs some fstests exposure.

> I have a modified THP migration patch series that applies on top of
> this one and is cleaner since I don't have to add code to handle the
> +1 reference count. The link below is for the earlier v2:
> ("mm/hmm/nouveau: add THP migration to migrate_vma_*")
> https://lore.kernel.org/linux-mm/20200902165830.5367-1-rcampbell@nvidia.com
>
>
>  arch/powerpc/kvm/book3s_hv_uvmem.c     |  1 -
>  drivers/gpu/drm/nouveau/nouveau_dmem.c |  1 -
>  include/linux/memremap.h               |  6 +--
>  include/linux/mm.h                     | 39 ---------------
>  lib/test_hmm.c                         |  1 -
>  mm/gup.c                               | 44 -----------------
>  mm/memremap.c                          | 20 ++++----
>  mm/migrate.c                           |  5 --
>  mm/swap.c                              | 66 +++++++++++---------------
>  9 files changed, 41 insertions(+), 142 deletions(-)

This diffstat is indeed appealing.

>
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 84e5a2dc8be5..00d97050d7ff 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -711,7 +711,6 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>
>         dpage = pfn_to_page(uvmem_pfn);
>         dpage->zone_device_data = pvt;
> -       get_page(dpage);
>         lock_page(dpage);
>         return dpage;
>  out_clear:
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index a13c6215bba8..2a4bbe01a455 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -324,7 +324,6 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
>                         return NULL;
>         }
>
> -       get_page(page);
>         lock_page(page);
>         return page;
>  }
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 4e9c738f4b31..7dd9802d2612 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -67,9 +67,9 @@ enum memory_type {
>
>  struct dev_pagemap_ops {
>         /*
> -        * Called once the page refcount reaches 1.  (ZONE_DEVICE pages never
> -        * reach 0 refcount unless there is a refcount bug. This allows the
> -        * device driver to implement its own memory management.)
> +        * Called once the page refcount reaches 0. The reference count is
> +        * reset to 1 before calling page_free(). This allows the
> +        * device driver to implement its own memory management.

I'd clarify the order events / responsibility of the common core
page_free() and the device specific page_free(). At the same time, why
not update drivers to expect that the page is already refcount==0 on
entry? Seems odd to go through all this trouble to make the reference
count appear to be zero to the wider kernel but expect that drivers
get a fake reference on entry to their ->page_free() callbacks.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
