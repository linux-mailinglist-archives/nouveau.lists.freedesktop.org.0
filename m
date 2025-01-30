Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD560A2B84C
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB6810E9E7;
	Fri,  7 Feb 2025 01:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="WCSXH+IM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C410F10E923
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 10:37:28 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so4071365e9.3
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 02:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738233447; x=1738838247; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tyqvf2GtMB8eYUA6roFvIAKJ3MrPvA1f4ISzNSrvZw0=;
 b=WCSXH+IMYMUnJPXpUWNS98v1mV3aMpS+puZV1K+cF44QHroIlzt8KJ32forkpk6Iwx
 fs9oi4iANZ+R/sJkN08HwM7maI0Mf88LdgcASd3c+tVKsdwRmO8f376s3Gj3H3NXV0Er
 eHLrYSAYppfUEAb3OLMIpMDXX75mBZAW+/RDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738233447; x=1738838247;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tyqvf2GtMB8eYUA6roFvIAKJ3MrPvA1f4ISzNSrvZw0=;
 b=igFbzJZnkldXAyrtMWLMEsFNagNLhs1qXVX5s7P1VM9STiWJokMW+gg6V5UAaVuYSm
 83ksNxyq8nDx8YgN2FmY/s40gNx/1N+TliBYaI7x/okZM8UozSe4PJkArCEct243HrNM
 mUlj6FoCKR/39/gyJZGednvLSbcrP/Du3ofYeMshbHerQvZHkx8vg+PKLrb/6RkVEcIP
 EpWfBi4OW+tmqDtCKlCHL17qDV/gRU01+rUOsAVilolW8ovsV8pXjd/WVAWXf7smpxLr
 bTsmNrpmvLcQSevTyrPBwPmB5iy7q17yDGzSZetMh/um5ZZbA2m4KF6AUYYGD3XBHqeY
 w4cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKxOTXySk3BmzEW9W+kJnpt0NCVYIDQawsZ3keTVaf000QAjxUhOynnUbnyFSONhWn289f1Npn@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywlx7J+m2F29Hc40dS4TvkeFPkF78j6sWxGrZsxmidrCMyNutPU
 V78kFZL4DBB0UccVnN9+P/P2E0OHAxGmngsTmxf0Q3ksnlEP9wxqhtUiTx8rSWQ=
X-Gm-Gg: ASbGncu2IJzhs0TLI4LIe/CHW3w1YU7kHI7A+AR/1zXmGld6xgPWEqSfvsTld+aG2+Q
 bp2TXDOgddNTWqvnZk4UC0OHbAnsIFG0neFlX5LpUCd3VtOMKt4P770mkBC7BMfw/BP/RmuNb+3
 gkVYzSUYkVksEFeo4FKHw+q4FvKbF+iEWHgfCrTLzk1L7W1GbvtH/h5J5Mvd+rw45q5V1XubRAb
 yw93UrDEbOPefA0FOsXKmJ4RZpnCsIyp+SCTlb4DRWi6r3Pl5IYndvdvXfhZ5gHbC5hP5hACa7d
 CLzsptcfHHB+ld1m279ALc5EYe0=
X-Google-Smtp-Source: AGHT+IFg7SYWGB7s8CQ+QgL5BM/h37wU8TOAK/f2xIHq4oWzFN+REfQ6LxpHzU72JzdfiBY831Ddbw==
X-Received: by 2002:a05:600c:3ba7:b0:435:306:e5dd with SMTP id
 5b1f17b1804b1-438dc3fc40bmr54907245e9.22.1738233446986; 
 Thu, 30 Jan 2025 02:37:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438d7aac93asm64284585e9.1.2025.01.30.02.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 02:37:24 -0800 (PST)
Date: Thu, 30 Jan 2025 11:37:22 +0100
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
Message-ID: <Z5tWYpwpUfgEmeKj@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-13-david@redhat.com>
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

On Wed, Jan 29, 2025 at 12:54:10PM +0100, David Hildenbrand wrote:
> Now that conversion to device-exclusive does no longer perform an
> rmap walk and the main page_vma_mapped_walk() users were taught to
> properly handle nonswap entries, let's treat device-exclusive entries just
> as if they would be present, similar to how we handle device-private
> entries already.

So the reason for handling device-private entries in rmap is so that
drivers can rely on try_to_migrate and related code to invalidate all the
various ptes even for device private memory. Otherwise no one should hit
this path, at least if my understanding is correct.

So I'm very much worried about opening a can of worms here because I think
this adds a genuine new case to all the various callers.

> This fixes swapout/migration of folios with device-exclusive entries.
> 
> Likely there are still some page_vma_mapped_walk() callers that are not
> fully prepared for these entries, and where we simply want to refuse
> !pte_present() entries. They have to be fixed independently; the ones in
> mm/rmap.c are prepared.

The other worry is that maybe breaking migration is a feature, at least in
parts. If thp constantly reassembles a pmd entry because hey all the
memory is contig and userspace allocated a chunk of memory to place
atomics that alternate between cpu and gpu nicely separated by 4k pages,
then we'll thrash around invalidating ptes to no end. So might be more
fallout here.
-Sima

> 
> Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory.c | 17 +----------------
>  mm/rmap.c   |  7 -------
>  2 files changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index db38d6ae4e74..cd689cd8a7c8 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -743,20 +743,6 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
>  
>  	VM_BUG_ON_FOLIO(pte_write(pte) && (!folio_test_anon(folio) &&
>  					   PageAnonExclusive(page)), folio);
> -
> -	/*
> -	 * No need to take a page reference as one was already
> -	 * created when the swap entry was made.
> -	 */
> -	if (folio_test_anon(folio))
> -		folio_add_anon_rmap_pte(folio, page, vma, address, RMAP_NONE);
> -	else
> -		/*
> -		 * Currently device exclusive access only supports anonymous
> -		 * memory so the entry shouldn't point to a filebacked page.
> -		 */
> -		WARN_ON_ONCE(1);
> -
>  	set_pte_at(vma->vm_mm, address, ptep, pte);
>  
>  	/*
> @@ -1628,8 +1614,7 @@ static inline int zap_nonpresent_ptes(struct mmu_gather *tlb,
>  		 */
>  		WARN_ON_ONCE(!vma_is_anonymous(vma));
>  		rss[mm_counter(folio)]--;
> -		if (is_device_private_entry(entry))
> -			folio_remove_rmap_pte(folio, page, vma);
> +		folio_remove_rmap_pte(folio, page, vma);
>  		folio_put(folio);
>  	} else if (!non_swap_entry(entry)) {
>  		/* Genuine swap entries, hence a private anon pages */
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 9e2002d97d6f..4acc9f6d743a 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2495,13 +2495,6 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>  	/* The pte is writable, uffd-wp does not apply. */
>  	set_pte_at(mm, addr, fw.ptep, swp_pte);
>  
> -	/*
> -	 * TODO: The device-exclusive non-swap PTE holds a folio reference but
> -	 * does not count as a mapping (mapcount), which is wrong and must be
> -	 * fixed, otherwise RMAP walks don't behave as expected.
> -	 */
> -	folio_remove_rmap_pte(folio, page, vma);
> -
>  	folio_walk_end(&fw, vma);
>  	*foliop = folio;
>  	return page;
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
