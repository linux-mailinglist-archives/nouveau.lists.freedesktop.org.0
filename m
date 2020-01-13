Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB678139CCB
	for <lists+nouveau@lfdr.de>; Mon, 13 Jan 2020 23:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39E36E18E;
	Mon, 13 Jan 2020 22:47:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374C76E18E
 for <nouveau@lists.freedesktop.org>; Mon, 13 Jan 2020 22:47:14 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e1cf35d0000>; Mon, 13 Jan 2020 14:46:53 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 13 Jan 2020 14:47:13 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 13 Jan 2020 14:47:13 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 13 Jan
 2020 22:47:13 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 13 Jan
 2020 22:47:08 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 13 Jan 2020 22:47:08 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e1cf36c0000>; Mon, 13 Jan 2020 14:47:08 -0800
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <linux-kselftest@vger.kernel.org>
Date: Mon, 13 Jan 2020 14:46:57 -0800
Message-ID: <20200113224703.5917-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578955614; bh=GtpVYgdrH9GxiIGh9Ju0Oa4D1/CloNN687n7bW51geE=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Type:
 Content-Transfer-Encoding;
 b=Y7rvFnSM4iRHDwseUUWaELIuTHKcEFFIaH5/m8ENvfphgVQR51TPPRfVQqqo9zpBK
 eG2bx2Ivw3Ff6Dz9eiYiLe8NUX9gquL9HyQtXZUFV2xrbwj7AwyNmVTavn5CYCp7kk
 pSshU3e+cgcfKMmc+GLHsinZsyTdP04xDsabWYXB6Bud19kV9e4vWYF1yVtRjQ5b36
 1CJWjYi0Je66h2qAH5g5ITKDt1e3dA7QoQz3cA7SUrUO/FDM7u0UAjIBh19JsuDpPi
 M7WOuIEM2Bmxkzu3tmBCdM2zqWIRyH15QVIDTMQiJcFzwkM0vQDTAfLP8oCI3aMmMM
 vNEWucdAgAXEA==
Subject: [Nouveau] [PATCH v6 0/6] mm/hmm/test: add self tests for HMM
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
 Ben Skeggs <bskeggs@redhat.com>, Andrew
 Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This series adds new functions to the mmu interval notifier API to
allow device drivers with MMUs to dynamically mirror a process' page
tables based on device faults and invalidation callbacks. The Nouveau
driver is updated to use the extended API and a set of stand alone self
tests is added to help validate and maintain correctness.

The patches are based on linux-5.5.0-rc6 and are for Jason's rdma/hmm tree
since I believe he is planning some interval notifier changes.

Changes v5 -> v6:
Rebase to linux-5.5.0-rc6
Refactored mmu interval notifier patches
Converted nouveau to use the new mmu interval notifier API

Changes v4 -> v5:
Added mmu interval notifier insert/remove/update callable from the
  invalidate() callback
Updated HMM tests to use the new core interval notifier API

Changes v1 -> v4:
https://lore.kernel.org/linux-mm/20191104222141.5173-1-rcampbell@nvidia.com

Ralph Campbell (6):
  mm/mmu_notifier: add mmu_interval_notifier_insert_safe()
  mm/mmu_notifier: add mmu_interval_notifier_put()
  mm/notifier: add mmu_interval_notifier_update()
  mm/mmu_notifier: add mmu_interval_notifier_find()
  nouveau: use new mmu interval notifiers
  mm/hmm/test: add self tests for HMM

 MAINTAINERS                            |    3 +
 drivers/gpu/drm/nouveau/nouveau_svm.c  |  313 ++++--
 include/linux/mmu_notifier.h           |   29 +
 lib/Kconfig.debug                      |   11 +
 lib/Makefile                           |    1 +
 lib/test_hmm.c                         | 1368 ++++++++++++++++++++++++
 mm/mmu_notifier.c                      |  223 +++-
 tools/testing/selftests/vm/.gitignore  |    1 +
 tools/testing/selftests/vm/Makefile    |    3 +
 tools/testing/selftests/vm/config      |    2 +
 tools/testing/selftests/vm/hmm-tests.c | 1354 +++++++++++++++++++++++
 tools/testing/selftests/vm/run_vmtests |   16 +
 tools/testing/selftests/vm/test_hmm.sh |   97 ++
 13 files changed, 3289 insertions(+), 132 deletions(-)
 create mode 100644 lib/test_hmm.c
 create mode 100644 tools/testing/selftests/vm/hmm-tests.c
 create mode 100755 tools/testing/selftests/vm/test_hmm.sh

-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
