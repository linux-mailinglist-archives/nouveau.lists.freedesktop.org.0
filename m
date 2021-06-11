Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FCE3B5146
	for <lists+nouveau@lfdr.de>; Sun, 27 Jun 2021 05:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E6E6E1B6;
	Sun, 27 Jun 2021 03:35:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E264B6EE99
 for <nouveau@lists.freedesktop.org>; Fri, 11 Jun 2021 15:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623423708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OnHkU06l/k9wqE171qbYza/gsqJMIJabflSWwwk6QCA=;
 b=KNnDj8vUngcdEpwKWfiEAM+5MS1jMITvA/87mfrZKjTDuR7t7hvqYqsGdCj4yqPDnNI6TR
 IVCFDLq1V6s/SYCkjkPqke7UeEoL7c4w0VdVaA/yj/iqJ49KHld59WcWWvbPayG/Zws0WZ
 NJ6vGJ4dEVMJrFIpfhQzXFNlWUQY3Zo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-LPHr_jQ-N8e0zy6isdlS1A-1; Fri, 11 Jun 2021 11:01:47 -0400
X-MC-Unique: LPHr_jQ-N8e0zy6isdlS1A-1
Received: by mail-qt1-f197.google.com with SMTP id
 f17-20020ac87f110000b02901e117339ea7so2052171qtk.16
 for <nouveau@lists.freedesktop.org>; Fri, 11 Jun 2021 08:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OnHkU06l/k9wqE171qbYza/gsqJMIJabflSWwwk6QCA=;
 b=EI1XlF00u/iCpM7gkd4MXMdAWoaT1sJJ+2rMhYQAO/kbtDEwlY6F80YShBpPhNFq5z
 6/nj3heRUgFJOvF6wHIrKz7EUtzQDN8a11bPVDtkHk5Zfl7T2xfNqxsPWqfyMq+G6qrV
 ujO2tJdaS0hfUBNEmgPjQSSUNpEi6wErJTRPEQgvciERVkix1QwPk8pQ6GFdUGWHlgiI
 OzX6oX1/eKIySTcehb2mLuqByGt/QSQjSnBREdVKe+kkEtZm3SrXDMX5E2BUoTFjtG9C
 hji8ppRhanee9f7J7wye9KEpTRxUf1khwnh1uU6rilCJ55TGS5hIniNEK6Sud+19bIg6
 7gfQ==
X-Gm-Message-State: AOAM532ggtKYo9EcM1Y+6kZgg2u8TtmJjVtgh67f8hUYQskV0THiovxE
 VojywBj9P3z+xabtc7nhv9pPtzLc6RIe9cSP5gztWG4dRZeK5r6FiOgPJ64X99rAzwW3sdKiuiJ
 b6Yy0jbbznFulQS48MIisu/lglA==
X-Received: by 2002:a37:8386:: with SMTP id f128mr4219562qkd.444.1623423705006; 
 Fri, 11 Jun 2021 08:01:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3GP6mxnvgz/ji/Vdupp827CjyJe5ajZSxAoIX/qzD3GyPBxndeXi6Wj8jInFNFCm6D45jvw==
X-Received: by 2002:a37:8386:: with SMTP id f128mr4219525qkd.444.1623423704690; 
 Fri, 11 Jun 2021 08:01:44 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id j65sm4621527qkd.17.2021.06.11.08.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 08:01:44 -0700 (PDT)
Date: Fri, 11 Jun 2021 11:01:42 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YMN61r0wdg88OM8r@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <4307769.9k6FjFFxS5@nvdebian> <YMK1snSH9q4Wkyq+@t490s>
 <2683185.ETRjo6vMkr@nvdebian>
MIME-Version: 1.0
In-Reply-To: <2683185.ETRjo6vMkr@nvdebian>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Sun, 27 Jun 2021 03:34:44 +0000
Subject: Re: [Nouveau] [PATCH v10 07/10] mm: Device exclusive memory access
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
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 01:43:20PM +1000, Alistair Popple wrote:
> On Friday, 11 June 2021 11:00:34 AM AEST Peter Xu wrote:
> > On Fri, Jun 11, 2021 at 09:17:14AM +1000, Alistair Popple wrote:
> > > On Friday, 11 June 2021 9:04:19 AM AEST Peter Xu wrote:
> > > > On Fri, Jun 11, 2021 at 12:21:26AM +1000, Alistair Popple wrote:
> > > > > > Hmm, the thing is.. to me FOLL_SPLIT_PMD should have similar effect to explicit
> > > > > > call split_huge_pmd_address(), afaict.  Since both of them use __split_huge_pmd()
> > > > > > internally which will generate that unwanted CLEAR notify.
> > > > >
> > > > > Agree that gup calls __split_huge_pmd() via split_huge_pmd_address()
> > > > > which will always CLEAR. However gup only calls split_huge_pmd_address() if it
> > > > > finds a thp pmd. In follow_pmd_mask() we have:
> > > > >
> > > > >       if (likely(!pmd_trans_huge(pmdval)))
> > > > >               return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
> > > > >
> > > > > So I don't think we have a problem here.
> > > >
> > > > Sorry I didn't follow here..  We do FOLL_SPLIT_PMD after this check, right?  I
> > > > mean, if it's a thp for the current mm, afaict pmd_trans_huge() should return
> > > > true above, so we'll skip follow_page_pte(); then we'll check FOLL_SPLIT_PMD
> > > > and do the split, then the CLEAR notify.  Hmm.. Did I miss something?
> > >
> > > That seems correct - if the thp is not mapped with a pmd we won't split and we
> > > won't CLEAR. If there is a thp pmd we will split and CLEAR, but in that case it
> > > is fine - we will retry, but the retry will won't CLEAR because the pmd has
> > > already been split.
> > 
> > Aha!
> > 
> > >
> > > The issue arises with doing it unconditionally in make device exclusive is that
> > > you *always* CLEAR even if there is no thp pmd to split. Or at least that's my
> > > understanding, please let me know if it doesn't make sense.
> > 
> > Exactly.  But if you see what I meant here, even if it can work like this, it
> > sounds still fragile, isn't it?  I just feel something is slightly off there..
> > 
> > IMHO split_huge_pmd() checked pmd before calling __split_huge_pmd() for
> > performance, afaict, because if it's not a thp even without locking, then it
> > won't be, so further __split_huge_pmd() is not necessary.
> > 
> > IOW, it's very legal if someday we'd like to let split_huge_pmd() call
> > __split_huge_pmd() directly, then AFAIU device exclusive API will be the 1st
> > one to be broken with that seems-to-be-irrelevant change I'm afraid..
> 
> Well I would argue the performance of memory notifiers is becoming increasingly
> important, and a change that causes them to be called unnecessarily is
> therefore not very legal. Likely the correct fix here is to optimise
> __split_huge_pmd() to only call the notifier if it's actually going to split a
> pmd. As you said though that's a completely different story which I think would
> be best done as a separate series.

Right, maybe I can look a bit more into that later; but my whole point was to
express that one functionality shouldn't depend on such a trivial detail of
implementation of other modules (thp split in this case).

> 
> > This lets me goes back a step to think about why do we need this notifier at
> > all to cover this whole range of make_device_exclusive() procedure..
> > 
> > What I am thinking is, we're afraid some CPU accesses this page so the pte got
> > quickly restored when device atomic operation is carrying on.  Then with this
> > notifier we'll be able to cancel it.  Makes perfect sense.
> > 
> > However do we really need to register this notifier so early?  The thing is the
> > GPU driver still has all the page locks, so even if there's a race to restore
> > the ptes, they'll block at taking the page lock until the driver releases it.
> > 
> > IOW, I'm wondering whether the "non-fragile" way to do this is not do
> > mmu_interval_notifier_insert() that early: what if we register that notifier
> > after make_device_exclusive_range() returns but before page_unlock() somehow?
> > So before page_unlock(), race is protected fully by the lock itself; after
> > that, it's done by mmu notifier.  Then maybe we don't need to worry about all
> > these notifications during marking exclusive (while we shouldn't)?
> 
> The notifier is needed to protect against races with pte changes. Once a page
> has been marked for exclusive access the driver will update it's page tables to
> allow atomic access to the page. However in the meantime the page could become
> unmapped entirely or write protected.
> 
> As I understand things the page lock won't protect against these kind of pte
> changes, hence the need for mmu_interval_read_begin/retry which allows the
> driver to hold a mutex protecting against invalidations via blocking the
> notifier until the device page tables have been updated.

Indeed, I suppose you mean change_pte_range() and zap_pte_range()
correspondingly.

Do you think we can restore pte right before wr-protect or zap?  Then all
things serializes with page lock (btw: it's already an insane userspace to
either unmap a page or wr-protect a page if it knows the device is using it!).
If these are the only two cases, it still sounds a cleaner approach to me than
the current approach.

This also reminded me that right now the cpu pgtable recovery is lazy - it
happens either from fork() or a cpu page fault.  Even after device finished
using it, swap ptes keep there.

What if the device tries to do atomic op on the same page twice?  I am not sure
whether it means we may also want to teach both GUP (majorly follow_page_pte()
for now before pmd support) and process of page_make_device_exclusive() with
understanding the device exclusive entries too?  Another option seems to be
restoring pte after device finish using it, as long as the device knows when.

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
