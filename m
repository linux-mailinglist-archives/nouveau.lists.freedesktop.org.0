Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52DFD15E1B
	for <lists+nouveau@lfdr.de>; Tue, 13 Jan 2026 00:53:13 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 71F0810E440;
	Mon, 12 Jan 2026 23:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="feqa8xza";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DA6C444CA2;
	Mon, 12 Jan 2026 23:44:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768261483;
 b=NBlix7Y6nU8NRnh+hDyHkZmV2tR97aWGmfSaWXR0lBZC9Nrl+etZztQJX+45vUKKN3St3
 iYYMj+6VtnPhJ6dwvLiOEM+WX1f/pyc6heEhyGrjItbjyCQdUV88fYkYoukJUB2rrOXLDzd
 e1T684hFxS6GmdJSKI7XCEaZp3YhGMN/Xsoeipm8HWvJCv1K164Spmt65CL72vzYoifeeRN
 pNarDP5isgQCzyBBVkz3ikKngopHL1GY8GYOmfh+5pKbsA7VMuE30fumLFa2T61GHXdz/Ix
 AQnJazB/68L1dNgS/uWtrT5hlXZYP51wOhSLzgoyZ5XUVa980mn/AiDpCqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768261483; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MFAPVPPrTQcXGzmX4uMQny5ONRwVZsvoYJMZG32QBJM=;
 b=rvo/GoB8j4a2x2tUXVKTXB6TlP1IyO2zkBbBpDxhIURGq0uwfA2Vkg8BK22uQNOwYdUEI
 1aS3pqd7Ml1atbTclbu5E/EHY4B4oe0KH4w7z/jx9dv1+6x/OzVTj2B22MvhZj/h7ov3kj5
 ojr8J+DuCWvN4L/25XnfwWcMX3loiRJ3h7w60AGRkUtHDXAywB9Mg3ItNZti4nqFhSHFCA1
 jQi+gD1z84j8d+k5BIod1XxttfD4fOR6yYLcn8/whgnpgqUIxZuUSbvOCOxM1ef7N8jIWeG
 //JEdFRPT9hy+kZEOAUHnXrhxIGdQjwzjDUH/l5yDOMoA/+4G/FpV0lP5p9w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4A3A340382
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 23:44:41 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A24E710E43C
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 23:53:08 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-8b2d56eaaceso796120385a.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 12 Jan 2026 15:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768261987; x=1768866787;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MFAPVPPrTQcXGzmX4uMQny5ONRwVZsvoYJMZG32QBJM=;
        b=feqa8xzaI2PGqHAXING1kUF3gh9XohkXBW2JeIHEgAPKO0lGL9J9eKMP4iOHOZbUMT
         5eT2qKWaez4z+FvlofahN5HD+fod6+fF7TRPKrAhsbiiuZdIsQtQwxLkBxEfVjQCee9Y
         BldS7KGYkthMXZdAtCcjC3cQDiAkk+dx+m7fj/dgn9S0NCzG3IdYEPNqGhoofcYsDmYb
         XSRQxTOmyioFGd1dR7mZlos2baQb0KtU1VivsGEtqD66RLLlnA4/TBQJMkY0Trq14j1Q
         6RQ0VYCgjYNb7f0Oz2UMIcv9ZB/CzUNyEXXcINiMva4G03ISKtwI6eOZo0fBw6LQjNHL
         HUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768261987; x=1768866787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFAPVPPrTQcXGzmX4uMQny5ONRwVZsvoYJMZG32QBJM=;
        b=wQvh7SdEVp+Vby0qDh37AXbMWHbooBsHC93QtYep2g6fxuyxXgISjsgQqcwYNqlLiC
         hB4M5xtq6ku2obbfk4o0z7KEZQwCgKY2KJ5qI5W5hq6M60X/j7DGOoyaWUfEK/CQKzBQ
         qpVHxdmVeHI9ms5MFVFy6yukLckf+hIuP2LBIanr/k302CJqo9kS7I3+wEJs2NCmbB58
         Boh6lHFSeKvC7lUjAYJnBaakipvl8IjKxcWo2qq+EFEEn21ct3FNBKMrliN1/zXImbfm
         YmqBK7krUv2T7zVJTW+b/uIUR+phmIfCKCYt8w4NNwe37Z1dTrG7jIBiSPvqaR84Bbtx
         YsmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXompBlFwyCd34f6k5r2NhX3zEHzWp3MiDIw1MqlyPjWtlHiBi1zdSuOYaTj7RwBpDbUQ05OHDq@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuHaVJhJ7JlKPH5fmDgAc9+ifDuYTkq6U0fHdmHsAJWGbUzBKV
	Wa1oC3fsByPLgfplS7GjpNmxqHlZpL16eRUa2UgprDIwXZRzAqKtD5UigrzqSEY4bpQ=
X-Gm-Gg: AY/fxX71/BJTdbIUoVNyeJOj132IM+5LgXZMfNxkgXPA+KMdUXePmpfRwdvVMd8KQMX
	zvYcOJI2JdOxi59GMM6jvOCFMh/ZEUFA67dJoO82tDc8jpHjryanh6Smuennj9IT6ZkRU1pMqLj
	/MlUEyPy6+/FLDS31tTM85BXDAJee7yJX5kooIJ8nHxQieEPr0nHhrlviaUCsg9bYY9kOtAEuFQ
	G8mL3CDz5rBkNecIpogqX5ad5ASSATwp+PEUEqLY6kBvPWcfRoF7cDDwyTe623+zq4kjavzHShK
	NXB0pr4jRTG/tAz48qNwHY9jGdmVv8ThtvhLsZvwP7FO9Yvkwxlwxas7rjah1qvqxEpy6vl/GW3
	QCixaR+PcxMa3EAp7s//ctIq1oz3bDoTHRWG9N0pvFDXRtXZvw1ujLgVV2/WJNWLxMzr495QBLR
	CTOz+PIzMlQGS7eFI5KNFHGFu4QURwN84AzDSL3R4NJbbCDAzu6G6nHps3Y4bmGoIUQRbXsEIHf
	lZ8Vw==
X-Google-Smtp-Source: 
 AGHT+IECCLtz04Q1g6y58MlK+cu2G+IQ+shlJTLlvJFkV+wtTDGmcQVfka7R8tosUNuc3dGp+UEbDg==
X-Received: by 2002:a05:620a:4804:b0:8b2:7536:bd2c with SMTP id
 af79cd13be357-8c3894188a8mr2759937485a.78.1768261987580;
        Mon, 12 Jan 2026 15:53:07 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f530907sm1597443885a.39.2026.01.12.15.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 15:53:07 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfRic-00000003fUQ-2VnR;
	Mon, 12 Jan 2026 19:53:06 -0400
Date: Mon, 12 Jan 2026 19:53:06 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <20260112235306.GN745888@ziepe.ca>
References: <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
 <20260112165001.GG745888@ziepe.ca>
 <86D91C8B-C3EA-4836-8DC2-829499477618@nvidia.com>
 <20260112182500.GI745888@ziepe.ca>
 <6AFCEB51-8EE1-4AC9-8F39-FCA561BE8CB5@nvidia.com>
 <20260112192816.GL745888@ziepe.ca>
 <8DB7DC41-FDBD-4739-AABC-D363A1572ADD@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8DB7DC41-FDBD-4739-AABC-D363A1572ADD@nvidia.com>
Message-ID-Hash: JG7FUNNEQHRQZSLWW565SIEGSISIPIJZ
X-Message-ID-Hash: JG7FUNNEQHRQZSLWW565SIEGSISIPIJZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JG7FUNNEQHRQZSLWW565SIEGSISIPIJZ/>
Archived-At: <https://lore.freedesktop.org/20260112235306.GN745888@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Jan 12, 2026 at 06:34:06PM -0500, Zi Yan wrote:
> page[1].flags.f &= ~PAGE_FLAGS_SECOND. It clears folio->order.
> 
> free_tail_page_prepare() clears ->mapping, which is TAIL_MAPPING, and
> compound_head at the end.
> 
> page->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP. It clears PG_head for compound
> pages.
> 
> These three parts undo prep_compound_page().

Well, mm doesn't clear all things on alloc..

> In current nouveau code, ->free_folios is used holding the freed folio.
> In nouveau_dmem_page_alloc_locked(), the freed folio is passed to
> zone_device_folio_init(). If the allocated folio order is different
> from the freed folio order, I do not know how you are going to keep
> track of the rest of the freed folio. Of course you can implement a
> buddy allocator there.

nouveau doesn't support high order folios.

A simple linked list is not really a suitable data structure to ever
support high order folios with.. If it were to use such a thing, and
did want to take a high order folio off the list, and reduce its
order, then it would have to put the remainder back on the list with a
revised order value. That's all, nothing hard.

Again if the driver needs to store information in the struct page to
manage its free list mechanism (ie linked pointers, order, whatever)
then it should be doing that directly.

When it takes the memory range off the free list it should call
zone_device_page_init() to make it ready to be used again. I think it
is a poor argument to say that zone_device_page_init() should rely on
values already in the struct page to work properly :\

The usable space within the struct page, and what values must be fixed
for correct system function, should exactly mirror what frozen pages
require. After free it is effectively now a frozen page owned by the
device driver.

I haven't seen any documentation on that, but I suspect Matthew and
David have some ideas..

If there is a reason for order, flags and mapping to be something
particular then it should flow from the definition of frozen pages,
and be documented, IMHO.

Jason
