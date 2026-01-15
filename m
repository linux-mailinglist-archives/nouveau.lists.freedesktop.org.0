Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B525D2228F
	for <lists+nouveau@lfdr.de>; Thu, 15 Jan 2026 03:40:50 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BEE4910E6A7;
	Thu, 15 Jan 2026 02:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Vfb3gBTf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7BA9C44CAC;
	Thu, 15 Jan 2026 02:32:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768444336;
 b=YhZB4alfnr0ELKlp2YrzODdVz/XbW3s5EuYDIqTVmGGvZ3NYi13+6dWDumCqnluUPPUot
 CWLEri7jaM74qpdPDaiYHQSO089gv9n4nyPu5uJXtBZUUxCrBuJGm7kLKUzxDFDacDb3+9G
 m99UgmB+WcHEdPjxv1zJnwUQBuOZ4KMuIYMvbpUrDeqbuOCcImI/JNcWQz6v82ssgFircXy
 +yJ7IjLivEWIxKbGg6CfKYNo1F5HXNy0SnTqhFdBBVRaneo8S+pBgd2O0oBlrDUJKJFknjT
 OfBdjCl6kNvRAHsshPnB+ttC9ZNr3RvvL0Aa3gyS+QpkBqmFPebuYHttvQlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768444336; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wPg1Rmvkx3e8pTULbrjUB1f5F5lTCXFNy35V+rVVRpY=;
 b=QJ1q8+j02ayXuB7yfeMr17kkT0r2QGSzRPSV3Oqo3TKfwYVK1RpC84kH29rklgMNLmjNb
 CKn6y6HvYEsAp+4lt28hw/aTOG/WpUVQsw1zqXaD7mhkSvtx5o6TRbeeXcDA6pnNHiYk72t
 y1/9VxPRnK4N2CJ7ovDGv8HYc2PwHXO8hBsWntEgy8n1WYOSNbVPYOPdh1cX2nMEZniaWXa
 c1KkuA/a+PdXy+Nyls7krwneNtzOcmk0Y1260grnxskbbbYbC3Gm0SPehVe8UKudTn0FIQK
 M945FUHdRr78cZqzkxf6lah0Gn29TurXycc3n/bmmP+Kc15siivX4W45euYA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 83F6844BAD
	for <nouveau@lists.freedesktop.org>; Thu, 15 Jan 2026 02:32:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9E42D10E6A3;
	Thu, 15 Jan 2026 02:40:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1036C60144;
	Thu, 15 Jan 2026 02:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4C2C4CEF7;
	Thu, 15 Jan 2026 02:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768444844;
	bh=kEIihbTO7hsA7HfHf64JRGq8WxboK1l9W0XcXEHbfeo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Vfb3gBTf+rsrpPAPcJ/Dig6SSOOLelLK4b09yec6FTVrBjTNJT3KBH/W/IuyCOUUG
	 rWCMabju6IaOer0i0XS9FstGNEW6IG96OZlxk9eDNmuYljuhHuOo2Q6G5GIosWUK/o
	 TtHClSrBGTI6P5GEFzOrr+RjoUt0V7nWJ0JUctS8=
Date: Wed, 14 Jan 2026 18:40:42 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-Id: <20260114184042.64fc3df3e43e6e62870bb705@linux-foundation.org>
In-Reply-To: <aWgr9Fp+0AeTu4zL@lstrano-desk.jf.intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
	<20260114192111.1267147-2-francois.dugast@intel.com>
	<20260114134825.8bf1cb3e897c8e41c73dc8ae@linux-foundation.org>
	<aWgn/THidvOQf9n2@lstrano-desk.jf.intel.com>
	<aWgr9Fp+0AeTu4zL@lstrano-desk.jf.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VSKGXT5I4I6CMDVLLI5DOSRAUPE3QS2Y
X-Message-ID-Hash: VSKGXT5I4I6CMDVLLI5DOSRAUPE3QS2Y
X-MailFrom: akpm@linux-foundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VSKGXT5I4I6CMDVLLI5DOSRAUPE3QS2Y/>
Archived-At: 
 <https://lore.freedesktop.org/20260114184042.64fc3df3e43e6e62870bb705@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 14 Jan 2026 15:51:16 -0800 Matthew Brost <matthew.brost@intel.com> wrote:

> On Wed, Jan 14, 2026 at 03:34:21PM -0800, Matthew Brost wrote:
> > On Wed, Jan 14, 2026 at 01:48:25PM -0800, Andrew Morton wrote:
> > > On Wed, 14 Jan 2026 20:19:52 +0100 Francois Dugast <francois.dugast@intel.com> wrote:
> > > 
> > > > Reinitialize metadata for large zone device private folios in
> > > > zone_device_page_init prior to creating a higher-order zone device
> > > > private folio. This step is necessary when the folio’s order changes
> > > > dynamically between zone_device_page_init calls to avoid building a
> > > > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > > > must be passed in from the caller because the pgmap stored in the folio
> > > > page may have been overwritten with a compound head.
> > > 
> > > Thanks.  What are the worst-case userspace-visible effects of the bug?
> > 
> > If you reallocate a subset of pages from what was originally a large
> > device folio, the pgmap mapping becomes invalid because it was
> > overwritten by the compound head, and this can crash the kernel.
> > 
> > Alternatively, consider the case where the original folio had an order
> > of 9 and _nr_pages was set. If you then reallocate the folio plus one as
> 
> s/_nr_pages/the order was encoded the page flags.
> 
> ...
>
> s/best to have kernel/best to not have kernels
> 

Great, thanks.  I pasted all the above into the changelog to help
explain our reasons.  I'll retain the patch in mm-hotfixes, targeting
6.19-rcX.  The remainder of the series is DRM stuff, NotMyProblem.  I
assume that getting this into 6.19-rcX is helpful to DRM - if not, and
if taking this via the DRM tree is preferable then let's discuss.

Can reviewers please take a look at this reasonably promptly?


btw, this patch uses

+		struct folio *new_folio = (struct folio *)new_page;

Was page_folio() unsuitable?

