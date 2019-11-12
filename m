Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6315612B2F5
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE4C6E17D;
	Fri, 27 Dec 2019 08:14:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE2E6EBCA
 for <nouveau@lists.freedesktop.org>; Tue, 12 Nov 2019 20:22:57 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id e187so15705023qkf.4
 for <nouveau@lists.freedesktop.org>; Tue, 12 Nov 2019 12:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ag74A03ltWPnoMqcDguSbvV42NCeKy/4wLDNRWFWC64=;
 b=PCWQFtRmX6dvCHfSMOkkkcPKeSnrHz8krN1hlyUDdwuQyPsVYOmzLQC5Yc41QZZP85
 B2NGMnss1hJMDxF9lI+niLqo+82kQlnomIjzm0A0i+pJUKE0GqVpYK2MOn66QPGThGqX
 NS94OqyNlUtJgXLAoouud6q++7BxD+vQdqXjziXP0GXKbwlkyF9M+ndNZkMoy7I1rJmB
 ToKMX/nJPIpUEiHM9uVporsmySIGzEMSqaRCthLMgEJFbQ6MTWATLpKUViLlGqYMFEmk
 /0gOYuaOZHlcHNsUM5RxvixV9NteWANqq9+eCto0TKyqtpfm3yeZNMfikTuU5wGo+s69
 K8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ag74A03ltWPnoMqcDguSbvV42NCeKy/4wLDNRWFWC64=;
 b=bhrrHUDGyifQFJ9WwDUainc7+eEpaMEgXo+ffdcRWvBOSZXkht9Lz5ro61zobNVaQz
 +W3nfMXxYgAc9HA4d07//Qype6i5jDHtRroHMhrQae2GizQwfHaBldWAXXHepMVMzS8q
 mMVmt5DQqLYN0DEwUqtn813CDxHWeKH3Hg176HvUaIuvnyzG3UXyrE4400nlQeKw7Z1o
 g5UzNYfx1zfayW8bGK/rsqZYGtGEmCC8toYVd/KevrptvHCXVgkLCCucgOHGMzeO2dBj
 o9PR6QAoH6ikf1H3tFU6vAxZYt8nIH5iGvHxbDeBTF9UlpBKGnV+ndpaWmsWFJdap8gj
 Qo7w==
X-Gm-Message-State: APjAAAXsQTPsxeYoQnhDO3wlws2KHH6YaQEM+ckYrMlp1CKu8L/Q+GAl
 gF/D3z9lWIRVK585q0rnrGeNjA==
X-Google-Smtp-Source: APXvYqzFb8GUByDgUwOTbZF3caBu1zPVFacaHYNI0Y/7i1YxdoOa6W+iBbg13cRpLZGHNCe94hp2sw==
X-Received: by 2002:a05:620a:1645:: with SMTP id
 c5mr7466381qko.22.1573590176249; 
 Tue, 12 Nov 2019 12:22:56 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id x30sm9613099qtc.7.2019.11.12.12.22.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Nov 2019 12:22:49 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iUcgZ-0003ks-QH; Tue, 12 Nov 2019 16:22:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Tue, 12 Nov 2019 16:22:31 -0400
Message-Id: <20191112202231.3856-15-jgg@ziepe.ca>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112202231.3856-1-jgg@ziepe.ca>
References: <20191112202231.3856-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:32 +0000
Subject: [Nouveau] [PATCH v3 14/14] xen/gntdev: use
 mmu_interval_notifier_insert
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

gntdev simply wants to monitor a specific VMA for any notifier events,
this can be done straightforwardly using mmu_interval_notifier_insert()
over the VMA's VA range.

The notifier should be attached until the original VMA is destroyed.

It is unclear if any of this is even sane, but at least a lot of duplicate
code is removed.

Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 drivers/xen/gntdev-common.h |   8 +-
 drivers/xen/gntdev.c        | 179 ++++++++++--------------------------
 2 files changed, 49 insertions(+), 138 deletions(-)

diff --git a/drivers/xen/gntdev-common.h b/drivers/xen/gntdev-common.h
index 2f8b949c3eeb14..91e44c04f7876c 100644
--- a/drivers/xen/gntdev-common.h
+++ b/drivers/xen/gntdev-common.h
@@ -21,15 +21,8 @@ struct gntdev_dmabuf_priv;
 struct gntdev_priv {
 	/* Maps with visible offsets in the file descriptor. */
 	struct list_head maps;
-	/*
-	 * Maps that are not visible; will be freed on munmap.
-	 * Only populated if populate_freeable_maps == 1
-	 */
-	struct list_head freeable_maps;
 	/* lock protects maps and freeable_maps. */
 	struct mutex lock;
-	struct mm_struct *mm;
-	struct mmu_notifier mn;
 
 #ifdef CONFIG_XEN_GRANT_DMA_ALLOC
 	/* Device for which DMA memory is allocated. */
@@ -49,6 +42,7 @@ struct gntdev_unmap_notify {
 };
 
 struct gntdev_grant_map {
+	struct mmu_interval_notifier notifier;
 	struct list_head next;
 	struct vm_area_struct *vma;
 	int index;
diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 81401f386c9ce0..a04ddf2a68afa5 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -63,7 +63,6 @@ MODULE_PARM_DESC(limit, "Maximum number of grants that may be mapped by "
 static atomic_t pages_mapped = ATOMIC_INIT(0);
 
 static int use_ptemod;
-#define populate_freeable_maps use_ptemod
 
 static int unmap_grant_pages(struct gntdev_grant_map *map,
 			     int offset, int pages);
@@ -249,12 +248,6 @@ void gntdev_put_map(struct gntdev_priv *priv, struct gntdev_grant_map *map)
 		evtchn_put(map->notify.event);
 	}
 
-	if (populate_freeable_maps && priv) {
-		mutex_lock(&priv->lock);
-		list_del(&map->next);
-		mutex_unlock(&priv->lock);
-	}
-
 	if (map->pages && !use_ptemod)
 		unmap_grant_pages(map, 0, map->count);
 	gntdev_free_map(map);
@@ -444,16 +437,9 @@ static void gntdev_vma_close(struct vm_area_struct *vma)
 
 	pr_debug("gntdev_vma_close %p\n", vma);
 	if (use_ptemod) {
-		/* It is possible that an mmu notifier could be running
-		 * concurrently, so take priv->lock to ensure that the vma won't
-		 * vanishing during the unmap_grant_pages call, since we will
-		 * spin here until that completes. Such a concurrent call will
-		 * not do any unmapping, since that has been done prior to
-		 * closing the vma, but it may still iterate the unmap_ops list.
-		 */
-		mutex_lock(&priv->lock);
+		WARN_ON(map->vma != vma);
+		mmu_interval_notifier_remove(&map->notifier);
 		map->vma = NULL;
-		mutex_unlock(&priv->lock);
 	}
 	vma->vm_private_data = NULL;
 	gntdev_put_map(priv, map);
@@ -475,109 +461,44 @@ static const struct vm_operations_struct gntdev_vmops = {
 
 /* ------------------------------------------------------------------ */
 
-static bool in_range(struct gntdev_grant_map *map,
-			      unsigned long start, unsigned long end)
-{
-	if (!map->vma)
-		return false;
-	if (map->vma->vm_start >= end)
-		return false;
-	if (map->vma->vm_end <= start)
-		return false;
-
-	return true;
-}
-
-static int unmap_if_in_range(struct gntdev_grant_map *map,
-			      unsigned long start, unsigned long end,
-			      bool blockable)
+static bool gntdev_invalidate(struct mmu_interval_notifier *mn,
+			      const struct mmu_notifier_range *range,
+			      unsigned long cur_seq)
 {
+	struct gntdev_grant_map *map =
+		container_of(mn, struct gntdev_grant_map, notifier);
 	unsigned long mstart, mend;
 	int err;
 
-	if (!in_range(map, start, end))
-		return 0;
+	if (!mmu_notifier_range_blockable(range))
+		return false;
 
-	if (!blockable)
-		return -EAGAIN;
+	/*
+	 * If the VMA is split or otherwise changed the notifier is not
+	 * updated, but we don't want to process VA's outside the modified
+	 * VMA. FIXME: It would be much more understandable to just prevent
+	 * modifying the VMA in the first place.
+	 */
+	if (map->vma->vm_start >= range->end ||
+	    map->vma->vm_end <= range->start)
+		return true;
 
-	mstart = max(start, map->vma->vm_start);
-	mend   = min(end,   map->vma->vm_end);
+	mstart = max(range->start, map->vma->vm_start);
+	mend = min(range->end, map->vma->vm_end);
 	pr_debug("map %d+%d (%lx %lx), range %lx %lx, mrange %lx %lx\n",
 			map->index, map->count,
 			map->vma->vm_start, map->vma->vm_end,
-			start, end, mstart, mend);
+			range->start, range->end, mstart, mend);
 	err = unmap_grant_pages(map,
 				(mstart - map->vma->vm_start) >> PAGE_SHIFT,
 				(mend - mstart) >> PAGE_SHIFT);
 	WARN_ON(err);
 
-	return 0;
-}
-
-static int mn_invl_range_start(struct mmu_notifier *mn,
-			       const struct mmu_notifier_range *range)
-{
-	struct gntdev_priv *priv = container_of(mn, struct gntdev_priv, mn);
-	struct gntdev_grant_map *map;
-	int ret = 0;
-
-	if (mmu_notifier_range_blockable(range))
-		mutex_lock(&priv->lock);
-	else if (!mutex_trylock(&priv->lock))
-		return -EAGAIN;
-
-	list_for_each_entry(map, &priv->maps, next) {
-		ret = unmap_if_in_range(map, range->start, range->end,
-					mmu_notifier_range_blockable(range));
-		if (ret)
-			goto out_unlock;
-	}
-	list_for_each_entry(map, &priv->freeable_maps, next) {
-		ret = unmap_if_in_range(map, range->start, range->end,
-					mmu_notifier_range_blockable(range));
-		if (ret)
-			goto out_unlock;
-	}
-
-out_unlock:
-	mutex_unlock(&priv->lock);
-
-	return ret;
-}
-
-static void mn_release(struct mmu_notifier *mn,
-		       struct mm_struct *mm)
-{
-	struct gntdev_priv *priv = container_of(mn, struct gntdev_priv, mn);
-	struct gntdev_grant_map *map;
-	int err;
-
-	mutex_lock(&priv->lock);
-	list_for_each_entry(map, &priv->maps, next) {
-		if (!map->vma)
-			continue;
-		pr_debug("map %d+%d (%lx %lx)\n",
-				map->index, map->count,
-				map->vma->vm_start, map->vma->vm_end);
-		err = unmap_grant_pages(map, /* offset */ 0, map->count);
-		WARN_ON(err);
-	}
-	list_for_each_entry(map, &priv->freeable_maps, next) {
-		if (!map->vma)
-			continue;
-		pr_debug("map %d+%d (%lx %lx)\n",
-				map->index, map->count,
-				map->vma->vm_start, map->vma->vm_end);
-		err = unmap_grant_pages(map, /* offset */ 0, map->count);
-		WARN_ON(err);
-	}
-	mutex_unlock(&priv->lock);
+	return true;
 }
 
-static const struct mmu_notifier_ops gntdev_mmu_ops = {
-	.release                = mn_release,
-	.invalidate_range_start = mn_invl_range_start,
+static const struct mmu_interval_notifier_ops gntdev_mmu_ops = {
+	.invalidate = gntdev_invalidate,
 };
 
 /* ------------------------------------------------------------------ */
@@ -592,7 +513,6 @@ static int gntdev_open(struct inode *inode, struct file *flip)
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&priv->maps);
-	INIT_LIST_HEAD(&priv->freeable_maps);
 	mutex_init(&priv->lock);
 
 #ifdef CONFIG_XEN_GNTDEV_DMABUF
@@ -604,17 +524,6 @@ static int gntdev_open(struct inode *inode, struct file *flip)
 	}
 #endif
 
-	if (use_ptemod) {
-		priv->mm = get_task_mm(current);
-		if (!priv->mm) {
-			kfree(priv);
-			return -ENOMEM;
-		}
-		priv->mn.ops = &gntdev_mmu_ops;
-		ret = mmu_notifier_register(&priv->mn, priv->mm);
-		mmput(priv->mm);
-	}
-
 	if (ret) {
 		kfree(priv);
 		return ret;
@@ -644,16 +553,12 @@ static int gntdev_release(struct inode *inode, struct file *flip)
 		list_del(&map->next);
 		gntdev_put_map(NULL /* already removed */, map);
 	}
-	WARN_ON(!list_empty(&priv->freeable_maps));
 	mutex_unlock(&priv->lock);
 
 #ifdef CONFIG_XEN_GNTDEV_DMABUF
 	gntdev_dmabuf_fini(priv->dmabuf_priv);
 #endif
 
-	if (use_ptemod)
-		mmu_notifier_unregister(&priv->mn, priv->mm);
-
 	kfree(priv);
 	return 0;
 }
@@ -714,8 +619,6 @@ static long gntdev_ioctl_unmap_grant_ref(struct gntdev_priv *priv,
 	map = gntdev_find_map_index(priv, op.index >> PAGE_SHIFT, op.count);
 	if (map) {
 		list_del(&map->next);
-		if (populate_freeable_maps)
-			list_add_tail(&map->next, &priv->freeable_maps);
 		err = 0;
 	}
 	mutex_unlock(&priv->lock);
@@ -1087,11 +990,6 @@ static int gntdev_mmap(struct file *flip, struct vm_area_struct *vma)
 		goto unlock_out;
 	if (use_ptemod && map->vma)
 		goto unlock_out;
-	if (use_ptemod && priv->mm != vma->vm_mm) {
-		pr_warn("Huh? Other mm?\n");
-		goto unlock_out;
-	}
-
 	refcount_inc(&map->users);
 
 	vma->vm_ops = &gntdev_vmops;
@@ -1102,10 +1000,6 @@ static int gntdev_mmap(struct file *flip, struct vm_area_struct *vma)
 		vma->vm_flags |= VM_DONTCOPY;
 
 	vma->vm_private_data = map;
-
-	if (use_ptemod)
-		map->vma = vma;
-
 	if (map->flags) {
 		if ((vma->vm_flags & VM_WRITE) &&
 				(map->flags & GNTMAP_readonly))
@@ -1116,8 +1010,28 @@ static int gntdev_mmap(struct file *flip, struct vm_area_struct *vma)
 			map->flags |= GNTMAP_readonly;
 	}
 
+	if (use_ptemod) {
+		map->vma = vma;
+		err = mmu_interval_notifier_insert_locked(
+			&map->notifier, vma->vm_mm, vma->vm_start,
+			vma->vm_end - vma->vm_start, &gntdev_mmu_ops);
+		if (err)
+			goto out_unlock_put;
+	}
 	mutex_unlock(&priv->lock);
 
+	/*
+	 * gntdev takes the address of the PTE in find_grant_ptes() and passes
+	 * it to the hypervisor in gntdev_map_grant_pages(). The purpose of
+	 * the notifier is to prevent the hypervisor pointer to the PTE from
+	 * going stale.
+	 *
+	 * Since this vma's mappings can't be touched without the mmap_sem,
+	 * and we are holding it now, there is no need for the notifier_range
+	 * locking pattern.
+	 */
+	mmu_interval_read_begin(&map->notifier);
+
 	if (use_ptemod) {
 		map->pages_vm_start = vma->vm_start;
 		err = apply_to_page_range(vma->vm_mm, vma->vm_start,
@@ -1166,8 +1080,11 @@ static int gntdev_mmap(struct file *flip, struct vm_area_struct *vma)
 	mutex_unlock(&priv->lock);
 out_put_map:
 	if (use_ptemod) {
-		map->vma = NULL;
 		unmap_grant_pages(map, 0, map->count);
+		if (map->vma) {
+			mmu_interval_notifier_remove(&map->notifier);
+			map->vma = NULL;
+		}
 	}
 	gntdev_put_map(priv, map);
 	return err;
-- 
2.24.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
