Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1381AD14BFF
	for <lists+nouveau@lfdr.de>; Mon, 12 Jan 2026 19:25:09 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CC91F10E2B0;
	Mon, 12 Jan 2026 18:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="cBOFG4CO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AE8AE44CA2;
	Mon, 12 Jan 2026 18:16:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768241798;
 b=HUzPpmRzeCFEgjFBQEOyzOmVTdMInI97DXDnRoa0l28CMIbq6zFoJXilF3TUtaGSnws0L
 WHfJZL5v5n+yTYqLfsK1wrxNeopZWk46y/9/hEcvYRk50sYHtaPDu5FLNJEPkyXERJ3PBc2
 spD7echl6OfJrYgGvnRHqDt6/3Aq6i5PgrWu/f9Cc3WzfzdIP/wYBAuAbcLFJk33/d0rter
 Rp8nideB0HPRnd9Cbjn0nKypSnRhZTsGmx82orzcBSAMIXewMaWCPVHbM8tPl47Yk+WGI36
 molMjyB2L97r9yi4uj3MAe+5oBuRKttM+R6Pt0iNk8/SzDz0mS+WDda4GdcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768241798; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jdD8MqriJAO2uyiGLSo7KkiIHx3VWLqLd6aNoF+yCm8=;
 b=ru6UfaHyn5loGS2XnVTsab4B6gJ5ztVvtvYCeIF/L/RsN3ZRltzlbiU3gJ9Q1DY1q9aYu
 Wm0iKDTpbuCf4xqiz2ETRc+JjPaEu871NtGhFzgT3tAN3Dj1fisgzK8cBBAEGswNo+zqVJ+
 JBgkNTfCPyNYnTHvisPgejCUaBd0MmXhqrx/wCll7KD41sjUdY2hAYu2y6WSwCdsO4huFEP
 arjkKbd00c6xdeizHPlIWP9ybWn83Vce/2Q1vvPjXShza9upaFTKI/5ayjxPkkDteS+gBeC
 AFh4zURQ6zcAM3PbgjkZYJfOnSKvcMitubjYcROZsFMzTrFIIwnLuuKGuCWQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E362F40382
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 18:16:35 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6440410E111
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 18:25:02 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-88a2ad13c24so64722616d6.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 12 Jan 2026 10:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768242301; x=1768847101;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jdD8MqriJAO2uyiGLSo7KkiIHx3VWLqLd6aNoF+yCm8=;
        b=cBOFG4COn080/Z9WyuXlRr5Hmz1BcShow5odAyVjyHl3IRLTtJtfJqpjcbq5hh0YrW
         02/bX717yrcfeaiak5ki+toH7fY3NSAMJm6V2F5egXvX/1GJiqFNdRqYtaV6lj5VBEnB
         UqkxF8CvbNgl0wFjUdO/zrbBQJZp2yT0o8PlNxQ0XitC9cnWFdws7i/aCojKM4DPUJ+Z
         oMdaMjP8sdKNimU5d+8AiuK7W/SScVJwbwr4htL5TJaJfOX2AkC6mNW26REdO0KqZhAV
         Q/ppKZx+6m0LfIn/MmB9sxEUE8GoWMJCSyK0Qd+COSA9iWe3L0eavbiSpvlD4MZIKR5/
         HlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768242301; x=1768847101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdD8MqriJAO2uyiGLSo7KkiIHx3VWLqLd6aNoF+yCm8=;
        b=eOWjkRYnPv2ZkZZA8ul/NU55b171Zr8qVXeZ/8BjRVJiYpa10a4bX5hbOjzY+sIRGw
         zfxtTdLrK+60CRBtPCbq7aS//5zmnVC17R8xXq3p4S5EuXJFpTX2PC1g7BH+oV7N8wXB
         +DdZu1jkIX0jh61PO59Wm8BMkVXumDupjya/NlzEoo+ioc0JmPeWsXS+9HqmxMOZfhKy
         pVWTQUKB1PN4B1qk4NJOe0BD274oQ9MLTeIYyvOu7M0M7AqiOjyrpb8SU2QxzovwtCZe
         EmUfm6mJpuR8Ojf0lj8oQyh2obXXdovHoRcB79HffClry3sJ9Y+CIoFz4Md9Ivzdl2Nv
         ESOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7EYLVbgS5D32LW+Pdv+vAJSr/G1oN7XoYH4zhGT/Xs0b1DbiyuqoFCUJZmaLGS+/nBpCXrPpC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFFZ9DKdCM+yGnXLEbF97K3TWnbxJQYPIaYFLY3YBK1P1LmvmP
	k9zjbnjLcv2BjV5cL/JuycZjOxRHOVrhZIAiy/udz7JO+eII3heP40bahFb4RG3DH/k=
X-Gm-Gg: AY/fxX6Qpx3TXasuYK2ki6hWDO9LlQFQbU2iLCnLdSmayR10v30D8nl3EpA7iDlqCMS
	FbBPkJR+Jlae9ntt7H9Z6Od1M8cYJgd/m5iESwkbnyUwND0G/85SKPBISSsGx1dLSKlkoDNDy9m
	xI7V1wVem5ocJ1CvrHY//Uh9wshtIP1nYTTV0rgx5aqLvAN7zkVKuPGI266pIe80WM4BuRKAkws
	TcvLr/s6AFmkepZL6yRIh2rhmLDXG7Ydilb/pn7EwSznDHpw94GAuNgbM8Wzd74yJdM4XYCS71M
	xoTw6pzowRDZgMOj03cmi3E+P5A4F0UMSd1WbG3BiIGfdwItvwZTrZ6f0ZWCYe3wkbVQV6lTmQN
	pL2PvJLwAFEZCI6cf+ynH5jlY7pABnOJBUa6BafjVxw5azHsmYRywiPssBjN7ZXvHIpZExL57RJ
	S36D1mxHAplT5kjWwgo6OpP/xU94Tox70p+5fWtc8gok7qLNHMH2QeKFxbguSuzdebZxY=
X-Google-Smtp-Source: 
 AGHT+IGn2SBiEVfPnYP4nrga1XlmOOc9x/h3J7lqU+usVoOUoaNofJJs2v26tTONjDwmwZ1AsmIeFg==
X-Received: by 2002:a05:6214:428e:b0:88e:9f73:2c08 with SMTP id
 6a1803df08f44-89084179da3mr258471116d6.5.1768242300986;
        Mon, 12 Jan 2026 10:25:00 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770ce985sm138366276d6.11.2026.01.12.10.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:25:00 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfMb6-00000003SfZ-05E0;
	Mon, 12 Jan 2026 14:25:00 -0400
Date: Mon, 12 Jan 2026 14:25:00 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <20260112182500.GI745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
 <20260112165001.GG745888@ziepe.ca>
 <86D91C8B-C3EA-4836-8DC2-829499477618@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86D91C8B-C3EA-4836-8DC2-829499477618@nvidia.com>
Message-ID-Hash: VXKSQEINUKUGKR3ECGG3J7W27AV4ZBIQ
X-Message-ID-Hash: VXKSQEINUKUGKR3ECGG3J7W27AV4ZBIQ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VXKSQEINUKUGKR3ECGG3J7W27AV4ZBIQ/>
Archived-At: <https://lore.freedesktop.org/20260112182500.GI745888@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Jan 12, 2026 at 12:46:57PM -0500, Zi Yan wrote:
> On 12 Jan 2026, at 11:50, Jason Gunthorpe wrote:
> 
> > On Mon, Jan 12, 2026 at 11:31:04AM -0500, Zi Yan wrote:
> >>> folio_free()
> >>>
> >>> 1) Allocator finds free memory
> >>> 2) zone_device_page_init() allocates the memory and makes refcount=1
> >>> 3) __folio_put() knows the recount 0.
> >>> 4) free_zone_device_folio() calls folio_free(), but it doesn't
> >>>    actually need to undo prep_compound_page() because *NOTHING* can
> >>>    use the page pointer at this point.
> >>> 5) Driver puts the memory back into the allocator and now #1 can
> >>>    happen. It knows how much memory to put back because folio->order
> >>>    is valid from #2
> >>> 6) #1 happens again, then #2 happens again and the folio is in the
> >>>    right state for use. The successor #2 fully undoes the work of the
> >>>    predecessor #2.
> >>
> >> But how can a successor #2 undo the work if the second #1 only allocates
> >> half of the original folio? For example, an order-9 at PFN 0 is
> >> allocated and freed, then an order-8 at PFN 0 is allocated and another
> >> order-8 at PFN 256 is allocated. How can two #2s undo the same order-9
> >> without corrupting each other’s data?
> >
> > What do you mean? The fundamental rule is you can't read the folio or
> > the order outside folio_free once it's refcount reaches 0.
> 
> There is no such a rule. In core MM, folio_split(), which splits a high
> order folio to low order ones, freezes the folio (turning refcount to 0)
> and manipulates the folio order and all tail pages compound_head to
> restructure the folio.

That's different, I am talking about reaching 0 because it has been
freed, meaning there are no external pointers to it.

Further, when a page is frozen page_ref_freeze() takes in the number
of references the caller has ownership over and it doesn't succeed if
there are stray references elsewhere.

This is very important because the entire operating model of split
only works if it has exclusive locks over all the valid pointers into
that page.

Spurious refcount failures concurrent with split cannot be allowed.

I don't see how pointing at __folio_freeze_and_split_unmapped() can
justify this series.

> Your fundamental rule breaks this.  Allowing compound information
> to stay after a folio is freed means you cannot tell whether a folio
> is under split or freed.

You can't refcount a folio out of nothing. It has to come from a
memory location that already is holding a refcount, and then you can
incr it.

For example lockless GUP fast will read the PTE, adjust to the head
page, attempt to incr it, then recheck the PTE.

If there are races then sure maybe the PTE will point to a stray tail
page that refers to an already allocated head page, but the re-check
of the PTE wille exclude this. The refcount system already has to
tolerate spurious refcount incrs because of GUP fast.

Nothing should be looking at order and refcount to try to guess if
concurrent split is happening!!

Jason
