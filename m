Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970EDA2B853
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C3010E9F6;
	Fri,  7 Feb 2025 01:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ibKg5JbF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FC810E922
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 10:10:59 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so6739805e9.1
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 02:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738231858; x=1738836658; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=93vOIonXuhhlCsVZNUEtlATNESA+m5aY8gZZwzqgor4=;
 b=ibKg5JbFwr7qkxk/89t0unoCCl9ZPswtLoJlWl5P1SMVWY7mY7iwCgHIhfpDD/qqR4
 Lq5rv18kmJdwICPh7ZxrT0/FIRVfonFTMAlB2SDIbVpnupD3duByi4OFX3aAHUK7hF1J
 nf/oxD2/5/KB1L6wCPuTqSFxAnpOReCfDLvaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738231858; x=1738836658;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=93vOIonXuhhlCsVZNUEtlATNESA+m5aY8gZZwzqgor4=;
 b=GV5Q19ETEArEQdemwwCaiwDVk7LzSwfhTfqXDxGkwZH07q2AK08YzLXZceA1XTMP1x
 dp4aPHdzSU7UZtp3oQqveWzKT+4rkGODAoBrt1R0wqOlWgAboCnBbU2oexDGGbw+91Jv
 WicLHZZPKUFPaEJBb6O1zhwH9XnFv3zAGvPv7m+20eaasZu8LW9ooBXY8VQgxn1k4NWW
 kBRy3q6BjkhEnvdV3BEMTIKEpRtcPcp75C1dDO4c9PSTSOi7OceBwMhXt3SKRaAnhR4O
 /aiDwF2A/SE3kRZdiNJR/yhLS2lo1CrF0NAOhhzVlXLlIdT818FQX/+nVuchUGfRzPX8
 eI7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfjDhNduJPK1JzQP2OYbIqKSttexPEAfX4KlDQVhnWPoN2fjMj0hF7aHjTQVzVZSYqayj98zcG@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe3wnYCX+EgY5Ya4Sj1mtIBWvOtrMQf878qcSF+tox+zUSRrZe
 K5THVJDmE/T3+GfbCuH/Ld6CuIQH/b1tIYpdashpjlYWEeMBVbPPC1FxOqunZ3M=
X-Gm-Gg: ASbGncvM+ZOxbdOxYMPg1yk/nXQYhumiR1Cp2Qh3oqWrVc4HYrT+cktzoF9vWjzsI/5
 YnRbUejGSf7SQhgEKhWdmkGbiKs9wVGu2PNSzOpMLKgMIgL0/+yTMRrwN1G80vBI6qtLcrb1tST
 h/cWxwaJ0UyNfEMzwZ56k4wpGV6wpCBPyLcgHUlVm862XKT6cdxaUDVwPLdaCsCdpuBjdn6fCXS
 CnMPmn+WuUtjCsFGhPVaT4AliSRjibcObgPPGW4G95OG38NddA7UfrShSsLSyc/W/HFOvnObphD
 ZLh74tGXgWsnqtwGRAqXRv3LgFI=
X-Google-Smtp-Source: AGHT+IGJbnpeQf8B7cOXmXj6f06PfyU+GyWQpPIgeE+bqBElNwC7Ri+H94bg3ZkKWdVeU5p3l70P8w==
X-Received: by 2002:a05:600c:3501:b0:434:a7e3:db5c with SMTP id
 5b1f17b1804b1-438e2446708mr19019575e9.11.1738231858001; 
 Thu, 30 Jan 2025 02:10:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81911sm52790125e9.38.2025.01.30.02.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 02:10:57 -0800 (PST)
Date: Thu, 30 Jan 2025 11:10:55 +0100
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
Subject: Re: [PATCH v1 08/12] mm/rmap: handle device-exclusive entries
 correctly in try_to_unmap_one()
Message-ID: <Z5tQL60SNNGCkfQR@phenom.ffwll.local>
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
 <20250129115411.2077152-9-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-9-david@redhat.com>
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

On Wed, Jan 29, 2025 at 12:54:06PM +0100, David Hildenbrand wrote:
> Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
> we can return with a device-exclusive entry from page_vma_mapped_walk().
> 
> try_to_unmap_one() is not prepared for that, so teach it about these
> non-present nonswap PTEs.
> 
> Before that, could we also have triggered this case with device-private
> entries? Unlikely.

Just quick comment on this, I'm still pondering all the other aspects.

device-private memory is entirely owned by the driver, the core mm isn't
supposed to touch these beyond migrating it back to system memory in
do_swap_page. Plus using rmap when the driver asks for invalidating
mappings as needed.

So no lru, thp, migration or anything initiated by core mm should ever
happen on these device private pages. If it does, it'd be a bug.

device-exclusive is entirely different ofc since that's just normal system
memory managed by core mm/.
-Sima
> 
> Note that we could currently only run into this case with
> device-exclusive entries on THPs. For order-0 folios, we still adjust
> the mapcount on conversion to device-exclusive, making the rmap walk
> abort early (folio_mapcount() == 0 and breaking swapout). We'll fix
> that next, now that try_to_unmap_one() can handle it.
> 
> Further note that try_to_unmap() calls MMU notifiers and holds the
> folio lock, so any device-exclusive users should be properly prepared
> for this device-exclusive PTE to "vanish".
> 
> Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/rmap.c | 53 ++++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 65d9bbea16d0..12900f367a2a 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1648,9 +1648,9 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  {
>  	struct mm_struct *mm = vma->vm_mm;
>  	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
> +	bool anon_exclusive, ret = true;
>  	pte_t pteval;
>  	struct page *subpage;
> -	bool anon_exclusive, ret = true;
>  	struct mmu_notifier_range range;
>  	enum ttu_flags flags = (enum ttu_flags)(long)arg;
>  	unsigned long pfn;
> @@ -1722,7 +1722,19 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  		/* Unexpected PMD-mapped THP? */
>  		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
>  
> -		pfn = pte_pfn(ptep_get(pvmw.pte));
> +		/*
> +		 * We can end up here with selected non-swap entries that
> +		 * actually map pages similar to PROT_NONE; see
> +		 * page_vma_mapped_walk()->check_pte().
> +		 */
> +		pteval = ptep_get(pvmw.pte);
> +		if (likely(pte_present(pteval))) {
> +			pfn = pte_pfn(pteval);
> +		} else {
> +			pfn = swp_offset_pfn(pte_to_swp_entry(pteval));
> +			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
> +		}
> +
>  		subpage = folio_page(folio, pfn - folio_pfn(folio));
>  		address = pvmw.address;
>  		anon_exclusive = folio_test_anon(folio) &&
> @@ -1778,7 +1790,9 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  				hugetlb_vma_unlock_write(vma);
>  			}
>  			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
> -		} else {
> +			if (pte_dirty(pteval))
> +				folio_mark_dirty(folio);
> +		} else if (likely(pte_present(pteval))) {
>  			flush_cache_page(vma, address, pfn);
>  			/* Nuke the page table entry. */
>  			if (should_defer_flush(mm, flags)) {
> @@ -1796,6 +1810,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  			} else {
>  				pteval = ptep_clear_flush(vma, address, pvmw.pte);
>  			}
> +			if (pte_dirty(pteval))
> +				folio_mark_dirty(folio);
> +		} else {
> +			pte_clear(mm, address, pvmw.pte);
>  		}
>  
>  		/*
> @@ -1805,10 +1823,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  		 */
>  		pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
>  
> -		/* Set the dirty flag on the folio now the pte is gone. */
> -		if (pte_dirty(pteval))
> -			folio_mark_dirty(folio);
> -
>  		/* Update high watermark before we lower rss */
>  		update_hiwater_rss(mm);
>  
> @@ -1822,8 +1836,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  				dec_mm_counter(mm, mm_counter(folio));
>  				set_pte_at(mm, address, pvmw.pte, pteval);
>  			}
> -
> -		} else if (pte_unused(pteval) && !userfaultfd_armed(vma)) {
> +		} else if (likely(pte_present(pteval)) && pte_unused(pteval) &&
> +			   !userfaultfd_armed(vma)) {
>  			/*
>  			 * The guest indicated that the page content is of no
>  			 * interest anymore. Simply discard the pte, vmscan
> @@ -1902,6 +1916,12 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  				set_pte_at(mm, address, pvmw.pte, pteval);
>  				goto walk_abort;
>  			}
> +
> +			/*
> +			 * arch_unmap_one() is expected to be a NOP on
> +			 * architectures where we could have non-swp entries
> +			 * here, so we'll not check/care.
> +			 */
>  			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
>  				swap_free(entry);
>  				set_pte_at(mm, address, pvmw.pte, pteval);
> @@ -1926,10 +1946,17 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  			swp_pte = swp_entry_to_pte(entry);
>  			if (anon_exclusive)
>  				swp_pte = pte_swp_mkexclusive(swp_pte);
> -			if (pte_soft_dirty(pteval))
> -				swp_pte = pte_swp_mksoft_dirty(swp_pte);
> -			if (pte_uffd_wp(pteval))
> -				swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +			if (likely(pte_present(pteval))) {
> +				if (pte_soft_dirty(pteval))
> +					swp_pte = pte_swp_mksoft_dirty(swp_pte);
> +				if (pte_uffd_wp(pteval))
> +					swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +			} else {
> +				if (pte_swp_soft_dirty(pteval))
> +					swp_pte = pte_swp_mksoft_dirty(swp_pte);
> +				if (pte_swp_uffd_wp(pteval))
> +					swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +			}
>  			set_pte_at(mm, address, pvmw.pte, swp_pte);
>  		} else {
>  			/*
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
