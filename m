Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B4912B296
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8E289A4F;
	Fri, 27 Dec 2019 08:13:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA0A6F877;
 Fri,  1 Nov 2019 20:54:48 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dbc9b9d0000>; Fri, 01 Nov 2019 13:54:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 01 Nov 2019 13:54:47 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 01 Nov 2019 13:54:47 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 1 Nov
 2019 20:54:45 +0000
To: Jason Gunthorpe <jgg@ziepe.ca>, <linux-mm@kvack.org>, Jerome Glisse
 <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 <Felix.Kuehling@amd.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <c2b67afe-cb32-14c9-6513-6cda6cd891d2@nvidia.com>
Date: Fri, 1 Nov 2019 13:54:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1572641693; bh=Wuhb/swYP3BT1uv7uflErFPxk1smHbkEatx0EkeJqaU=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Gj8TuUXAGqUgpBWWkd1I8rf8UlZHo8q1q32bgYotUpMASt7Hcee+T8VZU0i2EbaOy
 vvUx0qM7JgL9hFDJEJTWobwt0GGyavgQp8OphjX4Gp5CIU6nnVxJJfH9cZNfWnZo40
 0ggn9mDusEwQtT0na93hDn2I7IDYm51TemNvaOfHF8J8cF0JcB484fXjERHWsCuC5S
 kBUjjU/0a+Mfn0xDH/3BeI10iGw/PaqhyIwsFXYAzJukfGg7Nz0F/RMpjW/LIPsyQ1
 7xbSuJm3T7e6dNIuermjhMAIfBGhqO0gxbXcw/EMrMZlA5B7aEoZ0a0t2qeVYUDIvv
 xWjZqujp9IZ+A==
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: Re: [Nouveau] [PATCH v2 00/15] Consolidate the mmu notifier
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
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org, Dennis
 Dalessandro <dennis.dalessandro@intel.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@mellanox.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 10/28/19 1:10 PM, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> 8 of the mmu_notifier using drivers (i915_gem, radeon_mn, umem_odp, hfi1,
> scif_dma, vhost, gntdev, hmm) drivers are using a common pattern where
> they only use invalidate_range_start/end and immediately check the
> invalidating range against some driver data structure to tell if the
> driver is interested. Half of them use an interval_tree, the others are
> simple linear search lists.
> 
> Of the ones I checked they largely seem to have various kinds of races,
> bugs and poor implementation. This is a result of the complexity in how
> the notifier interacts with get_user_pages(). It is extremely difficult to
> use it correctly.
> 
> Consolidate all of this code together into the core mmu_notifier and
> provide a locking scheme similar to hmm_mirror that allows the user to
> safely use get_user_pages() and reliably know if the page list still
> matches the mm.
> 
> This new arrangment plays nicely with the !blockable mode for
> OOM. Scanning the interval tree is done such that the intersection test
> will always succeed, and since there is no invalidate_range_end exposed to
> drivers the scheme safely allows multiple drivers to be subscribed.
> 
> Four places are converted as an example of how the new API is used.
> Four are left for future patches:
>   - i915_gem has complex locking around destruction of a registration,
>     needs more study
>   - hfi1 (2nd user) needs access to the rbtree
>   - scif_dma has a complicated logic flow
>   - vhost's mmu notifiers are already being rewritten
> 
> This series, and the other code it depends on is available on my github:
> 
> https://github.com/jgunthorpe/linux/commits/mmu_notifier
> 
> v2 changes:
> - Add mmu_range_set_seq() to set the mrn sequence number under the driver
>    lock and make the locking more understandable
> - Add some additional comments around locking/READ_ONCe
> - Make the WARN_ON flow in mn_itree_invalidate a bit easier to follow
> - Fix wrong WARN_ON
> 
> Jason Gunthorpe (15):
>    mm/mmu_notifier: define the header pre-processor parts even if
>      disabled
>    mm/mmu_notifier: add an interval tree notifier
>    mm/hmm: allow hmm_range to be used with a mmu_range_notifier or
>      hmm_mirror
>    mm/hmm: define the pre-processor related parts of hmm.h even if
>      disabled
>    RDMA/odp: Use mmu_range_notifier_insert()
>    RDMA/hfi1: Use mmu_range_notifier_inset for user_exp_rcv
>    drm/radeon: use mmu_range_notifier_insert
>    xen/gntdev: Use select for DMA_SHARED_BUFFER
>    xen/gntdev: use mmu_range_notifier_insert
>    nouveau: use mmu_notifier directly for invalidate_range_start
>    nouveau: use mmu_range_notifier instead of hmm_mirror
>    drm/amdgpu: Call find_vma under mmap_sem
>    drm/amdgpu: Use mmu_range_insert instead of hmm_mirror
>    drm/amdgpu: Use mmu_range_notifier instead of hmm_mirror
>    mm/hmm: remove hmm_mirror and related
> 
>   Documentation/vm/hmm.rst                      | 105 +---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   9 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  14 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        | 457 +++------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h        |  53 --
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  13 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 111 ++--
>   drivers/gpu/drm/nouveau/nouveau_svm.c         | 231 +++++---
>   drivers/gpu/drm/radeon/radeon.h               |   9 +-
>   drivers/gpu/drm/radeon/radeon_mn.c            | 219 ++-----
>   drivers/infiniband/core/device.c              |   1 -
>   drivers/infiniband/core/umem_odp.c            | 288 +--------
>   drivers/infiniband/hw/hfi1/file_ops.c         |   2 +-
>   drivers/infiniband/hw/hfi1/hfi.h              |   2 +-
>   drivers/infiniband/hw/hfi1/user_exp_rcv.c     | 146 ++---
>   drivers/infiniband/hw/hfi1/user_exp_rcv.h     |   3 +-
>   drivers/infiniband/hw/mlx5/mlx5_ib.h          |   7 +-
>   drivers/infiniband/hw/mlx5/mr.c               |   3 +-
>   drivers/infiniband/hw/mlx5/odp.c              |  50 +-
>   drivers/xen/Kconfig                           |   3 +-
>   drivers/xen/gntdev-common.h                   |   8 +-
>   drivers/xen/gntdev.c                          | 180 ++----
>   include/linux/hmm.h                           | 195 +------
>   include/linux/mmu_notifier.h                  | 144 ++++-
>   include/rdma/ib_umem_odp.h                    |  65 +--
>   include/rdma/ib_verbs.h                       |   2 -
>   kernel/fork.c                                 |   1 -
>   mm/Kconfig                                    |   2 +-
>   mm/hmm.c                                      | 275 +--------
>   mm/mmu_notifier.c                             | 546 +++++++++++++++++-
>   32 files changed, 1225 insertions(+), 1922 deletions(-)
> 

You can add my Tested-by for the mm and nouveau changes.
IOW, patches 1-4, 10-11, and 15.

Tested-by: Ralph Campbell <rcampbell@nvidia.com>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
