Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56804A230FF
	for <lists+nouveau@lfdr.de>; Thu, 30 Jan 2025 16:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D76D10E35A;
	Thu, 30 Jan 2025 15:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YV/MpvKE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFCD10E35A
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 15:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738250979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mJob7iA5v8Inaje40a8inm2DkJcU/L91MMzxsi/pDHA=;
 b=YV/MpvKEJrxPknBZ79SZrLEXHqs5tBgqpefN2uO7QbsyEXEETDOU4xj0WUMU4KqZqQC53u
 EL+LiM3SD/wHGe1fCUIi2zabXjM70Kv8OEIoWiNTXHc5orEBWeLB4fB/G2B0ymsRuQCnPf
 a1TfaQKg7Hqz7atI/aDDIhwbplW7ayw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-f-8xBLNlOWWeYip28xLEqA-1; Thu, 30 Jan 2025 10:29:37 -0500
X-MC-Unique: f-8xBLNlOWWeYip28xLEqA-1
X-Mimecast-MFC-AGG-ID: f-8xBLNlOWWeYip28xLEqA
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38c24ac3706so623628f8f.0
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 07:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738250976; x=1738855776;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJob7iA5v8Inaje40a8inm2DkJcU/L91MMzxsi/pDHA=;
 b=Uyv0JMhmDlIV0ec498bTtQ1+rDPvQ2JLUQAv9F3c9itZ0v50OTKh0HyNZpY6YCB38i
 3PO9AhZ9p8cPlzpvxQKQd2/pubON7V/DmY1WDxDwTt4R7aGKX4Ca7tdBdpc+aUBaH3fX
 hWLgse/wXuacYa334xmzqHxnp6USozQC07BZVAnsZSFDAImjke5MDSqqhHJVxfZjLYr8
 D16PLEF/idj3HCzpbYuwVAvnFlZ8gMi/WYWGFdxh+F7AWbBsNxVV0PXfsYWDTaG7B7WD
 h1cjqvbwJywO18P2umf9dxTGsDKa3zwO1eXJxbuonPsmWbUTCLL6a43Qnh+jIVWsF9NI
 sZzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFwyEq3adUe4VZNc+AH4dPrJrthphMif9FKdehAiD/0sGjoh5CZyT38zJov5n65JLtoi8McmzT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzLrsohGblppNTm34zywjfIihGkGHw0pVBQILJthiX4T3uWo2E
 XMsZqcK5fp6LE/nW2Ovj68i844TTz1xA8wzPKRyqyxVBbvxsnIlBuhBFRAAWCNdu6Iv0HDn6sQ3
 dNfXeXoyMGMTpa/eEQxxF2MetgJGwWsmJ2C78hUd3WwPY3YmEgddtoYY3OH4F2DM=
X-Gm-Gg: ASbGncvz4RHBT7yZP9zs62Wck/5q5BAK/5/hf6B9X2W7zyrwdJKMO6O5DlcJsUZsxWa
 FgFZIPH+RLLZOI7GDwvEt4bMOwVGklydhgLcsttABP1Q3NgUe+0JSeSPiArNCIGoRdSvWtDAgo/
 +9Awo4fOnrSF93xnfGFj3F/4XSsGAEX31fiXgUeKSuwiljL+A97hdvf7MwOjcH9RfWOHcSA/UTu
 zxMBrgZJtPp0Urr6+uQLkEP8LMqfw9Te8quKTaD3e2+fgvzppx3C/B3l2BsKQmzX02BFlWXw6ez
 6T0Z4v8uDjUVQwwEm2Ir36h2nAuNXfZaNNZvJTOi/toqDeZmFD2i5Bh1Paz/+rYhWpMa9OcEs0D
 MprBojRuwBuQgoXTpZzSFCOHERg3jxxxa
X-Received: by 2002:a05:6000:1843:b0:38c:5d42:152b with SMTP id
 ffacd0b85a97d-38c5d421959mr2072511f8f.54.1738250976495; 
 Thu, 30 Jan 2025 07:29:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPN3coJdC7RmNnCsXNZRQOca969MNFF3pL2YAHjveUq+bLyj1uSaXw1q3EysfNf9vDrtH5PQ==
X-Received: by 2002:a05:6000:1843:b0:38c:5d42:152b with SMTP id
 ffacd0b85a97d-38c5d421959mr2072489f8f.54.1738250976106; 
 Thu, 30 Jan 2025 07:29:36 -0800 (PST)
Received: from ?IPV6:2003:cb:c713:3b00:16ce:8f1c:dd50:90fb?
 (p200300cbc7133b0016ce8f1cdd5090fb.dip0.t-ipconnect.de.
 [2003:cb:c713:3b00:16ce:8f1c:dd50:90fb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c125f0fsm2321311f8f.57.2025.01.30.07.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 07:29:34 -0800 (PST)
Message-ID: <d27c35d5-918f-4550-9975-eb7ba59ac9be@redhat.com>
Date: Thu, 30 Jan 2025 16:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] mm/memory: document restore_exclusive_pte()
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
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-5-david@redhat.com>
 <7vejbjs7btkof4iguvn3nqvozxqpnzbymxbumd7pant4zi4ac4@3ozuzfzsm5tp>
 <cfc4f8ac-80c4-472f-85fc-36ffcd212441@redhat.com>
 <Z5t_RebEx6Mj-KlT@phenom.ffwll.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z5t_RebEx6Mj-KlT@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ThfXYdL7IH6OYlEhtV538cw6I7fdfwLqzMCpGdVZry4_1738250976
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

On 30.01.25 14:31, Simona Vetter wrote:
> On Thu, Jan 30, 2025 at 10:37:06AM +0100, David Hildenbrand wrote:
>> On 30.01.25 01:27, Alistair Popple wrote:
>>> On Wed, Jan 29, 2025 at 12:58:02PM +0100, David Hildenbrand wrote:
>>>> Let's document how this function is to be used, and why the requirement
>>>> for the folio lock might maybe be dropped in the future.
>>>
>>> Sorry, only just catching up on your other thread. The folio lock was to ensure
>>> the GPU got a chance to make forward progress by mapping the page. Without it
>>> the CPU could immediately invalidate the entry before the GPU had a chance to
>>> retry the fault.
>>>> Obviously performance wise having such thrashing is terrible, so should
>>> really be avoided by userspace, but the lock at least allowed such programs
>>> to complete.
>>
>> Thanks for the clarification. So it's relevant that the MMU notifier in
>> remove_device_exclusive_entry() is sent after taking the folio lock.
>>
>> However, as soon as we drop the folio lock, remove_device_exclusive_entry()
>> will become active, lock the folio and trigger the MMU notifier.
>>
>> So the time it is actually mapped into the device is rather

I meant to say "rather short." :)

> 
> Looks like you cut off a bit here (or mail transport did that somewhere),
> but see my other reply I don't think this is a legit use-case. So we don't
> have to worry.

In that case, we would need the folio lock in the future.

> Well beyond documenting that if userspace concurrently thrashes
> the same page with both device atomics and cpu access it will stall real
> bad.

I'm curious, is locking between device-cpu or device-device something 
that can happen frequently? In that case, you would get that trashing 
naturally?

-- 
Cheers,

David / dhildenb

