Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5135EB319
	for <lists+nouveau@lfdr.de>; Mon, 26 Sep 2022 23:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E7D10E526;
	Mon, 26 Sep 2022 21:30:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A5510E7B3
 for <nouveau@lists.freedesktop.org>; Mon, 26 Sep 2022 21:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664227803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WoZ9fgngRao8IT+B8E9l7WqjGAnK52AtXGsAOFoOmwE=;
 b=gqPkCoAQEXqORUk3o6im4JzSArv6xL3j/IDtTmL469ivnDe5yMrRCk9Xr53ETfsGaUYo6m
 tQb7OKQjmCMxAOJvxQRYcBq8iHB37974sy+5Cmi0kIMi3KvoZRYOL22cxpdWpY7tOSg7d6
 nHV4I6mtZTWDKCjOkpdVbhKordrh4qs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-400-bDCkVeAeOFqQf7U__453aw-1; Mon, 26 Sep 2022 17:30:00 -0400
X-MC-Unique: bDCkVeAeOFqQf7U__453aw-1
Received: by mail-qk1-f200.google.com with SMTP id
 bl17-20020a05620a1a9100b006cdf19243acso5905808qkb.4
 for <nouveau@lists.freedesktop.org>; Mon, 26 Sep 2022 14:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=WoZ9fgngRao8IT+B8E9l7WqjGAnK52AtXGsAOFoOmwE=;
 b=Ro812tHDPyHa8hzx6+5OOb7rS4SgxPD/0a2bgCUZOdJcwTpNNUyoqy6qKMk2rFlR7u
 F8YN+iiepGcO/uEvhdElAfipW2ems7M/o1SsJaD1UUwr5xX1hZYAD/v+Vth9sQXuhEh5
 xdp5sgDD100ULSqn+rixCmH7xwVyZIt5C1nTg696H21m514LOlBwJ8B3pW/G0JF/QZtJ
 3Ab4GwJTR28uv7HyS8t/kEd2UyVo9+Db6th8dlbslTrgRtBDfkHQT3vmEBVW4+0k3eWa
 W9YzoNo4A0YsJ6HWskHDnJfzzM4P07S6yCpO2MQWaYPeZZMj+Eb+yD4Uxkt4XqUzgAPh
 MVSg==
X-Gm-Message-State: ACrzQf3iCAaK/0ez8st1+2gPYNcrrd3Wd/LLMnVxYfgzp1gl0ltuBxPf
 jt0hP38JyvJol7Ratt+dzCt+z9W7QcDNeFZg/FnV0B7ZjVq0lVrojpbB9SinPLzRrQ5km/JsZDX
 pCjg0pPSZ4JkpS8joJR/h1y1XVA==
X-Received: by 2002:a05:620a:2987:b0:6ce:c029:5f03 with SMTP id
 r7-20020a05620a298700b006cec0295f03mr15801511qkp.157.1664227799870; 
 Mon, 26 Sep 2022 14:29:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ooMLHPNGYGRP1IOKqLF5TpXz9XfH1OcMI3VMSbPod5U0TpcrkzXrJ+Bq2BgRX5qr4d9CtNA==
X-Received: by 2002:a05:620a:2987:b0:6ce:c029:5f03 with SMTP id
 r7-20020a05620a298700b006cec0295f03mr15801473qkp.157.1664227799582; 
 Mon, 26 Sep 2022 14:29:59 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00:e786:1aff:4f5c:c549?
 ([2600:4040:5c48:e00:e786:1aff:4f5c:c549])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a05620a25ce00b006cfa7b944fdsm1686678qko.16.2022.09.26.14.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 14:29:57 -0700 (PDT)
Message-ID: <d839ead12d782a184ca104d6b5f62184c0f178dd.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org, Andrew Morton
 <akpm@linux-foundation.org>
Date: Mon, 26 Sep 2022 17:29:55 -0400
In-Reply-To: <ea208905d853a0fdc277c2b5e74742593e53f767.1664171943.git-series.apopple@nvidia.com>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <ea208905d853a0fdc277c2b5e74742593e53f767.1664171943.git-series.apopple@nvidia.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH 5/7] nouveau/dmem: Refactor
 nouveau_dmem_fault_copy_one()
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
Cc: Alex Sierra <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Michael Ellerman <mpe@ellerman.id.au>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, amd-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, 2022-09-26 at 16:03 +1000, Alistair Popple wrote:
> nouveau_dmem_fault_copy_one() is used during handling of CPU faults via
> the migrate_to_ram() callback and is used to copy data from GPU to CPU
> memory. It is currently specific to fault handling, however a future
> patch implementing eviction of data during teardown needs similar
> functionality.
> 
> Refactor out the core functionality so that it is not specific to fault
> handling.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 59 +++++++++++++--------------
>  1 file changed, 29 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index f9234ed..66ebbd4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -139,44 +139,25 @@ static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
>  	}
>  }
>  
> -static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
> -		struct vm_fault *vmf, struct migrate_vma *args,
> -		dma_addr_t *dma_addr)
> +static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
> +				struct page *dpage, dma_addr_t *dma_addr)
>  {
>  	struct device *dev = drm->dev->dev;
> -	struct page *dpage, *spage;
> -	struct nouveau_svmm *svmm;
> -
> -	spage = migrate_pfn_to_page(args->src[0]);
> -	if (!spage || !(args->src[0] & MIGRATE_PFN_MIGRATE))
> -		return 0;
>  
> -	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
> -	if (!dpage)
> -		return VM_FAULT_SIGBUS;
>  	lock_page(dpage);
>  
>  	*dma_addr = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
>  	if (dma_mapping_error(dev, *dma_addr))
> -		goto error_free_page;
> +		return -EIO;
>  
> -	svmm = spage->zone_device_data;
> -	mutex_lock(&svmm->mutex);
> -	nouveau_svmm_invalidate(svmm, args->start, args->end);
>  	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_HOST, *dma_addr,
> -			NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage)))
> -		goto error_dma_unmap;
> -	mutex_unlock(&svmm->mutex);
> +					 NOUVEAU_APER_VRAM,
> +					 nouveau_dmem_page_addr(spage))) {
> +		dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
> +		return -EIO;
> +	}

Feel free to just align this with the starting (, as long as it doesn't go
above 100 characters it doesn't really matter imho and would look nicer that
way.

Otherwise:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will look at the other patch in a moment

>  
> -	args->dst[0] = migrate_pfn(page_to_pfn(dpage));
>  	return 0;
> -
> -error_dma_unmap:
> -	mutex_unlock(&svmm->mutex);
> -	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
> -error_free_page:
> -	__free_page(dpage);
> -	return VM_FAULT_SIGBUS;
>  }
>  
>  static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
> @@ -184,9 +165,11 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>  	struct nouveau_drm *drm = page_to_drm(vmf->page);
>  	struct nouveau_dmem *dmem = drm->dmem;
>  	struct nouveau_fence *fence;
> +	struct nouveau_svmm *svmm;
> +	struct page *spage, *dpage;
>  	unsigned long src = 0, dst = 0;
>  	dma_addr_t dma_addr = 0;
> -	vm_fault_t ret;
> +	vm_fault_t ret = 0;
>  	struct migrate_vma args = {
>  		.vma		= vmf->vma,
>  		.start		= vmf->address,
> @@ -207,9 +190,25 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>  	if (!args.cpages)
>  		return 0;
>  
> -	ret = nouveau_dmem_fault_copy_one(drm, vmf, &args, &dma_addr);
> -	if (ret || dst == 0)
> +	spage = migrate_pfn_to_page(src);
> +	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
> +		goto done;
> +
> +	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
> +	if (!dpage)
> +		goto done;
> +
> +	dst = migrate_pfn(page_to_pfn(dpage));
> +
> +	svmm = spage->zone_device_data;
> +	mutex_lock(&svmm->mutex);
> +	nouveau_svmm_invalidate(svmm, args.start, args.end);
> +	ret = nouveau_dmem_copy_one(drm, spage, dpage, &dma_addr);
> +	mutex_unlock(&svmm->mutex);
> +	if (ret) {
> +		ret = VM_FAULT_SIGBUS;
>  		goto done;
> +	}
>  
>  	nouveau_fence_new(dmem->migrate.chan, false, &fence);
>  	migrate_vma_pages(&args);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

