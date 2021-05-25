Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEA2390D47
	for <lists+nouveau@lfdr.de>; Wed, 26 May 2021 02:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75786EB8F;
	Wed, 26 May 2021 00:29:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A3F6EB7F
 for <nouveau@lists.freedesktop.org>; Tue, 25 May 2021 23:45:41 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id i9so48675806lfe.13
 for <nouveau@lists.freedesktop.org>; Tue, 25 May 2021 16:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3bWAgXGiiTzRVKYdfnPTxYrHckcttw3uRegUUnWbckY=;
 b=hhrAWAHsfs4V6Q1rRk+5RzotFe5WWhSfBpNqaVfrq48cm1yZ4mCi/3DHK5lHSGhFsd
 SmJ1xpnVoC7GwKmpH3GoRruIKeU8Ih6iy6Ws79VyE23+Fo9+g4JbUuKztOnJQ/A75X32
 F6tDH6wZDjxQVpUNs2UF0fySZ6sghA7NntIauYgD3MF2VdG4v6OLxVduYDUv5zVgV76d
 JmwjeX0l2NgUtx/F5ZxGtsUf5xupPKtD5PS/OAlZL4HfxZcTuGUESs0ONaygDVe19cwv
 FQzPzjRzsZB6Fnrt5Ecm93WJVhOzxD/x/n3M9I7hGisNhSKHzTk/Tm0AJmUjDadrhVhA
 Z3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3bWAgXGiiTzRVKYdfnPTxYrHckcttw3uRegUUnWbckY=;
 b=DRYAHcgy3S5pl7W9yP+CbFqKkcj/KqFp3Tw7A2myot2qzaiOG4f9aXDdrJ5pH5g/d7
 QMinWrt+OZqTzd+EmtVL7EepcznTbOENpMdeikkB4B+WY6rDbfXYRnM676xQzasWAXd1
 1Ky7QTiAxteZaXKFTTIuD/MxqCXJ0eSTNAcqN0DHXKqplbGTJ09M+scNbTbv/7NBRaNu
 0XCqOlwBAM9BfhA3Ei+s1hRY4EbDhNOztRLh/Okep1bgWNByYQPF+kjA0puTwmuhVkpM
 X/YfH1/++sY1zJjakSj2uqWKxM5fRv8ydLk1AxeTiZHj6Z1jr+iitl76MserElXy1MN7
 cKYg==
X-Gm-Message-State: AOAM530X06m7aesZRTTD+FEe1TXNeD3DN3/vhRUnpSlLJsMC90Dnyj1a
 YgQCpc5ZCD/G+6053Wc5wbiqxOclmy0ewKxYTKsLow==
X-Google-Smtp-Source: ABdhPJy9hB4q6/cvtU+d+uGxv+1Wbe3+B9NkI4vv8arO0VwtZXiweVdebha1FQ1CcW8CnxfqxV9Z3KwiBdSb7es7wjA=
X-Received: by 2002:a05:6512:3da3:: with SMTP id
 k35mr69007lfv.347.1621986339891; 
 Tue, 25 May 2021 16:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-4-apopple@nvidia.com>
 <20210525183710.fa2m2sbfixnhz7g5@revolver>
In-Reply-To: <20210525183710.fa2m2sbfixnhz7g5@revolver>
From: Shakeel Butt <shakeelb@google.com>
Date: Tue, 25 May 2021 16:45:28 -0700
Message-ID: <CALvZod5T1yjOk48Q_efppvP6iQWnSUwdOQL=G9TadrB6nS-s4Q@mail.gmail.com>
To: Liam Howlett <liam.howlett@oracle.com>
X-Mailman-Approved-At: Wed, 26 May 2021 00:29:14 +0000
Subject: Re: [Nouveau] [PATCH v9 03/10] mm/rmap: Split try_to_munlock from
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
Cc: "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "willy@infradead.org" <willy@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "bsingharora@gmail.com" <bsingharora@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, "hughd@google.com" <hughd@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 11:40 AM Liam Howlett <liam.howlett@oracle.com> wrote:
>
[...]
> >
> > +/*
> > + * Walks the vma's mapping a page and mlocks the page if any locked vma's are
> > + * found. Once one is found the page is locked and the scan can be terminated.
> > + */
>
> Can you please add that this requires the mmap_sem() lock to the
> comments?
>

Why does this require mmap_sem() lock? Also mmap_sem() lock of which mm_struct?

> > +static bool page_mlock_one(struct page *page, struct vm_area_struct *vma,
> > +                              unsigned long address, void *unused)
> > +{
> > +     struct page_vma_mapped_walk pvmw = {
> > +             .page = page,
> > +             .vma = vma,
> > +             .address = address,
> > +     };
> > +
> > +     /* An un-locked vma doesn't have any pages to lock, continue the scan */
> > +     if (!(vma->vm_flags & VM_LOCKED))
> > +             return true;
> > +
> > +     while (page_vma_mapped_walk(&pvmw)) {
> > +             /* PTE-mapped THP are never mlocked */
> > +             if (!PageTransCompound(page))
> > +                     mlock_vma_page(page);
> > +             page_vma_mapped_walk_done(&pvmw);
> > +
> > +             /*
> > +              * no need to continue scanning other vma's if the page has
> > +              * been locked.
> > +              */
> > +             return false;
> > +     }
> > +
> > +     return true;
> > +}
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
