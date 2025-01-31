Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EFBA23CB9
	for <lists+nouveau@lfdr.de>; Fri, 31 Jan 2025 12:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E70710EA73;
	Fri, 31 Jan 2025 11:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UjiXCco3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B7510EA73
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jan 2025 11:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738321609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ptBTE/j9Ief471JDveY+5Ixgr7ekpcVIWvNqXG+KHaU=;
 b=UjiXCco3lIkYZMANt/kP86DxjvjaSfPJit+43bJAzyCszruV3eFoHWhC0KuC9GoirhWhTn
 wcN31bxL4gzx0XIy7cX+8awYRJebKuwwwGsD8hOYqKXBElYiPhMUJ2BqQb+4rwwDJLZUwo
 MKSVd15aUVIV4eUHRnNjB5oDghM0R3I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-VsMET9F0MPGoyn1E147cvA-1; Fri, 31 Jan 2025 06:06:47 -0500
X-MC-Unique: VsMET9F0MPGoyn1E147cvA-1
X-Mimecast-MFC-AGG-ID: VsMET9F0MPGoyn1E147cvA
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4388eee7073so13218965e9.0
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jan 2025 03:06:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738321606; x=1738926406;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ptBTE/j9Ief471JDveY+5Ixgr7ekpcVIWvNqXG+KHaU=;
 b=bdBynm7wuvjarTfzQrZEkgpEPdKPP62nuVbznq/k0yzqiYOkoasH/9fdFoxOMIghlU
 eKdR2adclj8Ly52PJpxv1O4zX9El2umkrv0VyzYbnI3pjMXQ4hB0Qtsa4RIfe5bLgGIQ
 eiWTPTWpnWo+fxPRUpMaAMANqAzU/K04OGERxxc+90/LXcDAxL0nZC4T9vZunKOEiSey
 CvaFHrLPvCqJKSN9u5+T9fsfbVAe0PfliebrGuNh9OJWQOUwh4XHK2qsVT6Rdc9SGJ3S
 NtMfBEi+MehNhv3INN9csNi2hVRaTt0i2UmcszpDqNt88b9zAIPdRp7/7ri/InnrBwGR
 EaVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtiJ5Yj1N/FfwCHrOw1KH05f/H9B5UUDIyKTUYjQKVNdAP30XQtsEAoI0z67SmLsuCbnt/Ero/@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/HgaGo8MIVEMr52Lxi/zgTaKUa/yJjRy/UgI7VXs58pjW6NVC
 IiHvnAlhK408CGPcuN5xb7fTLFPPOwekbfEE2Z/xcbulaEjOesQMhOtj0i5lQ5Rdtp2YOw6xHrE
 jP7kQhecrNMqZIb8MkqeZEAkVuV3gHjUqNKOc5E3hT4UB9Vo6oSIMSLvb/AMYOZU=
X-Gm-Gg: ASbGncvk7sUCOOutUOPvGhUBwC6W0i1OW5ODHGIBQyLnb6Xb+NmXrgOexpFJdUUZdUH
 R4QqZ+nZgy7gk2r7kg3H93ZnlD03tocfOjmvrGYob6Uu5rTOwnxtxaTi8xMkUUOtgKLU4vWjItH
 +OvwkKMRvS/FR6mohlTyaOVeqIK9hzxoMys2VaRWE1Ok3JSKhw6M7U3Hobrg+dKbyjsultG9e+h
 Glvot7dhB/VCg+2GQGhK70Ur6um5UaQElR1mAZBmhP50q8GlZmdvp8phryZM6JUqsgMDSFuWKRi
 Xr5SeB05Sj4zNck1DRHBbe0euR0t5373u69t5n3//3yMFn744NEsD0ItkAhh1q/htCh5387B2zT
 RBLgzh7/OMSDZkDwfTSeKlJIT2HHDsgbc
X-Received: by 2002:a05:600c:1c9b:b0:434:fc5d:179c with SMTP id
 5b1f17b1804b1-438e1705f38mr61309825e9.13.1738321606659; 
 Fri, 31 Jan 2025 03:06:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvI25JKGadHoBsKNpaNligj01qj4xJdVU/Z3aCpJkv3iDtFRRerBqry12mhnck6BMQkG+OlA==
X-Received: by 2002:a05:600c:1c9b:b0:434:fc5d:179c with SMTP id
 5b1f17b1804b1-438e1705f38mr61309445e9.13.1738321606312; 
 Fri, 31 Jan 2025 03:06:46 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:1c00:b8d4:bc62:e7ed:ec0e?
 (p200300cbc70a1c00b8d4bc62e7edec0e.dip0.t-ipconnect.de.
 [2003:cb:c70a:1c00:b8d4:bc62:e7ed:ec0e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438d7b5eaecsm59983415e9.3.2025.01.31.03.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2025 03:06:44 -0800 (PST)
Message-ID: <cab05891-cfce-4d64-a05f-b90038d5ee9f@redhat.com>
Date: Fri, 31 Jan 2025 12:06:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/12] mm/page_vma_mapped: device-private entries are
 not migration entries
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
 <20250129115411.2077152-8-david@redhat.com>
 <baraw2czilsofpedok3jtxxshfaxjrmef6u42pitibtcst6mel@scoukpiwnvvc>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <baraw2czilsofpedok3jtxxshfaxjrmef6u42pitibtcst6mel@scoukpiwnvvc>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BkWuW4ISNWd3dAUTDKNQQkjByjMDqTeAwvmpTroov8M_1738321607
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

On 31.01.25 00:36, Alistair Popple wrote:
> On Wed, Jan 29, 2025 at 12:54:05PM +0100, David Hildenbrand wrote:
>> It's unclear why they would be considered migration entries; they are
>> not.
> 
> Yeah, I agree that doesn't seem right. I suspect I was initially modelling
> device exclusive entries similar to migration entries but obviously went too
> far. So thanks for fixing:
> 
> Reviewed-by: Alistair Popple <apopple@nvidia.com>

Thanks ... fixing all the wrong use of "device-private" in the 
subject+description ... not sure what my mind was doing there.

It's all about "device-exclusive" of course.

-- 
Cheers,

David / dhildenb

