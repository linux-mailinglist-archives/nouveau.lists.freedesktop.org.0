Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAE3A2B829
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FF310E9DD;
	Fri,  7 Feb 2025 01:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="R8uOpa2J";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B13410E061
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jan 2025 17:13:24 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3863703258fso2151822f8f.1
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jan 2025 09:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738343602; x=1738948402; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6jSWMajugHE39GppqlmQIz8pPmyPm52DOpdfP99qKyo=;
 b=R8uOpa2JvaGPOLui/pH22ugyUv1SlsiHcNaZ72vxxeDl6TAXgqfxzscdtTgDunKRme
 r8qRH5O0qx06HnwcbAeaqIy+cIyTL63SMlgtv0Uorogx69sta2hSnTGHS8J8x8Q+ptyu
 s46zvMQ3TdfEe+81aQYhiEgUQL8W7h/wDciRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738343602; x=1738948402;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6jSWMajugHE39GppqlmQIz8pPmyPm52DOpdfP99qKyo=;
 b=Y2Tkl60SIlAVGYdseHwA3UnGavPIG6v45X0jxVA6gTfbxRFDU7jVNBjPU/5ztgsCOQ
 TnRa0W5WjxL4Tzcp7EDFlTrGWw7+KaPYtKuyVnZuJeGNLpLLttND3NhzTymQm+4GCL4F
 wwKvvvU/OFmLMgXgbs6lns5uZM3PeDitcCCBAQADMyrx+BHIyHlRMBHGdrd8nZqH30B9
 jZ3Q4pKxiEs2n4aQ3O1xeP0fKCX+uQdRq7NBQ9tyFnGnbgb3Cb26EqPy6HMQZjTwuNAA
 CFsjDPQe56rH9ngsEUVpyLm62SBw+Ot//yumVnt2n/792qH2P8hLsvTih693B3EzdNgG
 4KqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9QxgrbxinSeGd7Zjr0ehDOiMs2xQp//9r9zcC8Xh0pn4l9791VvRN2su0QsqakJElXGss37W/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgSQGgSEQKgaQdjvH72FBCdu/Scp7llPL/OHB5WLGXK982cLga
 p1yQkMpOpiZ9cwoJeGJR0rSiN0dXEJY+4qHUlNIfIMbw0ODTJ0Db0HpSseDV7Jw=
X-Gm-Gg: ASbGncuUIPKcBBTHHN6SAwY4H5qgkW+pWP7LX7m8preLWdCSU0DoZpiyukyo8RNAl2C
 z9agngGl59gxvesID+ba8xssCIiU+ZSytfYYcsgqxkIOqVyg4zfmcdBZZkCSbFJZbouLB+X918W
 2fOylIm+ONwDLiqmvA3axXo55UgYJb4nt5GaB1CyEcjqV/rUX0IF3R91Tn58SPOa1Yuhg4+YvNO
 Eo1r2FZTre+lp7gi80M5zEkIykp8wN77ZRIYUqOD4eR+Id3KAWP+k46OI6KGYdOSOfmiG/C87p8
 mYFGbGVFh5bFv7+R640EWz5HuyE=
X-Google-Smtp-Source: AGHT+IGBiDEPfJPSLRmnOOkpJfCiAcSXF7PRNDxRISEjglfPUZ3JlbXVG6tP7dp5Gn/UOWRu2XqpDg==
X-Received: by 2002:a05:6000:1563:b0:38a:5d7d:4bd6 with SMTP id
 ffacd0b85a97d-38c5a9bee80mr7346375f8f.25.1738343602545; 
 Fri, 31 Jan 2025 09:13:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b57ccsm5178729f8f.79.2025.01.31.09.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 09:13:22 -0800 (PST)
Date: Fri, 31 Jan 2025 18:13:19 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 12/12] mm/rmap: keep mapcount untouched for
 device-exclusive entries
Message-ID: <Z50Er1Oy7VPLVY9U@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-13-david@redhat.com>
 <Z5tWYpwpUfgEmeKj@phenom.ffwll.local>
 <887df26d-b8bb-48df-af2f-21b220ef22e6@redhat.com>
 <Z5t8dkujVv7xZiuV@phenom.ffwll.local>
 <d70db67d-8989-4ce4-bc21-52a89449db4b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d70db67d-8989-4ce4-bc21-52a89449db4b@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
X-Mailman-Approved-At: Fri, 07 Feb 2025 01:42:11 +0000
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Jan 30, 2025 at 04:43:08PM +0100, David Hildenbrand wrote:
> > > Assume you have a THP (or any mTHP today). You can easily trigger the
> > > scenario that folio_mapcount() != 0 with active device-exclusive entries,
> > > and you start doing rmap walks and stumble over these device-exclusive
> > > entries and *not* handle them properly. Note that more and more systems are
> > > configured to just give you THP unless you explicitly opted-out using
> > > MADV_NOHUGEPAGE early.
> > > 
> > > Note that b756a3b5e7ea added that hunk that still walks these
> > > device-exclusive entries in rmap code, but didn't actually update the rmap
> > > walkers:
> > > 
> > > @@ -102,7 +104,8 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
> > > 
> > >                  /* Handle un-addressable ZONE_DEVICE memory */
> > >                  entry = pte_to_swp_entry(*pvmw->pte);
> > > -               if (!is_device_private_entry(entry))
> > > +               if (!is_device_private_entry(entry) &&
> > > +                   !is_device_exclusive_entry(entry))
> > >                          return false;
> > > 
> > >                  pfn = swp_offset(entry);
> > > 
> > > That was the right thing to do, because they resemble PROT_NONE entries and
> > > not migration entries or anything else that doesn't hold a folio reference).
> > 
> > Yeah I got that part. What I meant is that doubling down on this needs a
> > full audit and cannot rely on "we already have device private entries
> > going through these paths for much longer", which was the impression I
> > got. I guess it worked, thanks for doing that below :-)
> 
> I know I know, I shouldn't have touched it ... :)
> 
> So yeah, I'll spend some extra work on sorting out the other cases.

Thanks :-)

> > And at least from my very rough understanding of mm, at least around all
> > this gpu stuff, tracking device exclusive mappings like real cpu mappings
> > makes sense, they do indeed act like PROT_NONE with some magic to restore
> > access on fault.
> > 
> > I do wonder a bit though what else is all not properly tracked because
> > they should be like prot_none except arent. I guess we'll find those as we
> > hit them :-/
> 
> Likely a lot of stuff. But more in a "entry gets ignored -- functionality
> not implemented, move along" way, because all page table walkers have to
> care about !pte_present() already; it's just RMAP code that so far never
> required it.

I think it'd be good to include a tersion summary of this in the commit
messages - I'd expect this is code other gpu folks will need to crawl
through in the future again, and I had no idea where I should even start
looking to figure this out.

> 
> [...]
> 
> > 
> > > If thp constantly reassembles a pmd entry because hey all the
> > > > memory is contig and userspace allocated a chunk of memory to place
> > > > atomics that alternate between cpu and gpu nicely separated by 4k pages,
> > > > then we'll thrash around invalidating ptes to no end. So might be more
> > > > fallout here.
> > > 
> > > khugepaged will back off once it sees an exclusive entry, so collapsing
> > > could only happen once everything is non-exclusive. See
> > > __collapse_huge_page_isolate() as an example.
> > 
> > Ah ok. I think might be good to add that to the commit message, so that
> > people who don't understand mm deeply (like me) aren't worried when they
> > stumble over this change in the future again when digging around.
> 
> Will do, thanks for raising that concern!
> 
> > 
> > > It's really only page_vma_mapped_walk() callers that are affected by this
> > > change, not any other page table walkers.
> > 
> > I guess my mm understanding is just not up to that, but I couldn't figure
> > out why just looking at page_vma_mapped_walk() only is good enough?
> 
> See above: these never had to handle !page_present() before -- in contrast
> to the other page table walkers.
>
> So nothing bad happens when these page table walkers traverse these PTEs,
> it's just that the functionality will usually be implemented.
> 
> Take MADV_PAGEOUT as an example: madvise_cold_or_pageout_pte_range() will
> simply skip "!pte_present()", because it wouldn't know what to do in that
> case.
> 
> Of course, there could be page table walkers that check all cases and bail
> out if they find something unexpected: do_swap_page() cannot make forward
> progress and will inject a VM_FAULT_SIGBUS if it doesn't recognize the
> entry. But these are rather rare.

Yeah this all makes sense to me now. Thanks a lot for your explanation,
I'll try to pay it back by trying to review the next version of the series
a bit.

> We could enlighten selected page table walkers to handle device-exclusive
> where it really makes sense later.

I think rmap for eviction/migration is really the big one that obviously
should be fixed. All the other cases I could think of I think just end up
in handle_mm_fault() to sort out the situation and then retry.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
