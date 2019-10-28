Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F55612B2D9
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50726E0A6;
	Fri, 27 Dec 2019 08:14:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478AD89D84
 for <nouveau@lists.freedesktop.org>; Mon, 28 Oct 2019 20:10:45 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id c25so3545445qkk.1
 for <nouveau@lists.freedesktop.org>; Mon, 28 Oct 2019 13:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jB/ndDNYI+4jh+CyWUF8UUfKQRLegAjGY1TRhiwKQXc=;
 b=Hh/Zj3Y+Ryj/mU9zMFkCbpMT+v0KWWsJkUCHo1SRF/TME2Wth945w+SYI+g39jEPtr
 2TcL6muJgm05AFmLXzPJ2in/FLllzSgw/AhshM/+MYVIyJbvpU0Qap6m7vyyIMRZczjM
 qoRRoR6DCc1QboYFax8j0T3qz9s4m6qoVjluldwL8VV7L6yIOlMd0/vXcql7RACqDDl7
 yEg0VGkJ7zGEKiXYcwRIQgRK1yf/bFeaYVtpI2tN+jQa36SxcmtU4AhWxNj5bkZTFyzo
 TREK4XNbxKgUHNgwccShMuwBnl2TL/ivSv+RnIdWqzcy2MpngTiiSLCxjHKPz913nWhK
 84oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jB/ndDNYI+4jh+CyWUF8UUfKQRLegAjGY1TRhiwKQXc=;
 b=qaE0iiRUpY5i1YaiVWKJDAQ+geFQVIBYbWJmmyJ7qKcAEFs03oeXtnZudG+bnpxVQK
 RXs3YQnkZNqp1pdS+Txmx4P2Qg8p+IwWhCo8LgZ3slvYHNAw2PvFHfh9u5xuo43GhpAM
 VskF1AfsPWmJZKifZL33rqABZi/tfMSQf8uZsbW2dCJfwyw8jQVQhs1gtILXE727D9ib
 v8jWbRbbVq5qchIPc0rL7PKWYuCOnXpmP0k7ScaQSihSnPCpQAaFH6xb6quT0nMN00mS
 ffKZ3q+q2Fr8+8WMu6O4w/TlDkTXeFISZXd8b+YrcWK8CnOBTngb1sytGUHh+vZ6Q7FF
 PPyQ==
X-Gm-Message-State: APjAAAU4R59hsXoS0bSr/tVAWstEUfP3GP/XuIUTDSQFE2fFWqkekVt0
 8/eYiYKnSIZ9hynUHgsCsQRghQ==
X-Google-Smtp-Source: APXvYqwdtbMFOB3L0H1oyTNxzhFUkpbCkNAYH5f+kI9BJWI3JXGsIu1i9+YKKYVTym2s/kszBv6jdw==
X-Received: by 2002:ae9:ee10:: with SMTP id i16mr17214277qkg.14.1572293444241; 
 Mon, 28 Oct 2019 13:10:44 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id l7sm5028902qkg.102.2019.10.28.13.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 13:10:44 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPBLf-0001gw-Fq; Mon, 28 Oct 2019 17:10:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Mon, 28 Oct 2019 17:10:27 -0300
Message-Id: <20191028201032.6352-11-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: [Nouveau] [PATCH v2 10/15] nouveau: use mmu_notifier directly for
 invalidate_range_start
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

There is no reason to get the invalidate_range_start() callback via an
indirection through hmm_mirror, just register a normal notifier directly.

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 95 ++++++++++++++++++---------
 1 file changed, 63 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 668d4bd0c118f1..577f8811925a59 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -88,6 +88,7 @@ nouveau_ivmm_find(struct nouveau_svm *svm, u64 inst)
 }
 
 struct nouveau_svmm {
+	struct mmu_notifier notifier;
 	struct nouveau_vmm *vmm;
 	struct {
 		unsigned long start;
@@ -96,7 +97,6 @@ struct nouveau_svmm {
 
 	struct mutex mutex;
 
-	struct mm_struct *mm;
 	struct hmm_mirror mirror;
 };
 
@@ -251,10 +251,11 @@ nouveau_svmm_invalidate(struct nouveau_svmm *svmm, u64 start, u64 limit)
 }
 
 static int
-nouveau_svmm_sync_cpu_device_pagetables(struct hmm_mirror *mirror,
-					const struct mmu_notifier_range *update)
+nouveau_svmm_invalidate_range_start(struct mmu_notifier *mn,
+				    const struct mmu_notifier_range *update)
 {
-	struct nouveau_svmm *svmm = container_of(mirror, typeof(*svmm), mirror);
+	struct nouveau_svmm *svmm =
+		container_of(mn, struct nouveau_svmm, notifier);
 	unsigned long start = update->start;
 	unsigned long limit = update->end;
 
@@ -264,6 +265,9 @@ nouveau_svmm_sync_cpu_device_pagetables(struct hmm_mirror *mirror,
 	SVMM_DBG(svmm, "invalidate %016lx-%016lx", start, limit);
 
 	mutex_lock(&svmm->mutex);
+	if (unlikely(!svmm->vmm))
+		goto out;
+
 	if (limit > svmm->unmanaged.start && start < svmm->unmanaged.limit) {
 		if (start < svmm->unmanaged.start) {
 			nouveau_svmm_invalidate(svmm, start,
@@ -273,19 +277,31 @@ nouveau_svmm_sync_cpu_device_pagetables(struct hmm_mirror *mirror,
 	}
 
 	nouveau_svmm_invalidate(svmm, start, limit);
+
+out:
 	mutex_unlock(&svmm->mutex);
 	return 0;
 }
 
-static void
-nouveau_svmm_release(struct hmm_mirror *mirror)
+static void nouveau_svmm_free_notifier(struct mmu_notifier *mn)
+{
+	kfree(container_of(mn, struct nouveau_svmm, notifier));
+}
+
+static const struct mmu_notifier_ops nouveau_mn_ops = {
+	.invalidate_range_start = nouveau_svmm_invalidate_range_start,
+	.free_notifier = nouveau_svmm_free_notifier,
+};
+
+static int
+nouveau_svmm_sync_cpu_device_pagetables(struct hmm_mirror *mirror,
+					const struct mmu_notifier_range *update)
 {
+	return 0;
 }
 
-static const struct hmm_mirror_ops
-nouveau_svmm = {
+static const struct hmm_mirror_ops nouveau_svmm = {
 	.sync_cpu_device_pagetables = nouveau_svmm_sync_cpu_device_pagetables,
-	.release = nouveau_svmm_release,
 };
 
 void
@@ -294,7 +310,10 @@ nouveau_svmm_fini(struct nouveau_svmm **psvmm)
 	struct nouveau_svmm *svmm = *psvmm;
 	if (svmm) {
 		hmm_mirror_unregister(&svmm->mirror);
-		kfree(*psvmm);
+		mutex_lock(&svmm->mutex);
+		svmm->vmm = NULL;
+		mutex_unlock(&svmm->mutex);
+		mmu_notifier_put(&svmm->notifier);
 		*psvmm = NULL;
 	}
 }
@@ -320,7 +339,7 @@ nouveau_svmm_init(struct drm_device *dev, void *data,
 	mutex_lock(&cli->mutex);
 	if (cli->svm.cli) {
 		ret = -EBUSY;
-		goto done;
+		goto out_free;
 	}
 
 	/* Allocate a new GPU VMM that can support SVM (managed by the
@@ -335,24 +354,33 @@ nouveau_svmm_init(struct drm_device *dev, void *data,
 				.fault_replay = true,
 			    }, sizeof(struct gp100_vmm_v0), &cli->svm.vmm);
 	if (ret)
-		goto done;
+		goto out_free;
 
-	/* Enable HMM mirroring of CPU address-space to VMM. */
-	svmm->mm = get_task_mm(current);
-	down_write(&svmm->mm->mmap_sem);
+	down_write(&current->mm->mmap_sem);
 	svmm->mirror.ops = &nouveau_svmm;
-	ret = hmm_mirror_register(&svmm->mirror, svmm->mm);
-	if (ret == 0) {
-		cli->svm.svmm = svmm;
-		cli->svm.cli = cli;
-	}
-	up_write(&svmm->mm->mmap_sem);
-	mmput(svmm->mm);
+	ret = hmm_mirror_register(&svmm->mirror, current->mm);
+	if (ret)
+		goto out_mm_unlock;
 
-done:
+	svmm->notifier.ops = &nouveau_mn_ops;
+	ret = __mmu_notifier_register(&svmm->notifier, current->mm);
 	if (ret)
-		nouveau_svmm_fini(&svmm);
+		goto out_hmm_unregister;
+	/* Note, ownership of svmm transfers to mmu_notifier */
+
+	cli->svm.svmm = svmm;
+	cli->svm.cli = cli;
+	up_write(&current->mm->mmap_sem);
 	mutex_unlock(&cli->mutex);
+	return 0;
+
+out_hmm_unregister:
+	hmm_mirror_unregister(&svmm->mirror);
+out_mm_unlock:
+	up_write(&current->mm->mmap_sem);
+out_free:
+	mutex_unlock(&cli->mutex);
+	kfree(svmm);
 	return ret;
 }
 
@@ -494,12 +522,12 @@ nouveau_range_fault(struct nouveau_svmm *svmm, struct hmm_range *range)
 
 	ret = hmm_range_register(range, &svmm->mirror);
 	if (ret) {
-		up_read(&svmm->mm->mmap_sem);
+		up_read(&svmm->notifier.mm->mmap_sem);
 		return (int)ret;
 	}
 
 	if (!hmm_range_wait_until_valid(range, HMM_RANGE_DEFAULT_TIMEOUT)) {
-		up_read(&svmm->mm->mmap_sem);
+		up_read(&svmm->notifier.mm->mmap_sem);
 		return -EBUSY;
 	}
 
@@ -507,7 +535,7 @@ nouveau_range_fault(struct nouveau_svmm *svmm, struct hmm_range *range)
 	if (ret <= 0) {
 		if (ret == 0)
 			ret = -EBUSY;
-		up_read(&svmm->mm->mmap_sem);
+		up_read(&svmm->notifier.mm->mmap_sem);
 		hmm_range_unregister(range);
 		return ret;
 	}
@@ -587,12 +615,15 @@ nouveau_svm_fault(struct nvif_notify *notify)
 	args.i.p.version = 0;
 
 	for (fi = 0; fn = fi + 1, fi < buffer->fault_nr; fi = fn) {
+		struct mm_struct *mm;
+
 		/* Cancel any faults from non-SVM channels. */
 		if (!(svmm = buffer->fault[fi]->svmm)) {
 			nouveau_svm_fault_cancel_fault(svm, buffer->fault[fi]);
 			continue;
 		}
 		SVMM_DBG(svmm, "addr %016llx", buffer->fault[fi]->addr);
+		mm = svmm->notifier.mm;
 
 		/* We try and group handling of faults within a small
 		 * window into a single update.
@@ -609,11 +640,11 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		/* Intersect fault window with the CPU VMA, cancelling
 		 * the fault if the address is invalid.
 		 */
-		down_read(&svmm->mm->mmap_sem);
-		vma = find_vma_intersection(svmm->mm, start, limit);
+		down_read(&mm->mmap_sem);
+		vma = find_vma_intersection(mm, start, limit);
 		if (!vma) {
 			SVMM_ERR(svmm, "wndw %016llx-%016llx", start, limit);
-			up_read(&svmm->mm->mmap_sem);
+			up_read(&mm->mmap_sem);
 			nouveau_svm_fault_cancel_fault(svm, buffer->fault[fi]);
 			continue;
 		}
@@ -623,7 +654,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
 
 		if (buffer->fault[fi]->addr != start) {
 			SVMM_ERR(svmm, "addr %016llx", buffer->fault[fi]->addr);
-			up_read(&svmm->mm->mmap_sem);
+			up_read(&mm->mmap_sem);
 			nouveau_svm_fault_cancel_fault(svm, buffer->fault[fi]);
 			continue;
 		}
@@ -704,7 +735,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
 						NULL);
 			svmm->vmm->vmm.object.client->super = false;
 			mutex_unlock(&svmm->mutex);
-			up_read(&svmm->mm->mmap_sem);
+			up_read(&mm->mmap_sem);
 		}
 
 		/* Cancel any faults in the window whose pages didn't manage
-- 
2.23.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
