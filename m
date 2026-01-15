Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69BBD223B8
	for <lists+nouveau@lfdr.de>; Thu, 15 Jan 2026 04:02:01 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1846810E6AE;
	Thu, 15 Jan 2026 03:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="omuyeZrw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C01A244CAC;
	Thu, 15 Jan 2026 02:53:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768445607;
 b=sbvr5FB8Dol/KZXtgCw9vmhW4Bh0U5Tv7zjpsl2Swt9LlR0YZ2xgkJhJl4UlklAEdY3bs
 fcqYgHQl5aG4yhN3M20mgfBcu0WrpB8PSpHlwAG/0Q7pMqPEqHMLFsP87e2a36wFMkmttRU
 +RJj46dfQN4JapNoutaYwZXs1pcQTn+9louWtkGzey/aGVbhhxvhyIXaJ/C9rT5HM9fAFMS
 vIEZChgot/+qATCTWQPejJKiWrz1gJMte65z8+koHEyx93DBNPS9koRZooU+k8J5av8Zeg4
 HjiysAlDBwvDrSsmuwh8FfKkbsa/gI6RAdPydMRc3enU3FKHCpGtN60U4Xqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768445607; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5zQLK1Kx4KSHBdB8iyadgaDb9pVP4BI/1Am6eQhl6y0=;
 b=eqkAMKRWjR6J/xg1SsaIJ4t2u1Ne2phR0waDGXkZMeXkkNEo7C0ESOKw6cPRwUYOX5uEf
 3TPzUvCi1iUUvybU4+cu5L4M2Kh4C3dDMtHGTGZwYTCKCEvsnlb1Aym5zfIgIJ44u2SVyE2
 aeVuZwpUIvh3czRf02Oy/IB9iixNGlt6tPGtipV/3sf7BsNI8zYJsgt8IrYr8/R4aVF0ZIb
 v/u1jZT/kQou04IX1mn7O2S+WLzSovZHbD9N+CtDRnu7QsA3NQ7rL8CkR/EnzuMJ/ZKM0zb
 tfHIgGI2jrpc1nCY1IMu1u4QETbMkMlsvomt/tAQ5wyHF/RXSKl4sg7PtMyQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 135DB44B9D
	for <nouveau@lists.freedesktop.org>; Thu, 15 Jan 2026 02:53:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD1310E235;
	Thu, 15 Jan 2026 03:01:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51D4660140;
	Thu, 15 Jan 2026 03:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A77C4CEF7;
	Thu, 15 Jan 2026 03:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768446116;
	bh=t62plHsTL0NzPFD3kffjbbJXeKPsO+HXKRB8ZhdlO8k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=omuyeZrwDujiPdNf06U42mHqbJE+T8krxLxsXa0Dh7kwj5wgnsDsccsWbhd7wdXP4
	 UC66ZVu6CpbnfNPYvmLzhn5wXv+rRL9cYqbyE5VJMvghF+HKu7COLRojjM/kTPkbVc
	 +6YenfbpT4eR4UVzrm/t6nRiEN5v/+/MXNu4aqwo=
Date: Wed, 14 Jan 2026 19:01:54 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-Id: <20260114190154.c05e460ebf4054828430633f@linux-foundation.org>
In-Reply-To: <20260114192111.1267147-2-francois.dugast@intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
	<20260114192111.1267147-2-francois.dugast@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ATE2XVEAMIOCBFXYMD3LVZDI7OTOJMOF
X-Message-ID-Hash: ATE2XVEAMIOCBFXYMD3LVZDI7OTOJMOF
X-MailFrom: akpm@linux-foundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 adhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ATE2XVEAMIOCBFXYMD3LVZDI7OTOJMOF/>
Archived-At: 
 <https://lore.freedesktop.org/20260114190154.c05e460ebf4054828430633f@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 14 Jan 2026 20:19:52 +0100 Francois Dugast <francois.dugast@intel.com> wrote:

> From: Matthew Brost <matthew.brost@intel.com>
> 
> Reinitialize metadata for large zone device private folios in
> zone_device_page_init prior to creating a higher-order zone device
> private folio. This step is necessary when the folio’s order changes
> dynamically between zone_device_page_init calls to avoid building a
> corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> must be passed in from the caller because the pgmap stored in the folio
> page may have been overwritten with a compound head.
> 
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>  					struct drm_pagemap_zdd *zdd)
>  {
>  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> -	zone_device_page_init(page, 0);
> +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
>  }

drivers/gpu/drm/drm_pagemap.c:200:40: error: 'struct drm_pagemap_zdd' has no member named 'dpagemap'

I guess this was accidentally fixed in a later patch?

Please let's decide whether to fast-track the [1/N] fix into mainline
and if so, prepare something which compiles!
