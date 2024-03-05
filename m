Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A7F8724EA
	for <lists+nouveau@lfdr.de>; Tue,  5 Mar 2024 17:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798C410E1F2;
	Tue,  5 Mar 2024 16:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QiBmfGYA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF8A1121A4
 for <nouveau@lists.freedesktop.org>; Tue,  5 Mar 2024 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709657702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q2z9lZCL9Z3rimHOG8O2ywzmChw7nkWjJ7ypccwQP5g=;
 b=QiBmfGYA300RruTXxI5V0HZqmdpfU2JAb0Sq3DPsTa8gPS75jPfjHpxwMYTb0D7bHjdcBe
 tIN7mlEhrdJh+Nf7jF66o8yYRowWHCnr4JT62/SiJGSUFPHZmqvcHGxtDelesssNOo4GSu
 d+0rPI1cSYgyvoowxHmx+RD+TqJhB/g=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-4ZunNQUZPLe1grEERrsqPw-1; Tue, 05 Mar 2024 11:55:00 -0500
X-MC-Unique: 4ZunNQUZPLe1grEERrsqPw-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-78825e5e374so468114285a.0
 for <nouveau@lists.freedesktop.org>; Tue, 05 Mar 2024 08:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709657699; x=1710262499;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q2z9lZCL9Z3rimHOG8O2ywzmChw7nkWjJ7ypccwQP5g=;
 b=kieTPK80e7bi74gRFRVl/x/XYCfzp+n7xNBSjW5hfXCZwFHWcIG8pc8bZ1JiG0w71Q
 TAu5PJJsV0VGdxpvzPHvIbBED42IjKJptJ4EynhAjm2zkfc8O28cT0SR+EMjB2NQT/8m
 Z6xU4XXeVDSFxK3Y/GxFKqJKRAO4dFHtK65ZhKrLWPPtXEDuCR6GCYmI/frYywrCoVs/
 czom4O5JY+RVkEJTmhleD13HULxu1s2wpND/lM9YruTJOfMXElbHUJUGqydJq2H5K0XH
 LVTMmhq0wCrhwhk9cKMv2kyTL1WADKtFqW+MuG51EsSdrECEuSqlfZbvGv7wsf4AUhtu
 mdWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXC3XWUshnJ5RsUOskGKoaOC9l8zf8q9thtnTNCsVwoRQ35nHrljdaw0BvNa8TJwiNFYVL0fiJZ6Ufp9EZOEqv0Hg5lKf6AIvuw2FOfQ==
X-Gm-Message-State: AOJu0YyH9Gh/rjIgEyqzJdOIN/8pBfvDI1kPrVdvQPcaM8tAMnsiGMTD
 fdrA9p9KDDHMb0WpzaW8Sdbua+cqsVgEQLy1sY3JBKMpO/pTqQgZYbVgsN5HV2tzQzeA4Hwmn4k
 GEYA29c1yKE/Fl37lIGpozym1MFJoBECyuyzd9dDyYXWv/HjCX1UjX8YNatZwoRM=
X-Received: by 2002:a05:620a:1482:b0:788:322f:e8ab with SMTP id
 w2-20020a05620a148200b00788322fe8abmr3727312qkj.2.1709657699558; 
 Tue, 05 Mar 2024 08:54:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExv3MZheDgrjYzjAL3lBjTHXd+iKVpZeMtwriKBSS2qghKHcd7atNz/pH30IdbdmikOhTY+A==
X-Received: by 2002:a05:620a:1482:b0:788:322f:e8ab with SMTP id
 w2-20020a05620a148200b00788322fe8abmr3727284qkj.2.1709657699281; 
 Tue, 05 Mar 2024 08:54:59 -0800 (PST)
Received: from [10.32.64.131] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 p14-20020ae9f30e000000b0078825e2c57dsm2507620qkg.76.2024.03.05.08.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 08:54:58 -0800 (PST)
Message-ID: <93c832af-55df-4149-b9d1-1171528809c2@redhat.com>
Date: Tue, 5 Mar 2024 17:54:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nouveau/dmem: handle kcalloc() allocation failure
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, lyude@redhat.com, kherbst@redhat.com,
 timur@kernel.org, jani.nikula@linux.intel.com, nouveau@lists.freedesktop.org
References: <20240305143936.25283-1-duoming@zju.edu.cn>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240305143936.25283-1-duoming@zju.edu.cn>
X-Mimecast-Spam-Score: 0
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

Hi Duoming,

thanks for sending a V2.

On 3/5/24 15:39, Duoming Zhou wrote:
> The kcalloc() in nouveau_dmem_evict_chunk() will return null if
> the physical memory has run out. As a result, if we dereference
> src_pfns, dst_pfns or dma_addrs, the null pointer dereference bugs
> will happen.
> 
> Moreover, the GPU is going away. If the kcalloc() fails, we could not
> evict all pages mapping a chunk. So this patch adds a __GFP_NOFAIL
> flag in kcalloc().
> 
> Fixes: 249881232e14 ("nouveau/dmem: evict device private memory during release")
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
> Changes in v2:
>    - Allocate with __GFP_NOFAIL.
> 
>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 12feecf71e7..f5ae9724ee2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -378,9 +378,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
>   	dma_addr_t *dma_addrs;
>   	struct nouveau_fence *fence;
>   
> -	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL);
> -	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL);
> -	dma_addrs = kcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL);
> +	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
> +	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
> +	dma_addrs = kcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL | __GFP_NOFAIL);

I think we should also switch to kvcalloc(), AFAICS we don't need 
physically contiguous memory.

Sorry I did not mention that in V1 already.

- Danilo

>   
>   	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
>   			npages);

