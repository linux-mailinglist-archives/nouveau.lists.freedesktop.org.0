Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A4D12B331
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F706E417;
	Fri, 27 Dec 2019 08:14:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1192D89CDB
 for <nouveau@lists.freedesktop.org>; Mon, 28 Oct 2019 20:10:47 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x14so6223449qtq.3
 for <nouveau@lists.freedesktop.org>; Mon, 28 Oct 2019 13:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nd1aeYImkpXF2bbrObm2jlgTnnBK6THl9IrchVUSDrc=;
 b=QDUnE3MKTwJpRZIuKGLEd1KxvZJlb+1DckHcCHURQ9HSK1t0RgoAy1Is1dYbrkQZ64
 g3Cik5qTLKAK+tJxANfOd6jSJHSfmS2EgZwzw8EAv2+qIZnZ5utqGK1ZH71e5CCb1jJ3
 XsMcS4e6B+Vs9d1PZ+vxftVtfIQ6Bl9/KzbGU1uf7mO8gJSkYiO2QQoAzifV0POM/8ap
 Cf/8XsxF5GYxRHaHPBTyYNzN1Lgf40qxiLNjl+31nIJL+8BLCAieaP73H5kJOEruupO9
 MkbljHmAYlsW7oq0Nf8YesEJ4y9aFQHgNi8duEVefClbdJoJex+URxoETEvIn6cobMxB
 BxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nd1aeYImkpXF2bbrObm2jlgTnnBK6THl9IrchVUSDrc=;
 b=VUINWgWb1DWCgdjUotpj5F5q1ZGtrffBRxdeuTW+qQLmYCI3WgZkK6X7JCWX3blCD6
 OKFP5CoGHMhQCabtBMLQ7Ei+V2YN4qemJNqH8dxxEoULbvR7wogVroWhm9dSxL5Fu++N
 IDkYrmTyTHkYzX8Y/48ewRoR6pPiN0h6J7JrJEcqSrz4MIeVnIh8QkXQ2Hzq9amIMxTC
 /bnEqDMFOMjK7sCR6DBZGHOgIT9EuLm18WVOh4Lbo0plg4+9jFHsma3BfNDDFyLM+Lf4
 24LxqZD8QtIpdq4WSCse3jokmBKRvQ+LIaBe8rDPbyBsuLiS0Ssoc1jcPxSFkgKhLrq/
 oNTA==
X-Gm-Message-State: APjAAAUG3QKCMk/WZaaPlRf4WY4ZL1fpknYw3x1Oz1TJdJbCnE1tnCEu
 DBYPuHJvptTHD2jcoNzTBugVWw==
X-Google-Smtp-Source: APXvYqz7tV89//SAw/M6qcwng6wHNybOT2RkA1hOycOk7KeHSuGGECfRCjBje19BfyzzB0Z65gEjdA==
X-Received: by 2002:ac8:3142:: with SMTP id h2mr343813qtb.182.1572293445995;
 Mon, 28 Oct 2019 13:10:45 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id i66sm6141757qkb.105.2019.10.28.13.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 13:10:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPBLf-0001gY-AK; Mon, 28 Oct 2019 17:10:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Mon, 28 Oct 2019 17:10:23 -0300
Message-Id: <20191028201032.6352-7-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: [Nouveau] [PATCH v2 06/15] RDMA/hfi1: Use mmu_range_notifier_inset
 for user_exp_rcv
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

This converts one of the two users of mmu_notifiers to use the new API.
The conversion is fairly straightforward, however the existing use of
notifiers here seems to be racey.

Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>
Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 drivers/infiniband/hw/hfi1/file_ops.c     |   2 +-
 drivers/infiniband/hw/hfi1/hfi.h          |   2 +-
 drivers/infiniband/hw/hfi1/user_exp_rcv.c | 146 +++++++++-------------
 drivers/infiniband/hw/hfi1/user_exp_rcv.h |   3 +-
 4 files changed, 60 insertions(+), 93 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/file_ops.c b/drivers/infiniband/hw/hfi1/file_ops.c
index f9a7e9d29c8ba2..7c5e3fb224139a 100644
--- a/drivers/infiniband/hw/hfi1/file_ops.c
+++ b/drivers/infiniband/hw/hfi1/file_ops.c
@@ -1138,7 +1138,7 @@ static int get_ctxt_info(struct hfi1_filedata *fd, unsigned long arg, u32 len)
 			HFI1_CAP_UGET_MASK(uctxt->flags, MASK) |
 			HFI1_CAP_KGET_MASK(uctxt->flags, K2U);
 	/* adjust flag if this fd is not able to cache */
-	if (!fd->handler)
+	if (!fd->use_mn)
 		cinfo.runtime_flags |= HFI1_CAP_TID_UNMAP; /* no caching */
 
 	cinfo.num_active = hfi1_count_active_units();
diff --git a/drivers/infiniband/hw/hfi1/hfi.h b/drivers/infiniband/hw/hfi1/hfi.h
index fa45350a9a1d32..fc10d65fc3e13c 100644
--- a/drivers/infiniband/hw/hfi1/hfi.h
+++ b/drivers/infiniband/hw/hfi1/hfi.h
@@ -1444,7 +1444,7 @@ struct hfi1_filedata {
 	/* for cpu affinity; -1 if none */
 	int rec_cpu_num;
 	u32 tid_n_pinned;
-	struct mmu_rb_handler *handler;
+	bool use_mn;
 	struct tid_rb_node **entry_to_rb;
 	spinlock_t tid_lock; /* protect tid_[limit,used] counters */
 	u32 tid_limit;
diff --git a/drivers/infiniband/hw/hfi1/user_exp_rcv.c b/drivers/infiniband/hw/hfi1/user_exp_rcv.c
index 3592a9ec155e85..a1ab3bd334f89e 100644
--- a/drivers/infiniband/hw/hfi1/user_exp_rcv.c
+++ b/drivers/infiniband/hw/hfi1/user_exp_rcv.c
@@ -59,11 +59,11 @@ static int set_rcvarray_entry(struct hfi1_filedata *fd,
 			      struct tid_user_buf *tbuf,
 			      u32 rcventry, struct tid_group *grp,
 			      u16 pageidx, unsigned int npages);
-static int tid_rb_insert(void *arg, struct mmu_rb_node *node);
 static void cacheless_tid_rb_remove(struct hfi1_filedata *fdata,
 				    struct tid_rb_node *tnode);
-static void tid_rb_remove(void *arg, struct mmu_rb_node *node);
-static int tid_rb_invalidate(void *arg, struct mmu_rb_node *mnode);
+static bool tid_rb_invalidate(struct mmu_range_notifier *mrn,
+			      const struct mmu_notifier_range *range,
+			      unsigned long cur_seq);
 static int program_rcvarray(struct hfi1_filedata *fd, struct tid_user_buf *,
 			    struct tid_group *grp,
 			    unsigned int start, u16 count,
@@ -73,10 +73,8 @@ static int unprogram_rcvarray(struct hfi1_filedata *fd, u32 tidinfo,
 			      struct tid_group **grp);
 static void clear_tid_node(struct hfi1_filedata *fd, struct tid_rb_node *node);
 
-static struct mmu_rb_ops tid_rb_ops = {
-	.insert = tid_rb_insert,
-	.remove = tid_rb_remove,
-	.invalidate = tid_rb_invalidate
+static const struct mmu_range_notifier_ops tid_mn_ops = {
+	.invalidate = tid_rb_invalidate,
 };
 
 /*
@@ -87,7 +85,6 @@ static struct mmu_rb_ops tid_rb_ops = {
 int hfi1_user_exp_rcv_init(struct hfi1_filedata *fd,
 			   struct hfi1_ctxtdata *uctxt)
 {
-	struct hfi1_devdata *dd = uctxt->dd;
 	int ret = 0;
 
 	spin_lock_init(&fd->tid_lock);
@@ -109,20 +106,7 @@ int hfi1_user_exp_rcv_init(struct hfi1_filedata *fd,
 			fd->entry_to_rb = NULL;
 			return -ENOMEM;
 		}
-
-		/*
-		 * Register MMU notifier callbacks. If the registration
-		 * fails, continue without TID caching for this context.
-		 */
-		ret = hfi1_mmu_rb_register(fd, fd->mm, &tid_rb_ops,
-					   dd->pport->hfi1_wq,
-					   &fd->handler);
-		if (ret) {
-			dd_dev_info(dd,
-				    "Failed MMU notifier registration %d\n",
-				    ret);
-			ret = 0;
-		}
+		fd->use_mn = true;
 	}
 
 	/*
@@ -139,7 +123,7 @@ int hfi1_user_exp_rcv_init(struct hfi1_filedata *fd,
 	 * init.
 	 */
 	spin_lock(&fd->tid_lock);
-	if (uctxt->subctxt_cnt && fd->handler) {
+	if (uctxt->subctxt_cnt && fd->use_mn) {
 		u16 remainder;
 
 		fd->tid_limit = uctxt->expected_count / uctxt->subctxt_cnt;
@@ -158,18 +142,10 @@ void hfi1_user_exp_rcv_free(struct hfi1_filedata *fd)
 {
 	struct hfi1_ctxtdata *uctxt = fd->uctxt;
 
-	/*
-	 * The notifier would have been removed when the process'es mm
-	 * was freed.
-	 */
-	if (fd->handler) {
-		hfi1_mmu_rb_unregister(fd->handler);
-	} else {
-		if (!EXP_TID_SET_EMPTY(uctxt->tid_full_list))
-			unlock_exp_tids(uctxt, &uctxt->tid_full_list, fd);
-		if (!EXP_TID_SET_EMPTY(uctxt->tid_used_list))
-			unlock_exp_tids(uctxt, &uctxt->tid_used_list, fd);
-	}
+	if (!EXP_TID_SET_EMPTY(uctxt->tid_full_list))
+		unlock_exp_tids(uctxt, &uctxt->tid_full_list, fd);
+	if (!EXP_TID_SET_EMPTY(uctxt->tid_used_list))
+		unlock_exp_tids(uctxt, &uctxt->tid_used_list, fd);
 
 	kfree(fd->invalid_tids);
 	fd->invalid_tids = NULL;
@@ -201,7 +177,7 @@ static void unpin_rcv_pages(struct hfi1_filedata *fd,
 
 	if (mapped) {
 		pci_unmap_single(dd->pcidev, node->dma_addr,
-				 node->mmu.len, PCI_DMA_FROMDEVICE);
+				 node->npages * PAGE_SIZE, PCI_DMA_FROMDEVICE);
 		pages = &node->pages[idx];
 	} else {
 		pages = &tidbuf->pages[idx];
@@ -777,8 +753,8 @@ static int set_rcvarray_entry(struct hfi1_filedata *fd,
 		return -EFAULT;
 	}
 
-	node->mmu.addr = tbuf->vaddr + (pageidx * PAGE_SIZE);
-	node->mmu.len = npages * PAGE_SIZE;
+	node->notifier.ops = &tid_mn_ops;
+	node->fdata = fd;
 	node->phys = page_to_phys(pages[0]);
 	node->npages = npages;
 	node->rcventry = rcventry;
@@ -787,23 +763,34 @@ static int set_rcvarray_entry(struct hfi1_filedata *fd,
 	node->freed = false;
 	memcpy(node->pages, pages, sizeof(struct page *) * npages);
 
-	if (!fd->handler)
-		ret = tid_rb_insert(fd, &node->mmu);
-	else
-		ret = hfi1_mmu_rb_insert(fd->handler, &node->mmu);
-
-	if (ret) {
-		hfi1_cdbg(TID, "Failed to insert RB node %u 0x%lx, 0x%lx %d",
-			  node->rcventry, node->mmu.addr, node->phys, ret);
-		pci_unmap_single(dd->pcidev, phys, npages * PAGE_SIZE,
-				 PCI_DMA_FROMDEVICE);
-		kfree(node);
-		return -EFAULT;
+	if (fd->use_mn) {
+		ret = mmu_range_notifier_insert(
+			&node->notifier, tbuf->vaddr + (pageidx * PAGE_SIZE),
+			npages * PAGE_SIZE, fd->mm);
+		if (ret)
+			goto out_unmap;
+		/*
+		 * FIXME: This is in the wrong order, the notifier should be
+		 * established before the pages are pinned by pin_rcv_pages.
+		 */
+		mmu_range_read_begin(&node->notifier);
 	}
+	fd->entry_to_rb[node->rcventry - uctxt->expected_base] = node;
+
 	hfi1_put_tid(dd, rcventry, PT_EXPECTED, phys, ilog2(npages) + 1);
 	trace_hfi1_exp_tid_reg(uctxt->ctxt, fd->subctxt, rcventry, npages,
-			       node->mmu.addr, node->phys, phys);
+			       node->notifier.interval_tree.start, node->phys,
+			       phys);
 	return 0;
+
+out_unmap:
+	hfi1_cdbg(TID, "Failed to insert RB node %u 0x%lx, 0x%lx %d",
+		  node->rcventry, node->notifier.interval_tree.start,
+		  node->phys, ret);
+	pci_unmap_single(dd->pcidev, phys, npages * PAGE_SIZE,
+			 PCI_DMA_FROMDEVICE);
+	kfree(node);
+	return -EFAULT;
 }
 
 static int unprogram_rcvarray(struct hfi1_filedata *fd, u32 tidinfo,
@@ -833,10 +820,9 @@ static int unprogram_rcvarray(struct hfi1_filedata *fd, u32 tidinfo,
 	if (grp)
 		*grp = node->grp;
 
-	if (!fd->handler)
-		cacheless_tid_rb_remove(fd, node);
-	else
-		hfi1_mmu_rb_remove(fd->handler, &node->mmu);
+	if (fd->use_mn)
+		mmu_range_notifier_remove(&node->notifier);
+	cacheless_tid_rb_remove(fd, node);
 
 	return 0;
 }
@@ -847,7 +833,8 @@ static void clear_tid_node(struct hfi1_filedata *fd, struct tid_rb_node *node)
 	struct hfi1_devdata *dd = uctxt->dd;
 
 	trace_hfi1_exp_tid_unreg(uctxt->ctxt, fd->subctxt, node->rcventry,
-				 node->npages, node->mmu.addr, node->phys,
+				 node->npages,
+				 node->notifier.interval_tree.start, node->phys,
 				 node->dma_addr);
 
 	/*
@@ -894,30 +881,29 @@ static void unlock_exp_tids(struct hfi1_ctxtdata *uctxt,
 				if (!node || node->rcventry != rcventry)
 					continue;
 
+				if (fd->use_mn)
+					mmu_range_notifier_remove(
+						&node->notifier);
 				cacheless_tid_rb_remove(fd, node);
 			}
 		}
 	}
 }
 
-/*
- * Always return 0 from this function.  A non-zero return indicates that the
- * remove operation will be called and that memory should be unpinned.
- * However, the driver cannot unpin out from under PSM.  Instead, retain the
- * memory (by returning 0) and inform PSM that the memory is going away.  PSM
- * will call back later when it has removed the memory from its list.
- */
-static int tid_rb_invalidate(void *arg, struct mmu_rb_node *mnode)
+static bool tid_rb_invalidate(struct mmu_range_notifier *mrn,
+			      const struct mmu_notifier_range *range,
+			      unsigned long cur_seq)
 {
-	struct hfi1_filedata *fdata = arg;
-	struct hfi1_ctxtdata *uctxt = fdata->uctxt;
 	struct tid_rb_node *node =
-		container_of(mnode, struct tid_rb_node, mmu);
+		container_of(mrn, struct tid_rb_node, notifier);
+	struct hfi1_filedata *fdata = node->fdata;
+	struct hfi1_ctxtdata *uctxt = fdata->uctxt;
 
 	if (node->freed)
-		return 0;
+		return true;
 
-	trace_hfi1_exp_tid_inval(uctxt->ctxt, fdata->subctxt, node->mmu.addr,
+	trace_hfi1_exp_tid_inval(uctxt->ctxt, fdata->subctxt,
+				 node->notifier.interval_tree.start,
 				 node->rcventry, node->npages, node->dma_addr);
 	node->freed = true;
 
@@ -946,18 +932,7 @@ static int tid_rb_invalidate(void *arg, struct mmu_rb_node *mnode)
 		fdata->invalid_tid_idx++;
 	}
 	spin_unlock(&fdata->invalid_lock);
-	return 0;
-}
-
-static int tid_rb_insert(void *arg, struct mmu_rb_node *node)
-{
-	struct hfi1_filedata *fdata = arg;
-	struct tid_rb_node *tnode =
-		container_of(node, struct tid_rb_node, mmu);
-	u32 base = fdata->uctxt->expected_base;
-
-	fdata->entry_to_rb[tnode->rcventry - base] = tnode;
-	return 0;
+	return true;
 }
 
 static void cacheless_tid_rb_remove(struct hfi1_filedata *fdata,
@@ -968,12 +943,3 @@ static void cacheless_tid_rb_remove(struct hfi1_filedata *fdata,
 	fdata->entry_to_rb[tnode->rcventry - base] = NULL;
 	clear_tid_node(fdata, tnode);
 }
-
-static void tid_rb_remove(void *arg, struct mmu_rb_node *node)
-{
-	struct hfi1_filedata *fdata = arg;
-	struct tid_rb_node *tnode =
-		container_of(node, struct tid_rb_node, mmu);
-
-	cacheless_tid_rb_remove(fdata, tnode);
-}
diff --git a/drivers/infiniband/hw/hfi1/user_exp_rcv.h b/drivers/infiniband/hw/hfi1/user_exp_rcv.h
index 43b105de1d5427..b5314db083b125 100644
--- a/drivers/infiniband/hw/hfi1/user_exp_rcv.h
+++ b/drivers/infiniband/hw/hfi1/user_exp_rcv.h
@@ -65,7 +65,8 @@ struct tid_user_buf {
 };
 
 struct tid_rb_node {
-	struct mmu_rb_node mmu;
+	struct mmu_range_notifier notifier;
+	struct hfi1_filedata *fdata;
 	unsigned long phys;
 	struct tid_group *grp;
 	u32 rcventry;
-- 
2.23.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
