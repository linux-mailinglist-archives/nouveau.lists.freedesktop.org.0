Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11464B104D9
	for <lists+nouveau@lfdr.de>; Thu, 24 Jul 2025 10:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B063A10E8F6;
	Thu, 24 Jul 2025 08:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iWMVj4xx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C733310E8FB
 for <nouveau@lists.freedesktop.org>; Thu, 24 Jul 2025 08:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753347181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eSRWHNR3oSryq2XtU/spTQx/p9VSczkNbYfeDDaHpfg=;
 b=iWMVj4xxeah100ObRO3ziqSc3dC994A4X8/pcDbB9GGq3d2QK6YNxtY+cU5pnXLpQG7UyR
 n8wc8Lr/GKTIyea07V7mGHyXQMEbBwViJmsCQOgQ3Fs1/f5Ym4N56dGrSPaAfzHKFRWoZz
 rS/FHb8384eZvGO/Mv1EvKiuSFrzKqs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-eavv_SRcOOCNzb6J8L-XVA-1; Thu, 24 Jul 2025 04:52:59 -0400
X-MC-Unique: eavv_SRcOOCNzb6J8L-XVA-1
X-Mimecast-MFC-AGG-ID: eavv_SRcOOCNzb6J8L-XVA_1753347178
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a52bfda108so371047f8f.3
 for <nouveau@lists.freedesktop.org>; Thu, 24 Jul 2025 01:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753347178; x=1753951978;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eSRWHNR3oSryq2XtU/spTQx/p9VSczkNbYfeDDaHpfg=;
 b=Rk0rmshzKLIYGVEOJjjGsC0/d0OBRwvLzagTEBtUmRgOS6IM4R+pYibJQ/IXMKtbJE
 Vkacbo/NmDStapKimmr/c6O8J4tJDeYG6RGNcT5CkkDGDf0TguBY7mRfRuR0DX41Let1
 vLT4dbWuO3hs49UIbJFugh1DqCP5Ye/5zdovPnUTxeXJrzByvdTZY9GTBlw31Ks0h9TP
 Ghz4ND0XMocsos62VwuJ1q716AyD4RA6sUI+4b3NL6BX4hbemaPEULpr4A/+BERRaqY2
 5RXXgE3Jp/BJ1HU7NxY3rlRlzv5LWfR0Rf7Fx4cQHaPLe6cCh/0W/jU9X5EiK94lK7My
 d+tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/CqMVGD+f4I4qcXHVP5AOpK79JA/Ya/wUEoheNK7HpjUByKL2cM9xejOELMrCVhffYXvy1R5S@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL3Xm+SRqqO8KbWipnM9Poja9/3xfTO+wECBy0dujJpmp9ZETA
 oxjdn5OwbeZaV8FoqrZ1Si5OuxnXWKA0k1SFDrw+4NssaDDRzx553dpoip/u0iDaGQtzdhricWP
 acnhJ8rDfx8eDnV5f70zM2TeKt6PUy+7fZAG4a2gOwTRfgQhcMfkuVT5SeFpafXtuqUs=
X-Gm-Gg: ASbGnctWwZzr7BPEkxsH0rr5W10KCJqat5ErpAXbHriswKJRdQCCNtfhzYesSIDu/aU
 vFvoiv5GEdU4ziiyAPnl0J4cLoSnr2qMd6rNq93HqsPzT5pbACDqh0HI8AY1Yl2+DOCnoC+eJf2
 5y3pjSmdyw4PN5lFkLIbugDuCNqrcZWLMkpQaUZSW9w56EwDSGuRQFxGd7jnXEtNm6BOxDPZH9h
 pcjwqsm5otSzo8YLuGMy+ed2NAEjS5znkE7oKfU2gbD24T4jTsijUHnPx8+dAJV1AYg97MbMZO1
 wyoU1HPYXYJTCg9PlwecgN6vlqGcDqyfue090WwUBC0JW6YVQ8xgukXIRxx6d4m2rvK/KvTBMc+
 OFYVbnUhPx6dtRyjOki3l5L9LGpzeA4tizezV6TWJ56WU+j6hHvbm2sHDbvPUgUIq
X-Received: by 2002:a05:6000:1884:b0:3a8:30b8:cb93 with SMTP id
 ffacd0b85a97d-3b768ef953dmr4588646f8f.32.1753347177753; 
 Thu, 24 Jul 2025 01:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoD8bQhLMR7nrUTvI3JvUWW9/Pn8ZIBrS4iPYjqfRFSc5RU+yNx7pIBUo5X7x71tBeIaa94w==
X-Received: by 2002:a05:6000:1884:b0:3a8:30b8:cb93 with SMTP id
 ffacd0b85a97d-3b768ef953dmr4588610f8f.32.1753347177191; 
 Thu, 24 Jul 2025 01:52:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1f:5e00:c941:d6fb:3e30:b42?
 (p200300d82f1f5e00c941d6fb3e300b42.dip0.t-ipconnect.de.
 [2003:d8:2f1f:5e00:c941:d6fb:3e30:b42])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fcc43c2sm1436739f8f.83.2025.07.24.01.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 01:52:56 -0700 (PDT)
Message-ID: <a3f1af02-ef3f-40f8-be79-4c3929a59bb7@redhat.com>
Date: Thu, 24 Jul 2025 10:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
To: Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Matthew Wilcox <willy@infradead.org>, Yonatan Maman <ymaman@nvidia.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky
 <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@nvidia.com>,
 Michael Guralnik <michaelgur@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-2-ymaman@nvidia.com>
 <aHpXXKTaqp8FUhmq@casper.infradead.org> <20250718144442.GG2206214@ziepe.ca>
 <aH4_QaNtIJMrPqOw@casper.infradead.org>
 <7lvduvov3rvfsgixbkyyinnzz3plpp3szxam46ccgjmh6v5d7q@zoz4k723vs3d>
 <aIBcTpC9Te7YIe4J@ziepe.ca>
 <cn7hcxskr5prkc3jnd4vzzeau5weevzumcspzfayeiwdexkkfe@ovvgraqo7svh>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <cn7hcxskr5prkc3jnd4vzzeau5weevzumcspzfayeiwdexkkfe@ovvgraqo7svh>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vMP2ULX1lIdQCjwpiaP9VLNHKBD2gRm6lNaXhJOC-pU_1753347178
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

On 23.07.25 06:10, Alistair Popple wrote:
> On Wed, Jul 23, 2025 at 12:51:42AM -0300, Jason Gunthorpe wrote:
>> On Tue, Jul 22, 2025 at 10:49:10AM +1000, Alistair Popple wrote:
>>>> So what is it?
>>>
>>> IMHO a hack, because obviously we shouldn't require real physical addresses for
>>> something the CPU can't actually address anyway and this causes real
>>> problems
>>
>> IMHO what DEVICE PRIVATE really boils down to is a way to have swap
>> entries that point to some kind of opaque driver managed memory.
>>
>> We have alot of assumptions all over about pfn/phys to page
>> relationships so anything that has a struct page also has to come with
>> a fake PFN today..
> 
> Hmm ... maybe. To get that PFN though we have to come from either a special
> swap entry which we already have special cases for, or a struct page (which is
> a device private page) which we mostly have to handle specially anyway. I'm not
> sure there's too many places that can sensibly handle a fake PFN without somehow
> already knowing it is device-private PFN.
> 
>>> (eg. it doesn't actually work on anything other than x86_64). There's no reason
>>> the "PFN" we store in device-private entries couldn't instead just be an index
>>> into some data structure holding pointers to the struct pages. So instead of
>>> using pfn_to_page()/page_to_pfn() we would use device_private_index_to_page()
>>> and page_to_device_private_index().
>>
>> It could work, but any of the pfn conversions would have to be tracked
>> down.. Could be troublesome.
> 
> I looked at this a while back and I'm reasonably optimistic that this is doable
> because we already have to treat these specially everywhere anyway.
How would that look like?

E.g., we have code like

if (is_device_private_entry(entry)) {
	page = pfn_swap_entry_to_page(entry);
	folio = page_folio(page);

	...
	folio_get(folio);
	...
}

We could easily stop allowing pfn_swap_entry_to_page(), turning these 
into non-pfn swap entries.

Would it then be something like

if (is_device_private_entry(entry)) {
	page = device_private_entry_to_page(entry);
	
	...
}

Whereby device_private_entry_to_page() obtains the "struct page" not via 
the PFN but some other magical (index) value?

-- 
Cheers,

David / dhildenb

