Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4744D283E41
	for <lists+nouveau@lfdr.de>; Mon,  5 Oct 2020 20:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFB289A4F;
	Mon,  5 Oct 2020 18:24:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C719789A4F
 for <nouveau@lists.freedesktop.org>; Mon,  5 Oct 2020 18:24:19 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id q63so13066587qkf.3
 for <nouveau@lists.freedesktop.org>; Mon, 05 Oct 2020 11:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OCSLqGNh9b5YSmYsk1DlWKJeyULS7OR1a85rgALsc9w=;
 b=MCDa+1cwmN3uqvhljUtqnjRDTYQZ/bi0REuAsgRPHawGFRLu9yuU9WlllBKYKSYWoC
 COppqAsu3MTAife2gP8sPBj5BM2BbGaDJxEwZvtuafwP4a4hdfpwdn/NGDE42M6wmPYx
 w6RKz8PK1yLHK6fqWqsgZhdkxQJNKhX5RC2wxagFLtzU3TwNIOuknrBo7berTriabUSB
 qqTiGv8KasNRDd1sfsDjr2lO2IxW1f9KChgBRQcBUplHmmgGaWF66ZIebhDq1VNBfLXS
 ScC9FSdcE4fiChkQkPfTWWSWJq5i1UZonfVL4S1jsX1F1gH31b2ZbJ02j2EKwtYWInDJ
 gSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OCSLqGNh9b5YSmYsk1DlWKJeyULS7OR1a85rgALsc9w=;
 b=pnB2EHhV8T+Hju6LC1/yAgWvUhAtjy6QzpzQJRf6suXr3qhv9NdRFcW3IhAEEz1UMo
 wD7sCiaYhRWlnd4Q2McDtIq0lqU+AtPBS6QUuUUcRaQi8Mpfjh64LDfVVd8wm3sUwapB
 NtXBMhWqf16bwUZ1Gc8dfo0Oa7siu7/7x2suaFIVOtEyl3/FA/LREW/54BvWg9DfVoZp
 Lt2xO4ZNBrgyHNiW5Jk90FpifmNAgaLc5///Y8FYlz4xIRQFli+JzdY502Xe36ZkAiIw
 RJCTBj1XKUYSflqQZS2QalfQQdrHRCuE5l2m6rLM0G5z7s9CqRh38vWPh3u9+rcqXAgA
 6mBQ==
X-Gm-Message-State: AOAM532TBlQesg4/CFYIK4DxYbcoUsNQLa+l3jshpFaMml5EcDBaXDvI
 lTLtny6Y631akl960K6KfDeTpDX77dlBUP/cyv/vWw==
X-Google-Smtp-Source: ABdhPJxukAgIYi20kSI9kjVPF33fEc4rKpb9eQYgj02bTfT4kUplSjOE1HGcZ8LTlpn7FoBl8beo3/6xylx4QC83AAg=
X-Received: by 2002:a05:620a:4d0:: with SMTP id
 16mr1333224qks.200.1601922258954; 
 Mon, 05 Oct 2020 11:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201001181715.17416-1-rcampbell@nvidia.com>
In-Reply-To: <20201001181715.17416-1-rcampbell@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 5 Oct 2020 11:24:07 -0700
Message-ID: <CAPcyv4gu=So5PgQU9LezhW4vUQt+paaUr1T6CAvQYjh0XzkkgQ@mail.gmail.com>
To: Ralph Campbell <rcampbell@nvidia.com>
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

On Thu, Oct 1, 2020 at 11:17 AM Ralph Campbell <rcampbell@nvidia.com> wrote:
>
> This is still an RFC because after looking at the pmem/dax code some
> more, I realized that the ZONE_DEVICE struct pages are being inserted
> into the process' page tables with vmf_insert_mixed() and a zero
> refcount on the ZONE_DEVICE struct page. This is sort of OK because
> insert_pfn() increments the reference count on the pgmap which is what
> prevents memunmap_pages() from freeing the struct pages and it doesn't
> check for a non-zero struct page reference count.
> But, any calls to get_page() will hit the VM_BUG_ON_PAGE() that
> checks for a reference count == 0.
>
> // mmap() an ext4 file that is mounted -o dax.
> ext4_dax_fault()
>   ext4_dax_huge_fault()
>     dax_iomap_fault(&ext4_iomap_ops)
>       dax_iomap_pte_fault()
>         ops->iomap_begin() // ext4_iomap_begin()
>           ext4_map_blocks()
>           ext4_set_iomap()
>         dax_iomap_pfn()
>         dax_insert_entry()
>         vmf_insert_mixed(pfn)
>           __vm_insert_mixed()
>             if (!IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL) &&
>                 !pfn_t_devmap(pfn) && pfn_t_valid(pfn))
>               insert_page()
>                 get_page(page) // XXX would trigger VM_BUG_ON_PAGE()
>                 page_add_file_rmap()
>                 set_pte_at()
>             else
>               insert_pfn()
>                 pte_mkdevmap()
>                 set_pte_at()
>
> Should pmem set the page reference count to one before inserting the
> pfn into the page tables (and decrement when removing devmap PTEs)?
> What about MEMORY_DEVICE_GENERIC and MEMORY_DEVICE_PCI_P2PDMA use cases?
> Where should they icrement/decrement the page reference count?
> I don't know enough about how these are used to really know what to
> do at this point. If people want me to continue to work on this series,
> I will need some guidance.

fs/dax could take the reference when inserting, but that would mean
that ext4 and xfs would need to go back to checking for 1 to be page
idle. I think that's ok because the filesystem is actually not
checking for page-idle it's checking for "get_user_pages()" idle.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
