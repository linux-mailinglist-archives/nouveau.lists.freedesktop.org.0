Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFB626E7A5
	for <lists+nouveau@lfdr.de>; Thu, 17 Sep 2020 23:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39566E406;
	Thu, 17 Sep 2020 21:47:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DEE6EB6A
 for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2020 00:32:56 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id i22so703607eja.5
 for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2020 17:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Mv7tExlpUblwPxLiVpXmkZ8FmM1lPrmg1IaKwA589A=;
 b=Nyn3bRg6PHcnF7IuwL/gRVkBgDaad/CL/2NSJZ0OutWVN+rLpFcTmjBIwmdnvS7L1f
 KpcGPsPoNcqBSERqX6KNUU2oY3DDWJAysYSBs/+GNwOWa7iO3mu2Cuu1tL3HZGhiiF7U
 aDeRTy4URUfTy8YCLNz26Og1BmAZVMoBYFFlFlpyirDo1mox6qHLIwmStC0FIZiiwbwR
 HQFYKUdlVDk2Z43AObV/K7iA21j7phnPbKo9hBoswiWiZuzKOUASgRCeBAq3FpkpdePv
 tAixWxs/DLtrXqENpjRjy3BuinknZ/U9iFZz5rjVlc+VGP1yqGG7+c/XpXyX3YmsMzRy
 w6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Mv7tExlpUblwPxLiVpXmkZ8FmM1lPrmg1IaKwA589A=;
 b=HQ0P3OZtxq2iiEn2x8WD1ZbpYMJ1nCjGGam6Kf1K9RkOg33/FH03X5o9XvJWpRwm8y
 /Dm0aqzsL7eCbWcuZp3G/Q762FEV43Xe/1cWsq6SkXqDEhMLJ1L5wM669zT5WMOeEzEQ
 q4X3XqFTcm/pReQjpns+ol8AVf4IuLnqeInu+McNtgR9Af2+Yo8y0iDrFv8q5tzN05RY
 BGGmNzvMZeDI5BwQweApSsP6MvN3u+09Pq7senlIMQJR8FjDES8qWuS18zHtFgJdag1g
 BpNLOKJYMf7LiO6Qy8YidQ9Nqk97SV3P5EUEIa0mgbOVObvBBvPZpUj4OhAb8ngdiXWL
 gHOg==
X-Gm-Message-State: AOAM530QOTgs0pEFosH9ZC4nv7oZSPKzEI/J25WipNgKvJX69yhzkYSC
 wBSPNeDrlmWZbjGpC2ZCUTFMGnNum1oUJmGqaOQScQ==
X-Google-Smtp-Source: ABdhPJy/lCk/syWt2cUyaBBnBYt0rGos8cgelGTbE0LkeTPJKrWQ68aUyhQaP5VfsnlhpQpt3kFMUBVG5Q3xTQrQUd0=
X-Received: by 2002:a17:906:8143:: with SMTP id
 z3mr27697015ejw.323.1600302775371; 
 Wed, 16 Sep 2020 17:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200914224509.17699-1-rcampbell@nvidia.com>
 <CAPcyv4gVJuWsOtejrKvWgByq=c1niwQOZ0HHYaSo4h6vc-Xw+Q@mail.gmail.com>
 <10b4b85c-f1e9-b6b5-74cd-6190ee0aca5d@nvidia.com>
 <20200915162956.GA21990@infradead.org>
 <6dff5231-26d5-1aec-0c05-6880cf747642@nvidia.com>
 <20200916053653.GA7321@lst.de>
 <d3f80030-2ac4-384c-fd7e-66affb229577@nvidia.com>
In-Reply-To: <d3f80030-2ac4-384c-fd7e-66affb229577@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 16 Sep 2020 17:32:43 -0700
Message-ID: <CAPcyv4h=fWucxiiwZ9ZVbax-QTcHMJGkzdYRKCkL+E6+AUqwEw@mail.gmail.com>
To: Ralph Campbell <rcampbell@nvidia.com>
X-Mailman-Approved-At: Thu, 17 Sep 2020 21:46:51 +0000
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
Cc: Paul Mackerras <paulus@ozlabs.org>, Yang Shi <yang.shi@linux.alibaba.com>,
 Zi Yan <ziy@nvidia.com>, nouveau@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>, Linux MM <linux-mm@kvack.org>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 5:29 PM Ralph Campbell <rcampbell@nvidia.com> wrote:
>
>
> On 9/15/20 10:36 PM, Christoph Hellwig wrote:
> > On Tue, Sep 15, 2020 at 09:39:47AM -0700, Ralph Campbell wrote:
> >>> I don't think any of the three ->page_free instances even cares about
> >>> the page refcount.
> >>>
> >> Not true. The page_free() callback records the page is free by setting
> >> a bit or putting the page on a free list but when it allocates a free
> >> device private struct page to be used with migrate_vma_setup(), it needs to
> >> increment the refcount.
> >>
> >> For the ZONE_DEVICE MEMORY_DEVICE_GENERIC and MEMORY_DEVICE_PCI_P2PDMA
> >> struct pages, I think you are correct because they don't define page_free()
> >> and from what I can see, don't decrement the page refcount to zero.
> >
> > Umm, the whole point of ZONE_DEVICE is to have a struct page for
> > something that is not system memory.  For both the ppc kvm case (magic
> > hypervisor pool) and Noveau (device internal) memory that clear is the
> > case.  But looks like test_hmm uses normal pages to fake this up, so
> > I was wrong about the third caller.  But I think we can just call
> > set_page_count just before freeing the page there with a comment
> > explaining what is goin on.
>
> Dan Williams thought that having the ZONE_DEVICE struct pages
> be on a free list with a refcount of one was a bit strange and
> that the driver should handle the zero to one transition.
> But, that would mean a bit more invasive change to the 3 drivers
> to set the reference count to zero after calling memremap_pages()
> and setting the reference count to one when allocating a struct
> page. What you are suggesting is what I also proposed in v1.

IIUC, isn't what Christoph recommending is that drivers handle
set_page_count() directly rather than the core since some are prepared
for it to be zero on entry?
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
