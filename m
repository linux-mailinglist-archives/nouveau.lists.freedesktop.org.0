Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C19975A324
	for <lists+nouveau@lfdr.de>; Thu, 20 Jul 2023 02:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B37610E532;
	Thu, 20 Jul 2023 00:15:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A86E10E530
 for <nouveau@lists.freedesktop.org>; Thu, 20 Jul 2023 00:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689812105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rdeZyRs53ngCHUvgcBqiIzi8qUoX6WEQZb5p/+mbLO4=;
 b=Ba0xNxeco8jDcbmRSBZYzXT6ZPx0k8evVQ5zxB+NtaNhx8ryOSy4OIE2W61wkjiLB4iNSK
 XWTkembwLZXZalNWELT1qk7CPvwJy4ORMJE8XtusccNQZztYmm/YgwWJLiYcibgBNHwyl3
 yBKMvpLQJKOGJ8bOimhmBwlHP0UA2HQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-DmB_dKmoNlqz-pGIUM0T3w-1; Wed, 19 Jul 2023 20:15:04 -0400
X-MC-Unique: DmB_dKmoNlqz-pGIUM0T3w-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9928b4f1612so14499666b.3
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jul 2023 17:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689812103; x=1692404103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rdeZyRs53ngCHUvgcBqiIzi8qUoX6WEQZb5p/+mbLO4=;
 b=UmnzAgpLfSuJL0+J4zYohLVkMduQ+Ge7/9Y8oloy8UkiTzFB4N6YYUM+GXCWbYPK36
 8XmVyNI5sLQzxrm6SphqgZbz2Bi6IUUedGo5j0cnwgorplL6MHU67usCgHQCFmwJL5c2
 W33bOK3rlbaTuhwlcsyArF6GxZ0HeqjbiLBNgGYg5Z1ENGA9AL2WT23bEfl+8hsCCYk8
 fQnY5QRm89hJv4hQwBwRdwxfCquBmtB1q2FNfdGIBocah59PjW+9ZfCWI4A/wGOf9aN6
 KgJuITpCMPqhgkZc98+qsN3rFD4kKYQTRPBWa15nyiQ7dGWVBqORmK10zdVTUnqRe3wO
 I7pw==
X-Gm-Message-State: ABy/qLYIWGnzbVgftm8qJV2P5zEFv4nm9C6SfoSghyAr1u+0A0OwSh5R
 Wlxu+xhM1vUA6GMwkC6rn/0XmM1DyMOViD9QWAtSgYygO/JHTKHysf8pYTjIOrRicoMo4z9/3Fk
 IGvfRgi7s7pPaJYphwJ8aRtcVBg==
X-Received: by 2002:a17:906:254:b0:993:ec0b:1a24 with SMTP id
 20-20020a170906025400b00993ec0b1a24mr836804ejl.7.1689812101767; 
 Wed, 19 Jul 2023 17:15:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHslWIOxYPwyg06REZp9AS+nSsyH6ZXDE791BYB3ohT6U5XZG7mnwp8sf5VcDzHjng7rUNbbQ==
X-Received: by 2002:a17:906:254:b0:993:ec0b:1a24 with SMTP id
 20-20020a170906025400b00993ec0b1a24mr836748ejl.7.1689812100456; 
 Wed, 19 Jul 2023 17:15:00 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 sb6-20020a170906edc600b009888aa1da11sm2956486ejb.188.2023.07.19.17.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 17:14:59 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Thu, 20 Jul 2023 02:14:22 +0200
Message-ID: <20230720001443.2380-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720001443.2380-1-dakr@redhat.com>
References: <20230720001443.2380-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH drm-misc-next v8 01/12] drm: manager to keep track
 of GPUs VA mappings
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Add infrastructure to keep track of GPU virtual address (VA) mappings
with a decicated VA space manager implementation.

New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
start implementing, allow userspace applications to request multiple and
arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
intended to serve the following purposes in this context.

1) Provide infrastructure to track GPU VA allocations and mappings,
   making using an interval tree (RB-tree).

2) Generically connect GPU VA mappings to their backing buffers, in
   particular DRM GEM objects.

3) Provide a common implementation to perform more complex mapping
   operations on the GPU VA space. In particular splitting and merging
   of GPU VA mappings, e.g. for intersecting mapping requests or partial
   unmap requests.

Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Tested-by: Matthew Brost <matthew.brost@intel.com>
Tested-by: Donald Robson <donald.robson@imgtec.com>
Suggested-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/drm-mm.rst    |   36 +
 drivers/gpu/drm/Makefile        |    1 +
 drivers/gpu/drm/drm_gem.c       |    3 +
 drivers/gpu/drm/drm_gpuva_mgr.c | 1728 +++++++++++++++++++++++++++++++
 include/drm/drm_drv.h           |    6 +
 include/drm/drm_gem.h           |   79 ++
 include/drm/drm_gpuva_mgr.h     |  706 +++++++++++++
 7 files changed, 2559 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
 create mode 100644 include/drm/drm_gpuva_mgr.h

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index a52e6f4117d6..3d5dc9dc1bfe 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -466,6 +466,42 @@ DRM MM Range Allocator Function References
 .. kernel-doc:: drivers/gpu/drm/drm_mm.c
    :export:
 
+DRM GPU VA Manager
+==================
+
+Overview
+--------
+
+.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+   :doc: Overview
+
+Split and Merge
+---------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+   :doc: Split and Merge
+
+Locking
+-------
+
+.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+   :doc: Locking
+
+Examples
+--------
+
+.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+   :doc: Examples
+
+DRM GPU VA Manager Function References
+--------------------------------------
+
+.. kernel-doc:: include/drm/drm_gpuva_mgr.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+   :export:
+
 DRM Buddy Allocator
 ===================
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 021b3f0ac152..215e78e79125 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -45,6 +45,7 @@ drm-y := \
 	drm_vblank.o \
 	drm_vblank_work.o \
 	drm_vma_manager.o \
+	drm_gpuva_mgr.o \
 	drm_writeback.o
 drm-$(CONFIG_DRM_LEGACY) += \
 	drm_agpsupport.o \
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c18686f434d4..dfe76c70bcb3 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -164,6 +164,9 @@ void drm_gem_private_object_init(struct drm_device *dev,
 	if (!obj->resv)
 		obj->resv = &obj->_resv;
 
+	if (drm_core_check_feature(dev, DRIVER_GEM_GPUVA))
+		drm_gem_gpuva_init(obj);
+
 	drm_vma_node_reset(&obj->vma_node);
 	INIT_LIST_HEAD(&obj->lru_node);
 }
diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
new file mode 100644
index 000000000000..dee2235530d6
--- /dev/null
+++ b/drivers/gpu/drm/drm_gpuva_mgr.c
@@ -0,0 +1,1728 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Red Hat.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors:
+ *     Danilo Krummrich <dakr@redhat.com>
+ *
+ */
+
+#include <drm/drm_gpuva_mgr.h>
+
+#include <linux/interval_tree_generic.h>
+#include <linux/mm.h>
+
+/**
+ * DOC: Overview
+ *
+ * The DRM GPU VA Manager, represented by struct drm_gpuva_manager keeps track
+ * of a GPU's virtual address (VA) space and manages the corresponding virtual
+ * mappings represented by &drm_gpuva objects. It also keeps track of the
+ * mapping's backing &drm_gem_object buffers.
+ *
+ * &drm_gem_object buffers maintain a list of &drm_gpuva objects representing
+ * all existent GPU VA mappings using this &drm_gem_object as backing buffer.
+ *
+ * GPU VAs can be flagged as sparse, such that drivers may use GPU VAs to also
+ * keep track of sparse PTEs in order to support Vulkan 'Sparse Resources'.
+ *
+ * The GPU VA manager internally uses a rb-tree to manage the
+ * &drm_gpuva mappings within a GPU's virtual address space.
+ *
+ * The &drm_gpuva_manager contains a special &drm_gpuva representing the
+ * portion of VA space reserved by the kernel. This node is initialized together
+ * with the GPU VA manager instance and removed when the GPU VA manager is
+ * destroyed.
+ *
+ * In a typical application drivers would embed struct drm_gpuva_manager and
+ * struct drm_gpuva within their own driver specific structures, there won't be
+ * any memory allocations of its own nor memory allocations of &drm_gpuva
+ * entries.
+ *
+ * The data structures needed to store &drm_gpuvas within the &drm_gpuva_manager
+ * are contained within struct drm_gpuva already. Hence, for inserting
+ * &drm_gpuva entries from within dma-fence signalling critical sections it is
+ * enough to pre-allocate the &drm_gpuva structures.
+ */
+
+/**
+ * DOC: Split and Merge
+ *
+ * Besides its capability to manage and represent a GPU VA space, the
+ * &drm_gpuva_manager also provides functions to let the &drm_gpuva_manager
+ * calculate a sequence of operations to satisfy a given map or unmap request.
+ *
+ * Therefore the DRM GPU VA manager provides an algorithm implementing splitting
+ * and merging of existent GPU VA mappings with the ones that are requested to
+ * be mapped or unmapped. This feature is required by the Vulkan API to
+ * implement Vulkan 'Sparse Memory Bindings' - drivers UAPIs often refer to this
+ * as VM BIND.
+ *
+ * Drivers can call drm_gpuva_sm_map() to receive a sequence of callbacks
+ * containing map, unmap and remap operations for a given newly requested
+ * mapping. The sequence of callbacks represents the set of operations to
+ * execute in order to integrate the new mapping cleanly into the current state
+ * of the GPU VA space.
+ *
+ * Depending on how the new GPU VA mapping intersects with the existent mappings
+ * of the GPU VA space the &drm_gpuva_fn_ops callbacks contain an arbitrary
+ * amount of unmap operations, a maximum of two remap operations and a single
+ * map operation. The caller might receive no callback at all if no operation is
+ * required, e.g. if the requested mapping already exists in the exact same way.
+ *
+ * The single map operation represents the original map operation requested by
+ * the caller.
+ *
+ * &drm_gpuva_op_unmap contains a 'keep' field, which indicates whether the
+ * &drm_gpuva to unmap is physically contiguous with the original mapping
+ * request. Optionally, if 'keep' is set, drivers may keep the actual page table
+ * entries for this &drm_gpuva, adding the missing page table entries only and
+ * update the &drm_gpuva_manager's view of things accordingly.
+ *
+ * Drivers may do the same optimization, namely delta page table updates, also
+ * for remap operations. This is possible since &drm_gpuva_op_remap consists of
+ * one unmap operation and one or two map operations, such that drivers can
+ * derive the page table update delta accordingly.
+ *
+ * Note that there can't be more than two existent mappings to split up, one at
+ * the beginning and one at the end of the new mapping, hence there is a
+ * maximum of two remap operations.
+ *
+ * Analogous to drm_gpuva_sm_map() drm_gpuva_sm_unmap() uses &drm_gpuva_fn_ops
+ * to call back into the driver in order to unmap a range of GPU VA space. The
+ * logic behind this function is way simpler though: For all existent mappings
+ * enclosed by the given range unmap operations are created. For mappings which
+ * are only partically located within the given range, remap operations are
+ * created such that those mappings are split up and re-mapped partically.
+ *
+ * As an alternative to drm_gpuva_sm_map() and drm_gpuva_sm_unmap(),
+ * drm_gpuva_sm_map_ops_create() and drm_gpuva_sm_unmap_ops_create() can be used
+ * to directly obtain an instance of struct drm_gpuva_ops containing a list of
+ * &drm_gpuva_op, which can be iterated with drm_gpuva_for_each_op(). This list
+ * contains the &drm_gpuva_ops analogous to the callbacks one would receive when
+ * calling drm_gpuva_sm_map() or drm_gpuva_sm_unmap(). While this way requires
+ * more memory (to allocate the &drm_gpuva_ops), it provides drivers a way to
+ * iterate the &drm_gpuva_op multiple times, e.g. once in a context where memory
+ * allocations are possible (e.g. to allocate GPU page tables) and once in the
+ * dma-fence signalling critical path.
+ *
+ * To update the &drm_gpuva_manager's view of the GPU VA space
+ * drm_gpuva_insert() and drm_gpuva_remove() may be used. These functions can
+ * safely be used from &drm_gpuva_fn_ops callbacks originating from
+ * drm_gpuva_sm_map() or drm_gpuva_sm_unmap(). However, it might be more
+ * convenient to use the provided helper functions drm_gpuva_map(),
+ * drm_gpuva_remap() and drm_gpuva_unmap() instead.
+ *
+ * The following diagram depicts the basic relationships of existent GPU VA
+ * mappings, a newly requested mapping and the resulting mappings as implemented
+ * by drm_gpuva_sm_map() - it doesn't cover any arbitrary combinations of these.
+ *
+ * 1) Requested mapping is identical. Replace it, but indicate the backing PTEs
+ *    could be kept.
+ *
+ *    ::
+ *
+ *	     0     a     1
+ *	old: |-----------| (bo_offset=n)
+ *
+ *	     0     a     1
+ *	req: |-----------| (bo_offset=n)
+ *
+ *	     0     a     1
+ *	new: |-----------| (bo_offset=n)
+ *
+ *
+ * 2) Requested mapping is identical, except for the BO offset, hence replace
+ *    the mapping.
+ *
+ *    ::
+ *
+ *	     0     a     1
+ *	old: |-----------| (bo_offset=n)
+ *
+ *	     0     a     1
+ *	req: |-----------| (bo_offset=m)
+ *
+ *	     0     a     1
+ *	new: |-----------| (bo_offset=m)
+ *
+ *
+ * 3) Requested mapping is identical, except for the backing BO, hence replace
+ *    the mapping.
+ *
+ *    ::
+ *
+ *	     0     a     1
+ *	old: |-----------| (bo_offset=n)
+ *
+ *	     0     b     1
+ *	req: |-----------| (bo_offset=n)
+ *
+ *	     0     b     1
+ *	new: |-----------| (bo_offset=n)
+ *
+ *
+ * 4) Existent mapping is a left aligned subset of the requested one, hence
+ *    replace the existent one.
+ *
+ *    ::
+ *
+ *	     0  a  1
+ *	old: |-----|       (bo_offset=n)
+ *
+ *	     0     a     2
+ *	req: |-----------| (bo_offset=n)
+ *
+ *	     0     a     2
+ *	new: |-----------| (bo_offset=n)
+ *
+ *    .. note::
+ *       We expect to see the same result for a request with a different BO
+ *       and/or non-contiguous BO offset.
+ *
+ *
+ * 5) Requested mapping's range is a left aligned subset of the existent one,
+ *    but backed by a different BO. Hence, map the requested mapping and split
+ *    the existent one adjusting its BO offset.
+ *
+ *    ::
+ *
+ *	     0     a     2
+ *	old: |-----------| (bo_offset=n)
+ *
+ *	     0  b  1
+ *	req: |-----|       (bo_offset=n)
+ *
+ *	     0  b  1  a' 2
+ *	new: |-----|-----| (b.bo_offset=n, a.bo_offset=n+1)
+ *
+ *    .. note::
+ *       We expect to see the same result for a request with a different BO
+ *       and/or non-contiguous BO offset.
+ *
+ *
+ * 6) Existent mapping is a superset of the requested mapping. Split it up, but
+ *    indicate that the backing PTEs could be kept.
+ *
+ *    ::
+ *
+ *	     0     a     2
+ *	old: |-----------| (bo_offset=n)
+ *
+ *	     0  a  1
+ *	req: |-----|       (bo_offset=n)
+ *
+ *	     0  a  1  a' 2
+ *	new: |-----|-----| (a.bo_offset=n, a'.bo_offset=n+1)
+ *
+ *
+ * 7) Requested mapping's range is a right aligned subset of the existent one,
+ *    but backed by a different BO. Hence, map the requested mapping and split
+ *    the existent one, without adjusting the BO offset.
+ *
+ *    ::
+ *
+ *	     0     a     2
+ *	old: |-----------| (bo_offset=n)
+ *
+ *	           1  b  2
+ *	req:       |-----| (bo_offset=m)
+ *
+ *	     0  a  1  b  2
+ *	new: |-----|-----| (a.bo_offset=n,b.bo_offset=m)
+ *
+ *
+ * 8) Existent mapping is a superset of the requested mapping. Split it up, but
+ *    indicate that the backing PTEs could be kept.
+ *
+ *    ::
+ *
+ *	      0     a     2
+ *	old: |-----------| (bo_offset=n)
+ *
+ *	           1  a  2
+ *	req:       |-----| (bo_offset=n+1)
+ *
+ *	     0  a' 1  a  2
+ *	new: |-----|-----| (a'.bo_offset=n, a.bo_offset=n+1)
+ *
+ *
+ * 9) Existent mapping is overlapped at the end by the requested mapping backed
+ *    by a different BO. Hence, map the requested mapping and split up the
+ *    existent one, without adjusting the BO offset.
+ *
+ *    ::
+ *
+ *	     0     a     2
+ *	old: |-----------|       (bo_offset=n)
+ *
+ *	           1     b     3
+ *	req:       |-----------| (bo_offset=m)
+ *
+ *	     0  a  1     b     3
+ *	new: |-----|-----------| (a.bo_offset=n,b.bo_offset=m)
+ *
+ *
+ * 10) Existent mapping is overlapped by the requested mapping, both having the
+ *     same backing BO with a contiguous offset. Indicate the backing PTEs of
+ *     the old mapping could be kept.
+ *
+ *     ::
+ *
+ *	      0     a     2
+ *	 old: |-----------|       (bo_offset=n)
+ *
+ *	            1     a     3
+ *	 req:       |-----------| (bo_offset=n+1)
+ *
+ *	      0  a' 1     a     3
+ *	 new: |-----|-----------| (a'.bo_offset=n, a.bo_offset=n+1)
+ *
+ *
+ * 11) Requested mapping's range is a centered subset of the existent one
+ *     having a different backing BO. Hence, map the requested mapping and split
+ *     up the existent one in two mappings, adjusting the BO offset of the right
+ *     one accordingly.
+ *
+ *     ::
+ *
+ *	      0        a        3
+ *	 old: |-----------------| (bo_offset=n)
+ *
+ *	            1  b  2
+ *	 req:       |-----|       (bo_offset=m)
+ *
+ *	      0  a  1  b  2  a' 3
+ *	 new: |-----|-----|-----| (a.bo_offset=n,b.bo_offset=m,a'.bo_offset=n+2)
+ *
+ *
+ * 12) Requested mapping is a contiguous subset of the existent one. Split it
+ *     up, but indicate that the backing PTEs could be kept.
+ *
+ *     ::
+ *
+ *	      0        a        3
+ *	 old: |-----------------| (bo_offset=n)
+ *
+ *	            1  a  2
+ *	 req:       |-----|       (bo_offset=n+1)
+ *
+ *	      0  a' 1  a  2 a'' 3
+ *	 old: |-----|-----|-----| (a'.bo_offset=n, a.bo_offset=n+1, a''.bo_offset=n+2)
+ *
+ *
+ * 13) Existent mapping is a right aligned subset of the requested one, hence
+ *     replace the existent one.
+ *
+ *     ::
+ *
+ *	            1  a  2
+ *	 old:       |-----| (bo_offset=n+1)
+ *
+ *	      0     a     2
+ *	 req: |-----------| (bo_offset=n)
+ *
+ *	      0     a     2
+ *	 new: |-----------| (bo_offset=n)
+ *
+ *     .. note::
+ *        We expect to see the same result for a request with a different bo
+ *        and/or non-contiguous bo_offset.
+ *
+ *
+ * 14) Existent mapping is a centered subset of the requested one, hence
+ *     replace the existent one.
+ *
+ *     ::
+ *
+ *	            1  a  2
+ *	 old:       |-----| (bo_offset=n+1)
+ *
+ *	      0        a       3
+ *	 req: |----------------| (bo_offset=n)
+ *
+ *	      0        a       3
+ *	 new: |----------------| (bo_offset=n)
+ *
+ *     .. note::
+ *        We expect to see the same result for a request with a different bo
+ *        and/or non-contiguous bo_offset.
+ *
+ *
+ * 15) Existent mappings is overlapped at the beginning by the requested mapping
+ *     backed by a different BO. Hence, map the requested mapping and split up
+ *     the existent one, adjusting its BO offset accordingly.
+ *
+ *     ::
+ *
+ *	            1     a     3
+ *	 old:       |-----------| (bo_offset=n)
+ *
+ *	      0     b     2
+ *	 req: |-----------|       (bo_offset=m)
+ *
+ *	      0     b     2  a' 3
+ *	 new: |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
+ */
+
+/**
+ * DOC: Locking
+ *
+ * Generally, the GPU VA manager does not take care of locking itself, it is
+ * the drivers responsibility to take care about locking. Drivers might want to
+ * protect the following operations: inserting, removing and iterating
+ * &drm_gpuva objects as well as generating all kinds of operations, such as
+ * split / merge or prefetch.
+ *
+ * The GPU VA manager also does not take care of the locking of the backing
+ * &drm_gem_object buffers GPU VA lists by itself; drivers are responsible to
+ * enforce mutual exclusion using either the GEMs dma_resv lock or alternatively
+ * a driver specific external lock. For the latter see also
+ * drm_gem_gpuva_set_lock().
+ *
+ * However, the GPU VA manager contains lockdep checks to ensure callers of its
+ * API hold the corresponding lock whenever the &drm_gem_objects GPU VA list is
+ * accessed by functions such as drm_gpuva_link() or drm_gpuva_unlink().
+ */
+
+/**
+ * DOC: Examples
+ *
+ * This section gives two examples on how to let the DRM GPUVA Manager generate
+ * &drm_gpuva_op in order to satisfy a given map or unmap request and how to
+ * make use of them.
+ *
+ * The below code is strictly limited to illustrate the generic usage pattern.
+ * To maintain simplicitly, it doesn't make use of any abstractions for common
+ * code, different (asyncronous) stages with fence signalling critical paths,
+ * any other helpers or error handling in terms of freeing memory and dropping
+ * previously taken locks.
+ *
+ * 1) Obtain a list of &drm_gpuva_op to create a new mapping::
+ *
+ *	// Allocates a new &drm_gpuva.
+ *	struct drm_gpuva * driver_gpuva_alloc(void);
+ *
+ *	// Typically drivers would embedd the &drm_gpuva_manager and &drm_gpuva
+ *	// structure in individual driver structures and lock the dma-resv with
+ *	// drm_exec or similar helpers.
+ *	int driver_mapping_create(struct drm_gpuva_manager *mgr,
+ *				  u64 addr, u64 range,
+ *				  struct drm_gem_object *obj, u64 offset)
+ *	{
+ *		struct drm_gpuva_ops *ops;
+ *		struct drm_gpuva_op *op
+ *
+ *		driver_lock_va_space();
+ *		ops = drm_gpuva_sm_map_ops_create(mgr, addr, range,
+ *						  obj, offset);
+ *		if (IS_ERR(ops))
+ *			return PTR_ERR(ops);
+ *
+ *		drm_gpuva_for_each_op(op, ops) {
+ *			struct drm_gpuva *va;
+ *
+ *			switch (op->op) {
+ *			case DRM_GPUVA_OP_MAP:
+ *				va = driver_gpuva_alloc();
+ *				if (!va)
+ *					; // unwind previous VA space updates,
+ *					  // free memory and unlock
+ *
+ *				driver_vm_map();
+ *				drm_gpuva_map(mgr, va, &op->map);
+ *				drm_gpuva_link(va);
+ *
+ *				break;
+ *			case DRM_GPUVA_OP_REMAP: {
+ *				struct drm_gpuva *prev = NULL, *next = NULL;
+ *
+ *				va = op->remap.unmap->va;
+ *
+ *				if (op->remap.prev) {
+ *					prev = driver_gpuva_alloc();
+ *					if (!prev)
+ *						; // unwind previous VA space
+ *						  // updates, free memory and
+ *						  // unlock
+ *				}
+ *
+ *				if (op->remap.next) {
+ *					next = driver_gpuva_alloc();
+ *					if (!next)
+ *						; // unwind previous VA space
+ *						  // updates, free memory and
+ *						  // unlock
+ *				}
+ *
+ *				driver_vm_remap();
+ *				drm_gpuva_remap(prev, next, &op->remap);
+ *
+ *				drm_gpuva_unlink(va);
+ *				if (prev)
+ *					drm_gpuva_link(prev);
+ *				if (next)
+ *					drm_gpuva_link(next);
+ *
+ *				break;
+ *			}
+ *			case DRM_GPUVA_OP_UNMAP:
+ *				va = op->unmap->va;
+ *
+ *				driver_vm_unmap();
+ *				drm_gpuva_unlink(va);
+ *				drm_gpuva_unmap(&op->unmap);
+ *
+ *				break;
+ *			default:
+ *				break;
+ *			}
+ *		}
+ *		driver_unlock_va_space();
+ *
+ *		return 0;
+ *	}
+ *
+ * 2) Receive a callback for each &drm_gpuva_op to create a new mapping::
+ *
+ *	struct driver_context {
+ *		struct drm_gpuva_manager *mgr;
+ *		struct drm_gpuva *new_va;
+ *		struct drm_gpuva *prev_va;
+ *		struct drm_gpuva *next_va;
+ *	};
+ *
+ *	// ops to pass to drm_gpuva_manager_init()
+ *	static const struct drm_gpuva_fn_ops driver_gpuva_ops = {
+ *		.sm_step_map = driver_gpuva_map,
+ *		.sm_step_remap = driver_gpuva_remap,
+ *		.sm_step_unmap = driver_gpuva_unmap,
+ *	};
+ *
+ *	// Typically drivers would embedd the &drm_gpuva_manager and &drm_gpuva
+ *	// structure in individual driver structures and lock the dma-resv with
+ *	// drm_exec or similar helpers.
+ *	int driver_mapping_create(struct drm_gpuva_manager *mgr,
+ *				  u64 addr, u64 range,
+ *				  struct drm_gem_object *obj, u64 offset)
+ *	{
+ *		struct driver_context ctx;
+ *		struct drm_gpuva_ops *ops;
+ *		struct drm_gpuva_op *op;
+ *		int ret = 0;
+ *
+ *		ctx.mgr = mgr;
+ *
+ *		ctx.new_va = kzalloc(sizeof(*ctx.new_va), GFP_KERNEL);
+ *		ctx.prev_va = kzalloc(sizeof(*ctx.prev_va), GFP_KERNEL);
+ *		ctx.next_va = kzalloc(sizeof(*ctx.next_va), GFP_KERNEL);
+ *		if (!ctx.new_va || !ctx.prev_va || !ctx.next_va) {
+ *			ret = -ENOMEM;
+ *			goto out;
+ *		}
+ *
+ *		driver_lock_va_space();
+ *		ret = drm_gpuva_sm_map(mgr, &ctx, addr, range, obj, offset);
+ *		driver_unlock_va_space();
+ *
+ *	out:
+ *		kfree(ctx.new_va);
+ *		kfree(ctx.prev_va);
+ *		kfree(ctx.next_va);
+ *		return ret;
+ *	}
+ *
+ *	int driver_gpuva_map(struct drm_gpuva_op *op, void *__ctx)
+ *	{
+ *		struct driver_context *ctx = __ctx;
+ *
+ *		drm_gpuva_map(ctx->mgr, ctx->new_va, &op->map);
+ *
+ *		drm_gpuva_link(ctx->new_va);
+ *
+ *		// prevent the new GPUVA from being freed in
+ *		// driver_mapping_create()
+ *		ctx->new_va = NULL;
+ *
+ *		return 0;
+ *	}
+ *
+ *	int driver_gpuva_remap(struct drm_gpuva_op *op, void *__ctx)
+ *	{
+ *		struct driver_context *ctx = __ctx;
+ *
+ *		drm_gpuva_remap(ctx->prev_va, ctx->next_va, &op->remap);
+ *
+ *		drm_gpuva_unlink(op->remap.unmap->va);
+ *		kfree(op->remap.unmap->va);
+ *
+ *		if (op->remap.prev) {
+ *			drm_gpuva_link(ctx->prev_va);
+ *			ctx->prev_va = NULL;
+ *		}
+ *
+ *		if (op->remap.next) {
+ *			drm_gpuva_link(ctx->next_va);
+ *			ctx->next_va = NULL;
+ *		}
+ *
+ *		return 0;
+ *	}
+ *
+ *	int driver_gpuva_unmap(struct drm_gpuva_op *op, void *__ctx)
+ *	{
+ *		drm_gpuva_unlink(op->unmap.va);
+ *		drm_gpuva_unmap(&op->unmap);
+ *		kfree(op->unmap.va);
+ *
+ *		return 0;
+ *	}
+ */
+
+#define to_drm_gpuva(__node)	container_of((__node), struct drm_gpuva, rb.node)
+
+#define GPUVA_START(node) ((node)->va.addr)
+#define GPUVA_LAST(node) ((node)->va.addr + (node)->va.range - 1)
+
+/* We do not actually use drm_gpuva_it_next(), tell the compiler to not complain
+ * about this.
+ */
+INTERVAL_TREE_DEFINE(struct drm_gpuva, rb.node, u64, rb.__subtree_last,
+		     GPUVA_START, GPUVA_LAST, static __maybe_unused,
+		     drm_gpuva_it)
+
+static int __drm_gpuva_insert(struct drm_gpuva_manager *mgr,
+			      struct drm_gpuva *va);
+static void __drm_gpuva_remove(struct drm_gpuva *va);
+
+static bool
+drm_gpuva_check_overflow(u64 addr, u64 range)
+{
+	u64 end;
+
+	return WARN(check_add_overflow(addr, range, &end),
+		    "GPUVA address limited to %lu bytes.\n", sizeof(end));
+}
+
+static bool
+drm_gpuva_in_mm_range(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
+{
+	u64 end = addr + range;
+	u64 mm_start = mgr->mm_start;
+	u64 mm_end = mm_start + mgr->mm_range;
+
+	return addr >= mm_start && end <= mm_end;
+}
+
+static bool
+drm_gpuva_in_kernel_node(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
+{
+	u64 end = addr + range;
+	u64 kstart = mgr->kernel_alloc_node.va.addr;
+	u64 krange = mgr->kernel_alloc_node.va.range;
+	u64 kend = kstart + krange;
+
+	return krange && addr < kend && kstart < end;
+}
+
+static bool
+drm_gpuva_range_valid(struct drm_gpuva_manager *mgr,
+		      u64 addr, u64 range)
+{
+
+	return !drm_gpuva_check_overflow(addr, range) &&
+	       drm_gpuva_in_mm_range(mgr, addr, range) &&
+	       !drm_gpuva_in_kernel_node(mgr, addr, range);
+}
+
+/**
+ * drm_gpuva_manager_init() - initialize a &drm_gpuva_manager
+ * @mgr: pointer to the &drm_gpuva_manager to initialize
+ * @name: the name of the GPU VA space
+ * @start_offset: the start offset of the GPU VA space
+ * @range: the size of the GPU VA space
+ * @reserve_offset: the start of the kernel reserved GPU VA area
+ * @reserve_range: the size of the kernel reserved GPU VA area
+ * @ops: &drm_gpuva_fn_ops called on &drm_gpuva_sm_map / &drm_gpuva_sm_unmap
+ *
+ * The &drm_gpuva_manager must be initialized with this function before use.
+ *
+ * Note that @mgr must be cleared to 0 before calling this function. The given
+ * &name is expected to be managed by the surrounding driver structures.
+ */
+void
+drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
+		       const char *name,
+		       u64 start_offset, u64 range,
+		       u64 reserve_offset, u64 reserve_range,
+		       const struct drm_gpuva_fn_ops *ops)
+{
+	mgr->rb.tree = RB_ROOT_CACHED;
+	INIT_LIST_HEAD(&mgr->rb.list);
+
+	drm_gpuva_check_overflow(start_offset, range);
+	mgr->mm_start = start_offset;
+	mgr->mm_range = range;
+
+	mgr->name = name ? name : "unknown";
+	mgr->ops = ops;
+
+	memset(&mgr->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
+
+	if (reserve_range) {
+		mgr->kernel_alloc_node.va.addr = reserve_offset;
+		mgr->kernel_alloc_node.va.range = reserve_range;
+
+		if (likely(!drm_gpuva_check_overflow(reserve_offset,
+						     reserve_range)))
+			__drm_gpuva_insert(mgr, &mgr->kernel_alloc_node);
+	}
+
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_manager_init);
+
+/**
+ * drm_gpuva_manager_destroy() - cleanup a &drm_gpuva_manager
+ * @mgr: pointer to the &drm_gpuva_manager to clean up
+ *
+ * Note that it is a bug to call this function on a manager that still
+ * holds GPU VA mappings.
+ */
+void
+drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr)
+{
+	mgr->name = NULL;
+
+	if (mgr->kernel_alloc_node.va.range)
+		__drm_gpuva_remove(&mgr->kernel_alloc_node);
+
+	WARN(!RB_EMPTY_ROOT(&mgr->rb.tree.rb_root),
+	     "GPUVA tree is not empty, potentially leaking memory.");
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_manager_destroy);
+
+static int
+__drm_gpuva_insert(struct drm_gpuva_manager *mgr,
+		   struct drm_gpuva *va)
+{
+	struct rb_node *node;
+	struct list_head *head;
+
+	if (drm_gpuva_it_iter_first(&mgr->rb.tree,
+				    GPUVA_START(va),
+				    GPUVA_LAST(va)))
+		return -EEXIST;
+
+	va->mgr = mgr;
+
+	drm_gpuva_it_insert(va, &mgr->rb.tree);
+
+	node = rb_prev(&va->rb.node);
+	if (node)
+		head = &(to_drm_gpuva(node))->rb.entry;
+	else
+		head = &mgr->rb.list;
+
+	list_add(&va->rb.entry, head);
+
+	return 0;
+}
+
+/**
+ * drm_gpuva_insert() - insert a &drm_gpuva
+ * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
+ * @va: the &drm_gpuva to insert
+ *
+ * Insert a &drm_gpuva with a given address and range into a
+ * &drm_gpuva_manager.
+ *
+ * It is safe to use this function using the safe versions of iterating the GPU
+ * VA space, such as drm_gpuva_for_each_va_safe() and
+ * drm_gpuva_for_each_va_range_safe().
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuva_insert(struct drm_gpuva_manager *mgr,
+		 struct drm_gpuva *va)
+{
+	u64 addr = va->va.addr;
+	u64 range = va->va.range;
+
+	if (unlikely(!drm_gpuva_range_valid(mgr, addr, range)))
+		return -EINVAL;
+
+	return __drm_gpuva_insert(mgr, va);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_insert);
+
+static void
+__drm_gpuva_remove(struct drm_gpuva *va)
+{
+	drm_gpuva_it_remove(va, &va->mgr->rb.tree);
+	list_del_init(&va->rb.entry);
+}
+
+/**
+ * drm_gpuva_remove() - remove a &drm_gpuva
+ * @va: the &drm_gpuva to remove
+ *
+ * This removes the given &va from the underlaying tree.
+ *
+ * It is safe to use this function using the safe versions of iterating the GPU
+ * VA space, such as drm_gpuva_for_each_va_safe() and
+ * drm_gpuva_for_each_va_range_safe().
+ */
+void
+drm_gpuva_remove(struct drm_gpuva *va)
+{
+	struct drm_gpuva_manager *mgr = va->mgr;
+
+	if (unlikely(va == &mgr->kernel_alloc_node)) {
+		WARN(1, "Can't destroy kernel reserved node.\n");
+		return;
+	}
+
+	__drm_gpuva_remove(va);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_remove);
+
+/**
+ * drm_gpuva_link() - link a &drm_gpuva
+ * @va: the &drm_gpuva to link
+ *
+ * This adds the given &va to the GPU VA list of the &drm_gem_object it is
+ * associated with.
+ *
+ * This function expects the caller to protect the GEM's GPUVA list against
+ * concurrent access using the GEMs dma_resv lock.
+ */
+void
+drm_gpuva_link(struct drm_gpuva *va)
+{
+	struct drm_gem_object *obj = va->gem.obj;
+
+	if (unlikely(!obj))
+		return;
+
+	drm_gem_gpuva_assert_lock_held(obj);
+
+	list_add_tail(&va->gem.entry, &obj->gpuva.list);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_link);
+
+/**
+ * drm_gpuva_unlink() - unlink a &drm_gpuva
+ * @va: the &drm_gpuva to unlink
+ *
+ * This removes the given &va from the GPU VA list of the &drm_gem_object it is
+ * associated with.
+ *
+ * This function expects the caller to protect the GEM's GPUVA list against
+ * concurrent access using the GEMs dma_resv lock.
+ */
+void
+drm_gpuva_unlink(struct drm_gpuva *va)
+{
+	struct drm_gem_object *obj = va->gem.obj;
+
+	if (unlikely(!obj))
+		return;
+
+	drm_gem_gpuva_assert_lock_held(obj);
+
+	list_del_init(&va->gem.entry);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_unlink);
+
+/**
+ * drm_gpuva_find_first() - find the first &drm_gpuva in the given range
+ * @mgr: the &drm_gpuva_manager to search in
+ * @addr: the &drm_gpuvas address
+ * @range: the &drm_gpuvas range
+ *
+ * Returns: the first &drm_gpuva within the given range
+ */
+struct drm_gpuva *
+drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
+		     u64 addr, u64 range)
+{
+	u64 last = addr + range - 1;
+
+	return drm_gpuva_it_iter_first(&mgr->rb.tree, addr, last);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_find_first);
+
+/**
+ * drm_gpuva_find() - find a &drm_gpuva
+ * @mgr: the &drm_gpuva_manager to search in
+ * @addr: the &drm_gpuvas address
+ * @range: the &drm_gpuvas range
+ *
+ * Returns: the &drm_gpuva at a given &addr and with a given &range
+ */
+struct drm_gpuva *
+drm_gpuva_find(struct drm_gpuva_manager *mgr,
+	       u64 addr, u64 range)
+{
+	struct drm_gpuva *va;
+
+	va = drm_gpuva_find_first(mgr, addr, range);
+	if (!va)
+		goto out;
+
+	if (va->va.addr != addr ||
+	    va->va.range != range)
+		goto out;
+
+	return va;
+
+out:
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_find);
+
+/**
+ * drm_gpuva_find_prev() - find the &drm_gpuva before the given address
+ * @mgr: the &drm_gpuva_manager to search in
+ * @start: the given GPU VA's start address
+ *
+ * Find the adjacent &drm_gpuva before the GPU VA with given &start address.
+ *
+ * Note that if there is any free space between the GPU VA mappings no mapping
+ * is returned.
+ *
+ * Returns: a pointer to the found &drm_gpuva or NULL if none was found
+ */
+struct drm_gpuva *
+drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start)
+{
+	if (!drm_gpuva_range_valid(mgr, start - 1, 1))
+		return NULL;
+
+	return drm_gpuva_it_iter_first(&mgr->rb.tree, start - 1, start);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_find_prev);
+
+/**
+ * drm_gpuva_find_next() - find the &drm_gpuva after the given address
+ * @mgr: the &drm_gpuva_manager to search in
+ * @end: the given GPU VA's end address
+ *
+ * Find the adjacent &drm_gpuva after the GPU VA with given &end address.
+ *
+ * Note that if there is any free space between the GPU VA mappings no mapping
+ * is returned.
+ *
+ * Returns: a pointer to the found &drm_gpuva or NULL if none was found
+ */
+struct drm_gpuva *
+drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end)
+{
+	if (!drm_gpuva_range_valid(mgr, end, 1))
+		return NULL;
+
+	return drm_gpuva_it_iter_first(&mgr->rb.tree, end, end + 1);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_find_next);
+
+/**
+ * drm_gpuva_interval_empty() - indicate whether a given interval of the VA space
+ * is empty
+ * @mgr: the &drm_gpuva_manager to check the range for
+ * @addr: the start address of the range
+ * @range: the range of the interval
+ *
+ * Returns: true if the interval is empty, false otherwise
+ */
+bool
+drm_gpuva_interval_empty(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
+{
+	return !drm_gpuva_find_first(mgr, addr, range);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_interval_empty);
+
+/**
+ * drm_gpuva_map() - helper to insert a &drm_gpuva according to a
+ * &drm_gpuva_op_map
+ * @mgr: the &drm_gpuva_manager
+ * @va: the &drm_gpuva to insert
+ * @op: the &drm_gpuva_op_map to initialize @va with
+ *
+ * Initializes the @va from the @op and inserts it into the given @mgr.
+ */
+void
+drm_gpuva_map(struct drm_gpuva_manager *mgr,
+	      struct drm_gpuva *va,
+	      struct drm_gpuva_op_map *op)
+{
+	drm_gpuva_init_from_op(va, op);
+	drm_gpuva_insert(mgr, va);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_map);
+
+/**
+ * drm_gpuva_remap() - helper to remap a &drm_gpuva according to a
+ * &drm_gpuva_op_remap
+ * @prev: the &drm_gpuva to remap when keeping the start of a mapping
+ * @next: the &drm_gpuva to remap when keeping the end of a mapping
+ * @op: the &drm_gpuva_op_remap to initialize @prev and @next with
+ *
+ * Removes the currently mapped &drm_gpuva and remaps it using @prev and/or
+ * @next.
+ */
+void
+drm_gpuva_remap(struct drm_gpuva *prev,
+		struct drm_gpuva *next,
+		struct drm_gpuva_op_remap *op)
+{
+	struct drm_gpuva *curr = op->unmap->va;
+	struct drm_gpuva_manager *mgr = curr->mgr;
+
+	drm_gpuva_remove(curr);
+
+	if (op->prev) {
+		drm_gpuva_init_from_op(prev, op->prev);
+		drm_gpuva_insert(mgr, prev);
+	}
+
+	if (op->next) {
+		drm_gpuva_init_from_op(next, op->next);
+		drm_gpuva_insert(mgr, next);
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_remap);
+
+/**
+ * drm_gpuva_unmap() - helper to remove a &drm_gpuva according to a
+ * &drm_gpuva_op_unmap
+ * @op: the &drm_gpuva_op_unmap specifying the &drm_gpuva to remove
+ *
+ * Removes the &drm_gpuva associated with the &drm_gpuva_op_unmap.
+ */
+void
+drm_gpuva_unmap(struct drm_gpuva_op_unmap *op)
+{
+	drm_gpuva_remove(op->va);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
+
+static int
+op_map_cb(const struct drm_gpuva_fn_ops *fn, void *priv,
+	  u64 addr, u64 range,
+	  struct drm_gem_object *obj, u64 offset)
+{
+	struct drm_gpuva_op op = {};
+
+	op.op = DRM_GPUVA_OP_MAP;
+	op.map.va.addr = addr;
+	op.map.va.range = range;
+	op.map.gem.obj = obj;
+	op.map.gem.offset = offset;
+
+	return fn->sm_step_map(&op, priv);
+}
+
+static int
+op_remap_cb(const struct drm_gpuva_fn_ops *fn, void *priv,
+	    struct drm_gpuva_op_map *prev,
+	    struct drm_gpuva_op_map *next,
+	    struct drm_gpuva_op_unmap *unmap)
+{
+	struct drm_gpuva_op op = {};
+	struct drm_gpuva_op_remap *r;
+
+	op.op = DRM_GPUVA_OP_REMAP;
+	r = &op.remap;
+	r->prev = prev;
+	r->next = next;
+	r->unmap = unmap;
+
+	return fn->sm_step_remap(&op, priv);
+}
+
+static int
+op_unmap_cb(const struct drm_gpuva_fn_ops *fn, void *priv,
+	    struct drm_gpuva *va, bool merge)
+{
+	struct drm_gpuva_op op = {};
+
+	op.op = DRM_GPUVA_OP_UNMAP;
+	op.unmap.va = va;
+	op.unmap.keep = merge;
+
+	return fn->sm_step_unmap(&op, priv);
+}
+
+static int
+__drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
+		   const struct drm_gpuva_fn_ops *ops, void *priv,
+		   u64 req_addr, u64 req_range,
+		   struct drm_gem_object *req_obj, u64 req_offset)
+{
+	struct drm_gpuva *va, *next, *prev = NULL;
+	u64 req_end = req_addr + req_range;
+	int ret;
+
+	if (unlikely(!drm_gpuva_range_valid(mgr, req_addr, req_range)))
+		return -EINVAL;
+
+	drm_gpuva_for_each_va_range_safe(va, next, mgr, req_addr, req_end) {
+		struct drm_gem_object *obj = va->gem.obj;
+		u64 offset = va->gem.offset;
+		u64 addr = va->va.addr;
+		u64 range = va->va.range;
+		u64 end = addr + range;
+		bool merge = !!va->gem.obj;
+
+		if (addr == req_addr) {
+			merge &= obj == req_obj &&
+				 offset == req_offset;
+
+			if (end == req_end) {
+				ret = op_unmap_cb(ops, priv, va, merge);
+				if (ret)
+					return ret;
+				break;
+			}
+
+			if (end < req_end) {
+				ret = op_unmap_cb(ops, priv, va, merge);
+				if (ret)
+					return ret;
+				goto next;
+			}
+
+			if (end > req_end) {
+				struct drm_gpuva_op_map n = {
+					.va.addr = req_end,
+					.va.range = range - req_range,
+					.gem.obj = obj,
+					.gem.offset = offset + req_range,
+				};
+				struct drm_gpuva_op_unmap u = {
+					.va = va,
+					.keep = merge,
+				};
+
+				ret = op_remap_cb(ops, priv, NULL, &n, &u);
+				if (ret)
+					return ret;
+				break;
+			}
+		} else if (addr < req_addr) {
+			u64 ls_range = req_addr - addr;
+			struct drm_gpuva_op_map p = {
+				.va.addr = addr,
+				.va.range = ls_range,
+				.gem.obj = obj,
+				.gem.offset = offset,
+			};
+			struct drm_gpuva_op_unmap u = { .va = va };
+
+			merge &= obj == req_obj &&
+				 offset + ls_range == req_offset;
+			u.keep = merge;
+
+			if (end == req_end) {
+				ret = op_remap_cb(ops, priv, &p, NULL, &u);
+				if (ret)
+					return ret;
+				break;
+			}
+
+			if (end < req_end) {
+				ret = op_remap_cb(ops, priv, &p, NULL, &u);
+				if (ret)
+					return ret;
+				goto next;
+			}
+
+			if (end > req_end) {
+				struct drm_gpuva_op_map n = {
+					.va.addr = req_end,
+					.va.range = end - req_end,
+					.gem.obj = obj,
+					.gem.offset = offset + ls_range +
+						      req_range,
+				};
+
+				ret = op_remap_cb(ops, priv, &p, &n, &u);
+				if (ret)
+					return ret;
+				break;
+			}
+		} else if (addr > req_addr) {
+			merge &= obj == req_obj &&
+				 offset == req_offset +
+					   (addr - req_addr);
+
+			if (end == req_end) {
+				ret = op_unmap_cb(ops, priv, va, merge);
+				if (ret)
+					return ret;
+				break;
+			}
+
+			if (end < req_end) {
+				ret = op_unmap_cb(ops, priv, va, merge);
+				if (ret)
+					return ret;
+				goto next;
+			}
+
+			if (end > req_end) {
+				struct drm_gpuva_op_map n = {
+					.va.addr = req_end,
+					.va.range = end - req_end,
+					.gem.obj = obj,
+					.gem.offset = offset + req_end - addr,
+				};
+				struct drm_gpuva_op_unmap u = {
+					.va = va,
+					.keep = merge,
+				};
+
+				ret = op_remap_cb(ops, priv, NULL, &n, &u);
+				if (ret)
+					return ret;
+				break;
+			}
+		}
+next:
+		prev = va;
+	}
+
+	return op_map_cb(ops, priv,
+			 req_addr, req_range,
+			 req_obj, req_offset);
+}
+
+static int
+__drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr,
+		     const struct drm_gpuva_fn_ops *ops, void *priv,
+		     u64 req_addr, u64 req_range)
+{
+	struct drm_gpuva *va, *next;
+	u64 req_end = req_addr + req_range;
+	int ret;
+
+	if (unlikely(!drm_gpuva_range_valid(mgr, req_addr, req_range)))
+		return -EINVAL;
+
+	drm_gpuva_for_each_va_range_safe(va, next, mgr, req_addr, req_end) {
+		struct drm_gpuva_op_map prev = {}, next = {};
+		bool prev_split = false, next_split = false;
+		struct drm_gem_object *obj = va->gem.obj;
+		u64 offset = va->gem.offset;
+		u64 addr = va->va.addr;
+		u64 range = va->va.range;
+		u64 end = addr + range;
+
+		if (addr < req_addr) {
+			prev.va.addr = addr;
+			prev.va.range = req_addr - addr;
+			prev.gem.obj = obj;
+			prev.gem.offset = offset;
+
+			prev_split = true;
+		}
+
+		if (end > req_end) {
+			next.va.addr = req_end;
+			next.va.range = end - req_end;
+			next.gem.obj = obj;
+			next.gem.offset = offset + (req_end - addr);
+
+			next_split = true;
+		}
+
+		if (prev_split || next_split) {
+			struct drm_gpuva_op_unmap unmap = { .va = va };
+
+			ret = op_remap_cb(ops, priv,
+					  prev_split ? &prev : NULL,
+					  next_split ? &next : NULL,
+					  &unmap);
+			if (ret)
+				return ret;
+		} else {
+			ret = op_unmap_cb(ops, priv, va, false);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * drm_gpuva_sm_map() - creates the &drm_gpuva_op split/merge steps
+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * @req_addr: the start address of the new mapping
+ * @req_range: the range of the new mapping
+ * @req_obj: the &drm_gem_object to map
+ * @req_offset: the offset within the &drm_gem_object
+ * @priv: pointer to a driver private data structure
+ *
+ * This function iterates the given range of the GPU VA space. It utilizes the
+ * &drm_gpuva_fn_ops to call back into the driver providing the split and merge
+ * steps.
+ *
+ * Drivers may use these callbacks to update the GPU VA space right away within
+ * the callback. In case the driver decides to copy and store the operations for
+ * later processing neither this function nor &drm_gpuva_sm_unmap is allowed to
+ * be called before the &drm_gpuva_manager's view of the GPU VA space was
+ * updated with the previous set of operations. To update the
+ * &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
+ * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
+ * used.
+ *
+ * A sequence of callbacks can contain map, unmap and remap operations, but
+ * the sequence of callbacks might also be empty if no operation is required,
+ * e.g. if the requested mapping already exists in the exact same way.
+ *
+ * There can be an arbitrary amount of unmap operations, a maximum of two remap
+ * operations and a single map operation. The latter one represents the original
+ * map operation requested by the caller.
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuva_sm_map(struct drm_gpuva_manager *mgr, void *priv,
+		 u64 req_addr, u64 req_range,
+		 struct drm_gem_object *req_obj, u64 req_offset)
+{
+	const struct drm_gpuva_fn_ops *ops = mgr->ops;
+
+	if (unlikely(!(ops && ops->sm_step_map &&
+		       ops->sm_step_remap &&
+		       ops->sm_step_unmap)))
+		return -EINVAL;
+
+	return __drm_gpuva_sm_map(mgr, ops, priv,
+				  req_addr, req_range,
+				  req_obj, req_offset);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_sm_map);
+
+/**
+ * drm_gpuva_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * @priv: pointer to a driver private data structure
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ *
+ * This function iterates the given range of the GPU VA space. It utilizes the
+ * &drm_gpuva_fn_ops to call back into the driver providing the operations to
+ * unmap and, if required, split existent mappings.
+ *
+ * Drivers may use these callbacks to update the GPU VA space right away within
+ * the callback. In case the driver decides to copy and store the operations for
+ * later processing neither this function nor &drm_gpuva_sm_map is allowed to be
+ * called before the &drm_gpuva_manager's view of the GPU VA space was updated
+ * with the previous set of operations. To update the &drm_gpuva_manager's view
+ * of the GPU VA space drm_gpuva_insert(), drm_gpuva_destroy_locked() and/or
+ * drm_gpuva_destroy_unlocked() should be used.
+ *
+ * A sequence of callbacks can contain unmap and remap operations, depending on
+ * whether there are actual overlapping mappings to split.
+ *
+ * There can be an arbitrary amount of unmap operations and a maximum of two
+ * remap operations.
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr, void *priv,
+		   u64 req_addr, u64 req_range)
+{
+	const struct drm_gpuva_fn_ops *ops = mgr->ops;
+
+	if (unlikely(!(ops && ops->sm_step_remap &&
+		       ops->sm_step_unmap)))
+		return -EINVAL;
+
+	return __drm_gpuva_sm_unmap(mgr, ops, priv,
+				    req_addr, req_range);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_sm_unmap);
+
+static struct drm_gpuva_op *
+gpuva_op_alloc(struct drm_gpuva_manager *mgr)
+{
+	const struct drm_gpuva_fn_ops *fn = mgr->ops;
+	struct drm_gpuva_op *op;
+
+	if (fn && fn->op_alloc)
+		op = fn->op_alloc();
+	else
+		op = kzalloc(sizeof(*op), GFP_KERNEL);
+
+	if (unlikely(!op))
+		return NULL;
+
+	return op;
+}
+
+static void
+gpuva_op_free(struct drm_gpuva_manager *mgr,
+	      struct drm_gpuva_op *op)
+{
+	const struct drm_gpuva_fn_ops *fn = mgr->ops;
+
+	if (fn && fn->op_free)
+		fn->op_free(op);
+	else
+		kfree(op);
+}
+
+static int
+drm_gpuva_sm_step(struct drm_gpuva_op *__op,
+		  void *priv)
+{
+	struct {
+		struct drm_gpuva_manager *mgr;
+		struct drm_gpuva_ops *ops;
+	} *args = priv;
+	struct drm_gpuva_manager *mgr = args->mgr;
+	struct drm_gpuva_ops *ops = args->ops;
+	struct drm_gpuva_op *op;
+
+	op = gpuva_op_alloc(mgr);
+	if (unlikely(!op))
+		goto err;
+
+	memcpy(op, __op, sizeof(*op));
+
+	if (op->op == DRM_GPUVA_OP_REMAP) {
+		struct drm_gpuva_op_remap *__r = &__op->remap;
+		struct drm_gpuva_op_remap *r = &op->remap;
+
+		r->unmap = kmemdup(__r->unmap, sizeof(*r->unmap),
+				   GFP_KERNEL);
+		if (unlikely(!r->unmap))
+			goto err_free_op;
+
+		if (__r->prev) {
+			r->prev = kmemdup(__r->prev, sizeof(*r->prev),
+					  GFP_KERNEL);
+			if (unlikely(!r->prev))
+				goto err_free_unmap;
+		}
+
+		if (__r->next) {
+			r->next = kmemdup(__r->next, sizeof(*r->next),
+					  GFP_KERNEL);
+			if (unlikely(!r->next))
+				goto err_free_prev;
+		}
+	}
+
+	list_add_tail(&op->entry, &ops->list);
+
+	return 0;
+
+err_free_unmap:
+	kfree(op->remap.unmap);
+err_free_prev:
+	kfree(op->remap.prev);
+err_free_op:
+	gpuva_op_free(mgr, op);
+err:
+	return -ENOMEM;
+}
+
+static const struct drm_gpuva_fn_ops gpuva_list_ops = {
+	.sm_step_map = drm_gpuva_sm_step,
+	.sm_step_remap = drm_gpuva_sm_step,
+	.sm_step_unmap = drm_gpuva_sm_step,
+};
+
+/**
+ * drm_gpuva_sm_map_ops_create() - creates the &drm_gpuva_ops to split and merge
+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * @req_addr: the start address of the new mapping
+ * @req_range: the range of the new mapping
+ * @req_obj: the &drm_gem_object to map
+ * @req_offset: the offset within the &drm_gem_object
+ *
+ * This function creates a list of operations to perform splitting and merging
+ * of existent mapping(s) with the newly requested one.
+ *
+ * The list can be iterated with &drm_gpuva_for_each_op and must be processed
+ * in the given order. It can contain map, unmap and remap operations, but it
+ * also can be empty if no operation is required, e.g. if the requested mapping
+ * already exists is the exact same way.
+ *
+ * There can be an arbitrary amount of unmap operations, a maximum of two remap
+ * operations and a single map operation. The latter one represents the original
+ * map operation requested by the caller.
+ *
+ * Note that before calling this function again with another mapping request it
+ * is necessary to update the &drm_gpuva_manager's view of the GPU VA space. The
+ * previously obtained operations must be either processed or abandoned. To
+ * update the &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
+ * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
+ * used.
+ *
+ * After the caller finished processing the returned &drm_gpuva_ops, they must
+ * be freed with &drm_gpuva_ops_free.
+ *
+ * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
+ */
+struct drm_gpuva_ops *
+drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
+			    u64 req_addr, u64 req_range,
+			    struct drm_gem_object *req_obj, u64 req_offset)
+{
+	struct drm_gpuva_ops *ops;
+	struct {
+		struct drm_gpuva_manager *mgr;
+		struct drm_gpuva_ops *ops;
+	} args;
+	int ret;
+
+	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
+	if (unlikely(!ops))
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&ops->list);
+
+	args.mgr = mgr;
+	args.ops = ops;
+
+	ret = __drm_gpuva_sm_map(mgr, &gpuva_list_ops, &args,
+				 req_addr, req_range,
+				 req_obj, req_offset);
+	if (ret)
+		goto err_free_ops;
+
+	return ops;
+
+err_free_ops:
+	drm_gpuva_ops_free(mgr, ops);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_sm_map_ops_create);
+
+/**
+ * drm_gpuva_sm_unmap_ops_create() - creates the &drm_gpuva_ops to split on
+ * unmap
+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ *
+ * This function creates a list of operations to perform unmapping and, if
+ * required, splitting of the mappings overlapping the unmap range.
+ *
+ * The list can be iterated with &drm_gpuva_for_each_op and must be processed
+ * in the given order. It can contain unmap and remap operations, depending on
+ * whether there are actual overlapping mappings to split.
+ *
+ * There can be an arbitrary amount of unmap operations and a maximum of two
+ * remap operations.
+ *
+ * Note that before calling this function again with another range to unmap it
+ * is necessary to update the &drm_gpuva_manager's view of the GPU VA space. The
+ * previously obtained operations must be processed or abandoned. To update the
+ * &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
+ * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
+ * used.
+ *
+ * After the caller finished processing the returned &drm_gpuva_ops, they must
+ * be freed with &drm_gpuva_ops_free.
+ *
+ * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
+ */
+struct drm_gpuva_ops *
+drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
+			      u64 req_addr, u64 req_range)
+{
+	struct drm_gpuva_ops *ops;
+	struct {
+		struct drm_gpuva_manager *mgr;
+		struct drm_gpuva_ops *ops;
+	} args;
+	int ret;
+
+	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
+	if (unlikely(!ops))
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&ops->list);
+
+	args.mgr = mgr;
+	args.ops = ops;
+
+	ret = __drm_gpuva_sm_unmap(mgr, &gpuva_list_ops, &args,
+				   req_addr, req_range);
+	if (ret)
+		goto err_free_ops;
+
+	return ops;
+
+err_free_ops:
+	drm_gpuva_ops_free(mgr, ops);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_sm_unmap_ops_create);
+
+/**
+ * drm_gpuva_prefetch_ops_create() - creates the &drm_gpuva_ops to prefetch
+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * @addr: the start address of the range to prefetch
+ * @range: the range of the mappings to prefetch
+ *
+ * This function creates a list of operations to perform prefetching.
+ *
+ * The list can be iterated with &drm_gpuva_for_each_op and must be processed
+ * in the given order. It can contain prefetch operations.
+ *
+ * There can be an arbitrary amount of prefetch operations.
+ *
+ * After the caller finished processing the returned &drm_gpuva_ops, they must
+ * be freed with &drm_gpuva_ops_free.
+ *
+ * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
+ */
+struct drm_gpuva_ops *
+drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
+			      u64 addr, u64 range)
+{
+	struct drm_gpuva_ops *ops;
+	struct drm_gpuva_op *op;
+	struct drm_gpuva *va;
+	u64 end = addr + range;
+	int ret;
+
+	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
+	if (!ops)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&ops->list);
+
+	drm_gpuva_for_each_va_range(va, mgr, addr, end) {
+		op = gpuva_op_alloc(mgr);
+		if (!op) {
+			ret = -ENOMEM;
+			goto err_free_ops;
+		}
+
+		op->op = DRM_GPUVA_OP_PREFETCH;
+		op->prefetch.va = va;
+		list_add_tail(&op->entry, &ops->list);
+	}
+
+	return ops;
+
+err_free_ops:
+	drm_gpuva_ops_free(mgr, ops);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_prefetch_ops_create);
+
+/**
+ * drm_gpuva_gem_unmap_ops_create() - creates the &drm_gpuva_ops to unmap a GEM
+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * @obj: the &drm_gem_object to unmap
+ *
+ * This function creates a list of operations to perform unmapping for every
+ * GPUVA attached to a GEM.
+ *
+ * The list can be iterated with &drm_gpuva_for_each_op and consists out of an
+ * arbitrary amount of unmap operations.
+ *
+ * After the caller finished processing the returned &drm_gpuva_ops, they must
+ * be freed with &drm_gpuva_ops_free.
+ *
+ * It is the callers responsibility to protect the GEMs GPUVA list against
+ * concurrent access using the GEMs dma_resv lock.
+ *
+ * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
+ */
+struct drm_gpuva_ops *
+drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
+			       struct drm_gem_object *obj)
+{
+	struct drm_gpuva_ops *ops;
+	struct drm_gpuva_op *op;
+	struct drm_gpuva *va;
+	int ret;
+
+	drm_gem_gpuva_assert_lock_held(obj);
+
+	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
+	if (!ops)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&ops->list);
+
+	drm_gem_for_each_gpuva(va, obj) {
+		op = gpuva_op_alloc(mgr);
+		if (!op) {
+			ret = -ENOMEM;
+			goto err_free_ops;
+		}
+
+		op->op = DRM_GPUVA_OP_UNMAP;
+		op->unmap.va = va;
+		list_add_tail(&op->entry, &ops->list);
+	}
+
+	return ops;
+
+err_free_ops:
+	drm_gpuva_ops_free(mgr, ops);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_gem_unmap_ops_create);
+
+
+/**
+ * drm_gpuva_ops_free() - free the given &drm_gpuva_ops
+ * @mgr: the &drm_gpuva_manager the ops were created for
+ * @ops: the &drm_gpuva_ops to free
+ *
+ * Frees the given &drm_gpuva_ops structure including all the ops associated
+ * with it.
+ */
+void
+drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
+		   struct drm_gpuva_ops *ops)
+{
+	struct drm_gpuva_op *op, *next;
+
+	drm_gpuva_for_each_op_safe(op, next, ops) {
+		list_del(&op->entry);
+
+		if (op->op == DRM_GPUVA_OP_REMAP) {
+			kfree(op->remap.prev);
+			kfree(op->remap.next);
+			kfree(op->remap.unmap);
+		}
+
+		gpuva_op_free(mgr, op);
+	}
+
+	kfree(ops);
+}
+EXPORT_SYMBOL_GPL(drm_gpuva_ops_free);
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index b77f2c7275b7..9813fa759b75 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -104,6 +104,12 @@ enum drm_driver_feature {
 	 * acceleration should be handled by two drivers that are connected using auxiliary bus.
 	 */
 	DRIVER_COMPUTE_ACCEL            = BIT(7),
+	/**
+	 * @DRIVER_GEM_GPUVA:
+	 *
+	 * Driver supports user defined GPU VA bindings for GEM objects.
+	 */
+	DRIVER_GEM_GPUVA		= BIT(8),
 
 	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index bbc721870c13..c0b13c43b459 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -36,6 +36,8 @@
 
 #include <linux/kref.h>
 #include <linux/dma-resv.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
 
 #include <drm/drm_vma_manager.h>
 
@@ -379,6 +381,22 @@ struct drm_gem_object {
 	 */
 	struct dma_resv _resv;
 
+	/**
+	 * @gpuva:
+	 *
+	 * Provides the list of GPU VAs attached to this GEM object.
+	 *
+	 * Drivers should lock list accesses with the GEMs &dma_resv lock
+	 * (&drm_gem_object.resv) or a custom lock if one is provided.
+	 */
+	struct {
+		struct list_head list;
+
+#ifdef CONFIG_LOCKDEP
+		struct lockdep_map *lock_dep_map;
+#endif
+	} gpuva;
+
 	/**
 	 * @funcs:
 	 *
@@ -526,4 +544,65 @@ unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
 
 int drm_gem_evict(struct drm_gem_object *obj);
 
+#ifdef CONFIG_LOCKDEP
+/**
+ * drm_gem_gpuva_set_lock() - Set the lock protecting accesses to the gpuva list.
+ * @obj: the &drm_gem_object
+ * @lock: the lock used to protect the gpuva list. The locking primitive
+ * must contain a dep_map field.
+ *
+ * Call this if you're not proctecting access to the gpuva list
+ * with the dma-resv lock, otherwise, drm_gem_gpuva_init() takes care
+ * of initializing lock_dep_map for you.
+ */
+#define drm_gem_gpuva_set_lock(obj, lock) \
+	if (!(obj)->gpuva.lock_dep_map) \
+		(obj)->gpuva.lock_dep_map = &(lock)->dep_map
+#define drm_gem_gpuva_assert_lock_held(obj) \
+	lockdep_assert(lock_is_held((obj)->gpuva.lock_dep_map))
+#else
+#define drm_gem_gpuva_set_lock(obj, lock) do {} while (0)
+#define drm_gem_gpuva_assert_lock_held(obj) do {} while (0)
+#endif
+
+/**
+ * drm_gem_gpuva_init() - initialize the gpuva list of a GEM object
+ * @obj: the &drm_gem_object
+ *
+ * This initializes the &drm_gem_object's &drm_gpuva list.
+ *
+ * Calling this function is only necessary for drivers intending to support the
+ * &drm_driver_feature DRIVER_GEM_GPUVA.
+ */
+static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
+{
+	INIT_LIST_HEAD(&obj->gpuva.list);
+	drm_gem_gpuva_set_lock(obj, &obj->resv->lock.base);
+}
+
+/**
+ * drm_gem_for_each_gpuva() - iternator to walk over a list of gpuvas
+ * @entry__: &drm_gpuva structure to assign to in each iteration step
+ * @obj__: the &drm_gem_object the &drm_gpuvas to walk are associated with
+ *
+ * This iterator walks over all &drm_gpuva structures associated with the
+ * &drm_gpuva_manager.
+ */
+#define drm_gem_for_each_gpuva(entry__, obj__) \
+	list_for_each_entry(entry__, &(obj__)->gpuva.list, gem.entry)
+
+/**
+ * drm_gem_for_each_gpuva_safe() - iternator to safely walk over a list of
+ * gpuvas
+ * @entry__: &drm_gpuva structure to assign to in each iteration step
+ * @next__: &next &drm_gpuva to store the next step
+ * @obj__: the &drm_gem_object the &drm_gpuvas to walk are associated with
+ *
+ * This iterator walks over all &drm_gpuva structures associated with the
+ * &drm_gem_object. It is implemented with list_for_each_entry_safe(), hence
+ * it is save against removal of elements.
+ */
+#define drm_gem_for_each_gpuva_safe(entry__, next__, obj__) \
+	list_for_each_entry_safe(entry__, next__, &(obj__)->gpuva.list, gem.entry)
+
 #endif /* __DRM_GEM_H__ */
diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
new file mode 100644
index 000000000000..ed8d50200cc3
--- /dev/null
+++ b/include/drm/drm_gpuva_mgr.h
@@ -0,0 +1,706 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __DRM_GPUVA_MGR_H__
+#define __DRM_GPUVA_MGR_H__
+
+/*
+ * Copyright (c) 2022 Red Hat.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <linux/list.h>
+#include <linux/rbtree.h>
+#include <linux/types.h>
+
+#include <drm/drm_gem.h>
+
+struct drm_gpuva_manager;
+struct drm_gpuva_fn_ops;
+
+/**
+ * enum drm_gpuva_flags - flags for struct drm_gpuva
+ */
+enum drm_gpuva_flags {
+	/**
+	 * @DRM_GPUVA_INVALIDATED:
+	 *
+	 * Flag indicating that the &drm_gpuva's backing GEM is invalidated.
+	 */
+	DRM_GPUVA_INVALIDATED = (1 << 0),
+
+	/**
+	 * @DRM_GPUVA_SPARSE:
+	 *
+	 * Flag indicating that the &drm_gpuva is a sparse mapping.
+	 */
+	DRM_GPUVA_SPARSE = (1 << 1),
+
+	/**
+	 * @DRM_GPUVA_USERBITS: user defined bits
+	 */
+	DRM_GPUVA_USERBITS = (1 << 2),
+};
+
+/**
+ * struct drm_gpuva - structure to track a GPU VA mapping
+ *
+ * This structure represents a GPU VA mapping and is associated with a
+ * &drm_gpuva_manager.
+ *
+ * Typically, this structure is embedded in bigger driver structures.
+ */
+struct drm_gpuva {
+	/**
+	 * @mgr: the &drm_gpuva_manager this object is associated with
+	 */
+	struct drm_gpuva_manager *mgr;
+
+	/**
+	 * @flags: the &drm_gpuva_flags for this mapping
+	 */
+	enum drm_gpuva_flags flags;
+
+	/**
+	 * @va: structure containing the address and range of the &drm_gpuva
+	 */
+	struct {
+		/**
+		 * @addr: the start address
+		 */
+		u64 addr;
+
+		/*
+		 * @range: the range
+		 */
+		u64 range;
+	} va;
+
+	/**
+	 * @gem: structure containing the &drm_gem_object and it's offset
+	 */
+	struct {
+		/**
+		 * @offset: the offset within the &drm_gem_object
+		 */
+		u64 offset;
+
+		/**
+		 * @obj: the mapped &drm_gem_object
+		 */
+		struct drm_gem_object *obj;
+
+		/**
+		 * @entry: the &list_head to attach this object to a &drm_gem_object
+		 */
+		struct list_head entry;
+	} gem;
+
+	/**
+	 * @rb: structure containing data to store &drm_gpuvas in a rb-tree
+	 */
+	struct {
+		/**
+		 * @rb: the rb-tree node
+		 */
+		struct rb_node node;
+
+		/**
+		 * @entry: The &list_head to additionally connect &drm_gpuvas
+		 * in the same order they appear in the interval tree. This is
+		 * useful to keep iterating &drm_gpuvas from a start node found
+		 * through the rb-tree while doing modifications on the rb-tree
+		 * itself.
+		 */
+		struct list_head entry;
+
+		/**
+		 * @__subtree_last: needed by the interval tree, holding last-in-subtree
+		 */
+		u64 __subtree_last;
+	} rb;
+};
+
+int drm_gpuva_insert(struct drm_gpuva_manager *mgr, struct drm_gpuva *va);
+void drm_gpuva_remove(struct drm_gpuva *va);
+
+void drm_gpuva_link(struct drm_gpuva *va);
+void drm_gpuva_unlink(struct drm_gpuva *va);
+
+struct drm_gpuva *drm_gpuva_find(struct drm_gpuva_manager *mgr,
+				 u64 addr, u64 range);
+struct drm_gpuva *drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
+				       u64 addr, u64 range);
+struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start);
+struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end);
+
+bool drm_gpuva_interval_empty(struct drm_gpuva_manager *mgr, u64 addr, u64 range);
+
+static inline void drm_gpuva_init(struct drm_gpuva *va, u64 addr, u64 range,
+				  struct drm_gem_object *obj, u64 offset)
+{
+	va->va.addr = addr;
+	va->va.range = range;
+	va->gem.obj = obj;
+	va->gem.offset = offset;
+}
+
+/**
+ * drm_gpuva_invalidate() - sets whether the backing GEM of this &drm_gpuva is
+ * invalidated
+ * @va: the &drm_gpuva to set the invalidate flag for
+ * @invalidate: indicates whether the &drm_gpuva is invalidated
+ */
+static inline void drm_gpuva_invalidate(struct drm_gpuva *va, bool invalidate)
+{
+	if (invalidate)
+		va->flags |= DRM_GPUVA_INVALIDATED;
+	else
+		va->flags &= ~DRM_GPUVA_INVALIDATED;
+}
+
+/**
+ * drm_gpuva_invalidated() - indicates whether the backing BO of this &drm_gpuva
+ * is invalidated
+ * @va: the &drm_gpuva to check
+ */
+static inline bool drm_gpuva_invalidated(struct drm_gpuva *va)
+{
+	return va->flags & DRM_GPUVA_INVALIDATED;
+}
+
+/**
+ * struct drm_gpuva_manager - DRM GPU VA Manager
+ *
+ * The DRM GPU VA Manager keeps track of a GPU's virtual address space by using
+ * &maple_tree structures. Typically, this structure is embedded in bigger
+ * driver structures.
+ *
+ * Drivers can pass addresses and ranges in an arbitrary unit, e.g. bytes or
+ * pages.
+ *
+ * There should be one manager instance per GPU virtual address space.
+ */
+struct drm_gpuva_manager {
+	/**
+	 * @name: the name of the DRM GPU VA space
+	 */
+	const char *name;
+
+	/**
+	 * @mm_start: start of the VA space
+	 */
+	u64 mm_start;
+
+	/**
+	 * @mm_range: length of the VA space
+	 */
+	u64 mm_range;
+
+	/**
+	 * @rb: structures to track &drm_gpuva entries
+	 */
+	struct {
+		/**
+		 * @tree: the rb-tree to track GPU VA mappings
+		 */
+		struct rb_root_cached tree;
+
+		/**
+		 * @list: the &list_head to track GPU VA mappings
+		 */
+		struct list_head list;
+	} rb;
+
+	/**
+	 * @kernel_alloc_node:
+	 *
+	 * &drm_gpuva representing the address space cutout reserved for
+	 * the kernel
+	 */
+	struct drm_gpuva kernel_alloc_node;
+
+	/**
+	 * @ops: &drm_gpuva_fn_ops providing the split/merge steps to drivers
+	 */
+	const struct drm_gpuva_fn_ops *ops;
+};
+
+void drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
+			    const char *name,
+			    u64 start_offset, u64 range,
+			    u64 reserve_offset, u64 reserve_range,
+			    const struct drm_gpuva_fn_ops *ops);
+void drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr);
+
+static inline struct drm_gpuva *
+__drm_gpuva_next(struct drm_gpuva *va)
+{
+	if (va && !list_is_last(&va->rb.entry, &va->mgr->rb.list))
+		return list_next_entry(va, rb.entry);
+
+	return NULL;
+}
+
+/**
+ * drm_gpuva_for_each_va_range() - iterate over a range of &drm_gpuvas
+ * @va__: &drm_gpuva structure to assign to in each iteration step
+ * @mgr__: &drm_gpuva_manager to walk over
+ * @start__: starting offset, the first gpuva will overlap this
+ * @end__: ending offset, the last gpuva will start before this (but may
+ * overlap)
+ *
+ * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager that lie
+ * between @start__ and @end__. It is implemented similarly to list_for_each(),
+ * but is using the &drm_gpuva_manager's internal interval tree to accelerate
+ * the search for the starting &drm_gpuva, and hence isn't safe against removal
+ * of elements. It assumes that @end__ is within (or is the upper limit of) the
+ * &drm_gpuva_manager. This iterator does not skip over the &drm_gpuva_manager's
+ * @kernel_alloc_node.
+ */
+#define drm_gpuva_for_each_va_range(va__, mgr__, start__, end__) \
+	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)); \
+	     va__ && (va__->va.addr < (end__)); \
+	     va__ = __drm_gpuva_next(va__))
+
+/**
+ * drm_gpuva_for_each_va_range_safe() - safely iterate over a range of
+ * &drm_gpuvas
+ * @va__: &drm_gpuva to assign to in each iteration step
+ * @next__: another &drm_gpuva to use as temporary storage
+ * @mgr__: &drm_gpuva_manager to walk over
+ * @start__: starting offset, the first gpuva will overlap this
+ * @end__: ending offset, the last gpuva will start before this (but may
+ * overlap)
+ *
+ * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager that lie
+ * between @start__ and @end__. It is implemented similarly to
+ * list_for_each_safe(), but is using the &drm_gpuva_manager's internal interval
+ * tree to accelerate the search for the starting &drm_gpuva, and hence is safe
+ * against removal of elements. It assumes that @end__ is within (or is the
+ * upper limit of) the &drm_gpuva_manager. This iterator does not skip over the
+ * &drm_gpuva_manager's @kernel_alloc_node.
+ */
+#define drm_gpuva_for_each_va_range_safe(va__, next__, mgr__, start__, end__) \
+	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)), \
+	     next__ = __drm_gpuva_next(va__); \
+	     va__ && (va__->va.addr < (end__)); \
+	     va__ = next__, next__ = __drm_gpuva_next(va__))
+
+/**
+ * drm_gpuva_for_each_va() - iterate over all &drm_gpuvas
+ * @va__: &drm_gpuva to assign to in each iteration step
+ * @mgr__: &drm_gpuva_manager to walk over
+ *
+ * This iterator walks over all &drm_gpuva structures associated with the given
+ * &drm_gpuva_manager.
+ */
+#define drm_gpuva_for_each_va(va__, mgr__) \
+	list_for_each_entry(va__, &(mgr__)->rb.list, rb.entry)
+
+/**
+ * drm_gpuva_for_each_va_safe() - safely iterate over all &drm_gpuvas
+ * @va__: &drm_gpuva to assign to in each iteration step
+ * @next__: another &drm_gpuva to use as temporary storage
+ * @mgr__: &drm_gpuva_manager to walk over
+ *
+ * This iterator walks over all &drm_gpuva structures associated with the given
+ * &drm_gpuva_manager. It is implemented with list_for_each_entry_safe(), and
+ * hence safe against the removal of elements.
+ */
+#define drm_gpuva_for_each_va_safe(va__, next__, mgr__) \
+	list_for_each_entry_safe(va__, next__, &(mgr__)->rb.list, rb.entry)
+
+/**
+ * enum drm_gpuva_op_type - GPU VA operation type
+ *
+ * Operations to alter the GPU VA mappings tracked by the &drm_gpuva_manager.
+ */
+enum drm_gpuva_op_type {
+	/**
+	 * @DRM_GPUVA_OP_MAP: the map op type
+	 */
+	DRM_GPUVA_OP_MAP,
+
+	/**
+	 * @DRM_GPUVA_OP_REMAP: the remap op type
+	 */
+	DRM_GPUVA_OP_REMAP,
+
+	/**
+	 * @DRM_GPUVA_OP_UNMAP: the unmap op type
+	 */
+	DRM_GPUVA_OP_UNMAP,
+
+	/**
+	 * @DRM_GPUVA_OP_PREFETCH: the prefetch op type
+	 */
+	DRM_GPUVA_OP_PREFETCH,
+};
+
+/**
+ * struct drm_gpuva_op_map - GPU VA map operation
+ *
+ * This structure represents a single map operation generated by the
+ * DRM GPU VA manager.
+ */
+struct drm_gpuva_op_map {
+	/**
+	 * @va: structure containing address and range of a map
+	 * operation
+	 */
+	struct {
+		/**
+		 * @addr: the base address of the new mapping
+		 */
+		u64 addr;
+
+		/**
+		 * @range: the range of the new mapping
+		 */
+		u64 range;
+	} va;
+
+	/**
+	 * @gem: structure containing the &drm_gem_object and it's offset
+	 */
+	struct {
+		/**
+		 * @offset: the offset within the &drm_gem_object
+		 */
+		u64 offset;
+
+		/**
+		 * @obj: the &drm_gem_object to map
+		 */
+		struct drm_gem_object *obj;
+	} gem;
+};
+
+/**
+ * struct drm_gpuva_op_unmap - GPU VA unmap operation
+ *
+ * This structure represents a single unmap operation generated by the
+ * DRM GPU VA manager.
+ */
+struct drm_gpuva_op_unmap {
+	/**
+	 * @va: the &drm_gpuva to unmap
+	 */
+	struct drm_gpuva *va;
+
+	/**
+	 * @keep:
+	 *
+	 * Indicates whether this &drm_gpuva is physically contiguous with the
+	 * original mapping request.
+	 *
+	 * Optionally, if &keep is set, drivers may keep the actual page table
+	 * mappings for this &drm_gpuva, adding the missing page table entries
+	 * only and update the &drm_gpuva_manager accordingly.
+	 */
+	bool keep;
+};
+
+/**
+ * struct drm_gpuva_op_remap - GPU VA remap operation
+ *
+ * This represents a single remap operation generated by the DRM GPU VA manager.
+ *
+ * A remap operation is generated when an existing GPU VA mmapping is split up
+ * by inserting a new GPU VA mapping or by partially unmapping existent
+ * mapping(s), hence it consists of a maximum of two map and one unmap
+ * operation.
+ *
+ * The @unmap operation takes care of removing the original existing mapping.
+ * @prev is used to remap the preceding part, @next the subsequent part.
+ *
+ * If either a new mapping's start address is aligned with the start address
+ * of the old mapping or the new mapping's end address is aligned with the
+ * end address of the old mapping, either @prev or @next is NULL.
+ *
+ * Note, the reason for a dedicated remap operation, rather than arbitrary
+ * unmap and map operations, is to give drivers the chance of extracting driver
+ * specific data for creating the new mappings from the unmap operations's
+ * &drm_gpuva structure which typically is embedded in larger driver specific
+ * structures.
+ */
+struct drm_gpuva_op_remap {
+	/**
+	 * @prev: the preceding part of a split mapping
+	 */
+	struct drm_gpuva_op_map *prev;
+
+	/**
+	 * @next: the subsequent part of a split mapping
+	 */
+	struct drm_gpuva_op_map *next;
+
+	/**
+	 * @unmap: the unmap operation for the original existing mapping
+	 */
+	struct drm_gpuva_op_unmap *unmap;
+};
+
+/**
+ * struct drm_gpuva_op_prefetch - GPU VA prefetch operation
+ *
+ * This structure represents a single prefetch operation generated by the
+ * DRM GPU VA manager.
+ */
+struct drm_gpuva_op_prefetch {
+	/**
+	 * @va: the &drm_gpuva to prefetch
+	 */
+	struct drm_gpuva *va;
+};
+
+/**
+ * struct drm_gpuva_op - GPU VA operation
+ *
+ * This structure represents a single generic operation.
+ *
+ * The particular type of the operation is defined by @op.
+ */
+struct drm_gpuva_op {
+	/**
+	 * @entry:
+	 *
+	 * The &list_head used to distribute instances of this struct within
+	 * &drm_gpuva_ops.
+	 */
+	struct list_head entry;
+
+	/**
+	 * @op: the type of the operation
+	 */
+	enum drm_gpuva_op_type op;
+
+	union {
+		/**
+		 * @map: the map operation
+		 */
+		struct drm_gpuva_op_map map;
+
+		/**
+		 * @remap: the remap operation
+		 */
+		struct drm_gpuva_op_remap remap;
+
+		/**
+		 * @unmap: the unmap operation
+		 */
+		struct drm_gpuva_op_unmap unmap;
+
+		/**
+		 * @prefetch: the prefetch operation
+		 */
+		struct drm_gpuva_op_prefetch prefetch;
+	};
+};
+
+/**
+ * struct drm_gpuva_ops - wraps a list of &drm_gpuva_op
+ */
+struct drm_gpuva_ops {
+	/**
+	 * @list: the &list_head
+	 */
+	struct list_head list;
+};
+
+/**
+ * drm_gpuva_for_each_op() - iterator to walk over &drm_gpuva_ops
+ * @op: &drm_gpuva_op to assign in each iteration step
+ * @ops: &drm_gpuva_ops to walk
+ *
+ * This iterator walks over all ops within a given list of operations.
+ */
+#define drm_gpuva_for_each_op(op, ops) list_for_each_entry(op, &(ops)->list, entry)
+
+/**
+ * drm_gpuva_for_each_op_safe() - iterator to safely walk over &drm_gpuva_ops
+ * @op: &drm_gpuva_op to assign in each iteration step
+ * @next: &next &drm_gpuva_op to store the next step
+ * @ops: &drm_gpuva_ops to walk
+ *
+ * This iterator walks over all ops within a given list of operations. It is
+ * implemented with list_for_each_safe(), so save against removal of elements.
+ */
+#define drm_gpuva_for_each_op_safe(op, next, ops) \
+	list_for_each_entry_safe(op, next, &(ops)->list, entry)
+
+/**
+ * drm_gpuva_for_each_op_from_reverse() - iterate backwards from the given point
+ * @op: &drm_gpuva_op to assign in each iteration step
+ * @ops: &drm_gpuva_ops to walk
+ *
+ * This iterator walks over all ops within a given list of operations beginning
+ * from the given operation in reverse order.
+ */
+#define drm_gpuva_for_each_op_from_reverse(op, ops) \
+	list_for_each_entry_from_reverse(op, &(ops)->list, entry)
+
+/**
+ * drm_gpuva_first_op() - returns the first &drm_gpuva_op from &drm_gpuva_ops
+ * @ops: the &drm_gpuva_ops to get the fist &drm_gpuva_op from
+ */
+#define drm_gpuva_first_op(ops) \
+	list_first_entry(&(ops)->list, struct drm_gpuva_op, entry)
+
+/**
+ * drm_gpuva_last_op() - returns the last &drm_gpuva_op from &drm_gpuva_ops
+ * @ops: the &drm_gpuva_ops to get the last &drm_gpuva_op from
+ */
+#define drm_gpuva_last_op(ops) \
+	list_last_entry(&(ops)->list, struct drm_gpuva_op, entry)
+
+/**
+ * drm_gpuva_prev_op() - previous &drm_gpuva_op in the list
+ * @op: the current &drm_gpuva_op
+ */
+#define drm_gpuva_prev_op(op) list_prev_entry(op, entry)
+
+/**
+ * drm_gpuva_next_op() - next &drm_gpuva_op in the list
+ * @op: the current &drm_gpuva_op
+ */
+#define drm_gpuva_next_op(op) list_next_entry(op, entry)
+
+struct drm_gpuva_ops *
+drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
+			    u64 addr, u64 range,
+			    struct drm_gem_object *obj, u64 offset);
+struct drm_gpuva_ops *
+drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
+			      u64 addr, u64 range);
+
+struct drm_gpuva_ops *
+drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
+				 u64 addr, u64 range);
+
+struct drm_gpuva_ops *
+drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
+			       struct drm_gem_object *obj);
+
+void drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
+			struct drm_gpuva_ops *ops);
+
+static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
+					  struct drm_gpuva_op_map *op)
+{
+	drm_gpuva_init(va, op->va.addr, op->va.range,
+		       op->gem.obj, op->gem.offset);
+}
+
+/**
+ * struct drm_gpuva_fn_ops - callbacks for split/merge steps
+ *
+ * This structure defines the callbacks used by &drm_gpuva_sm_map and
+ * &drm_gpuva_sm_unmap to provide the split/merge steps for map and unmap
+ * operations to drivers.
+ */
+struct drm_gpuva_fn_ops {
+	/**
+	 * @op_alloc: called when the &drm_gpuva_manager allocates
+	 * a struct drm_gpuva_op
+	 *
+	 * Some drivers may want to embed struct drm_gpuva_op into driver
+	 * specific structures. By implementing this callback drivers can
+	 * allocate memory accordingly.
+	 *
+	 * This callback is optional.
+	 */
+	struct drm_gpuva_op *(*op_alloc)(void);
+
+	/**
+	 * @op_free: called when the &drm_gpuva_manager frees a
+	 * struct drm_gpuva_op
+	 *
+	 * Some drivers may want to embed struct drm_gpuva_op into driver
+	 * specific structures. By implementing this callback drivers can
+	 * free the previously allocated memory accordingly.
+	 *
+	 * This callback is optional.
+	 */
+	void (*op_free)(struct drm_gpuva_op *op);
+
+	/**
+	 * @sm_step_map: called from &drm_gpuva_sm_map to finally insert the
+	 * mapping once all previous steps were completed
+	 *
+	 * The &priv pointer matches the one the driver passed to
+	 * &drm_gpuva_sm_map or &drm_gpuva_sm_unmap, respectively.
+	 *
+	 * Can be NULL if &drm_gpuva_sm_map is used.
+	 */
+	int (*sm_step_map)(struct drm_gpuva_op *op, void *priv);
+
+	/**
+	 * @sm_step_remap: called from &drm_gpuva_sm_map and
+	 * &drm_gpuva_sm_unmap to split up an existent mapping
+	 *
+	 * This callback is called when existent mapping needs to be split up.
+	 * This is the case when either a newly requested mapping overlaps or
+	 * is enclosed by an existent mapping or a partial unmap of an existent
+	 * mapping is requested.
+	 *
+	 * The &priv pointer matches the one the driver passed to
+	 * &drm_gpuva_sm_map or &drm_gpuva_sm_unmap, respectively.
+	 *
+	 * Can be NULL if neither &drm_gpuva_sm_map nor &drm_gpuva_sm_unmap is
+	 * used.
+	 */
+	int (*sm_step_remap)(struct drm_gpuva_op *op, void *priv);
+
+	/**
+	 * @sm_step_unmap: called from &drm_gpuva_sm_map and
+	 * &drm_gpuva_sm_unmap to unmap an existent mapping
+	 *
+	 * This callback is called when existent mapping needs to be unmapped.
+	 * This is the case when either a newly requested mapping encloses an
+	 * existent mapping or an unmap of an existent mapping is requested.
+	 *
+	 * The &priv pointer matches the one the driver passed to
+	 * &drm_gpuva_sm_map or &drm_gpuva_sm_unmap, respectively.
+	 *
+	 * Can be NULL if neither &drm_gpuva_sm_map nor &drm_gpuva_sm_unmap is
+	 * used.
+	 */
+	int (*sm_step_unmap)(struct drm_gpuva_op *op, void *priv);
+};
+
+int drm_gpuva_sm_map(struct drm_gpuva_manager *mgr, void *priv,
+		     u64 addr, u64 range,
+		     struct drm_gem_object *obj, u64 offset);
+
+int drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr, void *priv,
+		       u64 addr, u64 range);
+
+void drm_gpuva_map(struct drm_gpuva_manager *mgr,
+		   struct drm_gpuva *va,
+		   struct drm_gpuva_op_map *op);
+
+void drm_gpuva_remap(struct drm_gpuva *prev,
+		     struct drm_gpuva *next,
+		     struct drm_gpuva_op_remap *op);
+
+void drm_gpuva_unmap(struct drm_gpuva_op_unmap *op);
+
+#endif /* __DRM_GPUVA_MGR_H__ */
-- 
2.41.0

