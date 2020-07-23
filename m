Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AA722B972
	for <lists+nouveau@lfdr.de>; Fri, 24 Jul 2020 00:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93216E34E;
	Thu, 23 Jul 2020 22:30:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2773F6E517
 for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2020 22:30:52 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1a0f200002>; Thu, 23 Jul 2020 15:28:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 23 Jul 2020 15:30:50 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 23 Jul 2020 15:30:50 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jul
 2020 22:30:40 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Thu, 23 Jul 2020 22:30:40 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f1a0f8f0005>; Thu, 23 Jul 2020 15:30:40 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <kvm-ppc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 23 Jul 2020 15:29:58 -0700
Message-ID: <20200723223004.9586-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595543328; bh=ZwXB9DTR4tPS7zaUfLV/qJCI/BkZe94g9qf7+cwfua0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=TVbFTQ16TWQJrMKOy3aejSRVgaoLbc4Vkm8uJUav1IGnV8UCNIxlcUNaIljT32lLT
 IFUkxKku3oiwD/s0KJPRD2Z5P92RzMfRlTNzyvob2p19ZeLstAi5XHAFOBPxyRoqHT
 XBNFeLeeyRWkhXkXYByL4G9XWOc7aVCZRw3V1jZnUEOyUtW4VjCR2X/5I3mN05w0Na
 7Hb+FGjZFJyT5e5+vPs3gJ8zif2PIR0pJ9PLBihz71appn3YYQeHz8jk2u5NBb1/Qg
 paTD0aiMmUhZsUuOny88asPXliyd2ClVGLWx7CS4R7UJwX67oKy4GfaMplRxnjuLZk
 rkNZaL4BWZv2Q==
Subject: [Nouveau] [PATCH v4 0/6] mm/migrate: avoid device private
 invalidations
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

This series is based on Jason Gunthorpe's HMM tree (linux-5.8.0-rc4).

Also, this replaces the need for the following two patches I sent:
("mm: fix migrate_vma_setup() src_owner and normal pages")
https://lore.kernel.org/linux-mm/20200622222008.9971-1-rcampbell@nvidia.com
("nouveau: fix mixed normal and device private page migration")
https://lore.kernel.org/lkml/20200622233854.10889-3-rcampbell@nvidia.com

Changes in v4:
Added reviewed-by from Bharata B Rao.
Removed dead code checking for source device private page in lib/test_hmm.c
  dmirror_migrate_alloc_and_copy() since the source filter flag guarantees
  that.
Added patch 6 to remove a redundant invalidation in migrate_vma_pages().

Changes in v3:
Changed the direction field "dir" to a "flags" field and renamed
  src_owner to pgmap_owner.
Fixed a locking issue in nouveau for the migration invalidation.
Added a HMM selftest test case to exercise the HMM test driver
  invalidation changes.
Removed reviewed-by Bharata B Rao since this version is moderately
  changed.

Changes in v2:
Rebase to Jason Gunthorpe's HMM tree.
Added reviewed-by from Bharata B Rao.
Rename the mmu_notifier_range::data field to migrate_pgmap_owner as
  suggested by Jason Gunthorpe.

Ralph Campbell (6):
  nouveau: fix storing invalid ptes
  mm/migrate: add a flags parameter to migrate_vma
  mm/notifier: add migration invalidation type
  nouveau/svm: use the new migration invalidation
  mm/hmm/test: use the new migration invalidation
  mm/migrate: remove range invalidation in migrate_vma_pages()

 arch/powerpc/kvm/book3s_hv_uvmem.c            |  4 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c        | 19 ++++++--
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 21 ++++-----
 drivers/gpu/drm/nouveau/nouveau_svm.h         | 13 +++++-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 13 ++++--
 include/linux/migrate.h                       | 16 +++++--
 include/linux/mmu_notifier.h                  |  7 +++
 lib/test_hmm.c                                | 43 +++++++++----------
 mm/migrate.c                                  | 34 +++++----------
 tools/testing/selftests/vm/hmm-tests.c        | 18 ++++++--
 10 files changed, 112 insertions(+), 76 deletions(-)

-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
