Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9546F6BEB
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041D210E46C;
	Thu,  4 May 2023 12:33:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61C410E17E
 for <nouveau@lists.freedesktop.org>; Mon,  3 Apr 2023 12:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680523357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GDB/hmJOcrYFtJnN1TBanTBM2RE49CIj8eveC48zPtU=;
 b=IWxkp/Ucy8xVRHY29w6pFdNFAL0UKAn+fpZuP6Fjk5a85wNSzFx/uVjjp8UqeJQAS/aWs+
 VY+wP5ZcB2b1t0ODls33mNCBqpIGZJiJJlrdFdP10MLyYXqpNw66wD705rqc4zib1rtRUL
 oVCpRpujiW2bUbwLiI8biBxVPEQqfRw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-f4NDYjtwPB6185C4_zaPvw-1; Mon, 03 Apr 2023 08:02:36 -0400
X-MC-Unique: f4NDYjtwPB6185C4_zaPvw-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg33-20020a05600c3ca100b003ef6d684105so11777601wmb.1
 for <nouveau@lists.freedesktop.org>; Mon, 03 Apr 2023 05:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680523355;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GDB/hmJOcrYFtJnN1TBanTBM2RE49CIj8eveC48zPtU=;
 b=bEeuYI+NBHiTigStx32DcqYMdzUVEVykyC+zmyud+ohw5H5NnhcmO89lbFteKZEcb/
 y/v9OpmrP43bvNgsr57dBq+4j0SrGRWM5lnO//85xE5FJ7xcpDAEZkO1cYBDIRuE+ffp
 wCG6pI2IfJzdexmti3BDDcsbm0uJU5QyWOIacFtdPmFmRnewHbWk/mx0hxvVXPNJYh6D
 teVihokgSNOPLcmyoL0BsxOCL1Na4Ay37Jnl+hDR2P9p8tncbo5ixOoKkIhD7+B5QTd2
 XS5sJs2pq8HZaZVs5/EAkHaQFurkUSZbEQyc36qRQphns99ffLidXzoLMAAlFh4k5oNa
 1KjA==
X-Gm-Message-State: AAQBX9c6Uj6tKrJcQ/J44rka1fNjuZAr5LdSopfXP2y9OEM2uwfWgVSu
 nW3c/8qanB9/CsKCWpM2tWsePt4nhmQ4rbFZy1QLHAxWObwIkxYXQQ+VNT11zUZMcQNmUmP+kRJ
 Rfuq4mQx+xzLuTZO2jWT88AB51Q==
X-Received: by 2002:a7b:ce88:0:b0:3f0:3a5a:362e with SMTP id
 q8-20020a7bce88000000b003f03a5a362emr10037681wmj.39.1680523355008; 
 Mon, 03 Apr 2023 05:02:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350bK74W1j6j/etoodmlgMY4hwEOB599KYyw+0fEjbGAAaXiONOHFfop9MJUYTe3lHtONcsh5ug==
X-Received: by 2002:a7b:ce88:0:b0:3f0:3a5a:362e with SMTP id
 q8-20020a7bce88000000b003f03a5a362emr10037657wmj.39.1680523354652; 
 Mon, 03 Apr 2023 05:02:34 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:5e00:8e78:71f3:6243:77f0?
 (p200300cbc7025e008e7871f3624377f0.dip0.t-ipconnect.de.
 [2003:cb:c702:5e00:8e78:71f3:6243:77f0])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c468d00b003ef7058ea02sm19072053wmo.29.2023.04.03.05.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 05:02:33 -0700 (PDT)
Message-ID: <aab81ed0-9c1e-a10d-63a5-5172c3f91d38@redhat.com>
Date: Mon, 3 Apr 2023 14:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20230330012519.804116-1-apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230330012519.804116-1-apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:38 +0000
Subject: Re: [Nouveau] [PATCH v2] mm: Take a page reference when removing
 device exclusive entries
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, stable@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 30.03.23 03:25, Alistair Popple wrote:
> Device exclusive page table entries are used to prevent CPU access to
> a page whilst it is being accessed from a device. Typically this is
> used to implement atomic operations when the underlying bus does not
> support atomic access. When a CPU thread encounters a device exclusive
> entry it locks the page and restores the original entry after calling
> mmu notifiers to signal drivers that exclusive access is no longer
> available.
> 
> The device exclusive entry holds a reference to the page making it
> safe to access the struct page whilst the entry is present. However
> the fault handling code does not hold the PTL when taking the page
> lock. This means if there are multiple threads faulting concurrently
> on the device exclusive entry one will remove the entry whilst others
> will wait on the page lock without holding a reference.
> 
> This can lead to threads locking or waiting on a folio with a zero
> refcount. Whilst mmap_lock prevents the pages getting freed via
> munmap() they may still be freed by a migration. This leads to
> warnings such as PAGE_FLAGS_CHECK_AT_FREE due to the page being locked
> when the refcount drops to zero.
> 
> Fix this by trying to take a reference on the folio before locking
> it. The code already checks the PTE under the PTL and aborts if the
> entry is no longer there. It is also possible the folio has been
> unmapped, freed and re-allocated allowing a reference to be taken on
> an unrelated folio. This case is also detected by the PTE check and
> the folio is unlocked without further changes.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
> Cc: stable@vger.kernel.org

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

