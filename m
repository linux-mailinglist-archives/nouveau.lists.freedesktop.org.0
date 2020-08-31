Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AA725829E
	for <lists+nouveau@lfdr.de>; Mon, 31 Aug 2020 22:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C1C89061;
	Mon, 31 Aug 2020 20:31:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA7F89061
 for <nouveau@lists.freedesktop.org>; Mon, 31 Aug 2020 20:31:30 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f4d5da30000>; Mon, 31 Aug 2020 13:29:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 31 Aug 2020 13:31:29 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 31 Aug 2020 13:31:29 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 31 Aug
 2020 20:31:28 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 31 Aug 2020 20:31:28 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f4d5e200001>; Mon, 31 Aug 2020 13:31:28 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 31 Aug 2020 13:31:11 -0700
Message-ID: <20200831203111.4940-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1598905763; bh=pZWsjSZM0QN5f+TE2diScGkjthiNwttyZzPcjsliW5Q=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=FbVDlCGjRypJsQ8N3BF746+otYl3PQqAgWuR0TY+dk8GXTAtlWV5XefOeqCOxaoEZ
 eEZfHwpZnsUaexY5oxjWIYcDDXX19/3RS0dd1S0xtLhbRmW6makl1Time2m2F8j1l0
 k5KNNpRnM1UVeUeq3eENJFcDvAsDPGKWfWMksttbvsshQwRfsk20fExdNFlhM9/nnz
 VdY/+TbqUSw7SVYCtFfOnvCP59oM8odz7PbJtJZDeRJvRr7Pv02AWNRzmCR1YQSR2B
 TPFcE6QgyFs5bWcuW9PwrfvunCKtWxP0qVDqkE5Dwt7ujmS7cWVN7lES5TXwsErMGt
 Di9Df95W5s9qg==
Subject: [Nouveau] [PATCH v2] nouveau: fix the start/end range for migration
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The user level OpenCL code shouldn't have to align start and end
addresses to a page boundary. That is better handled in the nouveau
driver. The npages field is also redundant since it can be computed
from the start and end addresses.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---

This is for Ben Skegg's nouveau tree.

I have been working with Karol Herbst on the OpenCL mesa changes for
nouveau which will be merged upstream soon.
With or without those changes, the user visible effect of this patch
only extends the range by one page (round up vs. round down to page
boundary).

Changes in v2:
I changed the start/end check to require a size so start has to be less
than end.

 drivers/gpu/drm/nouveau/nouveau_svm.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 2df1c0460559..4f69e4c3dafd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -105,11 +105,11 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct drm_nouveau_svm_bind *args = data;
 	unsigned target, cmd, priority;
-	unsigned long addr, end, size;
+	unsigned long addr, end;
 	struct mm_struct *mm;
 
 	args->va_start &= PAGE_MASK;
-	args->va_end &= PAGE_MASK;
+	args->va_end = ALIGN(args->va_end, PAGE_SIZE);
 
 	/* Sanity check arguments */
 	if (args->reserved0 || args->reserved1)
@@ -118,8 +118,6 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 		return -EINVAL;
 	if (args->va_start >= args->va_end)
 		return -EINVAL;
-	if (!args->npages)
-		return -EINVAL;
 
 	cmd = args->header >> NOUVEAU_SVM_BIND_COMMAND_SHIFT;
 	cmd &= NOUVEAU_SVM_BIND_COMMAND_MASK;
@@ -151,12 +149,6 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 	if (args->stride)
 		return -EINVAL;
 
-	size = ((unsigned long)args->npages) << PAGE_SHIFT;
-	if ((args->va_start + size) <= args->va_start)
-		return -EINVAL;
-	if ((args->va_start + size) > args->va_end)
-		return -EINVAL;
-
 	/*
 	 * Ok we are ask to do something sane, for now we only support migrate
 	 * commands but we will add things like memory policy (what to do on
@@ -171,7 +163,7 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
-	for (addr = args->va_start, end = args->va_start + size; addr < end;) {
+	for (addr = args->va_start, end = args->va_end; addr < end;) {
 		struct vm_area_struct *vma;
 		unsigned long next;
 
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
