Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F66A2B849
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255F710E9E8;
	Fri,  7 Feb 2025 01:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="h6Mj3iKL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEEC10E056
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 13:19:54 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38633b5dbcfso786622f8f.2
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 05:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738243193; x=1738847993; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=je4i/r40oAXuV4+p1/WiSxUA0U60ME/6bXfv5n4XiRM=;
 b=h6Mj3iKLXU3eh6Um6BePH+Or/bYx01PfadqBzfzJHaCwOZQ5pR1BsOec+f91ybmYCp
 iR7UkfIX4WcLaEihLm9p1HfQMXivtQ9kZSx7HF5ZNsX7ubqLxOh7Oir2EDm80E3BaQfw
 k0tYb/rz1SKVZOEx6u5iymOwraKMCi1ZYXC+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738243193; x=1738847993;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=je4i/r40oAXuV4+p1/WiSxUA0U60ME/6bXfv5n4XiRM=;
 b=ObJtMFpQ6NGId1cM8WBRKSKq07ib1gKlEuOdqlCL74flw/NPSyoBiNYRLSDMK54bUn
 IMcZbKLbVVTh5KzvPMyRGlflsBzQqbgcDMTKHe9pCYVqZK5LXQs7frI6fmGBJd+dJqhn
 aHbo2La7q9kDX+XEmlge823BGnhrh9VTqEvzo2PiE+bPVVvwvCTzkokXsmbrG//lydIb
 4TbZsvJwIM9VHvYR7XlHHd2Lgd2GlyB5msnxbjfJAXm0KF/58wwS/h2oV8jCWYJFMORS
 ZxHvs7UIkCPI4IvwF2P63tZmHlrpUxWHfcXs4GiMNzQNfCxV8Hr/Ya/8kY6h309AAeQX
 /NbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8UfbgwjoAJNNqQhNOefHIXS93zQdxQToXRStfaaUQa0DHmG4bbjm8BodqyefVmKa2zEx6yo/k@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiFkZmUCvbFtTymZp0ML/wBP8RpF1xX0psPfByeBruQYoK1Agp
 4sKIUtPTqoBOSjAyx0ebuiZCnet7r1sGMzsx+UZ/2fKFq3j+MvPFBYXwa1PEytavtdnukXPYWzf
 L
X-Gm-Gg: ASbGncuG6AL6TekIkOqlG0nMSc9vYQA19/IsQCg5Y5uca/l1VrweVVskNwjsnStWX5N
 MiXOSB5W3bHCBOUeeE96zFEccdldzvGHYREtni/2k2CVUdt4WPxnjjIztKacXjZkvzWOSRKi8sm
 ffsM1Ri9c+1paVbcOSHSPZ6Wmw7PsIbI821Vp5hOT205r1Be+d/4LdEHJDf9qAilfn6d0bOUjK1
 lkJ2kZ5q6IetLdRu2TKhnnHgZ+XEi7OT2R0+jYP1CNMgmSxhpTQq6PMN17MgKWsCQjMV2sxZ6Jj
 qGEkedsmMAsTrVNcjY21vInKuP0=
X-Google-Smtp-Source: AGHT+IGpIlpBVQ4cq9fFNMeb+rvecigacDPTxIRWc2mwixyppcYhS8KCgcxJ6JU5vKwfdjCrG9DHJQ==
X-Received: by 2002:a5d:5f56:0:b0:385:d7f9:f157 with SMTP id
 ffacd0b85a97d-38c51e957b9mr6367577f8f.36.1738243193249; 
 Thu, 30 Jan 2025 05:19:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c101599sm1939047f8f.23.2025.01.30.05.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 05:19:52 -0800 (PST)
Date: Thu, 30 Jan 2025 14:19:50 +0100
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
Message-ID: <Z5t8dkujVv7xZiuV@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <887df26d-b8bb-48df-af2f-21b220ef22e6@redhat.com>
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

On Thu, Jan 30, 2025 at 12:42:26PM +0100, David Hildenbrand wrote:
> On 30.01.25 11:37, Simona Vetter wrote:
> > On Wed, Jan 29, 2025 at 12:54:10PM +0100, David Hildenbrand wrote:
> > > Now that conversion to device-exclusive does no longer perform an
> > > rmap walk and the main page_vma_mapped_walk() users were taught to
> > > properly handle nonswap entries, let's treat device-exclusive entries just
> > > as if they would be present, similar to how we handle device-private
> > > entries already.
> > 
> > So the reason for handling device-private entries in rmap is so that
> > drivers can rely on try_to_migrate and related code to invalidate all the
> > various ptes even for device private memory. Otherwise no one should hit
> > this path, at least if my understanding is correct.
> 
> Right, device-private probably only happen to be seen on the migration path
> so far.
> 
> > 
> > So I'm very much worried about opening a can of worms here because I think
> > this adds a genuine new case to all the various callers.
> 
> To be clear: it can all already happen.
> 
> Assume you have a THP (or any mTHP today). You can easily trigger the
> scenario that folio_mapcount() != 0 with active device-exclusive entries,
> and you start doing rmap walks and stumble over these device-exclusive
> entries and *not* handle them properly. Note that more and more systems are
> configured to just give you THP unless you explicitly opted-out using
> MADV_NOHUGEPAGE early.
> 
> Note that b756a3b5e7ea added that hunk that still walks these
> device-exclusive entries in rmap code, but didn't actually update the rmap
> walkers:
> 
> @@ -102,7 +104,8 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
> 
>                 /* Handle un-addressable ZONE_DEVICE memory */
>                 entry = pte_to_swp_entry(*pvmw->pte);
> -               if (!is_device_private_entry(entry))
> +               if (!is_device_private_entry(entry) &&
> +                   !is_device_exclusive_entry(entry))
>                         return false;
> 
>                 pfn = swp_offset(entry);
> 
> That was the right thing to do, because they resemble PROT_NONE entries and
> not migration entries or anything else that doesn't hold a folio reference).

Yeah I got that part. What I meant is that doubling down on this needs a
full audit and cannot rely on "we already have device private entries
going through these paths for much longer", which was the impression I
got. I guess it worked, thanks for doing that below :-)

And at least from my very rough understanding of mm, at least around all
this gpu stuff, tracking device exclusive mappings like real cpu mappings
makes sense, they do indeed act like PROT_NONE with some magic to restore
access on fault.

I do wonder a bit though what else is all not properly tracked because
they should be like prot_none except arent. I guess we'll find those as we
hit them :-/

> Fortunately, it's only the page_vma_mapped_walk() callers that need care.
> 
> mm/rmap.c is handled with this series.
> 
> mm/page_vma_mapped.c should work already.
> 
> mm/migrate.c: does not apply
> 
> mm/page_idle.c: likely should just skip !pte_present().
> 
> mm/ksm.c might be fine, but likely we should just reject !pte_present().
> 
> kernel/events/uprobes.c likely should reject !pte_present().
> 
> mm/damon/paddr.c likely should reject !pte_present().
> 
> 
> I briefly though about a flag to indicate if a page_vma_mapped_walk()
> supports these non-present entries, but likely just fixing them up is
> easier+cleaner.
> 
> Now that I looked at all, I might just write patches for them.
> 
> > 
> > > This fixes swapout/migration of folios with device-exclusive entries.
> > > 
> > > Likely there are still some page_vma_mapped_walk() callers that are not
> > > fully prepared for these entries, and where we simply want to refuse
> > > !pte_present() entries. They have to be fixed independently; the ones in
> > > mm/rmap.c are prepared.
> > 
> > The other worry is that maybe breaking migration is a feature, at least in
> > parts.
> 
> Maybe breaking swap and migration is a feature in some reality, in this
> reality it's a BUG :)

Oh yeah I agree on those :-)

> If thp constantly reassembles a pmd entry because hey all the
> > memory is contig and userspace allocated a chunk of memory to place
> > atomics that alternate between cpu and gpu nicely separated by 4k pages,
> > then we'll thrash around invalidating ptes to no end. So might be more
> > fallout here.
> 
> khugepaged will back off once it sees an exclusive entry, so collapsing
> could only happen once everything is non-exclusive. See
> __collapse_huge_page_isolate() as an example.

Ah ok. I think might be good to add that to the commit message, so that
people who don't understand mm deeply (like me) aren't worried when they
stumble over this change in the future again when digging around.

> It's really only page_vma_mapped_walk() callers that are affected by this
> change, not any other page table walkers.

I guess my mm understanding is just not up to that, but I couldn't figure
out why just looking at page_vma_mapped_walk() only is good enough?

> It's unfortunate that we now have to fix it all up, that original series
> should have never been merged that way.

Yeah looks like a rather big miss.
-Sima

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
