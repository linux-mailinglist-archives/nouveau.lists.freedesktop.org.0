Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0B6394851
	for <lists+nouveau@lfdr.de>; Fri, 28 May 2021 23:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6686E489;
	Fri, 28 May 2021 21:24:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075EE6F5BC
 for <nouveau@lists.freedesktop.org>; Fri, 28 May 2021 13:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622207491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FW9/4jT9qjw9qNpmMNMU5+vfx14NmLdS+jsCbfo2ekM=;
 b=i6h3zNjSkp9JbHxwZD7xaFbiOHLF5Bjt69NeKZ5pL1dLwZMcwpSls+zkZpYpEzicog9Unq
 Q+u0WXuMkCAE8V999MvvDe5CWIC+4zw5YomSlWOfwuCm7thIm8rwh1k+HMKg4AEWRU6s++
 VdbvEOq5EgA5aZQEQbbzAB7WxM9voy0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-HZwMPbKONJa2BJJe6iNmqA-1; Fri, 28 May 2021 09:11:28 -0400
X-MC-Unique: HZwMPbKONJa2BJJe6iNmqA-1
Received: by mail-qk1-f198.google.com with SMTP id
 d15-20020a05620a136fb02902e9e93c69c8so2959434qkl.23
 for <nouveau@lists.freedesktop.org>; Fri, 28 May 2021 06:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FW9/4jT9qjw9qNpmMNMU5+vfx14NmLdS+jsCbfo2ekM=;
 b=pueknSpHOygqBy1t0n8kxTZ2jLsBjhhbSbPDGx9oz0W2/r2ILyMEZRQzV/JOBVBp2l
 mHnDjJy+rVZmFUa2UjlrM+5SUZhIlNj9dUTdRqGq5iDtTi41M+j366vJUxTbi/S92j20
 kOarJ3a6a/HeHRdgif5BU43LuR7LennoBU+p9Kk/puxYWsDPZ0wJprfHArxotnOQJS4R
 IX8WmDyos+c0AMUN8fe1lzIQ98nyyvYIH4DQ7+pzeNQ9bdYgkavMVajXlmX+63jV9QBi
 s7cYRY4BlaLnay4hK3botOM5wuA3YengHpmcMPjYPowF4MJmFxj4lZha0pyOLWHDRX7M
 d2xg==
X-Gm-Message-State: AOAM533YjvsWA6TSH9krx7mNj8igmq+qklsuCWNW92CH3AG8jhXBsEvf
 YgnBMWXjr06F/iB5ItPJTHmVJy7PpZCYyqByB8tXrfjOy07rJMl7v64qgsOnDsKe1TgqQsM1b6q
 RYVrvvPTavAYyo545vTsmJoZkSw==
X-Received: by 2002:a05:6214:8f2:: with SMTP id
 dr18mr3830629qvb.25.1622207487812; 
 Fri, 28 May 2021 06:11:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeO8jD8WA5p6Lyazpu9mOUIrqsQpzhE1ohGBKpqpJPFBu0QqiibLIgKj2MM0bzxmuiSjk/GA==
X-Received: by 2002:a05:6214:8f2:: with SMTP id
 dr18mr3830596qvb.25.1622207487542; 
 Fri, 28 May 2021 06:11:27 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id t137sm3473526qke.50.2021.05.28.06.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 06:11:26 -0700 (PDT)
Date: Fri, 28 May 2021 09:11:25 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YLDr/RyAdUR4q0kk@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <37725705.JvxlXkkoz5@nvdebian> <YK+Y+aAZHDv8+w+Q@t490s>
 <2243324.CkbYuGXDfH@nvdebian>
MIME-Version: 1.0
In-Reply-To: <2243324.CkbYuGXDfH@nvdebian>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 28 May 2021 21:24:13 +0000
Subject: Re: [Nouveau] [PATCH v9 07/10] mm: Device exclusive memory access
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, bskeggs@redhat.com, jgg@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, May 28, 2021 at 11:48:40AM +1000, Alistair Popple wrote:

[...]

> > > > > +     while (page_vma_mapped_walk(&pvmw)) {
> > > > > +             /* Unexpected PMD-mapped THP? */
> > > > > +             VM_BUG_ON_PAGE(!pvmw.pte, page);
> > > > > +
> > > > > +             if (!pte_present(*pvmw.pte)) {
> > > > > +                     ret = false;
> > > > > +                     page_vma_mapped_walk_done(&pvmw);
> > > > > +                     break;
> > > > > +             }
> > > > > +
> > > > > +             subpage = page - page_to_pfn(page) + pte_pfn(*pvmw.pte);
> > > > 
> > > > I see that all pages passed in should be done after FOLL_SPLIT_PMD, so
> > > > is
> > > > this needed?  Or say, should subpage==page always be true?
> > > 
> > > Not always, in the case of a thp there are small ptes which will get
> > > device
> > > exclusive entries.
> > 
> > FOLL_SPLIT_PMD will first split the huge thp into smaller pages, then do
> > follow_page_pte() on them (in follow_pmd_mask):
> > 
> >         if (flags & FOLL_SPLIT_PMD) {
> >                 int ret;
> >                 page = pmd_page(*pmd);
> >                 if (is_huge_zero_page(page)) {
> >                         spin_unlock(ptl);
> >                         ret = 0;
> >                         split_huge_pmd(vma, pmd, address);
> >                         if (pmd_trans_unstable(pmd))
> >                                 ret = -EBUSY;
> >                 } else {
> >                         spin_unlock(ptl);
> >                         split_huge_pmd(vma, pmd, address);
> >                         ret = pte_alloc(mm, pmd) ? -ENOMEM : 0;
> >                 }
> > 
> >                 return ret ? ERR_PTR(ret) :
> >                         follow_page_pte(vma, address, pmd, flags,
> > &ctx->pgmap); }
> > 
> > So I thought all pages are small pages?
> 
> The page will remain as a transparent huge page though (at least as I 
> understand things). FOLL_SPLIT_PMD turns it into a pte mapped thp by splitting 
> the pmd and creating pte's mapping the subpages but doesn't split the page 
> itself. For comparison FOLL_SPLIT (which has been removed in v5.13 due to lack 
> of use) is what would be used to split the page in the above GUP code by 
> calling split_huge_page() rather than split_huge_pmd().

But shouldn't FOLL_SPLIT_PMD filled in small pfns for each pte?  See
__split_huge_pmd_locked():

	for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
                ...
		} else {
			entry = mk_pte(page + i, READ_ONCE(vma->vm_page_prot));
                        ...
		}
                ...
		set_pte_at(mm, addr, pte, entry);
        }

Then iiuc the coming follow_page_pte() will directly fetch the small pages?

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
