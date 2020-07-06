Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 362F9216174
	for <lists+nouveau@lfdr.de>; Tue,  7 Jul 2020 00:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD866E135;
	Mon,  6 Jul 2020 22:24:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAB86E135
 for <nouveau@lists.freedesktop.org>; Mon,  6 Jul 2020 22:24:04 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f03a41a0001>; Mon, 06 Jul 2020 15:22:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 06 Jul 2020 15:24:03 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 06 Jul 2020 15:24:03 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Jul
 2020 22:23:58 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 6 Jul 2020 22:23:58 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f03a47e0000>; Mon, 06 Jul 2020 15:23:58 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <kvm-ppc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 6 Jul 2020 15:23:42 -0700
Message-ID: <20200706222347.32290-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1594074138; bh=L1q+tY8XtVCJVAfZQvRMNXjLijJuUT/RKi3sLXZmr28=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=gkERmIj7sPNRqUTDSXWmzecTz0WtFK0U3kvh9q3hMeDHLm/Owv8u5sQcfDjbbRTz/
 +TgRzZRSMSZwtWLEi6CRcKCkUSasti32p/o8/XZ0mZzXiV34vDAdpZx/le+SAO8x0Q
 QLY/XEOfpmLryYdmMy62yrhZWa2bouIBs6hkQ/GsQZ7UlzXM1MR60Dt/TXPH3tUwV4
 OkmmZLR01IbgEZbiFd7QwnQl70JEualApo09S4soxZBIhCPDS8u02MIFDANsmL6Qx4
 8oVXc2Pps8U4J/YR2/KnPSmUqjfOXI5qq9o7B1Zu8N8mCMvGGrbsu1QshOx8Y/iaZi
 ZMd1XohWj+O7w==
Subject: [Nouveau] [PATCH 0/5] mm/migrate: avoid device private invalidations
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
Cc: Ralph
 Campbell <rcampbell@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Andrew
 Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The goal for this series is to avoid device private memory TLB
invalidations when migrating a range of addresses from system
memory to device private memory and some of those pages have already
been migrated. The approach taken is to introduce a new mmu notifier
invalidation event type and use that in the device driver to skip
invalidation callbacks from migrate_vma_setup(). The device driver is
also then expected to handle device MMU invalidations as part of the
migrate_vma_setup(), migrate_vma_pages(), migrate_vma_finalize() process.
Note that this is opt-in. A device driver can simply invalidate its MMU
in the mmu notifier callback and not handle MMU invalidations in the
migration sequence.

This series is based on linux-5.8.0-rc4 and the patches I sent for
("mm/hmm/nouveau: add PMD system memory mapping")
https://lore.kernel.org/linux-mm/20200701225352.9649-1-rcampbell@nvidia.com
There are no logical dependencies, but there would be merge conflicts
which could be resolved if this were to be applied before the other
series.

Also, this replaces the need for the following two patches I sent:
("mm: fix migrate_vma_setup() src_owner and normal pages")
https://lore.kernel.org/linux-mm/20200622222008.9971-1-rcampbell@nvidia.com
("nouveau: fix mixed normal and device private page migration")
https://lore.kernel.org/lkml/20200622233854.10889-3-rcampbell@nvidia.com

Ralph Campbell (5):
  nouveau: fix storing invalid ptes
  mm/migrate: add a direction parameter to migrate_vma
  mm/notifier: add migration invalidation type
  nouveau/svm: use the new migration invalidation
  mm/hmm/test: use the new migration invalidation

 arch/powerpc/kvm/book3s_hv_uvmem.c            |  2 ++
 drivers/gpu/drm/nouveau/nouveau_dmem.c        | 13 ++++++--
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 10 +++++-
 drivers/gpu/drm/nouveau/nouveau_svm.h         |  1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 13 +++++---
 include/linux/migrate.h                       | 12 +++++--
 include/linux/mmu_notifier.h                  |  7 ++++
 lib/test_hmm.c                                | 33 +++++++++++--------
 mm/migrate.c                                  | 13 ++++++--
 9 files changed, 77 insertions(+), 27 deletions(-)

-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
