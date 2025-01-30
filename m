Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E13A2B843
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683ED10E9E1;
	Fri,  7 Feb 2025 01:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="CbVxGrRT";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F6C10E31B
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 09:51:25 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4368a293339so6427015e9.3
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 01:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738230684; x=1738835484; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/pdSjiOp9c4OOZ/yEIi55/ppp/3tp0YczNnLQ60kX3w=;
 b=CbVxGrRTjmiBDB0mh5j2O3t7Sf8HI+UbZ2VNFoI+Ju05oFOkX4Eo/igFmx8yVCo2zR
 WC4D886sMznNUmu+Jmh17JuMeDSSh2CZoLfYuoDERKZftyJj6p8xsm1OsLUsDcAgtBiI
 T4MSYPDyoSmuB7JMvZ21YU8QHnQXVOEqzdd0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738230684; x=1738835484;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/pdSjiOp9c4OOZ/yEIi55/ppp/3tp0YczNnLQ60kX3w=;
 b=NXMV7HeMvKGdURR6M8fikMaa0Q2cTmaqy0hUNncDSDU1hcstOghOTMKFumAITSb5uW
 K8/eLmJWQNOM4yzb1ci9cSZNPGJPqSJ/rCxaYKmLffNdrx7we0/Q+677p0GMOm1C1b+c
 urEeJUnTF3EFLgvU3ILBXcs3I6qHpUxWEfSvGzzNXWkEv8CKVqETvRBQbKODS14jJcLC
 Xq7t9F7Ik0a1Q5IJagX4tDAGFn35mcr8vrB3IupkmGnOFfau2m4jaauyxlhInDELdp06
 3DyCT3yZu3/LomjkVUQijtwBsHtv4XTM68QpcnmLoBfTQzImnDa/CFRPiZ7jgyczxsX9
 Qnrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXHv6g4Vs7bab0+IgDB4K6s5vR20/7EX8SJd88l2rhOJeK2w/mK/00Rvb57Q0iQp1d5zSE8dFB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyUi1tmYTotVUqV1tA1zthQC20n9KFtWM8Yg0trL19304KcUDF
 2UPZqRqATwtfE4N/8nlCt4t8aCdH+lnfRIPEyTM3kcKWsDVwxMditrxiZ7v6Fms=
X-Gm-Gg: ASbGncuH4WobMXOQK2UpaNW9j2C9cO0sgYHpI1+jF0cmPKvpGaCYY3mWp9hB/kcpb0b
 njIq3msBxasnFCZX+bgNlh+pVZPcGKVL0RfuS4LdH7ZpNSbH/ZAR6MMI32JAEhj+Hpn5YkX3jC7
 /qsqKcOmRI8arJfp3B5/6npet5OlHprsEIrAXmJfxv2J00zzAhm9jJ9d59E7xTJjoQ9kf+Rfdh0
 ntek9ZPByRhdZrQs+3aUitZ6tcNm8Tmdl+8QUHs5Ud1wZuLJlCzIW3hycPNFzVtCLvPY3f7+RvM
 JbICJTEqM3qo71Ia75tge1yli38=
X-Google-Smtp-Source: AGHT+IF1314un3GQgKorQlU7Ooz/rQrCyj9j2D9rJRU+9J5toI9CX1diHYvVJ9K+Omvgaz97Oy+yBw==
X-Received: by 2002:a05:600c:1d82:b0:438:a240:c55 with SMTP id
 5b1f17b1804b1-438e298e709mr9982485e9.1.1738230684290; 
 Thu, 30 Jan 2025 01:51:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245efbcsm16833505e9.33.2025.01.30.01.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 01:51:23 -0800 (PST)
Date: Thu, 30 Jan 2025 10:51:21 +0100
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
Subject: Re: [PATCH v1 05/12] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
Message-ID: <Z5tLmYOQaZrdWQHN@phenom.ffwll.local>
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
 <20250129115411.2077152-6-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-6-david@redhat.com>
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

On Wed, Jan 29, 2025 at 12:54:03PM +0100, David Hildenbrand wrote:
> Let's do it just like mprotect write-upgrade or during NUMA-hinting
> faults on PROT_NONE PTEs: detect if the PTE can be writable by using
> can_change_pte_writable().
> 
> Set the PTE only dirty if the folio is dirty: we might not
> necessarily have a write access, and setting the PTE writable doesn't
> require setting the PTE dirty.

Not sure whether there's much difference in practice, since a device
exclusive access means a write, so the folio better be dirty (unless we
aborted halfway through). But then I couldn't find the code in nouveau to
do that, so now I'm confused.
-Sima

> With this change in place, there is no need to have separate
> readable and writable device-exclusive entry types, and we'll merge
> them next separately.
> 
> Note that, during fork(), we first convert the device-exclusive entries
> back to ordinary PTEs, and we only ever allow conversion of writable
> PTEs to device-exclusive -- only mprotect can currently change them to
> readable-device-exclusive. Consequently, we always expect
> PageAnonExclusive(page)==true and can_change_pte_writable()==true,
> unless we are dealing with soft-dirty tracking or uffd-wp. But reusing
> can_change_pte_writable() for now is cleaner.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 03efeeef895a..db38d6ae4e74 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -725,18 +725,21 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
>  	struct folio *folio = page_folio(page);
>  	pte_t orig_pte;
>  	pte_t pte;
> -	swp_entry_t entry;
>  
>  	orig_pte = ptep_get(ptep);
>  	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
>  	if (pte_swp_soft_dirty(orig_pte))
>  		pte = pte_mksoft_dirty(pte);
>  
> -	entry = pte_to_swp_entry(orig_pte);
>  	if (pte_swp_uffd_wp(orig_pte))
>  		pte = pte_mkuffd_wp(pte);
> -	else if (is_writable_device_exclusive_entry(entry))
> -		pte = maybe_mkwrite(pte_mkdirty(pte), vma);
> +
> +	if ((vma->vm_flags & VM_WRITE) &&
> +	    can_change_pte_writable(vma, address, pte)) {
> +		if (folio_test_dirty(folio))
> +			pte = pte_mkdirty(pte);
> +		pte = pte_mkwrite(pte, vma);
> +	}
>  
>  	VM_BUG_ON_FOLIO(pte_write(pte) && (!folio_test_anon(folio) &&
>  					   PageAnonExclusive(page)), folio);
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
