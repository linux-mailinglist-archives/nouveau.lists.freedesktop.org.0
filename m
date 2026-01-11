Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 632FBD10136
	for <lists+nouveau@lfdr.de>; Sun, 11 Jan 2026 23:35:46 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 99BD710E240;
	Sun, 11 Jan 2026 22:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="DgDVv7+N";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 64A7E44C98;
	Sun, 11 Jan 2026 22:27:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768170439;
 b=Em/DWSe2qEkMELNYFkbY/PSGUu7wLowVhmsoJrme0GPnqoyHjcIiaHR85Qx2OM0Q0jtec
 pkeRhFpEGsMk/TdtMw6cp/SI5Wr6sOieYAmH46iKivf4ch1JGgwkIO4pyDvBbkfGLm+AVqH
 mSSe2HKn+f55Q3ATS/M4Ysp/ttEnHmVAQAs0fzgVlYkcjPyhvwIM2n5mYJb9CH1nmhTJLDw
 c9aQ7Hwfxkg4wj0n3czUyUu/HNqn7FYBGoeUilc2VBzQGzAmicnnCVv7l87L3C+rWy7GWdx
 MLu8eqZa2JNF+KG9wY5Ysh+XmSNHLaIE120+PdupVLvF1S/K++JdxpfvDdiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768170439; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=85a7PrT0zgtz96jS4pRWuysfpQ780Eq5/9sjyOwO120=;
 b=JIHexYKUif7XJev+iOtm2uvKg+hDQzy+tVoa6nWJ8FDEObrxBrL+LsOvuV3GErZAz7KfU
 Me6g4rZgOCHdzT+d8rFCHTFIF5ThGEecHF2mJ5rKThX3V8U0xLJ9FZAChEdWr0AedS3BG3v
 R4sQA8qn8lozc+PlW/Ed9q9eyPXWUErCaBaDWpQTzD8M3+xUZTvKTFTsQvpGTkND5h1y2jA
 A33yxOlWx/ekTl6Qa2cHUjSPb3y8J2rmgI7LxVp+uH7HAOuoMEedEL/iRmRaORQxb+W35IZ
 tF4v4vBZ4X6ndKRiHb45yyMSL5EjTnPhNW8s5a7VIT5TG+DW3HGvcDB2SnoQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=infradead.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=infradead.org
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=infradead.org; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=infradead.org
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D32F64047F
	for <nouveau@lists.freedesktop.org>; Sun, 11 Jan 2026 22:27:14 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2ED10E009;
	Sun, 11 Jan 2026 22:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=85a7PrT0zgtz96jS4pRWuysfpQ780Eq5/9sjyOwO120=; b=DgDVv7+Nsz6PtaysJzaqZ6PHpD
	7eUBRGwOGYg9vHMBVIIPRyiBnuK76spGj3oXGGj4wyZX6r9oSGMmnZMYwWnWBiZ1rsCyNHXnn/f2D
	pG9odPnA+wDKBP7AaT6hVx/Qw9COSWSROCEpkSZ7f9xAUG3jNo3/Q8MyXGSwhueXWLlKS1h4mINFP
	tkajdWvGC1JmwhHglaEtAwZA+VRaFUNjOp0M1oggFAASNkZRm0WT5lB4Uyn7kVavnYAkCwaCqq7YL
	sz0+a7OdQLxR4KwcjKCIJTe2EekXRoEuSZH9JJPqycDT5s/znS4lx8ndXQg4tuCRgX8duH0UlsxPa
	j2NF+t2w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux))
	id 1vf41z-00000002OPX-35go;
	Sun, 11 Jan 2026 22:35:31 +0000
Date: Sun, 11 Jan 2026 22:35:31 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <aWQlsyIVVGpCvB3y@casper.infradead.org>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260111205820.830410-2-francois.dugast@intel.com>
Message-ID-Hash: Y7ZJDYUJYWTU2J4ZVYPOFMNBDFHONNKS
X-Message-ID-Hash: Y7ZJDYUJYWTU2J4ZVYPOFMNBDFHONNKS
X-MailFrom: willy@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Y7ZJDYUJYWTU2J4ZVYPOFMNBDFHONNKS/>
Archived-At: 
 <https://lore.freedesktop.org/aWQlsyIVVGpCvB3y@casper.infradead.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun, Jan 11, 2026 at 09:55:40PM +0100, Francois Dugast wrote:
> The core MM splits the folio before calling folio_free, restoring the
> zone pages associated with the folio to an initialized state (e.g.,
> non-compound, pgmap valid, etc...). The order argument represents the
> folio’s order prior to the split which can be used driver side to know
> how many pages are being freed.

This really feels like the wrong way to fix this problem.

I think someone from the graphics side really needs to take the lead on
understanding what the MM is doing (both currently and in the future).
I'm happy to work with you, but it feels like there's a lot of churn right
now because there's a lot of people working on this without understanding
the MM side of things (and conversely, I don't think (m)any people on the
MM side really understand what graphics cards are trying to accomplish).

Who is that going to be?  I'm happy to get on the phone with someone.
