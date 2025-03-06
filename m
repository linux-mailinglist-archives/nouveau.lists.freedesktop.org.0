Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765A8A54473
	for <lists+nouveau@lfdr.de>; Thu,  6 Mar 2025 09:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25C210E0A1;
	Thu,  6 Mar 2025 08:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PBrmkEP/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B562A10E0A1
 for <nouveau@lists.freedesktop.org>; Thu,  6 Mar 2025 08:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741249019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odsRzfoyTq7MLWg0HBrmPljhEyWEbEmwPwdNT+/iYYo=;
 b=PBrmkEP/4Tz4tlDyTWxiqr11lD/l7HmZKvsNiCRdw3yZt+3zHI5vvpBN5yjBM7EqDf8zIF
 XyatIYPUq2wRbtDaNqYm+M1iZmn04tld/5MnknkPWEeXnhGFM+dceIeyb00vLBdWqNN679
 0M7hDN199xJ3w0FiHtoJGL9yFjsyUVU=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-vDSQArkaPeCRV5ASVU2__w-1; Thu, 06 Mar 2025 03:16:58 -0500
X-MC-Unique: vDSQArkaPeCRV5ASVU2__w-1
X-Mimecast-MFC-AGG-ID: vDSQArkaPeCRV5ASVU2__w_1741249017
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-542a77b4a4cso230687e87.1
 for <nouveau@lists.freedesktop.org>; Thu, 06 Mar 2025 00:16:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741249016; x=1741853816;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=odsRzfoyTq7MLWg0HBrmPljhEyWEbEmwPwdNT+/iYYo=;
 b=LEC4kzaq5Tg/Q/cZYWIEVCeQ6q9RaB1GsBVz4GgOLeVunAZ87ftSa7GhoEGl0iMFyj
 n9wCtIpZEasAa/kCYINPwdnbCfDfbIiZfOvd05q9SIqNnyp980CZtfrx/U1C+U2AtYKk
 tzH4O89ZnU0bzS0ax6Th6tfkAGbGE6qWJZDL/fV8g3/9LRwBE4EITEYKSmGs2QRX8YJ1
 27q7HbFBKrM9/3i86NVnN6EA7B9wTjhYpTzjzYdk5BM48ctGOfKcpJ4AVtjfQBZZRB4x
 jitoYwu/iv32B7iu6sYdQfE3qH/vskEpKoY458NeWDY3CRJ+gZOBO5xH3YZsdSi6vAIP
 IUyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhQvmAnuhB8mlXkc/7XKPY2UjOpM7B8vs6QE790vkEZEhxv0Tmh44gTz0VoxCFtIn7fz32w4Ez@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq6IddhOGJT/NAqsREjkpngbpnHa1MblYTfqqtv1Wf8DDCKBd+
 +T6fghbUqgm1AFdJUe/rMKalMoyJpmm0h0ARhiKbsnGJlD1Qw8ku5jayKa8qJMNNGo1f6Kvvl3k
 Hibn86A7wwEuo6ROOQdUIg9GrIBtkzgsGHZMTho712vSgj+537fDphwGvCOE4bA==
X-Gm-Gg: ASbGncugV2d5RiZS76uTjo1g9PdGbNToLT2O/PWkKF24C1E9STPTAAGmkmDgLhC1h2R
 m8ZPQfQts8VZBn4Jh0oz/rqOZcJgPgeZ/wG9jiAUkUr6kfT7v6KA+9k19Iw9s2/AQkyK7z7zHya
 I14I9ajYpl3oI62g6lMgIbKlq/4GqR/CRyU1mwDbv7j0MeXcW+EA4zn6ywktdOzpf/AbbqMNB4X
 Wge+ncZUSus54MnVGgCNpel2h2/1xjUPHj+HMsFqDem9uAXY9tXEHUA+GIwmRV6SsdITBtlqvZO
 8RQfgRMYQjqPZcEAUHx2nIHljEcjJ96AnxmENcGPcw==
X-Received: by 2002:a05:6512:1322:b0:545:eef:83f1 with SMTP id
 2adb3069b0e04-5497d337e0cmr2671538e87.17.1741249016477; 
 Thu, 06 Mar 2025 00:16:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiqG6ICeY8Rgq/8C4HzQpFU5tEDdOt1pL5RtIfbip+7YLfAyoT3kW5xY2Cp2v83S4Jtg1SGQ==
X-Received: by 2002:a05:6512:1322:b0:545:eef:83f1 with SMTP id
 2adb3069b0e04-5497d337e0cmr2671520e87.17.1741249015951; 
 Thu, 06 Mar 2025 00:16:55 -0800 (PST)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae45fd6sm103034e87.47.2025.03.06.00.16.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 00:16:55 -0800 (PST)
Message-ID: <e1c3341f-dad5-434f-984a-4a3534657233@redhat.com>
Date: Thu, 6 Mar 2025 10:16:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 07/11] mm/memremap: Add folio_split support
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
 <20250306044239.3874247-8-balbirs@nvidia.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20250306044239.3874247-8-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xj8P9uyyTmByFxf1ELiqfX65B3CWpsO0JDej9Dy_LhE_1741249017
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
> When a zone device page is split (via huge pmd folio split). The
> driver callback for folio_split is invoked to let the device driver
> know that the folio size has been split into a smaller order.
>
> The HMM test driver has been updated to handle the split, since the
> test driver uses backing pages, it requires a mechanism of reorganizing
> the backing pages (backing pages are used to create a mirror device)
> again into the right sized order pages. This is supported by exporting
> prep_compound_page().
>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>  include/linux/memremap.h |  7 +++++++
>  include/linux/mm.h       |  1 +
>  lib/test_hmm.c           | 35 +++++++++++++++++++++++++++++++++++
>  mm/huge_memory.c         |  5 +++++
>  mm/page_alloc.c          |  1 +
>  5 files changed, 49 insertions(+)
>
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 11d586dd8ef1..2091b754f1da 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -100,6 +100,13 @@ struct dev_pagemap_ops {
>  	 */
>  	int (*memory_failure)(struct dev_pagemap *pgmap, unsigned long pfn,
>  			      unsigned long nr_pages, int mf_flags);
> +
> +	/*
> +	 * Used for private (un-addressable) device memory only.
> +	 * This callback is used when a folio is split into
> +	 * a smaller folio
> +	 */
> +	void (*folio_split)(struct folio *head, struct folio *tail);
>  };
>  
>  #define PGMAP_ALTMAP_VALID	(1 << 0)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 98a67488b5fe..3d0e91e0a923 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1415,6 +1415,7 @@ static inline struct folio *virt_to_folio(const void *x)
>  void __folio_put(struct folio *folio);
>  
>  void split_page(struct page *page, unsigned int order);
> +void prep_compound_page(struct page *page, unsigned int order);
>  void folio_copy(struct folio *dst, struct folio *src);
>  int folio_mc_copy(struct folio *dst, struct folio *src);
>  
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index a81d2f8a0426..18b6a7b061d7 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -1640,10 +1640,45 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>  	return ret;
>  }
>  
> +
> +static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
> +{
> +	struct page *rpage = BACKING_PAGE(folio_page(head, 0));
> +	struct folio *new_rfolio;
> +	struct folio *rfolio;
> +	unsigned long offset = 0;
> +
> +	if (!rpage) {
> +		folio_page(tail, 0)->zone_device_data = NULL;
> +		return;
> +	}
> +
> +	offset = folio_pfn(tail) - folio_pfn(head);
> +	rfolio = page_folio(rpage);
> +	new_rfolio = page_folio(folio_page(rfolio, offset));
> +
> +	folio_page(tail, 0)->zone_device_data = folio_page(new_rfolio, 0);
> +

> +	if (folio_pfn(tail) - folio_pfn(head) == 1) {
> +		if (folio_order(head))
> +			prep_compound_page(folio_page(rfolio, 0),
> +						folio_order(head));
> +		folio_set_count(rfolio, 1);
> +	}

I think this might need at least a comment. Also, isn't the
folio_order(head) always 0, tail and head are splitted folios and if pfn
difference == 1?
If the intention is to adjust the backing folio's head page to the new
order, shouldn't there be clear_compound_head() also for backing head
page if split to zero order?


> +	clear_compound_head(folio_page(new_rfolio, 0));
> +	if (folio_order(tail))
> +		prep_compound_page(folio_page(new_rfolio, 0),
> +						folio_order(tail));
> +	folio_set_count(new_rfolio, 1);
> +	folio_page(new_rfolio, 0)->mapping = folio_page(rfolio, 0)->mapping;
> +	tail->pgmap = head->pgmap;
> +}
> +
>  static const struct dev_pagemap_ops dmirror_devmem_ops = {
>  	.page_free	= dmirror_devmem_free,
>  	.migrate_to_ram	= dmirror_devmem_fault,
>  	.page_free	= dmirror_devmem_free,
> +	.folio_split	= dmirror_devmem_folio_split,
>  };
>  
>  static int dmirror_device_init(struct dmirror_device *mdevice, int id)
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 995ac8be5709..518a70d1b58a 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3655,6 +3655,11 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>  						MTHP_STAT_NR_ANON, 1);
>  			}
>  
> +			if (folio_is_device_private(origin_folio) &&
> +					origin_folio->pgmap->ops->folio_split)
> +				origin_folio->pgmap->ops->folio_split(
> +					origin_folio, release);
> +
>  			/*
>  			 * Unfreeze refcount first. Additional reference from
>  			 * page cache.
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 17ea8fb27cbf..563f7e39aa79 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -573,6 +573,7 @@ void prep_compound_page(struct page *page, unsigned int order)
>  
>  	prep_compound_head(page, order);
>  }
> +EXPORT_SYMBOL_GPL(prep_compound_page);
>  
>  static inline void set_buddy_order(struct page *page, unsigned int order)
>  {

--Mika


