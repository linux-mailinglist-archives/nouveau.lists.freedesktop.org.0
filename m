Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED16A23B6D
	for <lists+nouveau@lfdr.de>; Fri, 31 Jan 2025 10:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B7410EA47;
	Fri, 31 Jan 2025 09:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IXMndzm0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F6E10EA56
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jan 2025 09:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738315813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6JX/RWwIhNXl3m6w98kdtL5L38gt1l8nq6fffLr0F0g=;
 b=IXMndzm0stz3lph4j5NsphtstOp6VhI4UDD/RadLTWM1gGGo+PXoddzSHIjkQjrIuuOgwL
 rJ15V+tN//I8JuJtgY6n0KNKG9k0kwgKSzsogVO/bDjPoYvQyKq3fDp/CSYSUEhWc9g3Tl
 uAJn9NlHHn8b8qE5qI8RSJUR3hcnLSw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-CegLlWIeN_qG4pZWyCsPmw-1; Fri, 31 Jan 2025 04:30:11 -0500
X-MC-Unique: CegLlWIeN_qG4pZWyCsPmw-1
X-Mimecast-MFC-AGG-ID: CegLlWIeN_qG4pZWyCsPmw
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38c5d9530ebso1012895f8f.1
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jan 2025 01:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738315810; x=1738920610;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6JX/RWwIhNXl3m6w98kdtL5L38gt1l8nq6fffLr0F0g=;
 b=qpESK02PE3C7preQWCyLuz48P/fSsKTIRqbOmrZPeQ4T2CkJaAfHQzFwBrmPXJX6Xz
 OBwevrCkOq3OULbLmX2CU1VC5ILL1hRbe4qlz5fWKE1k4WExj6s6fU3QM1JU3QxYYUD9
 iBVW+/bp1+UlbOPGFmVOO9q9B0rPKfB3pnQGhsHax+s8x1/KTj+MEZxaHZkajWvrPqM9
 RuOAD7h43UvTosm50rWI9DeuLrwVhrqWm0MTcOjB8igx7BWhN83BHINDnACv0Lhr0ZIF
 Wsgfnx1lCd5Zl/k1PHPp5+SeVncPVtW9LInmlVMgO/8eqw9Q0LzwqOa0Bp/24p27FH72
 VDkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEsepxERT2MlpV3X6w3N2Dgk72lcgFPeF53l7NpaK8Nc6Q/3DaWtFe0w5tNPIU3IVqJeZ1mtbZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6nEcWXX0kLAcZTZNebdjjAql1BPDw7iKdE1gHUEPNMohTIrgh
 OOJE5/u2GekvwLry5o+iQhc6avOu5YZxBQJvi7D0PxABN6xZsNM5RzIGj3CRVuKEX20rTnCA87C
 jQkO6UdiWxwfWsB142fHmncBUwvCADTgFWwyEMOV3v6l7/5epIMxOModS2utqqPc=
X-Gm-Gg: ASbGncvR7VTmtRwFaybqb9EXlaO1crfn+8ArwqZRSLrtyGD6KOynHdf6/4E9oPwhIID
 u4ygOcqoY+w/X4WlkGsyH1sB9kP+N2E7R+NINKdEilYsbu62E+Kz6OmOdCfqn5Ng47nsLWNFWA/
 BoOFcXB01o4CwgROGvjUztYwCVuIX/8+bCMnQPDKaqliRWKWxds1VkusntdqCYYcU7DLFaAISbw
 u6hgJKZ6SwqQRxAygax28sma4vHHEMjonMAuMgT3ngxUSglmhRYHaq7WR6xNhz70TSjCJspwU11
 78NKIOKCg5+d/5Nm9dHvHN3q8TPhN0ja
X-Received: by 2002:a5d:5f93:0:b0:386:3213:5b9b with SMTP id
 ffacd0b85a97d-38c51e8e12fmr9404968f8f.43.1738315810058; 
 Fri, 31 Jan 2025 01:30:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/lPrwSVroidbMiKYfbD1/nXp46l+US2HSio5xTQO5OhxfVSCZ2fT04LU5R2PHsMKzzXSdnQ==
X-Received: by 2002:a5d:5f93:0:b0:386:3213:5b9b with SMTP id
 ffacd0b85a97d-38c51e8e12fmr9404919f8f.43.1738315809686; 
 Fri, 31 Jan 2025 01:30:09 -0800 (PST)
Received: from [192.168.3.141] (p5b0c6e05.dip0.t-ipconnect.de. [91.12.110.5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23e5e53sm48600365e9.17.2025.01.31.01.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2025 01:29:58 -0800 (PST)
Message-ID: <2985fbe9-8af8-44c9-bb9e-b3ab3131981a@redhat.com>
Date: Fri, 31 Jan 2025 10:29:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/12] mm/rmap: convert make_device_exclusive_range()
 to make_device_exclusive()
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-4-david@redhat.com>
 <b3stuhf2s6236zawaa6zt6x3fg6oamrtj3pwajlyoxlaxdmdtf@arqxcoemsjfg>
 <dibd7n5uhmpjvy2welm2lrxnrpxd3h2qkzgboca4xq634ib5dl@oojnkmmi7frl>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <dibd7n5uhmpjvy2welm2lrxnrpxd3h2qkzgboca4xq634ib5dl@oojnkmmi7frl>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A4I-HeaLncINN4tubGeSknDJXX_SF4XnmwIQQr5avDU_1738315810
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 31.01.25 01:28, Alistair Popple wrote:
> On Thu, Jan 30, 2025 at 04:57:39PM +1100, Alistair Popple wrote:
>> On Wed, Jan 29, 2025 at 12:54:01PM +0100, David Hildenbrand wrote:
> 
> [...]
> 
>>> -int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
>>> -				unsigned long end, struct page **pages,
>>> -				void *owner)
>>> +struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>>> +		void *owner, struct folio **foliop)
>>>   {
>>> -	long npages = (end - start) >> PAGE_SHIFT;
>>> -	long i;
>>> +	struct folio *folio;
>>> +	struct page *page;
>>> +	long npages;
>>> +
>>> +	mmap_assert_locked(mm);
>>>   
>>> -	npages = get_user_pages_remote(mm, start, npages,
>>> +	/*
>>> +	 * Fault in the page writable and try to lock it; note that if the
>>> +	 * address would already be marked for exclusive use by the device,
>>> +	 * the GUP call would undo that first by triggering a fault.
>>> +	 */
>>> +	npages = get_user_pages_remote(mm, addr, 1,
>>>   				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
>>> -				       pages, NULL);
>>> -	if (npages < 0)
>>> -		return npages;
>>> -
>>> -	for (i = 0; i < npages; i++, start += PAGE_SIZE) {
>>> -		struct folio *folio = page_folio(pages[i]);
>>> -		if (PageTail(pages[i]) || !folio_trylock(folio)) {
>>> -			folio_put(folio);
>>> -			pages[i] = NULL;
>>> -			continue;
>>> -		}
>>> +				       &page, NULL);
>>> +	if (npages != 1)
>>> +		return ERR_PTR(npages);
>>> +	folio = page_folio(page);
>>>   
>>> -		if (!folio_make_device_exclusive(folio, mm, start, owner)) {
>>> -			folio_unlock(folio);
>>> -			folio_put(folio);
>>> -			pages[i] = NULL;
>>> -		}
>>> +	if (!folio_test_anon(folio) || folio_test_hugetlb(folio)) {
>>> +		folio_put(folio);
>>> +		return ERR_PTR(-EOPNOTSUPP);
>>> +	}
>>> +
>>> +	if (!folio_trylock(folio)) {
> 
> Actually I think we can make this folio_lock(folio) now. The only reason for
> the trylock was to avoid deadlock between other threads looping over a range
> of folios while holding folio locks which is something the migration code also
> does.

Okay, let me do that in a separate patch. Thanks!

-- 
Cheers,

David / dhildenb

