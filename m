Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC20201D68
	for <lists+nouveau@lfdr.de>; Fri, 19 Jun 2020 23:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20056EC37;
	Fri, 19 Jun 2020 21:57:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096886EC32
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jun 2020 21:57:08 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eed34800007>; Fri, 19 Jun 2020 14:56:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 19 Jun 2020 14:57:07 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 19 Jun 2020 14:57:07 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Jun
 2020 21:56:59 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 19 Jun 2020 21:56:59 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5eed34aa0003>; Fri, 19 Jun 2020 14:56:58 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-rdma@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 19 Jun 2020 14:56:33 -0700
Message-ID: <20200619215649.32297-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592603776; bh=cY2z0OG1pUaoe5jBUN9mz4n6ug8KS7Y4KUbr8HDt6lM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=h9Ue237VUS0DYlx4+ZPf7DBfdsfGNigyNS8eyYLe4mqxhix4iw4hCoiwj2ACeJcIP
 cOTmq6M+LU527F7YEWJ/54n1+Y5dEeKouADPnbmr/KPkjT3o7tPCziz0MoMr3pTyp8
 A1HW3B5f4n7FfjOHYCOtmc7IWlH5MRslPGnMBkrylKMFrXZnTHcKMnGmyTWhiSDiR3
 HOTG6yr7LJLQEWip29sWfhQOotCaV5PlNKnifKnVuKEFYI9228oqDmbwJnbmLHiKu7
 8L0xm1X2SJ5LKTbMoZamhFqZdsFKD5qaniMTzm5doSBLxYF69Hm2lMaHC1hEA3Rdja
 a/eQhOsyz/uLA==
Subject: [Nouveau] [PATCH 00/16] mm/hmm/nouveau: THP mapping and migration
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Ralph Campbell <rcampbell@nvidia.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

These patches apply to linux-5.8.0-rc1. Patches 1-3 should probably go
into 5.8, the others can be queued for 5.9. Patches 4-6 improve the HMM
self tests. Patch 7-8 prepare nouveau for the meat of this series which
adds support and testing for compound page mapping of system memory
(patches 9-11) and compound page migration to device private memory
(patches 12-16). Since these changes are split across mm core, nouveau,
and testing, I'm guessing Jason Gunthorpe's HMM tree would be appropriate.

Ralph Campbell (16):
  mm: fix migrate_vma_setup() src_owner and normal pages
  nouveau: fix migrate page regression
  nouveau: fix mixed normal and device private page migration
  mm/hmm: fix test timeout on slower machines
  mm/hmm/test: remove redundant page table invalidate
  mm/hmm: test mixed normal and device private migrations
  nouveau: make nvkm_vmm_ctor() and nvkm_mmu_ptp_get() static
  nouveau/hmm: fault one page at a time
  mm/hmm: add output flag for compound page mapping
  nouveau/hmm: support mapping large sysmem pages
  hmm: add tests for HMM_PFN_COMPOUND flag
  mm/hmm: optimize migrate_vma_setup() for holes
  mm: support THP migration to device private memory
  mm/thp: add THP allocation helper
  mm/hmm/test: add self tests for THP migration
  nouveau: support THP migration to private memory

 drivers/gpu/drm/nouveau/nouveau_dmem.c        | 177 +++++---
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 241 +++++------
 drivers/gpu/drm/nouveau/nouveau_svm.h         |   3 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/base.c    |   6 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/priv.h    |   2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   3 -
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |  29 +-
 include/linux/gfp.h                           |  10 +
 include/linux/hmm.h                           |   4 +-
 include/linux/migrate.h                       |   1 +
 include/linux/mm.h                            |   1 +
 lib/test_hmm.c                                | 359 ++++++++++++----
 lib/test_hmm_uapi.h                           |   2 +
 mm/hmm.c                                      |  10 +-
 mm/huge_memory.c                              |  46 ++-
 mm/internal.h                                 |   1 -
 mm/memory.c                                   |  10 +-
 mm/memremap.c                                 |   9 +-
 mm/migrate.c                                  | 236 +++++++++--
 mm/page_alloc.c                               |   1 +
 tools/testing/selftests/vm/hmm-tests.c        | 388 +++++++++++++++++-
 22 files changed, 1203 insertions(+), 346 deletions(-)

-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
