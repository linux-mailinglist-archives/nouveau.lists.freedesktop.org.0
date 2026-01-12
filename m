Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE97D15000
	for <lists+nouveau@lfdr.de>; Mon, 12 Jan 2026 20:28:24 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFE310E2C7;
	Mon, 12 Jan 2026 19:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Ccmkqi1S";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4A0C544CA9;
	Mon, 12 Jan 2026 19:19:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768245595;
 b=BRivHbUpTpRn8Ot5QWHVa/lMb7vSKsPN1JUHI1rPe2m3r5GY06yH2l1xtIhqG+JO8Dner
 qjT6ZvY9tKFM/cWz2RNB6eVHtIXZC+y4BOJUb/6IIIb7h/O919je7BXpnq9BKLJiEAuf0Xx
 sfuwreKO/jqTj02qb24YTFJOJ/TWTpOTjvYDTc/EmnZ6lGb46ONL33NHrcI6gsq3W0+beDv
 S53UA1DTRTw4RqteQqBSY+HLnalrWBnHqYcZWe1pbxGahSkZDQSiIh9/I7Uq9gEjOjxncDq
 7qsd23LqJQNcOFJO5TnOYd4yZPsUSkbuu3hfe/10Mj5ruJS5x/CG9rNmHeNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768245595; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=a9AdLI7uJUYtOYd89GixDifcE7N5970uW2swaB6ncSw=;
 b=dg1jF+722ZvtVpH/lIXI11ctGSxkZXsUxvuMs0l42LVu3sTd2dedA6h571Hvn8gid5C7s
 DiLWopFcHNp9pp+L70+T/uItYcQB88m3EuUt67/BiSIxwR3zGDwB14W4dIJjLGKa1oCLnW1
 kndtjhLlFxUXQlHOuBeYaqGSPocZas7FkRPn00XoMQ3pDI/Ypw0wggOZ69zBW41CknfyLYZ
 a5etl4bdmWdaZ7gyC0lBrxZ+ixGydXIAvb7sn5+tKD+L3BpifCFMhUM3veHV3lwathHC/hK
 pFKrTc5sHYtA+SQrb5f1iTrFNKoQdjX1WiiiFw9KQzPDxD1DyXT2LR0khlfQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 20E7844C87
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 19:19:52 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1A48310E2B6
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 19:28:19 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-8b2d7c38352so584592285a.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 12 Jan 2026 11:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768246098; x=1768850898;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a9AdLI7uJUYtOYd89GixDifcE7N5970uW2swaB6ncSw=;
        b=Ccmkqi1SsEOtm3ZU7Ws11jAuKhWF/D0sLD5Hn2H58ZM+OktVgBJ6+CH+PmPrcm34TT
         qoEfEP6dPxpWYw3+VCcB83NU8BoPJ30yUGNUsa42KnIK8pdX2ysoZzq2QkGVrFSW4S/+
         EoUfbuloGWx5kmzvViEb0QTUePypfweEdIYbsu9jdkgxIRF6CLjmXvkKAF0RusP4d9Xj
         DWhJXqBuzCnh1P7RqbQZzyBFeZNadxI/baj6zyKneT5Ihfz/RPRFoRKV2M83EjlIGvZO
         2b+j5EggJAM9goErNaStya+xrhi+v6icfYEJINtTCtBjXJQaOp/7ZCXqC7i2PVHJe82q
         bQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768246098; x=1768850898;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9AdLI7uJUYtOYd89GixDifcE7N5970uW2swaB6ncSw=;
        b=o5HaaoAoA4/8xrMC2Ss2b0v6i9Ci9kAqigykoGiQnoq9xhGBs7oHNy6ZlzXMRHppwq
         /FPXCoHYMsIWDsWdRZYSrtkvPt9VtvG3Trax2FahwMSO7VitxdcfimOquqv27KukGiqM
         DcWs+CSY4oSLuY7sxrR311I+JgOoyALVWLVXZ22j49vK2x3C79a03ycqe/j6ZIhhEegM
         onB+9WJmy/SbwcPHEZ18hlXysSz4ldTBDsDRYEt35QgJA3qrBbuu4IKFsSk3iVjkqlUd
         3W+G/FV0d1eWITpXtrrOkd7muAzGwSQ5KwA2UuO3Lgkk2ScgynwV6o11JxFj+NB2cBIW
         sf3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOEs7kUKW3ZWar2OouQa/ztzTwaS9deFZb1NzjLVmgepG3D0iPKpuFry+aaTi8heoVS7LnLrxk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWvPQNlK1iYONEYGCriBb9r0gfrDwZ/XAs0hMLrsqMV6WEXYZq
	SeQex+FuRXvZ/CQpCLSCMrg0r8cwfqSXxyQd/KNWU1o0fjrN4x/nokoOzCn2Zk6YsII=
X-Gm-Gg: AY/fxX4WheU8u7YZUCNoDBK5QdahX9emvwBxGULDbXWv6bcR+WA2Ncac9gb1t6N+By5
	Qte/b0zdt+xmDnq2J7tKM8Wd1FAAqgjyA/xiYgCRbzgf6+u7VBfeqU+yqwMgbaytSixfuZODvSf
	PT+AmoYkNFK+Wc/OKpM922IhdxYK5anaOr5I3kIBuVvmRp3w1AFoTFnqc5ZuYSkfXr4CW+ky0q2
	R3VDiwB5nhhSxTp3KqSA8HgVNhAjUOMvI1FY4HadWCOIi+IXH2oAJwNtqGfFk725A0extsSobqJ
	Gkm92N69i0rxYMC1xNmyYB+6PVKnFC8xIbyNnpnq7gpyFHnxrayyZnxjsVElSWVYoutBv+hrMRO
	hFvlgOKoK6YZP3H8mvxJey7DTyja4TFztqsJs29O5xrqynfL+w70ouqn3Wn2WXDfi6LAF8bkhQq
	HGvc5VCo//x0GVK92GJq/2KzKv7gld6hvGMQXdz2PEGkeHNFqH9R8k6zF3MPlC/lFr9O4=
X-Received: by 2002:a05:620a:1726:b0:8b8:7f8d:c33b with SMTP id
 af79cd13be357-8c5208f18e3mr71372585a.43.1768246097807;
        Mon, 12 Jan 2026 11:28:17 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f4cd7a3sm1609425185a.24.2026.01.12.11.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 11:28:16 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfNaK-00000003cxB-192v;
	Mon, 12 Jan 2026 15:28:16 -0400
Date: Mon, 12 Jan 2026 15:28:16 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <20260112192816.GL745888@ziepe.ca>
References: <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
 <20260112165001.GG745888@ziepe.ca>
 <86D91C8B-C3EA-4836-8DC2-829499477618@nvidia.com>
 <20260112182500.GI745888@ziepe.ca>
 <6AFCEB51-8EE1-4AC9-8F39-FCA561BE8CB5@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6AFCEB51-8EE1-4AC9-8F39-FCA561BE8CB5@nvidia.com>
Message-ID-Hash: OWHSKYGI7F4SEXCETV6OW7WEIE25K7QG
X-Message-ID-Hash: OWHSKYGI7F4SEXCETV6OW7WEIE25K7QG
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OWHSKYGI7F4SEXCETV6OW7WEIE25K7QG/>
Archived-At: <https://lore.freedesktop.org/20260112192816.GL745888@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Jan 12, 2026 at 01:55:18PM -0500, Zi Yan wrote:
> > That's different, I am talking about reaching 0 because it has been
> > freed, meaning there are no external pointers to it.
> >
> > Further, when a page is frozen page_ref_freeze() takes in the number
> > of references the caller has ownership over and it doesn't succeed if
> > there are stray references elsewhere.
> >
> > This is very important because the entire operating model of split
> > only works if it has exclusive locks over all the valid pointers into
> > that page.
> >
> > Spurious refcount failures concurrent with split cannot be allowed.
> >
> > I don't see how pointing at __folio_freeze_and_split_unmapped() can
> > justify this series.
> >
> 
> But from anyone looking at the folio state, refcount == 0, compound_head
> is set, they cannot tell the difference.

This isn't reliable, nothing correct can be doing it :\

> If what you said is true, why is free_pages_prepare() needed? No one
> should touch these free pages. Why bother resetting these states.

? that function does alot of stuff, thinks like uncharging the cgroup
should obviously happen at free time.

What part of it are you looking at?

> > You can't refcount a folio out of nothing. It has to come from a
> > memory location that already is holding a refcount, and then you can
> > incr it.
> 
> Right. There is also no guarantee that all code is correct and follows
> this.

Let's concretely point at things that have a problem please.

> My point here is that calling prep_compound_page() on a compound page
> does not follow core MM’s conventions.

Maybe, but that doesn't mean it isn't the right solution..

Jason
