Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D96634B06F1
	for <lists+nouveau@lfdr.de>; Thu, 10 Feb 2022 08:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F97F10E727;
	Thu, 10 Feb 2022 07:28:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AF210E727;
 Thu, 10 Feb 2022 07:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=fKwV65Fx615k5LuIXkLcfiAVy//BhvLpTdyb0R61khg=; b=UBIrT7SYvmrOGapKs/IMJGZMJP
 rULomygyaaC55QDvs3eY68CeMZN8/C+Un5dhwOktX57xJXfoja7le1xanp8IT24T92jgKNogsi73U
 Vs9CL78FLc7OFzeln9OiPi/7vaiOEWqV6C55F6pZVXdbLeEo8ldf619JOUh2kLdEvFbEbfs4LZxZ3
 5qvQi9MVLtXFESagqUxWxaF5WV+V5JcZMy4pHRWVG/clCxw7rfcEHb30WuSh5pYSBuzRIj8PeF+Sn
 rhE6DpzHH+K5CChoU7tggXhlh61KLf/GmLxZLyL2cNDul5XrR+6rl7Cq4CkAIe4DZ9r8zj1m7ij2G
 Wyu4LoIQ==;
Received: from [2001:4bb8:188:3efc:8014:b2f2:fdfd:57ea] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI3sV-002rks-4y; Thu, 10 Feb 2022 07:28:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Date: Thu, 10 Feb 2022 08:28:01 +0100
Message-Id: <20220210072828.2930359-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] start sorting out the ZONE_DEVICE refcount mess v2
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi all,

this series removes the offset by one refcount for ZONE_DEVICE pages
that are freed back to the driver owning them, which is just device
private ones for now, but also the planned device coherent pages
and the ehanced p2p ones pending.

It does not address the fsdax pages yet, which will be attacked in a
follow on series.

Note that if we want to get the p2p series rebased on top of this
we'll need a git branch for this series.  I could offer to host one.

A git tree is available here:

    git://git.infradead.org/users/hch/misc.git pgmap-refcount

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/pgmap-refcount

Changes since v1:
 - add a missing memremap.h include in memcontrol.c
 - include rebased versions of the device coherent support and
   device coherent migration support series as well as additional
   cleanup patches

Diffstt:
 arch/arm64/mm/mmu.c                      |    1 
 arch/powerpc/kvm/book3s_hv_uvmem.c       |    1 
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |   35 -
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |    1 
 drivers/gpu/drm/drm_cache.c              |    2 
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |    3 
 drivers/gpu/drm/nouveau/nouveau_svm.c    |    1 
 drivers/infiniband/core/rw.c             |    1 
 drivers/nvdimm/pmem.h                    |    1 
 drivers/nvme/host/pci.c                  |    1 
 drivers/nvme/target/io-cmd-bdev.c        |    1 
 fs/Kconfig                               |    2 
 fs/fuse/virtio_fs.c                      |    1 
 include/linux/hmm.h                      |    9 
 include/linux/memremap.h                 |   36 +
 include/linux/migrate.h                  |    1 
 include/linux/mm.h                       |   59 --
 lib/test_hmm.c                           |  353 ++++++++++---
 lib/test_hmm_uapi.h                      |   22 
 mm/Kconfig                               |    7 
 mm/Makefile                              |    1 
 mm/gup.c                                 |  127 +++-
 mm/internal.h                            |    3 
 mm/memcontrol.c                          |   19 
 mm/memory-failure.c                      |    8 
 mm/memremap.c                            |   75 +-
 mm/migrate.c                             |  763 ----------------------------
 mm/migrate_device.c                      |  822 +++++++++++++++++++++++++++++++
 mm/rmap.c                                |    5 
 mm/swap.c                                |   49 -
 tools/testing/selftests/vm/Makefile      |    2 
 tools/testing/selftests/vm/hmm-tests.c   |  204 ++++++-
 tools/testing/selftests/vm/test_hmm.sh   |   24 
 33 files changed, 1552 insertions(+), 1088 deletions(-)
