Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270DBA22A05
	for <lists+nouveau@lfdr.de>; Thu, 30 Jan 2025 10:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43CF10E0C0;
	Thu, 30 Jan 2025 09:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fqS4sQqj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926D210E0C0
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 09:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738227858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Fol/NgIx5laLmX2ts5rSzbTEw1asc1ZaG7b2gi36JQQ=;
 b=fqS4sQqj9NgrOg6bZZFkYcDcl9YRWKc63Scz6vhXxU39ECP1MYTb6+mD+J04tQhg8/pMo5
 LlGvipxjq8DePuU/ctetB2s+F31ojNhVAnYX2+np90qBxFXUOvg4fy6cNzByL0t0sir/n8
 +bguldOgBCjd+flcHJ8TAQjPgtxcORU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-ftC74eqkP1Wmh98vHnbdnQ-1; Thu, 30 Jan 2025 04:04:17 -0500
X-MC-Unique: ftC74eqkP1Wmh98vHnbdnQ-1
X-Mimecast-MFC-AGG-ID: ftC74eqkP1Wmh98vHnbdnQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-438da39bb69so3333955e9.0
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 01:04:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738227856; x=1738832656;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Fol/NgIx5laLmX2ts5rSzbTEw1asc1ZaG7b2gi36JQQ=;
 b=gjXmrTaxwwbTw1y8hu/0MklxfVtOgf2VvhZAPCKj2PnDuYX2Ruk/bHiz/AGVg3FIJ5
 ZBhQKGgffFJJq/vp+pQuZHx51+9i/XDMsUBpZj7n68CRxp6jTm3h2miqywW6MeN/9199
 fNL+1jtnnUQaEWvc3SFkum4mY1Ep0lDnp2XfWEvb3XxYJTwOV+CnM49pML/h8SO+NLXa
 AFDYgXsNyM39C8x2svzFEeL8qYabm9YCffQKa2/+QBhkEvSqnbnR1AwEukaNubpPMcGb
 /RPfVUUgljkjJHdXEc8VuzIxDi/3p+CC9noS5dSUSStWVZYCG912w85/tORXzijzVI/L
 3AXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1P5jxiq0JrNlV8Fr/l9Ht1A0mPpJNfVKQQM0mLSLrhmodLSufLp3sctFXJ1869Ci/t2teiFXR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwkoqTFgfdoFdM5WSCAmYVkKucncnMX53kS4jVFEsQW4TlQ8FO
 zpUdwjGieq9W0MtYjt7PMEr7q/7JyN5y/ftT84d38Z/CI5eB5X8v4yxvSpT0GSw4RApHGWOoaDJ
 W2OL0qCKUpPSXoZB0CweD3rhw9gx/zeqxZ2xZbwMrXEWPHY70e+0CnU2/+VJl9YE=
X-Gm-Gg: ASbGnctLbcvV1G5tWI9JHke5/3D4ilBlq7XACyyGkuM/1bG8U42WtMcV2cHHfJeX4w/
 eF2UBi323VsCtno1cpDOWWiZ9ZqHyvIERXqQi+tXEiBIoGZnyUjOxODrDMHBibhbpuxeSKfKPf0
 egPb2LI99ds7pQW4TUjdOmuf1Ep1CHxsmBwqz4dH0P5MSi97VjNEnfxq9v0Uz4WMZZthgegP5iC
 LQCsHJaHaeRfCztUT0Iky86wl59PbV54e4RX03XE7JOcbHzbRQp8HypQ/9x7c6Beni33aLgiJVh
 p0Je3TsopL+8XVA9cM9eetpRNfFRPqslRebQTeBl+FBr
X-Received: by 2002:a05:600c:3b0e:b0:435:d22:9c9e with SMTP id
 5b1f17b1804b1-438dc40d6ddmr47351615e9.19.1738227855924; 
 Thu, 30 Jan 2025 01:04:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErxR+X+ZsHYfUyUiO3iA+YhoKD6+7ESiku7byXtK+HAhaUtw0hyMSaH6IWrB8SPfQEi2COqQ==
X-Received: by 2002:a05:600c:3b0e:b0:435:d22:9c9e with SMTP id
 5b1f17b1804b1-438dc40d6ddmr47351145e9.19.1738227855551; 
 Thu, 30 Jan 2025 01:04:15 -0800 (PST)
Received: from ?IPV6:2a01:599:904:96e0:a245:aa9f:6c57:eb41?
 ([2a01:599:904:96e0:a245:aa9f:6c57:eb41])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc2c4ddsm51016365e9.17.2025.01.30.01.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 01:04:15 -0800 (PST)
Message-ID: <cf48fc0a-a80e-437f-a969-36b268d7e2ee@redhat.com>
Date: Thu, 30 Jan 2025 10:04:13 +0100
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <b3stuhf2s6236zawaa6zt6x3fg6oamrtj3pwajlyoxlaxdmdtf@arqxcoemsjfg>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cLO5FbAmXgMlls-Szs9Coq6kC8ADmpQfWKQZi8MngIU_1738227856
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

>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 17fbfa61f7ef..676df4fba5b0 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -2495,70 +2495,78 @@ static bool folio_make_device_exclusive(struct folio *folio,
>>   		.arg = &args,
>>   	};
>>   
>> -	/*
>> -	 * Restrict to anonymous folios for now to avoid potential writeback
>> -	 * issues.
>> -	 */
>> -	if (!folio_test_anon(folio) || folio_test_hugetlb(folio))
>> -		return false;
> 
> A bit of churn with the previous patch but I suppose it makes a stable backport
> of the previous patch easier.

Yes, that's the idea.

Thanks!

-- 
Cheers,

David / dhildenb

