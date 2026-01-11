Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D443CD0FDA3
	for <lists+nouveau@lfdr.de>; Sun, 11 Jan 2026 21:59:10 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3338F10E264;
	Sun, 11 Jan 2026 20:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCr9Phyf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1E93D44C93;
	Sun, 11 Jan 2026 20:50:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768164644;
 b=vRxNteaU5h2+HQJ5Qv6uhxaq/vD5vaEkdPw7j/6fmmrfHhypplv2H2rLosPkgAUZztMd2
 tBW2mFrQG5tlagIO2ijkGogjvmYFaJCFb11lVNDwnh/iysTTdM0cdXDHc4rI9/HFzlIzuD2
 +a7gj/jDscUP1J+kMhOJ1tfQeLoK20t3gUsHzkIPZI4mivk94OPyMW8OwpMdftnS8S1rgJd
 YlIbDn0CiPpjNEYzqV176MSPevmG1oU6Ctcl+/qnfSpiSdRjvXum2Il0DFmlrLgF2uKSCcJ
 44VJGa45rEW5jpMdhdjUj3spaT6udY/DYSAJotIvosqScQtS/KBCzKDH3kGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768164644; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZEv8icGYn2/NvIbauvVBK2h6w5hpiY+WnWQJBv0zutE=;
 b=HmTMt0JPubLHmvLpiDKMQNBdvzfgTSDfZUHNqcvbFupq3HcaI5qBY1SfejDZOsGYHMGte
 YAP5ZKkds0rYdcZjdceCEQ2DFmBQZ4OktYlXoMnhYrVxf52PghAPRqQXHdVK3lgCvijzbgV
 0WLSjdg5mw8A+pksQKaBS+8iu/wLTPw3Zk1IU44aavCq2sgM+c1SNZsLBB2Ggei6VvdrZfG
 TMIbWPmwKVHtV8xXtAR+Kqbn2bMW959Dqwu7fYzR+KprEeYKORQwY8lAotLZRqTSQ6qzaGd
 Q/ffyPLpnoVfsz9g1tC3MksVsiqSzq1btdciGLe/JiKtNJt0QDpFaoRz1eMw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A581543E41
	for <nouveau@lists.freedesktop.org>; Sun, 11 Jan 2026 20:50:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2524E10E0C7;
	Sun, 11 Jan 2026 20:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768165146; x=1799701146;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JowSG+4tQQyTE47Rbtpcgaez8ldKvXlCh+DCDwat3uA=;
  b=KCr9PhyfERHVC0FFL5f0bUnE3VBF21GzZpnAjMAEHSHGUNj4X7Jm2EGl
   VFilqUcSVnIwPkpWjd7hqBrKVMahXaa9YJbdJILBKrGQLJmjnOpG2eOPw
   ikQgRZStF+jT3w5YWGcPtxb4T9hVTXL2Bd0T+HNhYp/+L1aQFbgJgrCiZ
   2ceIyJ/X907T9eoDxrv4WDdvTw1Vd+Oe7J6QNQ8b9//uMD9CRPWv6ty4L
   AmvClJoQCX74BlkxIVUB1P5fxuSriiV/lJThwnBbrmrm3qvdFdeekJwls
   8N1kYtUAvDP5IhtYmGWSTk177GpTV5OyWfR+2zmM/NRixi/nXE5ob2x+P
   A==;
X-CSE-ConnectionGUID: u5h6LQMeRfK+EImVKhoHew==
X-CSE-MsgGUID: 1LflAFv6RXeenPU742gLQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80904655"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800";
   d="scan'208";a="80904655"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 12:59:05 -0800
X-CSE-ConnectionGUID: D5xpyBpvRRC3zs7F9qTySg==
X-CSE-MsgGUID: /4GjZEskTMOj7ia6RpYfqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800";
   d="scan'208";a="208419944"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.11])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 12:58:55 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/7] Enable THP support in drm_pagemap
Date: Sun, 11 Jan 2026 21:55:39 +0100
Message-ID: <20260111205820.830410-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HXAR3YGXATNYBVDYLB6VUGZUONHSB5RA
X-Message-ID-Hash: HXAR3YGXATNYBVDYLB6VUGZUONHSB5RA
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HXAR3YGXATNYBVDYLB6VUGZUONHSB5RA/>
Archived-At: 
 <https://lore.freedesktop.org/20260111205820.830410-1-francois.dugast@intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Use Balbir Singh's series for device-private THP support [1] and
previous preparation work in drm_pagemap [2] to add 2MB/THP support
in xe. This leads to significant performance improvements when using
SVM with 2MB pages.

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

Matthew Brost (4):
  mm/zone_device: Add order argument to folio_free callback
  mm/zone_device: Add free_zone_device_folio_prepare() helper
  fs/dax: Use free_zone_device_folio_prepare() helper
  drm/pagemap: Correct cpages calculation for migrate_vma_setup

 arch/powerpc/kvm/book3s_hv_uvmem.c       |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |   2 +-
 drivers/gpu/drm/drm_gpusvm.c             |   7 +-
 drivers/gpu/drm/drm_pagemap.c            | 165 ++++++++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |   4 +-
 drivers/pci/p2pdma.c                     |   2 +-
 fs/dax.c                                 |  24 +---
 include/drm/drm_pagemap.h                |  15 +++
 include/linux/memremap.h                 |   8 +-
 lib/test_hmm.c                           |   4 +-
 mm/memremap.c                            |  60 ++++++++-
 11 files changed, 227 insertions(+), 66 deletions(-)

-- 
2.43.0

