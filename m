Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C441B12B2F1
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932586E397;
	Fri, 27 Dec 2019 08:14:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DC26EBDE
 for <nouveau@lists.freedesktop.org>; Tue, 12 Nov 2019 20:22:54 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id y18so6966287qve.2
 for <nouveau@lists.freedesktop.org>; Tue, 12 Nov 2019 12:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PZrtIQ1CqQ3aV6eDiT4AIT6dNu/ovkVG0MAXXUVRQPA=;
 b=N5sdBv6BsoyFRqhiisu/umdYUbVy9Q0vhIpmeXK0k1Z2n976NtwEGSe4f6xaVeM9aI
 0iie8PeQxU6Pzl7PaExiv5wXSdCmcakfQQYqtL301GS/N6tmsTuOCxyh5Z4J2Bx5LI9m
 hZ4ACJgY65YwCw1ca0bak+o9en98SxP+zjmcbIJZPCTLYUFbr1VHsequPzlbRw2PEpUT
 2Ckc1P6jvX312NS5kcr5DuEEPeQLvwDvBBXNW4q4UHyiDRaRhTqT9pCJpwlIbkJ6jBE4
 8jvzjAPKLI0LwepsLvXIgFWuCUpUgBzKcRXeCAmU8vxboEVzSYCAKwi2mLcjpWBsqfMs
 WaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PZrtIQ1CqQ3aV6eDiT4AIT6dNu/ovkVG0MAXXUVRQPA=;
 b=jpPoOxogSxXgZHKQ1L+oS8NJO6vTVBev+41mdbNbteNmKIyKP+7uM+dmR6X4T3u6sb
 JlTtc9cql/QVtiJe03AZN5PoeVb/NDDmjCfFQvrbdiLX7PiPvhjWnPW7tvguLRElxN7s
 lPuqkQZI2CNKVFMwZBtkrQ9VqCt/y8Zp4LX7KKOfdL+OrEto9ARyuBPJqRCxgS+5AhfM
 lbytkmatqy5lMsNIob/lu2PK4yWAGEo6Id8jp/LHN85s4FwcV9VP9VZlOEbIXs8PBIWQ
 HTlzXlCh3gOJ0E4IoWfyNvd9iqcAmEvpPrvVxPdJ8M0TptNQfvvgRDnzUMSsLEHQ+VVo
 pkgQ==
X-Gm-Message-State: APjAAAWhLmWQLZioU1zkiRCcbG3D4A/gr5qnMPXcQCBnAczHA4w4XyBC
 HcvjzvbBl+gpbfxJUhm+574NRg==
X-Google-Smtp-Source: APXvYqwjHVASiImpnLd/ILwe5StdJi3zozsyC3ebdiRQZc5AWQDBgQKjG4QUL+HhygmNxsbKFK0SMQ==
X-Received: by 2002:ad4:53ab:: with SMTP id j11mr5278002qvv.47.1573590173518; 
 Tue, 12 Nov 2019 12:22:53 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id y33sm14091065qta.18.2019.11.12.12.22.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Nov 2019 12:22:48 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iUcgZ-0003kZ-Kj; Tue, 12 Nov 2019 16:22:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Tue, 12 Nov 2019 16:22:28 -0400
Message-Id: <20191112202231.3856-12-jgg@ziepe.ca>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112202231.3856-1-jgg@ziepe.ca>
References: <20191112202231.3856-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:32 +0000
Subject: [Nouveau] [PATCH v3 11/14] drm/amdgpu: Use mmu_interval_insert
 instead of hmm_mirror
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
 Stefano Stabellini <sstabellini@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
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

Remove the interval tree in the driver and rely on the tree maintained by
the mmu_notifier for delivering mmu_notifier invalidation callbacks.

For some reason amdgpu has a very complicated arrangement where it tries
to prevent duplicate entries in the interval_tree, this is not necessary,
each amdgpu_bo can be its own stand alone entry. interval_tree already
allows duplicates and overlaps in the tree.

Also, there is no need to remove entries upon a release callback, the
mmu_interval API safely allows objects to remain registered beyond the
lifetime of the mm. The driver only has to stop touching the pages during
release.

Reviewed-by: Philip Yang <Philip.Yang@amd.com>
Tested-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        | 333 ++++--------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h        |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  13 +-
 6 files changed, 77 insertions(+), 281 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index bd37df5dd6d048..60591a5d420021 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1006,6 +1006,8 @@ struct amdgpu_device {
 	struct mutex  lock_reset;
 	struct amdgpu_doorbell_index doorbell_index;
 
+	struct mutex			notifier_lock;
+
 	int asic_reset_res;
 	struct work_struct		xgmi_reset_work;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 6d021ecc8d598f..47700302a08b7f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -481,8 +481,7 @@ static void remove_kgd_mem_from_kfd_bo_list(struct kgd_mem *mem,
  *
  * Returns 0 for success, negative errno for errors.
  */
-static int init_user_pages(struct kgd_mem *mem, struct mm_struct *mm,
-			   uint64_t user_addr)
+static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
 {
 	struct amdkfd_process_info *process_info = mem->process_info;
 	struct amdgpu_bo *bo = mem->bo;
@@ -1195,7 +1194,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	add_kgd_mem_to_kfd_bo_list(*mem, avm->process_info, user_addr);
 
 	if (user_addr) {
-		ret = init_user_pages(*mem, current->mm, user_addr);
+		ret = init_user_pages(*mem, user_addr);
 		if (ret)
 			goto allocate_init_user_pages_failed;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 5a1939dbd4e3e6..38f97998aaddb2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2633,6 +2633,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	mutex_init(&adev->virt.vf_errors.lock);
 	hash_init(adev->mn_hash);
 	mutex_init(&adev->lock_reset);
+	mutex_init(&adev->notifier_lock);
 	mutex_init(&adev->virt.dpm_mutex);
 	mutex_init(&adev->psp.mutex);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
index 31d4deb5d29484..9fe1c31ce17a30 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
@@ -50,66 +50,6 @@
 #include "amdgpu.h"
 #include "amdgpu_amdkfd.h"
 
-/**
- * struct amdgpu_mn_node
- *
- * @it: interval node defining start-last of the affected address range
- * @bos: list of all BOs in the affected address range
- *
- * Manages all BOs which are affected of a certain range of address space.
- */
-struct amdgpu_mn_node {
-	struct interval_tree_node	it;
-	struct list_head		bos;
-};
-
-/**
- * amdgpu_mn_destroy - destroy the HMM mirror
- *
- * @work: previously sheduled work item
- *
- * Lazy destroys the notifier from a work item
- */
-static void amdgpu_mn_destroy(struct work_struct *work)
-{
-	struct amdgpu_mn *amn = container_of(work, struct amdgpu_mn, work);
-	struct amdgpu_device *adev = amn->adev;
-	struct amdgpu_mn_node *node, *next_node;
-	struct amdgpu_bo *bo, *next_bo;
-
-	mutex_lock(&adev->mn_lock);
-	down_write(&amn->lock);
-	hash_del(&amn->node);
-	rbtree_postorder_for_each_entry_safe(node, next_node,
-					     &amn->objects.rb_root, it.rb) {
-		list_for_each_entry_safe(bo, next_bo, &node->bos, mn_list) {
-			bo->mn = NULL;
-			list_del_init(&bo->mn_list);
-		}
-		kfree(node);
-	}
-	up_write(&amn->lock);
-	mutex_unlock(&adev->mn_lock);
-
-	hmm_mirror_unregister(&amn->mirror);
-	kfree(amn);
-}
-
-/**
- * amdgpu_hmm_mirror_release - callback to notify about mm destruction
- *
- * @mirror: the HMM mirror (mm) this callback is about
- *
- * Shedule a work item to lazy destroy HMM mirror.
- */
-static void amdgpu_hmm_mirror_release(struct hmm_mirror *mirror)
-{
-	struct amdgpu_mn *amn = container_of(mirror, struct amdgpu_mn, mirror);
-
-	INIT_WORK(&amn->work, amdgpu_mn_destroy);
-	schedule_work(&amn->work);
-}
-
 /**
  * amdgpu_mn_lock - take the write side lock for this notifier
  *
@@ -133,157 +73,80 @@ void amdgpu_mn_unlock(struct amdgpu_mn *mn)
 }
 
 /**
- * amdgpu_mn_read_lock - take the read side lock for this notifier
- *
- * @amn: our notifier
- */
-static int amdgpu_mn_read_lock(struct amdgpu_mn *amn, bool blockable)
-{
-	if (blockable)
-		down_read(&amn->lock);
-	else if (!down_read_trylock(&amn->lock))
-		return -EAGAIN;
-
-	return 0;
-}
-
-/**
- * amdgpu_mn_read_unlock - drop the read side lock for this notifier
- *
- * @amn: our notifier
- */
-static void amdgpu_mn_read_unlock(struct amdgpu_mn *amn)
-{
-	up_read(&amn->lock);
-}
-
-/**
- * amdgpu_mn_invalidate_node - unmap all BOs of a node
+ * amdgpu_mn_invalidate_gfx - callback to notify about mm change
  *
- * @node: the node with the BOs to unmap
- * @start: start of address range affected
- * @end: end of address range affected
+ * @mni: the range (mm) is about to update
+ * @range: details on the invalidation
+ * @cur_seq: Value to pass to mmu_interval_set_seq()
  *
  * Block for operations on BOs to finish and mark pages as accessed and
  * potentially dirty.
  */
-static void amdgpu_mn_invalidate_node(struct amdgpu_mn_node *node,
-				      unsigned long start,
-				      unsigned long end)
+static bool amdgpu_mn_invalidate_gfx(struct mmu_interval_notifier *mni,
+				     const struct mmu_notifier_range *range,
+				     unsigned long cur_seq)
 {
-	struct amdgpu_bo *bo;
+	struct amdgpu_bo *bo = container_of(mni, struct amdgpu_bo, notifier);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	long r;
 
-	list_for_each_entry(bo, &node->bos, mn_list) {
-
-		if (!amdgpu_ttm_tt_affect_userptr(bo->tbo.ttm, start, end))
-			continue;
+	if (!mmu_notifier_range_blockable(range))
+		return false;
 
-		r = dma_resv_wait_timeout_rcu(bo->tbo.base.resv,
-			true, false, MAX_SCHEDULE_TIMEOUT);
-		if (r <= 0)
-			DRM_ERROR("(%ld) failed to wait for user bo\n", r);
-	}
+	mutex_lock(&adev->notifier_lock);
+	r = dma_resv_wait_timeout_rcu(bo->tbo.base.resv, true, false,
+				      MAX_SCHEDULE_TIMEOUT);
+	mutex_unlock(&adev->notifier_lock);
+	if (r <= 0)
+		DRM_ERROR("(%ld) failed to wait for user bo\n", r);
+	return true;
 }
 
+static const struct mmu_interval_notifier_ops amdgpu_mn_gfx_ops = {
+	.invalidate = amdgpu_mn_invalidate_gfx,
+};
+
 /**
- * amdgpu_mn_sync_pagetables_gfx - callback to notify about mm change
+ * amdgpu_mn_invalidate_hsa - callback to notify about mm change
  *
- * @mirror: the hmm_mirror (mm) is about to update
- * @update: the update start, end address
+ * @mni: the range (mm) is about to update
+ * @range: details on the invalidation
+ * @cur_seq: Value to pass to mmu_interval_set_seq()
  *
- * Block for operations on BOs to finish and mark pages as accessed and
- * potentially dirty.
+ * We temporarily evict the BO attached to this range. This necessitates
+ * evicting all user-mode queues of the process.
  */
-static int
-amdgpu_mn_sync_pagetables_gfx(struct hmm_mirror *mirror,
-			      const struct mmu_notifier_range *update)
+static bool amdgpu_mn_invalidate_hsa(struct mmu_interval_notifier *mni,
+				     const struct mmu_notifier_range *range,
+				     unsigned long cur_seq)
 {
-	struct amdgpu_mn *amn = container_of(mirror, struct amdgpu_mn, mirror);
-	unsigned long start = update->start;
-	unsigned long end = update->end;
-	bool blockable = mmu_notifier_range_blockable(update);
-	struct interval_tree_node *it;
-
-	/* notification is exclusive, but interval is inclusive */
-	end -= 1;
-
-	/* TODO we should be able to split locking for interval tree and
-	 * amdgpu_mn_invalidate_node
-	 */
-	if (amdgpu_mn_read_lock(amn, blockable))
-		return -EAGAIN;
-
-	it = interval_tree_iter_first(&amn->objects, start, end);
-	while (it) {
-		struct amdgpu_mn_node *node;
-
-		if (!blockable) {
-			amdgpu_mn_read_unlock(amn);
-			return -EAGAIN;
-		}
-
-		node = container_of(it, struct amdgpu_mn_node, it);
-		it = interval_tree_iter_next(it, start, end);
+	struct amdgpu_bo *bo = container_of(mni, struct amdgpu_bo, notifier);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 
-		amdgpu_mn_invalidate_node(node, start, end);
-	}
+	if (!mmu_notifier_range_blockable(range))
+		return false;
 
-	amdgpu_mn_read_unlock(amn);
+	mutex_lock(&adev->notifier_lock);
+	amdgpu_amdkfd_evict_userptr(bo->kfd_bo, bo->notifier.mm);
+	mutex_unlock(&adev->notifier_lock);
 
-	return 0;
+	return true;
 }
 
-/**
- * amdgpu_mn_sync_pagetables_hsa - callback to notify about mm change
- *
- * @mirror: the hmm_mirror (mm) is about to update
- * @update: the update start, end address
- *
- * We temporarily evict all BOs between start and end. This
- * necessitates evicting all user-mode queues of the process. The BOs
- * are restorted in amdgpu_mn_invalidate_range_end_hsa.
- */
-static int
-amdgpu_mn_sync_pagetables_hsa(struct hmm_mirror *mirror,
-			      const struct mmu_notifier_range *update)
+static const struct mmu_interval_notifier_ops amdgpu_mn_hsa_ops = {
+	.invalidate = amdgpu_mn_invalidate_hsa,
+};
+
+static int amdgpu_mn_sync_pagetables(struct hmm_mirror *mirror,
+				     const struct mmu_notifier_range *update)
 {
 	struct amdgpu_mn *amn = container_of(mirror, struct amdgpu_mn, mirror);
-	unsigned long start = update->start;
-	unsigned long end = update->end;
-	bool blockable = mmu_notifier_range_blockable(update);
-	struct interval_tree_node *it;
 
-	/* notification is exclusive, but interval is inclusive */
-	end -= 1;
-
-	if (amdgpu_mn_read_lock(amn, blockable))
+	if (!mmu_notifier_range_blockable(update))
 		return -EAGAIN;
 
-	it = interval_tree_iter_first(&amn->objects, start, end);
-	while (it) {
-		struct amdgpu_mn_node *node;
-		struct amdgpu_bo *bo;
-
-		if (!blockable) {
-			amdgpu_mn_read_unlock(amn);
-			return -EAGAIN;
-		}
-
-		node = container_of(it, struct amdgpu_mn_node, it);
-		it = interval_tree_iter_next(it, start, end);
-
-		list_for_each_entry(bo, &node->bos, mn_list) {
-			struct kgd_mem *mem = bo->kfd_bo;
-
-			if (amdgpu_ttm_tt_affect_userptr(bo->tbo.ttm,
-							 start, end))
-				amdgpu_amdkfd_evict_userptr(mem, amn->mm);
-		}
-	}
-
-	amdgpu_mn_read_unlock(amn);
-
+	down_read(&amn->lock);
+	up_read(&amn->lock);
 	return 0;
 }
 
@@ -295,12 +158,10 @@ amdgpu_mn_sync_pagetables_hsa(struct hmm_mirror *mirror,
 
 static struct hmm_mirror_ops amdgpu_hmm_mirror_ops[] = {
 	[AMDGPU_MN_TYPE_GFX] = {
-		.sync_cpu_device_pagetables = amdgpu_mn_sync_pagetables_gfx,
-		.release = amdgpu_hmm_mirror_release
+		.sync_cpu_device_pagetables = amdgpu_mn_sync_pagetables,
 	},
 	[AMDGPU_MN_TYPE_HSA] = {
-		.sync_cpu_device_pagetables = amdgpu_mn_sync_pagetables_hsa,
-		.release = amdgpu_hmm_mirror_release
+		.sync_cpu_device_pagetables = amdgpu_mn_sync_pagetables,
 	},
 };
 
@@ -327,7 +188,8 @@ struct amdgpu_mn *amdgpu_mn_get(struct amdgpu_device *adev,
 	}
 
 	hash_for_each_possible(adev->mn_hash, amn, node, key)
-		if (AMDGPU_MN_KEY(amn->mm, amn->type) == key)
+		if (AMDGPU_MN_KEY(amn->mirror.hmm->mmu_notifier.mm,
+				  amn->type) == key)
 			goto release_locks;
 
 	amn = kzalloc(sizeof(*amn), GFP_KERNEL);
@@ -337,10 +199,8 @@ struct amdgpu_mn *amdgpu_mn_get(struct amdgpu_device *adev,
 	}
 
 	amn->adev = adev;
-	amn->mm = mm;
 	init_rwsem(&amn->lock);
 	amn->type = type;
-	amn->objects = RB_ROOT_CACHED;
 
 	amn->mirror.ops = &amdgpu_hmm_mirror_ops[type];
 	r = hmm_mirror_register(&amn->mirror, mm);
@@ -369,100 +229,33 @@ struct amdgpu_mn *amdgpu_mn_get(struct amdgpu_device *adev,
  * @bo: amdgpu buffer object
  * @addr: userptr addr we should monitor
  *
- * Registers an HMM mirror for the given BO at the specified address.
+ * Registers a mmu_notifier for the given BO at the specified address.
  * Returns 0 on success, -ERRNO if anything goes wrong.
  */
 int amdgpu_mn_register(struct amdgpu_bo *bo, unsigned long addr)
 {
-	unsigned long end = addr + amdgpu_bo_size(bo) - 1;
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	enum amdgpu_mn_type type =
-		bo->kfd_bo ? AMDGPU_MN_TYPE_HSA : AMDGPU_MN_TYPE_GFX;
-	struct amdgpu_mn *amn;
-	struct amdgpu_mn_node *node = NULL, *new_node;
-	struct list_head bos;
-	struct interval_tree_node *it;
-
-	amn = amdgpu_mn_get(adev, type);
-	if (IS_ERR(amn))
-		return PTR_ERR(amn);
-
-	new_node = kmalloc(sizeof(*new_node), GFP_KERNEL);
-	if (!new_node)
-		return -ENOMEM;
-
-	INIT_LIST_HEAD(&bos);
-
-	down_write(&amn->lock);
-
-	while ((it = interval_tree_iter_first(&amn->objects, addr, end))) {
-		kfree(node);
-		node = container_of(it, struct amdgpu_mn_node, it);
-		interval_tree_remove(&node->it, &amn->objects);
-		addr = min(it->start, addr);
-		end = max(it->last, end);
-		list_splice(&node->bos, &bos);
-	}
-
-	if (!node)
-		node = new_node;
+	if (bo->kfd_bo)
+		bo->notifier.ops = &amdgpu_mn_hsa_ops;
 	else
-		kfree(new_node);
-
-	bo->mn = amn;
-
-	node->it.start = addr;
-	node->it.last = end;
-	INIT_LIST_HEAD(&node->bos);
-	list_splice(&bos, &node->bos);
-	list_add(&bo->mn_list, &node->bos);
+		bo->notifier.ops = &amdgpu_mn_gfx_ops;
 
-	interval_tree_insert(&node->it, &amn->objects);
-
-	up_write(&amn->lock);
-
-	return 0;
+	return mmu_interval_notifier_insert(&bo->notifier, addr,
+					    amdgpu_bo_size(bo), current->mm);
 }
 
 /**
- * amdgpu_mn_unregister - unregister a BO for HMM mirror updates
+ * amdgpu_mn_unregister - unregister a BO for notifier updates
  *
  * @bo: amdgpu buffer object
  *
- * Remove any registration of HMM mirror updates from the buffer object.
+ * Remove any registration of mmu notifier updates from the buffer object.
  */
 void amdgpu_mn_unregister(struct amdgpu_bo *bo)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct amdgpu_mn *amn;
-	struct list_head *head;
-
-	mutex_lock(&adev->mn_lock);
-
-	amn = bo->mn;
-	if (amn == NULL) {
-		mutex_unlock(&adev->mn_lock);
+	if (!bo->notifier.mm)
 		return;
-	}
-
-	down_write(&amn->lock);
-
-	/* save the next list entry for later */
-	head = bo->mn_list.next;
-
-	bo->mn = NULL;
-	list_del_init(&bo->mn_list);
-
-	if (list_empty(head)) {
-		struct amdgpu_mn_node *node;
-
-		node = container_of(head, struct amdgpu_mn_node, bos);
-		interval_tree_remove(&node->it, &amn->objects);
-		kfree(node);
-	}
-
-	up_write(&amn->lock);
-	mutex_unlock(&adev->mn_lock);
+	mmu_interval_notifier_remove(&bo->notifier);
+	bo->notifier.mm = NULL;
 }
 
 /* flags used by HMM internal, not related to CPU/GPU PTE flags */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h
index b8ed68943625c2..d73ab2947b22b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h
@@ -39,12 +39,10 @@ enum amdgpu_mn_type {
  * struct amdgpu_mn
  *
  * @adev: amdgpu device pointer
- * @mm: process address space
  * @type: type of MMU notifier
  * @work: destruction work item
  * @node: hash table node to find structure by adev and mn
  * @lock: rw semaphore protecting the notifier nodes
- * @objects: interval tree containing amdgpu_mn_nodes
  * @mirror: HMM mirror function support
  *
  * Data for each amdgpu device and process address space.
@@ -52,7 +50,6 @@ enum amdgpu_mn_type {
 struct amdgpu_mn {
 	/* constant after initialisation */
 	struct amdgpu_device	*adev;
-	struct mm_struct	*mm;
 	enum amdgpu_mn_type	type;
 
 	/* only used on destruction */
@@ -63,7 +60,6 @@ struct amdgpu_mn {
 
 	/* objects protected by lock */
 	struct rw_semaphore	lock;
-	struct rb_root_cached	objects;
 
 #ifdef CONFIG_HMM_MIRROR
 	/* HMM mirror */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 658f4c9779b704..2792c5c70fd10d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -30,6 +30,9 @@
 
 #include <drm/amdgpu_drm.h>
 #include "amdgpu.h"
+#ifdef CONFIG_MMU_NOTIFIER
+#include <linux/mmu_notifier.h>
+#endif
 
 #define AMDGPU_BO_INVALID_OFFSET	LONG_MAX
 #define AMDGPU_BO_MAX_PLACEMENTS	3
@@ -100,10 +103,12 @@ struct amdgpu_bo {
 	struct ttm_bo_kmap_obj		dma_buf_vmap;
 	struct amdgpu_mn		*mn;
 
-	union {
-		struct list_head	mn_list;
-		struct list_head	shadow_list;
-	};
+
+#ifdef CONFIG_MMU_NOTIFIER
+	struct mmu_interval_notifier	notifier;
+#endif
+
+	struct list_head		shadow_list;
 
 	struct kgd_mem                  *kfd_bo;
 };
-- 
2.24.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
