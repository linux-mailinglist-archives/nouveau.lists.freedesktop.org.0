Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C94FD142A6
	for <lists+nouveau@lfdr.de>; Mon, 12 Jan 2026 17:50:08 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 49F8210E423;
	Mon, 12 Jan 2026 16:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Bat6wu0U";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 58CC144C9F;
	Mon, 12 Jan 2026 16:41:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768236099;
 b=OauvZcF0sa2WTlQnSrm/TrsdlgjFvaDwoY4A2RZnfqkHHMLA3B+5v+Qsnnjx+NMBsdiH/
 0FHJDGayPCxOkVormtQhvYo10VfqGVim9Ta+8gajhQ42Im1NUEUcXPML5C3XFpQAMuHStig
 yTj2jL23k8hmdBR8EJOASRR5Ew1GPgqTLdUoyIdzdYitCRhbTzepsEFGnWTaGYdx6zUZN/W
 anID1USVuGrroTCQVhQpphYedG0BrcPPQvn8pJwgboxilEZ/Lv4TzIN09/b/XTj7hFJWTps
 cGkU2ytoBKod+2KM1YSOtu46zBOgA/grc2D+QJMEbUlDcnIV6AFsns31E1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768236099; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=eAxh70JY3ShLNfnDxBWsRZWpalCHcaRfsM5YzKZ+W9w=;
 b=R1zHZ6RQEhVT1MOks/ZdIj/zuNg1FXvj2yte8EbCZxURpLQilkGnm22CGM4EEJjl/SRqr
 6c8CtKH4QELNEqwKes0ZjkFpn4xGHXboPRfJg+4UMiGNLtNUxMJSbaYVi8Liis9Rd53xQYt
 R0fXnASRrW1TRHQsqDHf8mqGrRJr06fOllLb4NtaqejaztHwdb1XJvLYfkyqAwEmiBuEGqW
 UdCfYOFDlpNZYhktgoSi105+GVMVDdO87SwJyzRv7xrpd8ZHOzQsgJxThn1hwlaEpg5tkVg
 6hH4x6ruhZlPsanFV6tbFn4YhD0O4zEyF+cnS+TJApOwmbLAoUXheVgsisug==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 37A1944C7F
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 16:41:37 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E42BC10E421
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 16:50:03 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4fc42188805so69728251cf.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 12 Jan 2026 08:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768236603; x=1768841403;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eAxh70JY3ShLNfnDxBWsRZWpalCHcaRfsM5YzKZ+W9w=;
        b=Bat6wu0UmG9fuCZn5Iq+jd5OxvWiNpQdIq69eBLJAYXkYQWDeAMwNBJ5Y0b1/2B+d+
         B0G6komz5bqCZYsgSITfSNPdBzcVf0tjViU4xq+Txkgph+iNLcPkLZ7PFGAwpPwOuPkc
         iY8Czei3UIRUh5uOIZpQCl0QZHn9eYXAXI4kazYPlVShGUvbzk4nBmWxDV6oTIgkP4Bx
         qLNRohAt09eNZp4HJdf0cNdSZ1JNHeIBe75r/rx+lcKZhSuyD7Vclo2NzLgLCLq7nwoa
         dbeoOYpcoH3Mkui+6mbyEz1OJkRvlSAW+/48hQ3LQ754slxzzgbwEFseE7AAscvSfFVg
         8WOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768236603; x=1768841403;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAxh70JY3ShLNfnDxBWsRZWpalCHcaRfsM5YzKZ+W9w=;
        b=mB3W57q9tiUYNpt6h8zkNP2C1PECfqzph/UuQPFgtSqS4daEnQKv4hB5PLLMlBMffT
         b0EtjQu4U/baNmziSSJQ+CAxn+GNiA1OE8+y/5M1VOGbWDYHSPMqMBnEH46I4sdQNdfE
         WY4KfvHKMqM0B16H50bYoHGSaTGcvKD+aBe6X7uzi1uFQWC4Zt9Aw4U2S3qpLsKxXeWS
         /Qn4Lqa5yTeN0qTnanjdnYJWDkSHsXvMHEiDIkTadQutV0agB+PkcY+A2idn/Y31VNjZ
         cfOJem3xsAfrxutqsN9mi/Py4tfuN7JlgibnetEAamsCbQpld1SfkAY45bDbUn9dKHQm
         8NKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGIamgWT7Z9XknWIeY/k6/VYsDMMoxbLvUmwTrY5EgpWye+6sWbgFEkUWt27AGxwCfOm4IsNwl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysQ674TYnpFqScI/BLlpIrDbfctq6DNCx4mxCk+EQ0/ebHbj+g
	eraFQ3Mfdja//tv2co2nRWTUK0IIpEJb65DqffWucUvkD8BpTopk9GGm7jITuzC5YSQ=
X-Gm-Gg: AY/fxX6oFZ4qgbaKz9JtyLGylNJEbkgmRgDFwYt+og2vezrEWmKk0uDQIzxQ88n6hE/
	4CfTz8cNNe0d5maa6iKfYjW8hoHXve1soClVsBXUdzvYEzTnflyMi32zD3ipYJyepTms3EMA3Kf
	FWlR8cO2xlgQpSUNxHJY2QU6xlrjs2tAJELfxOdUrcLyjTIHAdPjmyO2bXpJGZUSShhgPyVIoOF
	BSTw3gzMY5nUT+zlpglVTH8f7QNVAcqrNcjGkI6u7LdpKB5kXFKCFAzkYI3ld/SWDv50LdSldnL
	wcf/0cSqg4nOugkxDONuKlcLV9NcDpwiYf0oU0HP5tfNnhnGGJSUrXb0r/JVFsCtJMJKrnHk9vY
	OZneasFyXu0kUrDQyIjZWRmAzuj6FTNbwgzqK9Urd9Hc1G/vIzMhzqYO1oMjnSSZqgJmE9Xqxrw
	Y5RxXxWfpHKs//JvnHNtHX0DvTrFIisMIRcUFETH61F48eV6cJ8V754nL3D2yXwgr7lq4=
X-Google-Smtp-Source: 
 AGHT+IE/A98Uf8f6ySXPvh9xamBlLANpUoYS4iXttzp8YDJn905I/7mcjcPxPkNVMXbRPnmf8UaJPg==
X-Received: by 2002:ac8:6f1a:0:b0:4ee:208a:fbec with SMTP id
 d75a77b69052e-4ffb4a1ed32mr255276771cf.66.1768236602551;
        Mon, 12 Jan 2026 08:50:02 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89077253218sm139285396d6.43.2026.01.12.08.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 08:50:02 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfL7B-00000003RcK-2R9k;
	Mon, 12 Jan 2026 12:50:01 -0400
Date: Mon, 12 Jan 2026 12:50:01 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <20260112165001.GG745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
Message-ID-Hash: ETIKDQWG5MN3H43ONO3S2QCEUCG3743M
X-Message-ID-Hash: ETIKDQWG5MN3H43ONO3S2QCEUCG3743M
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ETIKDQWG5MN3H43ONO3S2QCEUCG3743M/>
Archived-At: <https://lore.freedesktop.org/20260112165001.GG745888@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Jan 12, 2026 at 11:31:04AM -0500, Zi Yan wrote:
> > folio_free()
> >
> > 1) Allocator finds free memory
> > 2) zone_device_page_init() allocates the memory and makes refcount=1
> > 3) __folio_put() knows the recount 0.
> > 4) free_zone_device_folio() calls folio_free(), but it doesn't
> >    actually need to undo prep_compound_page() because *NOTHING* can
> >    use the page pointer at this point.
> > 5) Driver puts the memory back into the allocator and now #1 can
> >    happen. It knows how much memory to put back because folio->order
> >    is valid from #2
> > 6) #1 happens again, then #2 happens again and the folio is in the
> >    right state for use. The successor #2 fully undoes the work of the
> >    predecessor #2.
> 
> But how can a successor #2 undo the work if the second #1 only allocates
> half of the original folio? For example, an order-9 at PFN 0 is
> allocated and freed, then an order-8 at PFN 0 is allocated and another
> order-8 at PFN 256 is allocated. How can two #2s undo the same order-9
> without corrupting each other’s data?

What do you mean? The fundamental rule is you can't read the folio or
the order outside folio_free once it's refcount reaches 0.

So the successor #2 will write updated heads and order to the order 8
pages at PFN 0 and the ones starting at PFN 256 will remain with
garbage.

This is OK because nothing is allowed to read them as their refcount
is 0.

If later PFN256 is allocated then it will get updated head and order
at the same time it's refcount becomes 1.

There is corruption and they don't corrupt each other's data.

> > If the allocator is using the struct page memory then step #5 should
> > also clean up the struct page with the allocator data before returning
> > it to the allocator.
> 
> Do you mean ->folio_free() callback should undo prep_compound_page()
> instead?

I wouldn't say undo, I was very careful to say it needs to get the
struct page memory into a state that the allocator algorithm expects,
whatever that means.

Jason
