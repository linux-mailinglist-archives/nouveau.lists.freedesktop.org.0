Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1EFA23C8B
	for <lists+nouveau@lfdr.de>; Fri, 31 Jan 2025 11:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CF110E1C2;
	Fri, 31 Jan 2025 10:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SsH01pe0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C628F10E1C2
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jan 2025 10:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738320969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Q3RpfUrdZBCMnrOyM0k8HuSUcAta7Y636lLqMrYrWx8=;
 b=SsH01pe0MxZrQQJDVXTOY7/itGqNZ24qhWI2Xt63e9OrFkxxjSGN6dIEJ7tXlZXWN3Pu10
 nNGngeCtGyxOlZSnfHLd8i6xSH6HX2kb27GsKQ22jWtk49R018NUeYU3A6bZB4WQ8J33QM
 xQKmiDC2BrCRD5bIA0X0m9czMScTDOg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-xefhATWFO6e-hMZbwQItYg-1; Fri, 31 Jan 2025 05:56:07 -0500
X-MC-Unique: xefhATWFO6e-hMZbwQItYg-1
X-Mimecast-MFC-AGG-ID: xefhATWFO6e-hMZbwQItYg
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3862e986d17so702320f8f.3
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jan 2025 02:56:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738320966; x=1738925766;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q3RpfUrdZBCMnrOyM0k8HuSUcAta7Y636lLqMrYrWx8=;
 b=fgUCHGqgIPAgCzfw79lmGpos48z9C9Z/Atci+x+i+UnCaZoofd7DGXuYuLeNdB/1ja
 TRn4FIIknpDjYOFL3Kbe2ajuQLBbvpreeKPbTQ/zCmIyhzFlkpJVi5maWFVAZ29WPqUy
 rClvsCuJJfZA0nEG1akvLWBGpkg6hKVNA8loBlJrjQXBzxvC9ncUv9vto6CB/PAIt5cB
 SE0UzJ6pbXtLpP7gcEvb787lHXGvQYu4BahWIuNOCNj4u1C8R+o0IWYMKZZzDnFvUHRn
 ykV0uyJyJ2r3MfTVB91fumfjp8EEk7rgQ5IhgBV10fO3iZmiBlbTw/7oMIup4VOMD55I
 890Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqG0ka2OIcYjrHhsqxfM6X55tiK8VQkSbZfgix/VnL/sCekQzyIcWW7lZM/89lyRXwmfM88uCV@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyADHwcDz58xcrfYv010uu+WeXKIKyo/eroN2T2TGuaVIOC0rMS
 4ZP0OqyeGkrpuqgK1LuUCpawTegL3AQbLmrtVoP7mvhcaPjaYmy7sAhA6ic9fPG/wxZnVfN0FoF
 I/+EMwi6tYho4o7cyrnBIUkc0clrBWUk9VcX5j6Lju24wr5FdMdebDousr0jak8c=
X-Gm-Gg: ASbGncs/lYY6A1bBISp4F5jUY5tqi3c2m7Uhbeelr6/hYIicjYLpkTjvYBaxyoSUWa0
 pWs8dqth3+e3VzNtyOKn1qmNdhTlxz2Yek53kDX0X5hhehjoA8/9BKCUyhaFL5IDTrcMhFCRNL7
 W9vZRdAWCmAdBmCndZ298t7C1AXn4nGhsLDCYT3ZsHbECIXGSOXQdO08NYKZPmYC3F3PPrUfRoV
 SCGhtMo4ggChiJ5mPqeb19wq188y6Jyp791Uko/BpuwVieTWVnJx0LRiQrd54xeVz+g3DckbyET
 +2uyW8o9CSPFK9wVTu65QqHPj4pG9CP+DNBNcczXrCXv1hY4x4e8ZgWaJywcmvtJDCCRe+XZSB0
 MHZkMOlHzdH+GKm+mhIJ7bl8HtZcZu2g9
X-Received: by 2002:a05:6000:1a8b:b0:385:f47b:1501 with SMTP id
 ffacd0b85a97d-38c5195fd82mr8250983f8f.32.1738320965943; 
 Fri, 31 Jan 2025 02:56:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+I+ynCeZEHXX+6WrhMhXHSL94RRp5D9nLI6LDBxYzej6H/Ex/I2OwQyT0gbWRqDVNDvdr0w==
X-Received: by 2002:a05:6000:1a8b:b0:385:f47b:1501 with SMTP id
 ffacd0b85a97d-38c5195fd82mr8250948f8f.32.1738320965490; 
 Fri, 31 Jan 2025 02:56:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:1c00:b8d4:bc62:e7ed:ec0e?
 (p200300cbc70a1c00b8d4bc62e7edec0e.dip0.t-ipconnect.de.
 [2003:cb:c70a:1c00:b8d4:bc62:e7ed:ec0e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c102fcasm4451251f8f.38.2025.01.31.02.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2025 02:55:58 -0800 (PST)
Message-ID: <d552cc03-b7af-44be-bcaf-13da720a2226@redhat.com>
Date: Fri, 31 Jan 2025 11:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/12] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
To: Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-6-david@redhat.com>
 <Z5tLmYOQaZrdWQHN@phenom.ffwll.local>
 <2670f65f-e973-483e-aed6-526d00125ad7@redhat.com>
 <Z5t4rrkRiOsRY2jH@phenom.ffwll.local>
 <z7s7xb2ftv5hqg3uzjqkou6enguleazwwehxbi5zulbkar2aej@zlbdh2kdewdn>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <z7s7xb2ftv5hqg3uzjqkou6enguleazwwehxbi5zulbkar2aej@zlbdh2kdewdn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NQXq4beZjZtW9SgGcDYcK-MUZqra3dem5darV56I6wc_1738320966
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

On 31.01.25 00:06, Alistair Popple wrote:
> On Thu, Jan 30, 2025 at 02:03:42PM +0100, Simona Vetter wrote:
>> On Thu, Jan 30, 2025 at 10:58:51AM +0100, David Hildenbrand wrote:
>>> On 30.01.25 10:51, Simona Vetter wrote:
>>>> On Wed, Jan 29, 2025 at 12:54:03PM +0100, David Hildenbrand wrote:
>>>>> Let's do it just like mprotect write-upgrade or during NUMA-hinting
>>>>> faults on PROT_NONE PTEs: detect if the PTE can be writable by using
>>>>> can_change_pte_writable().
>>>>>
>>>>> Set the PTE only dirty if the folio is dirty: we might not
>>>>> necessarily have a write access, and setting the PTE writable doesn't
>>>>> require setting the PTE dirty.
>>>>
>>>> Not sure whether there's much difference in practice, since a device
>>>> exclusive access means a write, so the folio better be dirty (unless we
>>>> aborted halfway through). But then I couldn't find the code in nouveau to
>>>> do that, so now I'm confused.
>>>
>>> That confused me as well. Requiring the PTE to be writable does not imply
>>> that it is dirty.
>>>
>>> So something must either set the PTE or the folio dirty.
>>
>> Yeah I'm not finding that something.
>>
>>> ( In practice, most anonymous folios are dirty most of the time ... )
>>
>> And yup that's why I think it hasn't blown up yet.
>>
>>> If we assume that "device-exclusive entries" are always dirty, then it
>>> doesn't make sense to set the folio dirty when creating device-exclusive
>>> entries. We'd always have to set the PTE dirty when restoring the exclusive
>>> pte.
>>
>> I do agree with your change, I think it's correct to put this
>> responsibility onto drivers. It's just that nouveau seems to not be
>> entirely correct.
> 
> Yeah, agree it should be a driver responsibility but also can't see how nouveau
> is correct there either. I might see if I can get it to blow up...

(in context of the rmap walkers) The question is, how do we consider 
device-exclusive entries:

(1) dirty? Not from a CPU perspective.
(2) referenced? Not from a CPU perspective.

If the answer is always "no" to all questions, then memory notifiers 
must handle it, because we'd be answering the question from the CPU 
point of view.

If the answer is always "yes", there is a problem: we can only make it 
clean/young by converting it to an ordinary PTE first (requiring MMU 
notifiers etc.), which makes it quite nasty.

Mixed answers are not possible, because we don't know just from staring 
at the entry.

-- 
Cheers,

David / dhildenb

