Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7AED12E0A
	for <lists+nouveau@lfdr.de>; Mon, 12 Jan 2026 14:45:19 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A676510E3D2;
	Mon, 12 Jan 2026 13:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="eXDhQoVq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 071A744CAA;
	Mon, 12 Jan 2026 13:36:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768225009;
 b=eOC3fDmiR2iBTc6PZQ1hNSlXSCIw9fM8mjykpBrjwi75jUfKMwMvbO7/4fSjkcEdNfBoX
 p8HmBmhoGgeWDpCEdlcTAYMDh57k8lbPymsvZpHSXBQZ+lCWmWQHUCkAu2GXSayP7SxalLj
 3Q2KqQhxyfvnjD8KfMxcit1EIcTOHzU4zgjcOmJuXbk0xOjx9O1NarZz3FgVPO+mgIDYb4f
 whP3Rqb6YRzuUXNQZqhSxU7w9QrOISLRIClq+PZjkx83B9NLz25ZHmLO1rSoj/d1fXyMpFe
 0aZzzZnOapSyBb85DqoPIroyHbi7bQXtDgufkM6XHt7JNSFXLU5beJDzt9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768225009; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oQVWjYpPCtwp4dXF89g7hQK6KDriflVp74tvOjx72Jc=;
 b=OY7upquok+/3LV52dqHxDe4GCJ2qDb/f/jHTAf3cXRxg8buFEyCdTcwuhbO2qlp4Xh7eV
 0UYuQKdpmRRV1sqOLk2xP0z275xN+we/hqv//em9eziDf91QnIbweYmnmGFU+bhBrenfliE
 PWzai15EJPbCc6ZCtljKybFIpdclAJ3BgMW+tR3Vn1spnHs6xr28bW4ugSAiDJT9xYRek3L
 2XIRCGzVY/zW+g4Kj2a3LOLMMLtIPO9iPAvGUAY3gY6Irht8CEM0b/EZcB/EGexp3TQmADe
 C/yzokipFvMS7HOJ7s62DC3bVULe8ymrTbbPtXlyRQ1f9oDj75H2qWEZg17g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AA9D844C9E
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 13:36:47 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C748610E3CE
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 13:45:13 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4ffb41c1efaso39446371cf.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 12 Jan 2026 05:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768225513; x=1768830313;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oQVWjYpPCtwp4dXF89g7hQK6KDriflVp74tvOjx72Jc=;
        b=eXDhQoVq3DMjGm5amCRpyKArZcwdgs2ArRllGGKXLAhTvyOCAV8NrxAUn3MBMtS9Hv
         QZKutUpEg7Ub18ivE5xPSF+9WjWeQ/j2WcwfB9+Dv9S8IQQcLqcw3p54jKGtTO/pwc/G
         7B86l3qmVRclekBUeBYL3iCPW6STIadaC7zPkwDlQ31W04dtRczLinamSP8DHI4awyra
         XO9HUxy2Ijp1TXBErwBsQecD55vN+2Uf4CrPxtaJQiLnZVHMTo6fHX/JObgUK4SdSlUZ
         owY21399n1OxhTzu8nl5jztfAaK9oE6Z3LUO8F9r9dzmDB3+ZDO4Wxb40mQi75uxcrYL
         NZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768225513; x=1768830313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQVWjYpPCtwp4dXF89g7hQK6KDriflVp74tvOjx72Jc=;
        b=aOPrtb2CLvWAWoIJGsTWh4IPuAcTGN548VEEklUIt+jPSGh6ITKssxW4dE6uI6mYZ1
         /ebFBuQEg/2Perzl4aL9LMb3FAxDAc/drbaEKIAXIZZhNwt+yVK5bdPEU7I+Q5/XJBXg
         wtKiZYoR8kuWX3bU82cZkVGMipKWjVxrMPFr1P6pJFV8Nrn+kLwm/bzm2NWxXv5CqzHo
         xGgvOV21CCJM+ltV6FzyCUEY+brDD08EvLRN7Hk3K8emPku13LBog8z9uDIwJ6ZkRIWA
         u7kRmNE1wOQlhhPAikyL68rE08a6DDGh3EzXxPTYs0U5MI39SGdMzTSjSBqIda43tz99
         zCuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFSYb1XUmNQQLjum0zk4bkKqioYXN3oxX8o4T2yFEX9ZPVZftMGtuLWPdtwnvcZSAB+t2PGt4Q@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxn1LVyv+EeNm6jGtueDl0TpGy/dTIFtZvT9cKUBQPPJUy6Zdbm
	WF6p/s//+93+I5yq7HIojWM6wp4i5x8Us+kqJPFX85Eyzaav5gwe6RQwDWobyeVvObQ=
X-Gm-Gg: AY/fxX6MaMGC0WYy/QXSmgOS/CmbBbUv6nl0UTRPgOLxwCneiWvC6IuwQd7pos9EaRe
	ze7bL9guPPpY4x42NlTxUkwE4geFv31h76Gi4LDLxu5bwUL0Avrd3gbfwURQkAaqCSCIyhvyP3q
	WdDTdGUQPcKa9s2ci1+XUL1nEYk7CBHOCeEwKdQzwq+C8rhyaGRVL1kjj5c5ltmDLFFPdykihJE
	jx8ALNDJY8ERD/VHkGMIoLDv3f9+pM44gWZ8B4hmCxCEYBq/HdNqgEUN2ftnkpVfiCmYPQiuw0k
	CgMbDE8jCIRFKAlyLovSDeh17wKDS1TuayamhJxJA6nl2NIXylljsvn4lw3NA6qHsI8jKnyUBzI
	NkoC7O2/7U8wDWewWF2X/nCnm/3V8wYaJaMX/Q9abnT88h/8G3FOBi1ss86pN2D+b7Nm94MRFfq
	bwDOcNMy7dn+e3RPrZdSTrsCzps3+hSnUjX/X5BZbPbSJtGPo+CUCNLtMzeqkNErkbD/9Lx2YSZ
	Ll6cQ==
X-Google-Smtp-Source: 
 AGHT+IG20+wZaR0cdbZzmqo1CbORIU0XkpxQP0kdASvCc3hNxGR2kbLwFGbi9bRoyfQYpJE34s/36Q==
X-Received: by 2002:ac8:7f4e:0:b0:4ed:6803:6189 with SMTP id
 d75a77b69052e-4ffb49998dfmr285683391cf.53.1768225512643;
        Mon, 12 Jan 2026 05:45:12 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ffa8e36232sm124159891cf.22.2026.01.12.05.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:45:11 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfIEI-00000003Q1m-3fo1;
	Mon, 12 Jan 2026 09:45:10 -0400
Date: Mon, 12 Jan 2026 09:45:10 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <20260112134510.GC745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
Message-ID-Hash: Q2NNT27JUFBOYPFHR2MXFD2SCJHGRZMF
X-Message-ID-Hash: Q2NNT27JUFBOYPFHR2MXFD2SCJHGRZMF
X-MailFrom: jgg@ziepe.ca
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Matthew Wilcox <willy@infradead.org>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alistair Popple <apopple@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Q2NNT27JUFBOYPFHR2MXFD2SCJHGRZMF/>
Archived-At: <https://lore.freedesktop.org/20260112134510.GC745888@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun, Jan 11, 2026 at 07:51:01PM -0500, Zi Yan wrote:
> On 11 Jan 2026, at 19:19, Balbir Singh wrote:
> 
> > On 1/12/26 08:35, Matthew Wilcox wrote:
> >> On Sun, Jan 11, 2026 at 09:55:40PM +0100, Francois Dugast wrote:
> >>> The core MM splits the folio before calling folio_free, restoring the
> >>> zone pages associated with the folio to an initialized state (e.g.,
> >>> non-compound, pgmap valid, etc...). The order argument represents the
> >>> folio’s order prior to the split which can be used driver side to know
> >>> how many pages are being freed.
> >>
> >> This really feels like the wrong way to fix this problem.
> >>
> 
> Hi Matthew,
> 
> I think the wording is confusing, since the actual issue is that:
> 
> 1. zone_device_page_init() calls prep_compound_page() to form a large folio,
> 2. but free_zone_device_folio() never reverse the course,
> 3. the undo of prep_compound_page() in free_zone_device_folio() needs to
>    be done before driver callback ->folio_free(), since once ->folio_free()
>    is called, the folio can be reallocated immediately,
> 4. after the undo of prep_compound_page(), folio_order() can no longer provide
>    the original order information, thus, folio_free() needs that for proper
>    device side ref manipulation.

There is something wrong with the driver if the "folio can be
reallocated immediately".

The flow generally expects there to be a driver allocator linked to
folio_free()

1) Allocator finds free memory
2) zone_device_page_init() allocates the memory and makes refcount=1
3) __folio_put() knows the recount 0.
4) free_zone_device_folio() calls folio_free(), but it doesn't
   actually need to undo prep_compound_page() because *NOTHING* can
   use the page pointer at this point.
5) Driver puts the memory back into the allocator and now #1 can
   happen. It knows how much memory to put back because folio->order
   is valid from #2
6) #1 happens again, then #2 happens again and the folio is in the
   right state for use. The successor #2 fully undoes the work of the
   predecessor #2.

If you have races where #1 can happen immediately after #3 then the
driver design is fundamentally broken and passing around order isn't
going to help anything.

If the allocator is using the struct page memory then step #5 should
also clean up the struct page with the allocator data before returning
it to the allocator.

I vaugely remember talking about this before in the context of the Xe
driver.. You can't just take an existing VRAM allocator and layer it
on top of the folios and have it broadly ignore the folio_free
callback.

Jsaon
