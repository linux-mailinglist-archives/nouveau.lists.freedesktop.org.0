Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B60CD37947
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 18:21:06 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6629410E90E;
	Fri, 16 Jan 2026 17:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="V9LhYH/c";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7A4B544C8A;
	Fri, 16 Jan 2026 17:12:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768583542;
 b=pks1tkvX5fBReiqPWuHVenVClkpvFb/FUXbQHPYmXikn6JY3p0YnawX7Cjf7vdBP63LuT
 yjgWcfZvCgHa8KtNr7Z+mGqqPafHNWnOv9rzsJccLJYN4ieCNTtLEs9OkoxticNW2Gk5dFf
 8EqHVs3VkVmP9yeEeMCPGFssMUK5APxYIxlaIJkmnPGbwOcGbGu5WKIJV3WPSmsK68S9Gxo
 Nt8lC5loX6B3/IRJz9TeukHpIA4dHHo8tQNAbKW1/Wf7VMU/A3l36MS+v2ilxpESe7g+h2Z
 6P8N3ii+4Um6zE0K7q5817O/xjEJIhMzkHug95N4Zt9orEz/EhnRSyPwK11g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768583542; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ke97Rr0JZ7eY7fCVBJ0MTKU0b1sPJJtx1nolStxn4zc=;
 b=npEjOwz8HCSREVYsc5CN2gmF1H6CdRu7R1RknAcANaXtz7mRdFSR7BTdqvUnljXEDn3e9
 fPxhABhBuLcqEril5w/5ZsFE5Zxm+epMAzgYQ8a1Xoc0CheAb5k1nU3+yGHfZ/yaNOobCkc
 XPYC23mZTJBDayHzcD+2tfnhUxb5TgTShCwODNiLAKjedAl+w4GeMmeC957W//VfDiYfosy
 dvFSiKy4OwWmVEY0pcSW7628NkvderHJJWr02tfeMcVTsLQ5WcqjVTlTaHTzLnCYHpj0Vcg
 GVI1KvySq4qhQ5IY40oJmHd9dlvs8uYnnXfh1LKwid6BYv67SacZwn3/n7UA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 489F744B97
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 17:12:19 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AF1FC10E90D
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 17:20:54 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-8907f0b447aso27710756d6.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 16 Jan 2026 09:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768584053; x=1769188853;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ke97Rr0JZ7eY7fCVBJ0MTKU0b1sPJJtx1nolStxn4zc=;
        b=V9LhYH/conGHRNcYVgRh2X+90O+ZQXxVT78D/JovAZq2VfVpLsXVeexk5utLvqG/8C
         sNG9ieTKSrxwVlvpM1q17GqibBFuJ0ggJMpgkZEYcp+kcIlT5oVUg6OpzhqWfREf4v0B
         DrElO2TzIXLNta4ISNzorSWsNIHTEVMfGdh4JNLUr4dRjNkudz4EevjbvBzbhzn9AI1z
         f+FrCvwjdHFyPXfHzR2FHtf0sOv92VgZpRcDdyNRwSV2wDYKpDQr75j2KIoc3Etwy2hR
         ZHBPji2oMWjlJfNqSTefGNIbptv8hB8XkbWal1cmffB7+8OqsZ6ZVcolX1P6FZrWrOXg
         blhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768584053; x=1769188853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ke97Rr0JZ7eY7fCVBJ0MTKU0b1sPJJtx1nolStxn4zc=;
        b=q4SUEJ90g2mlNW7FpejZy3uC8V4ebuO+F4Plc1uyKA/OxKeyU4iXySp6bBHe0Utntz
         jyLPYCryXQGw8ctZUTnaVB5rO5T8gQGOYtR5xFtlfNMsdMdsyuUZsfohX5L5x4OmkvBT
         Yw381PlebkzrcEQrJ+A0bCkLYbLiyK3Y+Wu/OWUN8rsTlI27HRjBjRG7Ah8EUC1g0Txc
         IfzMCbz77ixqpazoODfvx0qJdvhfV8IIGLsWzotlV1597Hmci92Y4b1MUfulbeMBzJI0
         VXmy370TKFQxJJQBb/KG3ZtezLGzEmn4tlMdie0PXTE88r0lCsUjVlBj25SBEBEi4S5c
         4MHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1ynMMamqJg7Jk5tHkGqTveVKA+vJJkWvgv0mGPGn06dHhQaYej/N2VuXs3mOjqz8eI+wSV2t2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOf2boFWkZc408TUEKa0ZZWbhDT2jiBAfLPtw1iDU7/w69Se0x
	VZT20MfrLkNifljhUmagLRQ24oRe04hGYm9wOgbh1YxAYMa9mBASwHBDsCPGNu4q/FA=
X-Gm-Gg: AY/fxX4GKlR+oQVNh0oP1RAiL2Fyj/nr6Mr1ODg+qzw2YNMPOgaU3KOxmLT/83W+g8k
	LscrBt/+naHYTsP11+VP1XNPvw2ZwpnkXUBdW4Z6CEzZzJpsUbagVbZ8m0BAoEOm8tBQo0l6gGX
	H33zZIa8Ggzgi1vK/Qi9urbm9VAC/5L+Def+tMkdNL2PIV59CPUYClcaPfne8cHpBDKc3uckDEV
	NSm6a+2JzKaLTkQMHffPjG7UtLOPBb4ra1QaGjxH+1M/HzjyX7liCY9LptdDnCP7ut3nuxCgz2h
	T97qcRnb4dOe3DvmvUXvLoDHFJJNlMHSEOUWymXKcaPP1R10byAtHSQmJtsv85Aw3PEGxHJ6TLy
	EDJSASUp8XRHLLAxEHFLJbd2ZDodLSGTXe7BP/OIOylETlTKDthzIWQUjlCUuvVvUGQb6zPV4zd
	9feKxVaArwSs46kAZ7dyV+lCHhFC2GB5O1WAChZs/dVTdPKvSs1folLICVLCxGHa+g6u4=
X-Received: by 2002:a05:6214:d08:b0:88a:529a:a543 with SMTP id
 6a1803df08f44-8942e543175mr46699756d6.69.1768584053510;
        Fri, 16 Jan 2026 09:20:53 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8942e6ad606sm26895826d6.33.2026.01.16.09.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 09:20:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vgnVE-00000004kb4-0KMs;
	Fri, 16 Jan 2026 13:20:52 -0400
Date: Fri, 16 Jan 2026 13:20:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <20260116172052.GC961572@ziepe.ca>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-2-francois.dugast@intel.com>
 <ed6ca250-67ee-4f7a-bc3b-66169494549a@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed6ca250-67ee-4f7a-bc3b-66169494549a@suse.cz>
Message-ID-Hash: KHP5OV4QYKVBOXTYGHEOJVZAWMQXMWEE
X-Message-ID-Hash: KHP5OV4QYKVBOXTYGHEOJVZAWMQXMWEE
X-MailFrom: jgg@ziepe.ca
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 adhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-mm@kvack.org, linux-cxl@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KHP5OV4QYKVBOXTYGHEOJVZAWMQXMWEE/>
Archived-At: <https://lore.freedesktop.org/20260116172052.GC961572@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jan 16, 2026 at 05:07:09PM +0100, Vlastimil Babka wrote:
> On 1/16/26 12:10, Francois Dugast wrote:
> > From: Matthew Brost <matthew.brost@intel.com>
> > diff --git a/mm/memremap.c b/mm/memremap.c
> > index 63c6ab4fdf08..ac7be07e3361 100644
> > --- a/mm/memremap.c
> > +++ b/mm/memremap.c
> > @@ -477,10 +477,43 @@ void free_zone_device_folio(struct folio *folio)
> >  	}
> >  }
> >  
> > -void zone_device_page_init(struct page *page, unsigned int order)
> > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > +			   unsigned int order)
> >  {
> > +	struct page *new_page = page;
> > +	unsigned int i;
> > +
> >  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> >  
> > +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > +		struct folio *new_folio = (struct folio *)new_page;
> > +
> > +		/*
> > +		 * new_page could have been part of previous higher order folio
> > +		 * which encodes the order, in page + 1, in the flags bits. We
> > +		 * blindly clear bits which could have set my order field here,
> > +		 * including page head.
> > +		 */
> > +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> > +
> > +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > +		/*
> > +		 * This pointer math looks odd, but new_page could have been
> > +		 * part of a previous higher order folio, which sets _nr_pages
> > +		 * in page + 1 (new_page). Therefore, we use pointer casting to
> > +		 * correctly locate the _nr_pages bits within new_page which
> > +		 * could have modified by previous higher order folio.
> > +		 */
> > +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > +#endif
> > +
> > +		new_folio->mapping = NULL;
> > +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> > +		new_folio->share = 0;   /* fsdax only, unused for device private */
> > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > +	}
> > +
> >  	/*
> >  	 * Drivers shouldn't be allocating pages after calling
> >  	 * memunmap_pages().
> 
> Can't say I'm a fan of this. It probably works now (so I'm not nacking) but
> seems rather fragile. It seems likely to me somebody will try to change some
> implementation detail in the page allocator and not notice it breaks this,
> for example. I hope we can eventually get to something more robust.

These pages shouldn't be in the buddy allocator at all? The driver
using the ZONE_DEVICE pages is responsible to provide its own
allocator.

Did you mean something else?

Jason
 
