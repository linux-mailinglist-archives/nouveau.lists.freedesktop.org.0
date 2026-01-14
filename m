Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8633BD216E2
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 22:48:35 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B077910E69B;
	Wed, 14 Jan 2026 21:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="P6vtWoYC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CFD0444CAC;
	Wed, 14 Jan 2026 21:40:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768426801;
 b=G+dEbuCSG/j/J2KvSg8qdE0VGpPPbBCmYQq2w0XrPvsCKVO8CS7ZlkFZNR/hS+qZz7rSH
 PDNSzzPliNWRYZP4IWbowdpahsLovCGopXHxF9Camxd2ZDUknOZfrUNrT1LnosXWLQlQK+f
 L/vbpJ7rBa+KFt7tMRd/rz4YsDzZJbzSgQjVxVWszDIsOcgT82sEAVKdHCzL5YPqIspKXP4
 AjujNSdJYt2pkjqXgqwbNhr/qXNvV5LitLIfrOESAR+4VQlN79oSJUrj9mCGgyriHw4m0Is
 DbZoGkB1R7xGtbTUhLAKfaLzzKBDi0YWn///XnYCBjztnqxNuUBlJP9GGriQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768426801; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vs+/0N8xgH8/A9zak6RnbC/vymouvc1DzX8sAGTp+9k=;
 b=rfwbFRhe5RZNAA9es0gMyWzm6oq/QvbdO+6vroyqaKwkmONCL+fMYjQ76NRl6wyrF5kZM
 PjxjwfRd3QOyHG5IFLRkr/2pmdAM3E3MwyERUf/AIpfHrLY6uTirKv6gazSSGjGMKzlN5hq
 1TzSPRYDlFyEILVPCkf9GEPcHr6TPDcgSIrwx6xb16+WQjSMm1qjEs7BcNcHGFtTrA5pfCY
 fnIY+6PHv3hl2HQtbyiNjbUOw3SiPe3/LC9tIb/LwKeLiPI80EIJlRgN7f2D3KS5zZPehlw
 ZQ1R7D2zPVmj9LZn3JnV1TW7vTJESOdCigSUnH9bDzylExLndal58hm2FA5w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2C2A244B9D
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 21:39:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 695FE10E695;
	Wed, 14 Jan 2026 21:48:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 105006001D;
	Wed, 14 Jan 2026 21:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94455C4CEF7;
	Wed, 14 Jan 2026 21:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768427306;
	bh=sVjE+SfQsdIUMHLLdK2WZZMe9meeOIqp+vLdzF39rao=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P6vtWoYCIlr2XYuGHN8Ct1JWv57QVflPPPZ09aqbdSf6sWvv6Psm4BbFl9dEKxvME
	 9IiuEcpRE83qTyXp72NniYCaihdkRtUtnm5MV6es8ZMUNP2zri1F+QO+WeYttAzUaW
	 ul+FCK9Uuub6AWdHHLL0xvAdQEb3R2ZlrFvcN/18=
Date: Wed, 14 Jan 2026 13:48:25 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-Id: <20260114134825.8bf1cb3e897c8e41c73dc8ae@linux-foundation.org>
In-Reply-To: <20260114192111.1267147-2-francois.dugast@intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
	<20260114192111.1267147-2-francois.dugast@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SNT6MIUVO4N5GKB3YBTBKCTTBNZLSKFG
X-Message-ID-Hash: SNT6MIUVO4N5GKB3YBTBKCTTBNZLSKFG
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SNT6MIUVO4N5GKB3YBTBKCTTBNZLSKFG/>
Archived-At: 
 <https://lore.freedesktop.org/20260114134825.8bf1cb3e897c8e41c73dc8ae@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 14 Jan 2026 20:19:52 +0100 Francois Dugast <francois.dugast@intel.com> wrote:

> Reinitialize metadata for large zone device private folios in
> zone_device_page_init prior to creating a higher-order zone device
> private folio. This step is necessary when the folio’s order changes
> dynamically between zone_device_page_init calls to avoid building a
> corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> must be passed in from the caller because the pgmap stored in the folio
> page may have been overwritten with a compound head.

Thanks.  What are the worst-case userspace-visible effects of the bug?
