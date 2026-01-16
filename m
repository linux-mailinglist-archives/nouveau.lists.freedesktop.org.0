Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336D6D3894C
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 23:34:42 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 334AE10E1FD;
	Fri, 16 Jan 2026 22:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NLUgKdV5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D25E244CAA;
	Fri, 16 Jan 2026 22:26:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768602363;
 b=lsV0GD+isXY6oK00splgYB5tC5Z9gIm3CfeGtSeVHjD2oMuBzUjTeSjmsvhXZVk/Y+vix
 FWDThqZCtgwOFwVaj3Pq52rDp0OYq2eEJ6wa5RsqjpHTlKtBdyyG1JkP97NpRyoONbSuPn9
 NVCqw0e7mEmOMibzfyiNyjgU92JTO+sjV3oTsYA7bAIob8L3nEnef7++pH0ybiv/qgZAY5B
 IT2nJeqyDswafL9ZVDmrDcSPMqfITPDUiLnkvOzh7UzAXm/TiR8BD3VMF3ZPw56QSyuuYs1
 598qU6kN3FUqv0vxDHLqx1OJOlkQWUBGKhmm1XUlIvY26Pg6RBc6fi4ks2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768602363; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lwkYngeioKbxDRwX4+wJC8A9juDqdXklK5QTVnHLsAE=;
 b=LQyJ6pZybSV1KpyzuTMW5mulSo2rPoq1KJ+M6+OFHqDaFH2jUa5m50BmEJ+v4KsIu3wS1
 XP/9SatDpMZ17+KAu73/arL/f+tg66sFoCtVK3vcvckkhzJdvl2tDk8dH9sUNikDTZRoRRn
 nD2Gd2HmxQ9kbeSJIiMGpWVcEdv8zLu6TNE96FEw5TTeGPfdV6Up39mJKNQH1MYBdv0L+39
 SUAy8hR7mpOhpSon+fAioNzaoGJi3K3lXpv27JLDN0Rd5wb2TuHOFxhwoj+txqfrq6qSYYy
 iL7+P9cn3zuh4LdKH/qYSo+uOwISxX8DFnlqq152ZNnJdhdnMb8qpwA/g3Iw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 81E0540744
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 22:26:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 028EE10E26B;
	Fri, 16 Jan 2026 22:34:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9074D60169;
	Fri, 16 Jan 2026 22:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C71AC116C6;
	Fri, 16 Jan 2026 22:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768602874;
	bh=kVpnh95TVOJW8VAQPIPSr+AtflaSPXQdvwC6ha92XDY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NLUgKdV5rMmMraQ4VO7tdHdrJG5WmEsW2juttELKBYBSDejVV0hR/IQgTFpr6tYdn
	 f5JOdy9G2qNC3TIB3r9ZkeZQVi40l9CLIQGFYANM/qzbhKj84KDPLBY+TLopNEs9gP
	 AXuzcWaHlQVHSDIiihDEiNj6+9fQ5Vr/JnmhU0fs=
Date: Fri, 16 Jan 2026 14:34:32 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-Id: <20260116143432.50b98d6dc965b94f3b915333@linux-foundation.org>
In-Reply-To: <20260116111325.1736137-2-francois.dugast@intel.com>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
	<20260116111325.1736137-2-francois.dugast@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GOH5VGBIDM6UMXAI3HXGEV6DE3WAKK53
X-Message-ID-Hash: GOH5VGBIDM6UMXAI3HXGEV6DE3WAKK53
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GOH5VGBIDM6UMXAI3HXGEV6DE3WAKK53/>
Archived-At: 
 <https://lore.freedesktop.org/20260116143432.50b98d6dc965b94f3b915333@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 16 Jan 2026 12:10:16 +0100 Francois Dugast <francois.dugast@intel.com> wrote:

> Reinitialize metadata for large zone device private folios in
> zone_device_page_init prior to creating a higher-order zone device
> private folio. This step is necessary when the folio’s order changes
> dynamically between zone_device_page_init calls to avoid building a
> corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> must be passed in from the caller because the pgmap stored in the folio
> page may have been overwritten with a compound head.
> 
> Without this fix, individual pages could have invalid pgmap fields and
> flags (with PG_locked being notably problematic) due to prior different
> order allocations, which can, and will, result in kernel crashes.

Is it OK to leave 6.18.x without this fixed?
