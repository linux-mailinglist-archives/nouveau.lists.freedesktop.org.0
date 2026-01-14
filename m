Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCBCD2100C
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 20:21:48 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BF06910E677;
	Wed, 14 Jan 2026 19:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c5BfR4D6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2873944CAF;
	Wed, 14 Jan 2026 19:13:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768417994;
 b=SscpveXluDw9ujBERwnxytWYxno6eIvTLO5sOeeedUC8YEB1Wsx48UJYkSSyXelWWTx2p
 suYzy94LMUgNWsQksrXX6e99wLRyz8Poc3X5C6xHxqOzVWaUFmal6hfjMUPFQU/rchTnIqu
 TIRseLMYvz7LRjdmH0LIMgRnoWedt3vzQupCsYwobAVcqyWJfzA7j6AT2kg27ujJB2iV6Bz
 VxAGFTLbkjwnTf+mg/nSMUdf/AHKjG+w13Yia6PJhWFtGFQ9yj8WEW1UQZBrKLuFAmQ4L0d
 +6UWSHV3tbKrzNPLjS5pfpiTEni3riwFhV3Lwl9G168Fq6+EUEHy8zMMvBug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768417994; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vqzM2gqCcXkSyAl3o9QoHaz/KNUBsZJKsEmE8yUdCPk=;
 b=to6TZO3oxJkDf0SzNEKvpjeRUL+uDD8NrCF/0X3c4zZet4nDBjD6wtgmMoqEcPwfRvfWI
 QFFTvNaVPDFCPEaIeMxWp24AMVyfiStW4mODS4sgF24QYx99zijTo8GgWKUuSRVwwabOw/e
 6iBvwhVaVzKN5doaFhS1o50wBeVDQcp4LnwPZ9qQroh1Jz0q1Nfdj7aX/VzD6xSEbDkT8bD
 UKc1JCkiY4BnvO1H/HhkAHUDec0s1b5Xun5TGBOjPF4ks+dy5thxyx4BmUOV36Ss3WBUAPy
 iyqr2ZyeCShCVyTK5ca1TRs7CD/VwjPoUP0fhIIb0CwM0U9QQDEGfWk9GrpQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E5594400E0
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:13:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3097F10E66F;
	Wed, 14 Jan 2026 19:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768418502; x=1799954502;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0Xr44qIt4aDZeFOuXJUWqKFpNwHw/ty79qHlHFXr8ng=;
  b=c5BfR4D6eHlFOp+wLlCQ/3b8mecEzY7wm+duto/Aeoug8l5SU6D0fTKp
   eWJGEZT2ySN1UltpxjYuq26QzXK7wA1gzIr3jM5edagmJqfncLu6xH40D
   IxKOv0JHg3DR7HSHLAKkFuowLgsN5RJVqySFXgu5+c6c0p0hohE7+Ah76
   XXrSmhapXXVS5wMvlz5Xl/hx4rkw9BOGaYyUCLz0IZJSgwJ5tFdCc+WXs
   vvGeMRexwjFpcL6g18sYXmqiw/Fxd8SPdPmBMqdI6ZNM+pIZZH63oGN51
   3vAJ3eZj/YvVUubuxxypV87L1EZeqMmss52utftJe8iV3vyzhoc96oXal
   w==;
X-CSE-ConnectionGUID: p45Yt6h5QbOq4hn+Xmmvxw==
X-CSE-MsgGUID: 9owP4Wf8QMa8cRTM4UZILA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="87305653"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800";
   d="scan'208";a="87305653"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 11:21:41 -0800
X-CSE-ConnectionGUID: 36cRy4BqT3ukGV7yMf/R4Q==
X-CSE-MsgGUID: oSiZugMJQPWWWoPWHLMztA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800";
   d="scan'208";a="236006778"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.244.85])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 11:21:33 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 0/5] Enable THP support in drm_pagemap
Date: Wed, 14 Jan 2026 20:19:51 +0100
Message-ID: <20260114192111.1267147-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AIOBMAYWPR5HOYEOMMW6VNWQPIL2DPIB
X-Message-ID-Hash: AIOBMAYWPR5HOYEOMMW6VNWQPIL2DPIB
X-MailFrom: francois.dugast@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>, Zi Yan <ziy@nvidia.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-fsdevel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AIOBMAYWPR5HOYEOMMW6VNWQPIL2DPIB/>
Archived-At: 
 <https://lore.freedesktop.org/20260114192111.1267147-1-francois.dugast@intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Use Balbir Singh's series for device-private THP support [1] and previous
preparation work in drm_pagemap [2] to add 2MB/THP support in xe. This leads
to significant performance improvements when using SVM with 2MB pages.

[1] https://lore.kernel.org/linux-mm/20251001065707.920170-1-balbirs@nvidia.com/
[2] https://patchwork.freedesktop.org/series/151754/

v2:
- rebase on top of multi-device SVM
- add drm_pagemap_cpages() with temporary patch
- address other feedback from Matt Brost on v1

v3:
The major change is to remove the dependency to the mm/huge_memory
helper migrate_device_split_page() that was called explicitely when
a 2M buddy allocation backed by a large folio would be later reused
for a smaller allocation (4K or 64K). Instead, the first 3 patches
provided by Matthew Brost ensure large folios are split at the time
of freeing.

v4:
- add order argument to folio_free callback
- send complete series to linux-mm and MM folks as requested (Zi Yan
  and Andrew Morton) and cover letter to anyone receiving at least
  one of the patches (Liam R. Howlett)

v5:
- update zone_device_page_init() in patch #1 to reinitialize large
  zone device private folios

Cc: Zi Yan <ziy@nvidia.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Logan Gunthorpe <logang@deltatee.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-pci@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-cxl@vger.kernel.org
Cc: nvdimm@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org

Francois Dugast (3):
  drm/pagemap: Unlock and put folios when possible
  drm/pagemap: Add helper to access zone_device_data
  drm/pagemap: Enable THP support for GPU memory migration

Matthew Brost (2):
  mm/zone_device: Reinitialize large zone device private folios
  drm/pagemap: Correct cpages calculation for migrate_vma_setup

 arch/powerpc/kvm/book3s_hv_uvmem.c       |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |   2 +-
 drivers/gpu/drm/drm_gpusvm.c             |   7 +-
 drivers/gpu/drm/drm_pagemap.c            | 158 ++++++++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |   2 +-
 include/drm/drm_pagemap.h                |  15 +++
 include/linux/memremap.h                 |   9 +-
 lib/test_hmm.c                           |   4 +-
 mm/memremap.c                            |  20 ++-
 9 files changed, 180 insertions(+), 39 deletions(-)

-- 
2.43.0

