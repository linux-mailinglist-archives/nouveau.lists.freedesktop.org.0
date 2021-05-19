Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8643893C5
	for <lists+nouveau@lfdr.de>; Wed, 19 May 2021 18:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC136EE28;
	Wed, 19 May 2021 16:29:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949CE6ED9B
 for <nouveau@lists.freedesktop.org>; Wed, 19 May 2021 12:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621427072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B6+GMlwrRYCIhKlucQm0d4pBq6rNn427lZR0x1Dlm1U=;
 b=GDj4kTQBRTFHmZGMPM91fqLRrCE7KNCCzwchKs3jOGwusOul2fnXfAW8gOuhJ8tvzpONAw
 UaqyyKfCwjEF52jYFgz29X3unkeked2xr3CmH0fknwN16gJUnkEl/mzOUgpA/XL3pyKczA
 0IONPc8/Y9PvbWAypsC5fcSX+g9ZkWw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-VBi-KjaaNsOJIT3-F45o5A-1; Wed, 19 May 2021 08:24:29 -0400
X-MC-Unique: VBi-KjaaNsOJIT3-F45o5A-1
Received: by mail-qv1-f71.google.com with SMTP id
 l19-20020a0ce0930000b02901efdf1c21ecso7396170qvk.10
 for <nouveau@lists.freedesktop.org>; Wed, 19 May 2021 05:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B6+GMlwrRYCIhKlucQm0d4pBq6rNn427lZR0x1Dlm1U=;
 b=k0EH2ELgK1zdF3KkK3sGjQeODhE2QjhwreD0P2Txbnbq0AKXk8ajqpLAvc4TacuKBN
 NOeeSljC+6779BarSrbZRnHDkuRO+gEsSm8e58xopOQK0U9r0IXs+LdFYq+Vf1fVVUmn
 dPa4ys41n4Tpj9wJg3zR54LNoEm35uARJ/ulYbTveENlZg/R1rUyiff4gmGUlS/aVxbB
 8HJueKHxyH849x9BswyjsWUAuU20gr+2/+3OxTe6ucGSpBkf/sxMKZ5fvYk5pf0ZWOqi
 EYACONlbPqYrOJEumBDGp9MHW76wWmxjnYqpk1c+BQ6DV0r+iDf6W7j5F0aKj1aYnrsg
 U38g==
X-Gm-Message-State: AOAM531d4dNgN3I5Fr/SUI8lHOw0briZ1kLos9B1D53mimNo8kzC9tIl
 WTlYIKkt15I2NFWeG7piHoxoBqfYcY9O7UboK9+C0Qx6oQqpeRtP3PPSsZsG/hrlhsdeAP2BQbW
 SJCaZCgF4ZvZwteLaaDcaLZwOOw==
X-Received: by 2002:ac8:4b74:: with SMTP id g20mr11134571qts.196.1621427068812; 
 Wed, 19 May 2021 05:24:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfYWS/dsuPCr9XZO07LTE6R21Hbq/UdkcASCcx2KQMguWwavSEob3mks8rwF1tmkFnKYSzdA==
X-Received: by 2002:ac8:4b74:: with SMTP id g20mr11134560qts.196.1621427068562; 
 Wed, 19 May 2021 05:24:28 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id m4sm15981169qtg.21.2021.05.19.05.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 05:24:28 -0700 (PDT)
Date: Wed, 19 May 2021 08:24:27 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YKUDe8Oe4Y+q5Kxx@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com>
 <YKQutvAa3NlgGaMm@t490s> <3859486.fHISG1RMxY@nvdebian>
MIME-Version: 1.0
In-Reply-To: <3859486.fHISG1RMxY@nvdebian>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 19 May 2021 16:29:11 +0000
Subject: Re: [Nouveau] [PATCH v8 5/8] mm: Device exclusive memory access
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
Cc: rcampbell@nvidia.com, willy@infradead.org, daniel@ffwll.ch,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 bsingharora@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 bskeggs@redhat.com, jgg@nvidia.com, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 08:49:01PM +1000, Alistair Popple wrote:
> On Wednesday, 19 May 2021 7:16:38 AM AEST Peter Xu wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Wed, Apr 07, 2021 at 06:42:35PM +1000, Alistair Popple wrote:
> > 
> > [...]
> > 
> > > +static bool try_to_protect(struct page *page, struct mm_struct *mm,
> > > +                        unsigned long address, void *arg)
> > > +{
> > > +     struct ttp_args ttp = {
> > > +             .mm = mm,
> > > +             .address = address,
> > > +             .arg = arg,
> > > +             .valid = false,
> > > +     };
> > > +     struct rmap_walk_control rwc = {
> > > +             .rmap_one = try_to_protect_one,
> > > +             .done = page_not_mapped,
> > > +             .anon_lock = page_lock_anon_vma_read,
> > > +             .arg = &ttp,
> > > +     };
> > > +
> > > +     /*
> > > +      * Restrict to anonymous pages for now to avoid potential writeback
> > > +      * issues.
> > > +      */
> > > +     if (!PageAnon(page))
> > > +             return false;
> > > +
> > > +     /*
> > > +      * During exec, a temporary VMA is setup and later moved.
> > > +      * The VMA is moved under the anon_vma lock but not the
> > > +      * page tables leading to a race where migration cannot
> > > +      * find the migration ptes. Rather than increasing the
> > > +      * locking requirements of exec(), migration skips
> > > +      * temporary VMAs until after exec() completes.
> > > +      */
> > > +     if (!PageKsm(page) && PageAnon(page))
> > > +             rwc.invalid_vma = invalid_migration_vma;
> > > +
> > > +     rmap_walk(page, &rwc);
> > > +
> > > +     return ttp.valid && !page_mapcount(page);
> > > +}
> > 
> > I raised a question in the other thread regarding fork():
> > 
> > https://lore.kernel.org/lkml/YKQjmtMo+YQGx%2FwZ@t490s/
> > 
> > While I suddenly noticed that we may have similar issues even if we fork()
> > before creating the ptes.
> > 
> > In that case, we may see multiple read-only ptes pointing to the same page. 
> > We will convert all of them into device exclusive read ptes in rmap_walk()
> > above, however how do we guarantee after all COW done in the parent and all
> > the childs processes, the device owned page will be returned to the parent?
> 
> I assume you are talking about a fork() followed by a call to 
> make_device_exclusive()? I think this should be ok because 
> make_device_exclusive() always calls GUP with FOLL_WRITE both to break COW and 
> because a device performing atomic operations needs to write to the page. I 
> suppose a comment here highlighting the need to break COW to avoid this 
> scenario would be useful though.

Indeed, sorry for the false alarm!  Yes it would be great to mention that too.

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
