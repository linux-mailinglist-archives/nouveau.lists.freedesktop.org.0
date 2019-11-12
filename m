Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A996912B2DD
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE366E142;
	Fri, 27 Dec 2019 08:14:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EC96EBC9
 for <nouveau@lists.freedesktop.org>; Tue, 12 Nov 2019 20:22:49 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id d3so5366760qvs.11
 for <nouveau@lists.freedesktop.org>; Tue, 12 Nov 2019 12:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GWMSOcigcFkvS1mXDN4UZKv/Sz4qJBz/Xw1txpllC58=;
 b=SdP44dA/qt3Cafkmp5tDYwUfTKua1RYFbjfub38WMqp1Vetd5HDAMxGgKpbA4Ao+oK
 gsEL1oHkgBYSL5wAFUvGW4WL3U/pvufnqzGsum5CGpKAJYB+qH5Upt6hHPp0oyUiUVZQ
 luFJjPDkpYMu/LEwn7P4i1KvQc3sG0kQARArCClpXMObiDqr/9YyrAyqL0dxb++bMYDb
 XbTfpT4OBOBeoefNdIfWJ+fDQI8fjcFqTYyS9qXYt67Hx6qKRVE8+RXhoDoz1lpBwD/V
 slDxBVQ6lEnBCWWDRENPVOvt6nSoUCSoIGfYhgVkElAgGx2oznQ/Ekwnr6eHH2zAzayA
 jOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GWMSOcigcFkvS1mXDN4UZKv/Sz4qJBz/Xw1txpllC58=;
 b=IytThDfje3SmJ5fOLHCF4T09l1Hg7Ny7hAZc6tH6LJhbhLZLU0BvZ9FJflHDnMX9OF
 nS3kF9sPGpeNwA/paofubxSDkZIsaxm39JahIO0mI9HFIFdUbVbyb7QSft7NAjT4zoKT
 WVn5mPGq1ze35L9qBGa805V5Uu4WomnfjCzrXmhcfbepixq5kKQp/l0eYguzpcJKg8oS
 dmnLHzoTrUPHwq2Dnj98VBme0Z8KYceaN31Eb+mz0F4fQ5Yqj1ne98jL1eGZI5cjVeNG
 9+SVDwOj+ZE/ZIDQy151Z6M3Q5sVNoPe9d9eJICOYLgNDqZPSrmIRh+14mKd8DXQYMwh
 2RIA==
X-Gm-Message-State: APjAAAWUk2SD3GXVj+fsGo2svCIVnzjR9fQEs2IxIonRPnZ+z+WQ427B
 C2AfcADHjHMIUE+zjQX06cEgpQ==
X-Google-Smtp-Source: APXvYqyZGwIPop6xwsfhsv3DLyXXAOZa8Eq5KSgCu6w55310PeMbie/nmCz5Pj6znsHarv3wD6pCCQ==
X-Received: by 2002:a05:6214:14b2:: with SMTP id
 bo18mr30642652qvb.72.1573590168105; 
 Tue, 12 Nov 2019 12:22:48 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id j71sm10881994qke.90.2019.11.12.12.22.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Nov 2019 12:22:47 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iUcgZ-0003jU-35; Tue, 12 Nov 2019 16:22:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Tue, 12 Nov 2019 16:22:17 -0400
Message-Id: <20191112202231.3856-1-jgg@ziepe.ca>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: [Nouveau] [PATCH hmm v3 00/14] Consolidate the mmu notifier
 interval_tree and locking
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

8 of the mmu_notifier using drivers (i915_gem, radeon_mn, umem_odp, hfi1,
scif_dma, vhost, gntdev, hmm) drivers are using a common pattern where
they only use invalidate_range_start/end and immediately check the
invalidating range against some driver data structure to tell if the
driver is interested. Half of them use an interval_tree, the others are
simple linear search lists.

Of the ones I checked they largely seem to have various kinds of races,
bugs and poor implementation. This is a result of the complexity in how
the notifier interacts with get_user_pages(). It is extremely difficult to
use it correctly.

Consolidate all of this code together into the core mmu_notifier and
provide a locking scheme similar to hmm_mirror that allows the user to
safely use get_user_pages() and reliably know if the page list still
matches the mm.

This new arrangment plays nicely with the !blockable mode for
OOM. Scanning the interval tree is done such that the intersection test
will always succeed, and since there is no invalidate_range_end exposed to
drivers the scheme safely allows multiple drivers to be subscribed.

Four places are converted as an example of how the new API is used.
Four are left for future patches:
 - i915_gem has complex locking around destruction of a registration,
   needs more study
 - hfi1 (2nd user) needs access to the rbtree
 - scif_dma has a complicated logic flow
 - vhost's mmu notifiers are already being rewritten

This is already in linux-next, a git tree is available here:

 https://github.com/jgunthorpe/linux/commits/mmu_notifier

v3:
- Rename mmu_range_notifier to mmu_interval_notifier for clarity
  Avoids confusion with struct mmu_notifier_range
- Fix bugs in odp, amdgpu and xen gntdev from testing
- Make ops an argument to mmu_interval_notifier_insert() to make it
  harder to misuse
- Update many comments
- Add testing of mm_count during insertion

v2: https://lore.kernel.org/r/20191028201032.6352-1-jgg@ziepe.ca
v1: https://lore.kernel.org/r/20191015181242.8343-1-jgg@ziepe.ca

Absent any new discussion I think this will go to Linus at the next merge
window.

Thanks to everyone to helped!

Jason Gunthorpe (14):
  mm/mmu_notifier: define the header pre-processor parts even if
    disabled
  mm/mmu_notifier: add an interval tree notifier
  mm/hmm: allow hmm_range to be used with a mmu_interval_notifier or
    hmm_mirror
  mm/hmm: define the pre-processor related parts of hmm.h even if
    disabled
  RDMA/odp: Use mmu_interval_notifier_insert()
  RDMA/hfi1: Use mmu_interval_notifier_insert for user_exp_rcv
  drm/radeon: use mmu_interval_notifier_insert
  nouveau: use mmu_notifier directly for invalidate_range_start
  nouveau: use mmu_interval_notifier instead of hmm_mirror
  drm/amdgpu: Call find_vma under mmap_sem
  drm/amdgpu: Use mmu_interval_insert instead of hmm_mirror
  drm/amdgpu: Use mmu_interval_notifier instead of hmm_mirror
  mm/hmm: remove hmm_mirror and related
  xen/gntdev: use mmu_interval_notifier_insert

 Documentation/vm/hmm.rst                      | 105 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        | 443 ++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h        |  53 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 145 +++--
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 230 ++++---
 drivers/gpu/drm/radeon/radeon.h               |   9 +-
 drivers/gpu/drm/radeon/radeon_mn.c            | 218 ++-----
 drivers/infiniband/core/device.c              |   1 -
 drivers/infiniband/core/umem_odp.c            | 303 ++--------
 drivers/infiniband/hw/hfi1/file_ops.c         |   2 +-
 drivers/infiniband/hw/hfi1/hfi.h              |   2 +-
 drivers/infiniband/hw/hfi1/user_exp_rcv.c     | 146 ++---
 drivers/infiniband/hw/hfi1/user_exp_rcv.h     |   3 +-
 drivers/infiniband/hw/mlx5/mlx5_ib.h          |   7 +-
 drivers/infiniband/hw/mlx5/mr.c               |   3 +-
 drivers/infiniband/hw/mlx5/odp.c              |  50 +-
 drivers/xen/gntdev-common.h                   |   8 +-
 drivers/xen/gntdev.c                          | 179 ++----
 include/linux/hmm.h                           | 195 +-----
 include/linux/mmu_notifier.h                  | 147 ++++-
 include/rdma/ib_umem_odp.h                    |  68 +--
 include/rdma/ib_verbs.h                       |   2 -
 kernel/fork.c                                 |   1 -
 mm/Kconfig                                    |   2 +-
 mm/hmm.c                                      | 276 +--------
 mm/mmu_notifier.c                             | 565 +++++++++++++++++-
 31 files changed, 1271 insertions(+), 1931 deletions(-)

-- 
2.24.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
