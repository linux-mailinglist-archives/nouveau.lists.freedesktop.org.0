Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E7AA54635
	for <lists+nouveau@lfdr.de>; Thu,  6 Mar 2025 10:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E347610E027;
	Thu,  6 Mar 2025 09:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="azUKr6Be";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D04D10E027
 for <nouveau@lists.freedesktop.org>; Thu,  6 Mar 2025 09:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741253105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WM7yWeObA9CF+Z7/sodqheqkakLF4KM63V0xRYX1Nzs=;
 b=azUKr6BekudV7SzVC6NJ0GyX87ZlDPDP8et4FdB45VdkfP0mz2SxyBJE0OVeQ2geVtC2QM
 DO9x6So5bdqaMCuEmgGjeCGslpVRHEzt1d6fGYvWfDDm7obhEoh4+A4Q4PoWGsKVEruTym
 5cFUVeZhZhxAckP5Q08Rh8v5BO73wj0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-kZ7lONDVN5G1KUvj7PbBvA-1; Thu, 06 Mar 2025 04:25:02 -0500
X-MC-Unique: kZ7lONDVN5G1KUvj7PbBvA-1
X-Mimecast-MFC-AGG-ID: kZ7lONDVN5G1KUvj7PbBvA_1741253101
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5497c18801cso172700e87.2
 for <nouveau@lists.freedesktop.org>; Thu, 06 Mar 2025 01:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741253101; x=1741857901;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WM7yWeObA9CF+Z7/sodqheqkakLF4KM63V0xRYX1Nzs=;
 b=mN7tz3/ZvitDBHhGWCc5H6XFfwe43p0q8vY3w01hrMLktsLN3lx9/J9ZF5158EtDLl
 xjXJt6v0JQxK9ddqi6Kmbhs566lp2BWCb6eVMzIWvPejLraepC32oe2wG3Zks1pudXzZ
 bdjSgm7FZjYNMl2Hok7OtneY/FKv0bzIUJljfKWVHJJvPaBJmT76PMRCF273H7KCO2s7
 Ka/W7YxKB9bS/8f/UrO6XRuUe69ani4LXmZvmO2pqvW2GvcG0AgT6vPREqEmZCWCPo14
 wzwlArmXlv1e4LSaXlv6+gZnHTJguNb47OP89d3gd8injBU8a3zBT0NMW82Hs+yhQtk3
 xF6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4uKiJC67xa9TQLVMFmk7q4PNyXe4MHRLmGCkMPv1mI/Qu2fBj8gmFHTBa6aGShyTgTr6oDwf/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsoaL7Xe/O1Vj8XPKq37uwZekc6RuH+G5uyXcJgPcmuo32kkbN
 Cy0iBFaB1lcUb8JwijoxyGudHyIx08SOIiA9oKqAeOg6iJebxl07Xtq58Zk7vrFIVFkrDiv7LZb
 9kEdOv0FnKc+PWT5OLmBIP7FzzXStxGWLVwoqhqG2+3itjJgsfnzgyjGSmWRGCA==
X-Gm-Gg: ASbGncvxyL4OKfaxiPsPcWe7ehMbhuXbNC9tfQgkyOMINKGiE8LoIbTeHhyp6hBnIt9
 0yeoUyaFBAmBiPyS0/l29Mg2v/fhAgyaYLquxx2LV9umiuwhwa/AIMhB4va/2QtY269UUSy/fY0
 PZMJtrfeTH4kq6ysITZkhdVfjxYgxhC6fDnMdzrzovkjK6B84s18Vt8mdq2VtW25ihr0AwgIRuq
 keDr3hanEWX094DPGkbjMXvMgaCz/b15QDyVRAnSqYpDZnvSQu0srgwhv2qCBGWXJLgazweevjK
 VJS6X8w6EBvOMNbXUhLYroSXvIVPYIlH5BNpvO5F4A==
X-Received: by 2002:a05:6512:6d2:b0:545:2eca:856 with SMTP id
 2adb3069b0e04-5497d330b21mr2679374e87.9.1741253100618; 
 Thu, 06 Mar 2025 01:25:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIwq38VGt7y79hXuVQM/A10zAVLGVX2sPPrzqn5KFw8tGh93hCxrMBcCyARSUv3U5pfE1Fzw==
X-Received: by 2002:a05:6512:6d2:b0:545:2eca:856 with SMTP id
 2adb3069b0e04-5497d330b21mr2679341e87.9.1741253100141; 
 Thu, 06 Mar 2025 01:25:00 -0800 (PST)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae5904esm118763e87.76.2025.03.06.01.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 01:24:59 -0800 (PST)
Message-ID: <3dc94555-ae24-407f-8ac3-277b911de5d9@redhat.com>
Date: Thu, 6 Mar 2025 11:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 04/11] mm/migrate_device: THP migration of zone device pages
To: Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 David Hildenbrand <david@redhat.com>, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <20250306044239.3874247-5-balbirs@nvidia.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20250306044239.3874247-5-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: swjrFN2q0-1GcW3hUL6UosgaiqCivjnveWOU9QOcD6w_1741253101
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 3/6/25 06:42, Balbir Singh wrote:
...

>  
>  			/*
>  			 * The only time there is no vma is when called from
> @@ -728,15 +1000,47 @@ static void __migrate_device_pages(unsigned long *src_pfns,
>  					migrate->pgmap_owner);
>  				mmu_notifier_invalidate_range_start(&range);
>  			}
> -			migrate_vma_insert_page(migrate, addr, newpage,
> +
> +			if ((src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
> +				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
> +				nr = HPAGE_PMD_NR;
> +				src_pfns[i] &= ~MIGRATE_PFN_COMPOUND;
> +				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
> +				goto next;
> +			}
> +
> +			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
>  						&src_pfns[i]);
> -			continue;
> +			goto next;
>  		}
>  
>  		newfolio = page_folio(newpage);
>  		folio = page_folio(page);
>  		mapping = folio_mapping(folio);
>  
> +		/*
> +		 * If THP migration is enabled, check if both src and dst
> +		 * can migrate large pages
> +		 */
> +		if (thp_migration_supported()) {
> +			if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
> +				(src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
> +				!(dst_pfns[i] & MIGRATE_PFN_COMPOUND)) {
> +
> +				if (!migrate) {
> +					src_pfns[i] &= ~(MIGRATE_PFN_MIGRATE |
> +							 MIGRATE_PFN_COMPOUND);
> +					goto next;
> +				}
> +				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;

This looks strange as is but patch 08 changes this to split and then
migrate.


> +			} else if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
> +				(dst_pfns[i] & MIGRATE_PFN_COMPOUND) &&
> +				!(src_pfns[i] & MIGRATE_PFN_COMPOUND)) {
> +				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;

Should there be goto next; or similar here also, we are not migrating
this src?


> +			}
> +		}
> +
> +
>  		if (folio_is_device_private(newfolio) ||
>  		    folio_is_device_coherent(newfolio)) {
>  			if (mapping) {
> @@ -749,7 +1053,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
>  				if (!folio_test_anon(folio) ||
>  				    !folio_free_swap(folio)) {
>  					src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
> -					continue;
> +					goto next;
>  				}
>  			}
>  		} else if (folio_is_zone_device(newfolio)) {
> @@ -757,7 +1061,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
>  			 * Other types of ZONE_DEVICE page are not supported.
>  			 */
>  			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
> -			continue;
> +			goto next;
>  		}
>  
>  		BUG_ON(folio_test_writeback(folio));
> @@ -769,6 +1073,8 @@ static void __migrate_device_pages(unsigned long *src_pfns,
>  			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
>  		else
>  			folio_migrate_flags(newfolio, folio);
> +next:
> +		i += nr;
>  	}
>  
>  	if (notified)
> @@ -899,24 +1205,40 @@ EXPORT_SYMBOL(migrate_vma_finalize);
>  int migrate_device_range(unsigned long *src_pfns, unsigned long start,
>  			unsigned long npages)
>  {
> -	unsigned long i, pfn;
> +	unsigned long i, j, pfn;
>  
> -	for (pfn = start, i = 0; i < npages; pfn++, i++) {
> -		struct folio *folio;
> +	i = 0;
> +	pfn = start;
> +	while (i < npages) {
> +		struct page *page = pfn_to_page(pfn);
> +		struct folio *folio = page_folio(page);
> +		unsigned int nr = 1;
>  
>  		folio = folio_get_nontail_page(pfn_to_page(pfn));
>  		if (!folio) {
>  			src_pfns[i] = 0;
> -			continue;
> +			goto next;
>  		}
>  
>  		if (!folio_trylock(folio)) {
>  			src_pfns[i] = 0;
>  			folio_put(folio);
> -			continue;
> +			goto next;
>  		}
>  
>  		src_pfns[i] = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> +		nr = folio_nr_pages(folio);
> +		if (nr > 1) {
> +			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
> +			for (j = 1; j < nr; j++)
> +				src_pfns[i+j] = 0;
> +			i += j;
> +			pfn += j;
> +			continue;
> +		}
> +next:
> +		i++;
> +		pfn++;
>  	}
>  
>  	migrate_device_unmap(src_pfns, npages, NULL);

--Mika


