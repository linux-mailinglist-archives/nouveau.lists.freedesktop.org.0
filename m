Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667617DE8E6
	for <lists+nouveau@lfdr.de>; Thu,  2 Nov 2023 00:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3A310E7DF;
	Wed,  1 Nov 2023 23:31:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB9E10E7DF
 for <nouveau@lists.freedesktop.org>; Wed,  1 Nov 2023 23:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698881485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1lD0COgBfwH5UYAd332SA45aE7haVTJhuDDmzsBJW6I=;
 b=T8Yxexz7aFqL+WbUcwli5ZpJ8KlRjmLnPdHmxkwjlLIRz/0/V3bJbTfZbJfQ4ith31jJuK
 ma0O8VPM2/ssViOxu+oXEkEi2Ztkhr+Uoevk8XYxnTHvgJYoNH7p3OIqquinoSh/6NOmdC
 16EgFACF+/TqZTmTrTCQERrTJA2ncw0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-p-g2uFmkO1SlfZwc_QVPqA-1; Wed, 01 Nov 2023 19:31:24 -0400
X-MC-Unique: p-g2uFmkO1SlfZwc_QVPqA-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-53e2acda9d6so198155a12.2
 for <nouveau@lists.freedesktop.org>; Wed, 01 Nov 2023 16:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698881483; x=1699486283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1lD0COgBfwH5UYAd332SA45aE7haVTJhuDDmzsBJW6I=;
 b=YnDcylWyUH1TRMtMDtNkyWp/LMxiRZFMDHCxNvy9h0JzwGi+PxshkEOqfIsRLIF0bO
 th2p9E3jLRBT4wsaGOxw86O8Ya9WtjM00ve6ACGVbHyt09Y1az0Q92yAWp3LBnyXB/Ih
 ekKF+j/ywHeZsL06WNAm1ZHecJ6KQ7izCD1hhGW4FD9bAKsL22h5ce+1j5uyYUowbUsY
 Hu/FjD990TkIUtC7Pr+UhiKg57Cl6K3cYW2YsktO9Nh7TqDKac3GeQUFwTFUWbXAQU/C
 mT1CJi/03q3fn/La2ABGlNvB6PpFw7Vp1swyRCssiUpKieVbA4IfyRWDioCNVh0AqYFX
 wEaA==
X-Gm-Message-State: AOJu0YztKTt5STl5wnapOePx5N5DjXmfnXRYk8iiwq7zwCD2pBxcOiVW
 k+7RzHotFATEZGCJn+STkylCbR8g0SyWgRILay9VBKJQm5UoxRHtSNFUKBTnZz1e34KG6EyKT25
 O/bYhqrdQ/y//4Ato03JAYA7MLg==
X-Received: by 2002:a05:6402:1ac8:b0:53d:b839:2045 with SMTP id
 ba8-20020a0564021ac800b0053db8392045mr12074611edb.25.1698881482995; 
 Wed, 01 Nov 2023 16:31:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF4r0+dOme5iGT3Nw+myMv/GbANRSOpuEAorLBfyWK6TebZ9Lppjqo8x4AQ4l4nKNYbvJHKQ==
X-Received: by 2002:a05:6402:1ac8:b0:53d:b839:2045 with SMTP id
 ba8-20020a0564021ac800b0053db8392045mr12074599edb.25.1698881482710; 
 Wed, 01 Nov 2023 16:31:22 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 s28-20020a50ab1c000000b0053dfd3519f4sm1621724edc.22.2023.11.01.16.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 16:31:22 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Date: Thu,  2 Nov 2023 00:30:53 +0100
Message-ID: <20231101233113.8059-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101233113.8059-1-dakr@redhat.com>
References: <20231101233113.8059-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH drm-misc-next v8 01/12] drm/gpuvm: convert WARN()
 to drm_WARN() variants
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Use drm_WARN() and drm_WARN_ON() variants to indicate drivers the
context the failing VM resides in.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 32 ++++++++++++++------------
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
 include/drm/drm_gpuvm.h                |  7 ++++++
 3 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 08c088319652..d7367a202fee 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -614,12 +614,12 @@ static int __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 static void __drm_gpuva_remove(struct drm_gpuva *va);
 
 static bool
-drm_gpuvm_check_overflow(u64 addr, u64 range)
+drm_gpuvm_check_overflow(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
 {
 	u64 end;
 
-	return WARN(check_add_overflow(addr, range, &end),
-		    "GPUVA address limited to %zu bytes.\n", sizeof(end));
+	return drm_WARN(gpuvm->drm, check_add_overflow(addr, range, &end),
+			"GPUVA address limited to %zu bytes.\n", sizeof(end));
 }
 
 static bool
@@ -647,7 +647,7 @@ static bool
 drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 		      u64 addr, u64 range)
 {
-	return !drm_gpuvm_check_overflow(addr, range) &&
+	return !drm_gpuvm_check_overflow(gpuvm, addr, range) &&
 	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
 	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
 }
@@ -656,6 +656,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
  * drm_gpuvm_init() - initialize a &drm_gpuvm
  * @gpuvm: pointer to the &drm_gpuvm to initialize
  * @name: the name of the GPU VA space
+ * @drm: the &drm_device this VM resides in
  * @start_offset: the start offset of the GPU VA space
  * @range: the size of the GPU VA space
  * @reserve_offset: the start of the kernel reserved GPU VA area
@@ -668,8 +669,8 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
  * &name is expected to be managed by the surrounding driver structures.
  */
 void
-drm_gpuvm_init(struct drm_gpuvm *gpuvm,
-	       const char *name,
+drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+	       struct drm_device *drm,
 	       u64 start_offset, u64 range,
 	       u64 reserve_offset, u64 reserve_range,
 	       const struct drm_gpuvm_ops *ops)
@@ -677,20 +678,20 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
 	gpuvm->rb.tree = RB_ROOT_CACHED;
 	INIT_LIST_HEAD(&gpuvm->rb.list);
 
-	drm_gpuvm_check_overflow(start_offset, range);
-	gpuvm->mm_start = start_offset;
-	gpuvm->mm_range = range;
-
 	gpuvm->name = name ? name : "unknown";
 	gpuvm->ops = ops;
+	gpuvm->drm = drm;
 
-	memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
+	drm_gpuvm_check_overflow(gpuvm, start_offset, range);
+	gpuvm->mm_start = start_offset;
+	gpuvm->mm_range = range;
 
+	memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
 	if (reserve_range) {
 		gpuvm->kernel_alloc_node.va.addr = reserve_offset;
 		gpuvm->kernel_alloc_node.va.range = reserve_range;
 
-		if (likely(!drm_gpuvm_check_overflow(reserve_offset,
+		if (likely(!drm_gpuvm_check_overflow(gpuvm, reserve_offset,
 						     reserve_range)))
 			__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
 	}
@@ -712,8 +713,8 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
 	if (gpuvm->kernel_alloc_node.va.range)
 		__drm_gpuva_remove(&gpuvm->kernel_alloc_node);
 
-	WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
-	     "GPUVA tree is not empty, potentially leaking memory.");
+	drm_WARN(gpuvm->drm, !RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
+		 "GPUVA tree is not empty, potentially leaking memory.\n");
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
 
@@ -795,7 +796,8 @@ drm_gpuva_remove(struct drm_gpuva *va)
 	struct drm_gpuvm *gpuvm = va->vm;
 
 	if (unlikely(va == &gpuvm->kernel_alloc_node)) {
-		WARN(1, "Can't destroy kernel reserved node.\n");
+		drm_WARN(gpuvm->drm, 1,
+			 "Can't destroy kernel reserved node.\n");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 5cf892c50f43..aaf5d28bd587 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1808,6 +1808,7 @@ int
 nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		  u64 kernel_managed_addr, u64 kernel_managed_size)
 {
+	struct drm_device *drm = cli->drm->dev;
 	int ret;
 	u64 kernel_managed_end = kernel_managed_addr + kernel_managed_size;
 
@@ -1836,7 +1837,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	uvmm->kernel_managed_addr = kernel_managed_addr;
 	uvmm->kernel_managed_size = kernel_managed_size;
 
-	drm_gpuvm_init(&uvmm->base, cli->name,
+	drm_gpuvm_init(&uvmm->base, cli->name, drm,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       kernel_managed_addr, kernel_managed_size,
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index bdfafc4a7705..687fd5893624 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -29,6 +29,7 @@
 #include <linux/rbtree.h>
 #include <linux/types.h>
 
+#include <drm/drm_device.h>
 #include <drm/drm_gem.h>
 
 struct drm_gpuvm;
@@ -201,6 +202,11 @@ struct drm_gpuvm {
 	 */
 	const char *name;
 
+	/**
+	 * @drm: the &drm_device this VM lives in
+	 */
+	struct drm_device *drm;
+
 	/**
 	 * @mm_start: start of the VA space
 	 */
@@ -241,6 +247,7 @@ struct drm_gpuvm {
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+		    struct drm_device *drm,
 		    u64 start_offset, u64 range,
 		    u64 reserve_offset, u64 reserve_range,
 		    const struct drm_gpuvm_ops *ops);
-- 
2.41.0

