Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B2EAFCDD8
	for <lists+nouveau@lfdr.de>; Tue,  8 Jul 2025 16:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D2B10E66F;
	Tue,  8 Jul 2025 14:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HP/A8IQ7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B367010E675
 for <nouveau@lists.freedesktop.org>; Tue,  8 Jul 2025 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751985492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EoQP04KByMD1Sm77x5AnudeBRGOmO431zL0RQv2jrp4=;
 b=HP/A8IQ7zGfspwd07oyLHyDJq9WgHe2cRTOopKY/009CqLm4MOU51FQH/DuqgQ+mdUGPMz
 HuOmtGTagtJmHQyI7eOfWY98silI1hA2HLMZYW8GLFGR/OsOrWnk28d2vePFLUCQxf5hUW
 uHJYepIWUfuXwHU5nFsYL+qKCL7opf4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-gF0pOEkgNaGJ_aEu0QpcRA-1; Tue, 08 Jul 2025 10:38:11 -0400
X-MC-Unique: gF0pOEkgNaGJ_aEu0QpcRA-1
X-Mimecast-MFC-AGG-ID: gF0pOEkgNaGJ_aEu0QpcRA_1751985490
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-451d2037f1eso25987605e9.0
 for <nouveau@lists.freedesktop.org>; Tue, 08 Jul 2025 07:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751985490; x=1752590290;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EoQP04KByMD1Sm77x5AnudeBRGOmO431zL0RQv2jrp4=;
 b=FJne6KCVZDM51XVzC2rRcatv6IJB6mcfpsRSJ4VTiUDeCD0wafNvJFLStY37xCj5rC
 ZKboWa+H9diuNWuIfeYIGY+zyEfPiFoYFpfI4mNBW3qGfBi39c1Tly4bq+UQQManJW2I
 I2LdCupLshZ8ly8maZUnIq+Sf7FACN3pREJsrcef0lk9NtTP1k2jYVBpGz76AwuDX63m
 Wd0ijh2I9AAFpSSQiObYcWOXLorcLFRcGInmNwZwORGvxN+d+1kcK4b8DSI8AMBQFrB9
 k5dddGCAB984ycfBhUkK7YdjN3P7e6ZWWXYHdXGpIRdOqkKFqWSbTGmUfexUl+YkImxq
 vjmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXn8LKWUhmMbvEYC4EdIWq3DZxhQ3Rnb75rnL2uhuGVGzOpRZFbmN0SagpBq/uGGSsojsNvgB1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzeIv2yu/zDZJc0GPTSgpVnM74fP55LIPeUqZTHrLUGLiD+1Eo
 0XlsgyJoAi0ciDlivBlTKy1C9LecFe/UreXP3CA6du94W0ob7flcCEKjN+pQvydLB1Uq6BC08EN
 nK7UoledVlRAke5C5LwRVKrkvwbVsayZevhtjsj/j43um13A0u0qFWVsgS5DE0yHUATg=
X-Gm-Gg: ASbGncsPxiq7AVOrSlQkojQtevyTK+KjXghsfAwv1tb+afz7yleyVzoZL/anftkVzVd
 d9ZcswX9lPvoe+ImB94VlUSYSzfyk2bkuVsj+qD5ayFKjq6GaQmd2lqToReJBvG5+U2l+YiAsKD
 NBOx6hLnl+Ls+hKsIoz83kd/9Z4IsKpr4JA9ys3lWxumb6w24dSu1UMbFgeLskxvZ2Gd/ukIdZ/
 iXheomdyG5G9XTLtPbXMrNmnKZZzdIaTjgVO3xoln5T0bogV9P3ERs0dRUzVOhdElSDBWGtpiCa
 IfRI1gyuewerGJU1rIahCwjvDj/zTw5ax0wDeozcLvbX3ECoWzG3XvurxvWsbAQ5GzZD5quUbtg
 lxVRIAdc+wREvUgyJz2ZbLrtFjJnj3iVfCLaeXwwAE5F1jAcd2A==
X-Received: by 2002:a05:600c:1549:b0:43d:17f1:2640 with SMTP id
 5b1f17b1804b1-454bc49ecbamr119364215e9.26.1751985490016; 
 Tue, 08 Jul 2025 07:38:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJMfWU4WGPVjUWRaLhwNMDAFfUqrlpllAhTnFfHigjAx7GDb43eQYHXrqfR9dAJOxfGUqqYQ==
X-Received: by 2002:a05:600c:1549:b0:43d:17f1:2640 with SMTP id
 5b1f17b1804b1-454bc49ecbamr119363605e9.26.1751985489485; 
 Tue, 08 Jul 2025 07:38:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:f500:4346:f17c:2bde:808c?
 (p200300d82f1af5004346f17c2bde808c.dip0.t-ipconnect.de.
 [2003:d8:2f1a:f500:4346:f17c:2bde:808c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd3d2661sm24623995e9.19.2025.07.08.07.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 07:38:09 -0700 (PDT)
Message-ID: <fd22621c-ad89-4ae2-bdee-b0ec6a828059@redhat.com>
Date: Tue, 8 Jul 2025 16:38:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 08/11] mm/thp: add split during migration support
To: Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <20250306044239.3874247-9-balbirs@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250306044239.3874247-9-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ts-jZloiVkx3_S6rqPVyNt1cRs-tVcgm8Y0er21WEY0_1751985490
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

On 06.03.25 05:42, Balbir Singh wrote:
> Support splitting pages during THP zone device migration as needed.
> The common case that arises is that after setup, during migrate
> the destination might not be able to allocate MIGRATE_PFN_COMPOUND
> pages.
> 
> Add a new routine migrate_vma_split_pages() to support the splitting
> of already isolated pages. The pages being migrated are already unmapped
> and marked for migration during setup (via unmap). folio_split() and
> __split_unmapped_folio() take additional isolated arguments, to avoid
> unmapping and remaping these pages and unlocking/putting the folio.
> 
> Since unmap/remap is avoided in these code paths, an extra reference
> count is added to the split folio pages, which will be dropped in
> the finalize phase.
> 
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---

[...]

>   	remap_page(origin_folio, 1 << order,
>   			folio_test_anon(origin_folio) ?
>   				RMP_USE_SHARED_ZEROPAGE : 0);
> @@ -3808,6 +3823,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>    * @lock_at: a page within @folio to be left locked to caller
>    * @list: after-split folios will be put on it if non NULL
>    * @uniform_split: perform uniform split or not (non-uniform split)
> + * @isolated: The pages are already unmapped

Isolated -> unmapped? Huh?

Can we just detect that state from the folio so we don't have to pass 
random boolean variables around?

For example, folio_mapped() can tell you if the folio is currently mapped.

-- 
Cheers,

David / dhildenb

