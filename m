Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD83B76F008
	for <lists+nouveau@lfdr.de>; Thu,  3 Aug 2023 18:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AD610E641;
	Thu,  3 Aug 2023 16:53:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403C510E643
 for <nouveau@lists.freedesktop.org>; Thu,  3 Aug 2023 16:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691081611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DoLUYaAfpNuLuaBx/8lqXtBWGA8XSTpbVZHnBEXQ2K8=;
 b=Z4lbyCFdcTFrUssceyN1IkcIRWnTrUxGibNhfSIBbqWm6tEd8b22IDpeRmgWEgTxzBfZP0
 L+/abo25gvjvJ7ewzcwUYHWaKjPpoQU1uZNDKjcWqFytCXBgsAOfm4h81sakbCOf3JwD2l
 RRfamAiX2kMVWCMwQpD0r3dhFGS0KWg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-PwF0oyXIPUW-jTBXaZ2PRQ-1; Thu, 03 Aug 2023 12:53:30 -0400
X-MC-Unique: PwF0oyXIPUW-jTBXaZ2PRQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-52236f504a6so784600a12.2
 for <nouveau@lists.freedesktop.org>; Thu, 03 Aug 2023 09:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691081609; x=1691686409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DoLUYaAfpNuLuaBx/8lqXtBWGA8XSTpbVZHnBEXQ2K8=;
 b=kVFjHnoJIyr+pQv30iwimn/QfBa8h9+x/PXZDs6/VDbZPFS6Mm9r/WvA2JjnslKdHT
 P9ypitsKjQwpF3SqoinbQbYJIbz0stR5kT/o6E8mXmRTOl/ue8CORa7rG6kCCb/iBaX/
 Ohk4TWctQuxaSDKOdyTDhfqVzxvCLiLxPyJAMYvNWR9OLvE51ceGtb4fMYb+pHItaHm3
 JO48GaWf0H1xIn9f7Mx5dYM1c+GxXXEhum0IfZdAi6hW22vjJT65BtKYkgt01GtJ/17v
 beF8pmDpkKnJ3jJzZ+zYl5zeWW+JiXf105U3jHOjr/LYJ/1C3xvICzYYpixZOJK6U+1/
 at/g==
X-Gm-Message-State: ABy/qLZ2xg582zJQaND6mR7CwweXK9lc7xwzHRCiICEzAwgd7KqzyVao
 fz589pKZN/Qg2u8ydV+2hZD9wHoLu1ghVWEiFDNgEN1VUenxXn8E7c7v5H0MgIQmajyaClYwEta
 jCl1sRpUb3DYyKK/9hX7KqGOURg==
X-Received: by 2002:a17:906:8444:b0:993:e752:1a6f with SMTP id
 e4-20020a170906844400b00993e7521a6fmr8009832ejy.6.1691081608683; 
 Thu, 03 Aug 2023 09:53:28 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGVQNhc4DrzGOMHoGC548oU8MNRqUEuK8gM7G9F3R9Y+9O4jXSLEmJz8k/V2V4xfNvhgpQ5Cw==
X-Received: by 2002:a17:906:8444:b0:993:e752:1a6f with SMTP id
 e4-20020a170906844400b00993e7521a6fmr8009818ejy.6.1691081608368; 
 Thu, 03 Aug 2023 09:53:28 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a1709060e5800b0098e422d6758sm61515eji.219.2023.08.03.09.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 09:53:28 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Thu,  3 Aug 2023 18:52:28 +0200
Message-ID: <20230803165238.8798-10-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803165238.8798-1-dakr@redhat.com>
References: <20230803165238.8798-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v9 09/11] drm/nouveau: nvkm/vmm:
 implement raw ops to manage uvmm
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
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The new VM_BIND UAPI uses the DRM GPU VA manager to manage the VA space.
Hence, we a need a way to manipulate the MMUs page tables without going
through the internal range allocator implemented by nvkm/vmm.

This patch adds a raw interface for nvkm/vmm to pass the resposibility
for managing the address space and the corresponding map/unmap/sparse
operations to the upper layers.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |  26 ++-
 drivers/gpu/drm/nouveau/include/nvif/vmm.h    |  19 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |  20 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c         |   2 +-
 drivers/gpu/drm/nouveau/nouveau_vmm.c         |   4 +-
 drivers/gpu/drm/nouveau/nvif/vmm.c            | 100 +++++++-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    | 213 ++++++++++++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 197 ++++++++++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |  25 ++
 .../drm/nouveau/nvkm/subdev/mmu/vmmgf100.c    |  16 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |  16 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c |  27 ++-
 12 files changed, 566 insertions(+), 99 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000c.h b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
index 9c7ff56831c5..a5a182b3c28d 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if000c.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
@@ -3,7 +3,10 @@
 struct nvif_vmm_v0 {
 	__u8  version;
 	__u8  page_nr;
-	__u8  managed;
+#define NVIF_VMM_V0_TYPE_UNMANAGED                                         0x00
+#define NVIF_VMM_V0_TYPE_MANAGED                                           0x01
+#define NVIF_VMM_V0_TYPE_RAW                                               0x02
+	__u8  type;
 	__u8  pad03[5];
 	__u64 addr;
 	__u64 size;
@@ -17,6 +20,7 @@ struct nvif_vmm_v0 {
 #define NVIF_VMM_V0_UNMAP                                                  0x04
 #define NVIF_VMM_V0_PFNMAP                                                 0x05
 #define NVIF_VMM_V0_PFNCLR                                                 0x06
+#define NVIF_VMM_V0_RAW                                                    0x07
 #define NVIF_VMM_V0_MTHD(i)                                         ((i) + 0x80)
 
 struct nvif_vmm_page_v0 {
@@ -66,6 +70,26 @@ struct nvif_vmm_unmap_v0 {
 	__u64 addr;
 };
 
+struct nvif_vmm_raw_v0 {
+	__u8 version;
+#define NVIF_VMM_RAW_V0_GET	0x0
+#define NVIF_VMM_RAW_V0_PUT	0x1
+#define NVIF_VMM_RAW_V0_MAP	0x2
+#define NVIF_VMM_RAW_V0_UNMAP	0x3
+#define NVIF_VMM_RAW_V0_SPARSE	0x4
+	__u8  op;
+	__u8  sparse;
+	__u8  ref;
+	__u8  shift;
+	__u32 argc;
+	__u8  pad01[7];
+	__u64 addr;
+	__u64 size;
+	__u64 offset;
+	__u64 memory;
+	__u64 argv;
+};
+
 struct nvif_vmm_pfnmap_v0 {
 	__u8  version;
 	__u8  page;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/vmm.h b/drivers/gpu/drm/nouveau/include/nvif/vmm.h
index a2ee92201ace..0ecedd0ee0a5 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/vmm.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/vmm.h
@@ -4,6 +4,12 @@
 struct nvif_mem;
 struct nvif_mmu;
 
+enum nvif_vmm_type {
+	UNMANAGED,
+	MANAGED,
+	RAW,
+};
+
 enum nvif_vmm_get {
 	ADDR,
 	PTES,
@@ -30,8 +36,9 @@ struct nvif_vmm {
 	int page_nr;
 };
 
-int nvif_vmm_ctor(struct nvif_mmu *, const char *name, s32 oclass, bool managed,
-		  u64 addr, u64 size, void *argv, u32 argc, struct nvif_vmm *);
+int nvif_vmm_ctor(struct nvif_mmu *, const char *name, s32 oclass,
+		  enum nvif_vmm_type, u64 addr, u64 size, void *argv, u32 argc,
+		  struct nvif_vmm *);
 void nvif_vmm_dtor(struct nvif_vmm *);
 int nvif_vmm_get(struct nvif_vmm *, enum nvif_vmm_get, bool sparse,
 		 u8 page, u8 align, u64 size, struct nvif_vma *);
@@ -39,4 +46,12 @@ void nvif_vmm_put(struct nvif_vmm *, struct nvif_vma *);
 int nvif_vmm_map(struct nvif_vmm *, u64 addr, u64 size, void *argv, u32 argc,
 		 struct nvif_mem *, u64 offset);
 int nvif_vmm_unmap(struct nvif_vmm *, u64);
+
+int nvif_vmm_raw_get(struct nvif_vmm *vmm, u64 addr, u64 size, u8 shift);
+int nvif_vmm_raw_put(struct nvif_vmm *vmm, u64 addr, u64 size, u8 shift);
+int nvif_vmm_raw_map(struct nvif_vmm *vmm, u64 addr, u64 size, u8 shift,
+		     void *argv, u32 argc, struct nvif_mem *mem, u64 offset);
+int nvif_vmm_raw_unmap(struct nvif_vmm *vmm, u64 addr, u64 size,
+		       u8 shift, bool sparse);
+int nvif_vmm_raw_sparse(struct nvif_vmm *vmm, u64 addr, u64 size, bool ref);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
index 70e7887ef4b4..2fd2f2433fc7 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
@@ -17,6 +17,7 @@ struct nvkm_vma {
 	bool part:1; /* Region was split from an allocated region by map(). */
 	bool busy:1; /* Region busy (for temporarily preventing user access). */
 	bool mapped:1; /* Region contains valid pages. */
+	bool no_comp:1; /* Force no memory compression. */
 	struct nvkm_memory *memory; /* Memory currently mapped into VMA. */
 	struct nvkm_tags *tags; /* Compression tag reference. */
 };
@@ -27,10 +28,26 @@ struct nvkm_vmm {
 	const char *name;
 	u32 debug;
 	struct kref kref;
-	struct mutex mutex;
+
+	struct {
+		struct mutex vmm;
+		struct mutex ref;
+		struct mutex map;
+	} mutex;
 
 	u64 start;
 	u64 limit;
+	struct {
+		struct {
+			u64 addr;
+			u64 size;
+		} p;
+		struct {
+			u64 addr;
+			u64 size;
+		} n;
+		bool raw;
+	} managed;
 
 	struct nvkm_vmm_pt *pd;
 	struct list_head join;
@@ -70,6 +87,7 @@ struct nvkm_vmm_map {
 
 	const struct nvkm_vmm_page *page;
 
+	bool no_comp;
 	struct nvkm_tags *tags;
 	u64 next;
 	u64 type;
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index a74ba8d84ba7..186351ecf72f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -350,7 +350,7 @@ nouveau_svmm_init(struct drm_device *dev, void *data,
 	 * VMM instead of the standard one.
 	 */
 	ret = nvif_vmm_ctor(&cli->mmu, "svmVmm",
-			    cli->vmm.vmm.object.oclass, true,
+			    cli->vmm.vmm.object.oclass, MANAGED,
 			    args->unmanaged_addr, args->unmanaged_size,
 			    &(struct gp100_vmm_v0) {
 				.fault_replay = true,
diff --git a/drivers/gpu/drm/nouveau/nouveau_vmm.c b/drivers/gpu/drm/nouveau/nouveau_vmm.c
index 67d6619fcd5e..a6602c012671 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vmm.c
@@ -128,8 +128,8 @@ nouveau_vmm_fini(struct nouveau_vmm *vmm)
 int
 nouveau_vmm_init(struct nouveau_cli *cli, s32 oclass, struct nouveau_vmm *vmm)
 {
-	int ret = nvif_vmm_ctor(&cli->mmu, "drmVmm", oclass, false, PAGE_SIZE,
-				0, NULL, 0, &vmm->vmm);
+	int ret = nvif_vmm_ctor(&cli->mmu, "drmVmm", oclass, UNMANAGED,
+				PAGE_SIZE, 0, NULL, 0, &vmm->vmm);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c b/drivers/gpu/drm/nouveau/nvif/vmm.c
index 6053d6dc2184..99296f03371a 100644
--- a/drivers/gpu/drm/nouveau/nvif/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
@@ -104,6 +104,90 @@ nvif_vmm_get(struct nvif_vmm *vmm, enum nvif_vmm_get type, bool sparse,
 	return ret;
 }
 
+int
+nvif_vmm_raw_get(struct nvif_vmm *vmm, u64 addr, u64 size,
+		 u8 shift)
+{
+	struct nvif_vmm_raw_v0 args = {
+		.version = 0,
+		.op = NVIF_VMM_RAW_V0_GET,
+		.addr = addr,
+		.size = size,
+		.shift = shift,
+	};
+
+	return nvif_object_mthd(&vmm->object, NVIF_VMM_V0_RAW,
+				&args, sizeof(args));
+}
+
+int
+nvif_vmm_raw_put(struct nvif_vmm *vmm, u64 addr, u64 size, u8 shift)
+{
+	struct nvif_vmm_raw_v0 args = {
+		.version = 0,
+		.op = NVIF_VMM_RAW_V0_PUT,
+		.addr = addr,
+		.size = size,
+		.shift = shift,
+	};
+
+	return nvif_object_mthd(&vmm->object, NVIF_VMM_V0_RAW,
+				&args, sizeof(args));
+}
+
+int
+nvif_vmm_raw_map(struct nvif_vmm *vmm, u64 addr, u64 size, u8 shift,
+		 void *argv, u32 argc, struct nvif_mem *mem, u64 offset)
+{
+	struct nvif_vmm_raw_v0 args = {
+		.version = 0,
+		.op = NVIF_VMM_RAW_V0_MAP,
+		.addr = addr,
+		.size = size,
+		.shift = shift,
+		.memory = nvif_handle(&mem->object),
+		.offset = offset,
+		.argv = (u64)(uintptr_t)argv,
+		.argc = argc,
+	};
+
+
+	return nvif_object_mthd(&vmm->object, NVIF_VMM_V0_RAW,
+				&args, sizeof(args));
+}
+
+int
+nvif_vmm_raw_unmap(struct nvif_vmm *vmm, u64 addr, u64 size,
+		   u8 shift, bool sparse)
+{
+	struct nvif_vmm_raw_v0 args = {
+		.version = 0,
+		.op = NVIF_VMM_RAW_V0_UNMAP,
+		.addr = addr,
+		.size = size,
+		.shift = shift,
+		.sparse = sparse,
+	};
+
+	return nvif_object_mthd(&vmm->object, NVIF_VMM_V0_RAW,
+				&args, sizeof(args));
+}
+
+int
+nvif_vmm_raw_sparse(struct nvif_vmm *vmm, u64 addr, u64 size, bool ref)
+{
+	struct nvif_vmm_raw_v0 args = {
+		.version = 0,
+		.op = NVIF_VMM_RAW_V0_SPARSE,
+		.addr = addr,
+		.size = size,
+		.ref = ref,
+	};
+
+	return nvif_object_mthd(&vmm->object, NVIF_VMM_V0_RAW,
+				&args, sizeof(args));
+}
+
 void
 nvif_vmm_dtor(struct nvif_vmm *vmm)
 {
@@ -112,8 +196,9 @@ nvif_vmm_dtor(struct nvif_vmm *vmm)
 }
 
 int
-nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass, bool managed,
-	      u64 addr, u64 size, void *argv, u32 argc, struct nvif_vmm *vmm)
+nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass,
+	      enum nvif_vmm_type type, u64 addr, u64 size, void *argv, u32 argc,
+	      struct nvif_vmm *vmm)
 {
 	struct nvif_vmm_v0 *args;
 	u32 argn = sizeof(*args) + argc;
@@ -125,9 +210,18 @@ nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass, bool managed,
 	if (!(args = kmalloc(argn, GFP_KERNEL)))
 		return -ENOMEM;
 	args->version = 0;
-	args->managed = managed;
 	args->addr = addr;
 	args->size = size;
+
+	switch (type) {
+	case UNMANAGED: args->type = NVIF_VMM_V0_TYPE_UNMANAGED; break;
+	case MANAGED: args->type = NVIF_VMM_V0_TYPE_MANAGED; break;
+	case RAW: args->type = NVIF_VMM_V0_TYPE_RAW; break;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
 	memcpy(args->data, argv, argc);
 
 	ret = nvif_object_ctor(&mmu->object, name ? name : "nvifVmm", 0,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index 524cd3c0e3fe..38b7ced934b1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -58,10 +58,13 @@ nvkm_uvmm_mthd_pfnclr(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	} else
 		return ret;
 
+	if (nvkm_vmm_in_managed_range(vmm, addr, size) && vmm->managed.raw)
+		return -EINVAL;
+
 	if (size) {
-		mutex_lock(&vmm->mutex);
+		mutex_lock(&vmm->mutex.vmm);
 		ret = nvkm_vmm_pfn_unmap(vmm, addr, size);
-		mutex_unlock(&vmm->mutex);
+		mutex_unlock(&vmm->mutex.vmm);
 	}
 
 	return ret;
@@ -88,10 +91,13 @@ nvkm_uvmm_mthd_pfnmap(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	} else
 		return ret;
 
+	if (nvkm_vmm_in_managed_range(vmm, addr, size) && vmm->managed.raw)
+		return -EINVAL;
+
 	if (size) {
-		mutex_lock(&vmm->mutex);
+		mutex_lock(&vmm->mutex.vmm);
 		ret = nvkm_vmm_pfn_map(vmm, page, addr, size, phys);
-		mutex_unlock(&vmm->mutex);
+		mutex_unlock(&vmm->mutex.vmm);
 	}
 
 	return ret;
@@ -113,7 +119,10 @@ nvkm_uvmm_mthd_unmap(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	} else
 		return ret;
 
-	mutex_lock(&vmm->mutex);
+	if (nvkm_vmm_in_managed_range(vmm, addr, 0) && vmm->managed.raw)
+		return -EINVAL;
+
+	mutex_lock(&vmm->mutex.vmm);
 	vma = nvkm_vmm_node_search(vmm, addr);
 	if (ret = -ENOENT, !vma || vma->addr != addr) {
 		VMM_DEBUG(vmm, "lookup %016llx: %016llx",
@@ -134,7 +143,7 @@ nvkm_uvmm_mthd_unmap(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	nvkm_vmm_unmap_locked(vmm, vma, false);
 	ret = 0;
 done:
-	mutex_unlock(&vmm->mutex);
+	mutex_unlock(&vmm->mutex.vmm);
 	return ret;
 }
 
@@ -159,13 +168,16 @@ nvkm_uvmm_mthd_map(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	} else
 		return ret;
 
+	if (nvkm_vmm_in_managed_range(vmm, addr, size) && vmm->managed.raw)
+		return -EINVAL;
+
 	memory = nvkm_umem_search(client, handle);
 	if (IS_ERR(memory)) {
 		VMM_DEBUG(vmm, "memory %016llx %ld\n", handle, PTR_ERR(memory));
 		return PTR_ERR(memory);
 	}
 
-	mutex_lock(&vmm->mutex);
+	mutex_lock(&vmm->mutex.vmm);
 	if (ret = -ENOENT, !(vma = nvkm_vmm_node_search(vmm, addr))) {
 		VMM_DEBUG(vmm, "lookup %016llx", addr);
 		goto fail;
@@ -198,7 +210,7 @@ nvkm_uvmm_mthd_map(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 		}
 	}
 	vma->busy = true;
-	mutex_unlock(&vmm->mutex);
+	mutex_unlock(&vmm->mutex.vmm);
 
 	ret = nvkm_memory_map(memory, offset, vmm, vma, argv, argc);
 	if (ret == 0) {
@@ -207,11 +219,11 @@ nvkm_uvmm_mthd_map(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 		return 0;
 	}
 
-	mutex_lock(&vmm->mutex);
+	mutex_lock(&vmm->mutex.vmm);
 	vma->busy = false;
 	nvkm_vmm_unmap_region(vmm, vma);
 fail:
-	mutex_unlock(&vmm->mutex);
+	mutex_unlock(&vmm->mutex.vmm);
 	nvkm_memory_unref(&memory);
 	return ret;
 }
@@ -232,7 +244,7 @@ nvkm_uvmm_mthd_put(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	} else
 		return ret;
 
-	mutex_lock(&vmm->mutex);
+	mutex_lock(&vmm->mutex.vmm);
 	vma = nvkm_vmm_node_search(vmm, args->v0.addr);
 	if (ret = -ENOENT, !vma || vma->addr != addr || vma->part) {
 		VMM_DEBUG(vmm, "lookup %016llx: %016llx %d", addr,
@@ -248,7 +260,7 @@ nvkm_uvmm_mthd_put(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	nvkm_vmm_put_locked(vmm, vma);
 	ret = 0;
 done:
-	mutex_unlock(&vmm->mutex);
+	mutex_unlock(&vmm->mutex.vmm);
 	return ret;
 }
 
@@ -275,10 +287,10 @@ nvkm_uvmm_mthd_get(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	} else
 		return ret;
 
-	mutex_lock(&vmm->mutex);
+	mutex_lock(&vmm->mutex.vmm);
 	ret = nvkm_vmm_get_locked(vmm, getref, mapref, sparse,
 				  page, align, size, &vma);
-	mutex_unlock(&vmm->mutex);
+	mutex_unlock(&vmm->mutex.vmm);
 	if (ret)
 		return ret;
 
@@ -314,6 +326,167 @@ nvkm_uvmm_mthd_page(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	return 0;
 }
 
+static inline int
+nvkm_uvmm_page_index(struct nvkm_uvmm *uvmm, u64 size, u8 shift, u8 *refd)
+{
+	struct nvkm_vmm *vmm = uvmm->vmm;
+	const struct nvkm_vmm_page *page;
+
+	if (likely(shift)) {
+		for (page = vmm->func->page; page->shift; page++) {
+			if (shift == page->shift)
+				break;
+		}
+
+		if (!page->shift || !IS_ALIGNED(size, 1ULL << page->shift)) {
+			VMM_DEBUG(vmm, "page %d %016llx", shift, size);
+			return -EINVAL;
+		}
+	} else {
+		return -EINVAL;
+	}
+	*refd = page - vmm->func->page;
+
+	return 0;
+}
+
+static int
+nvkm_uvmm_mthd_raw_get(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
+{
+	struct nvkm_vmm *vmm = uvmm->vmm;
+	u8 refd;
+	int ret;
+
+	if (!nvkm_vmm_in_managed_range(vmm, args->addr, args->size))
+		return -EINVAL;
+
+	ret = nvkm_uvmm_page_index(uvmm, args->size, args->shift, &refd);
+	if (ret)
+		return ret;
+
+	return nvkm_vmm_raw_get(vmm, args->addr, args->size, refd);
+}
+
+static int
+nvkm_uvmm_mthd_raw_put(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
+{
+	struct nvkm_vmm *vmm = uvmm->vmm;
+	u8 refd;
+	int ret;
+
+	if (!nvkm_vmm_in_managed_range(vmm, args->addr, args->size))
+		return -EINVAL;
+
+	ret = nvkm_uvmm_page_index(uvmm, args->size, args->shift, &refd);
+	if (ret)
+		return ret;
+
+	nvkm_vmm_raw_put(vmm, args->addr, args->size, refd);
+
+	return 0;
+}
+
+static int
+nvkm_uvmm_mthd_raw_map(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
+{
+	struct nvkm_client *client = uvmm->object.client;
+	struct nvkm_vmm *vmm = uvmm->vmm;
+	struct nvkm_vma vma = {
+		.addr = args->addr,
+		.size = args->size,
+		.used = true,
+		.mapref = false,
+		.no_comp = true,
+	};
+	struct nvkm_memory *memory;
+	u64 handle = args->memory;
+	u8 refd;
+	int ret;
+
+	if (!nvkm_vmm_in_managed_range(vmm, args->addr, args->size))
+		return -EINVAL;
+
+	ret = nvkm_uvmm_page_index(uvmm, args->size, args->shift, &refd);
+	if (ret)
+		return ret;
+
+	vma.page = vma.refd = refd;
+
+	memory = nvkm_umem_search(client, args->memory);
+	if (IS_ERR(memory)) {
+		VMM_DEBUG(vmm, "memory %016llx %ld\n", handle, PTR_ERR(memory));
+		return PTR_ERR(memory);
+	}
+
+	ret = nvkm_memory_map(memory, args->offset, vmm, &vma,
+			      (void *)args->argv, args->argc);
+
+	nvkm_memory_unref(&vma.memory);
+	nvkm_memory_unref(&memory);
+	return ret;
+}
+
+static int
+nvkm_uvmm_mthd_raw_unmap(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
+{
+	struct nvkm_vmm *vmm = uvmm->vmm;
+	u8 refd;
+	int ret;
+
+	if (!nvkm_vmm_in_managed_range(vmm, args->addr, args->size))
+		return -EINVAL;
+
+	ret = nvkm_uvmm_page_index(uvmm, args->size, args->shift, &refd);
+	if (ret)
+		return ret;
+
+	nvkm_vmm_raw_unmap(vmm, args->addr, args->size,
+			   args->sparse, refd);
+
+	return 0;
+}
+
+static int
+nvkm_uvmm_mthd_raw_sparse(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
+{
+	struct nvkm_vmm *vmm = uvmm->vmm;
+
+	if (!nvkm_vmm_in_managed_range(vmm, args->addr, args->size))
+		return -EINVAL;
+
+	return nvkm_vmm_raw_sparse(vmm, args->addr, args->size, args->ref);
+}
+
+static int
+nvkm_uvmm_mthd_raw(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
+{
+	union {
+		struct nvif_vmm_raw_v0 v0;
+	} *args = argv;
+	int ret = -ENOSYS;
+
+	if (!uvmm->vmm->managed.raw)
+		return -EINVAL;
+
+	if ((ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, true)))
+		return ret;
+
+	switch (args->v0.op) {
+	case NVIF_VMM_RAW_V0_GET:
+		return nvkm_uvmm_mthd_raw_get(uvmm, &args->v0);
+	case NVIF_VMM_RAW_V0_PUT:
+		return nvkm_uvmm_mthd_raw_put(uvmm, &args->v0);
+	case NVIF_VMM_RAW_V0_MAP:
+		return nvkm_uvmm_mthd_raw_map(uvmm, &args->v0);
+	case NVIF_VMM_RAW_V0_UNMAP:
+		return nvkm_uvmm_mthd_raw_unmap(uvmm, &args->v0);
+	case NVIF_VMM_RAW_V0_SPARSE:
+		return nvkm_uvmm_mthd_raw_sparse(uvmm, &args->v0);
+	default:
+		return -EINVAL;
+	};
+}
+
 static int
 nvkm_uvmm_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
@@ -326,6 +499,7 @@ nvkm_uvmm_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 	case NVIF_VMM_V0_UNMAP : return nvkm_uvmm_mthd_unmap (uvmm, argv, argc);
 	case NVIF_VMM_V0_PFNMAP: return nvkm_uvmm_mthd_pfnmap(uvmm, argv, argc);
 	case NVIF_VMM_V0_PFNCLR: return nvkm_uvmm_mthd_pfnclr(uvmm, argv, argc);
+	case NVIF_VMM_V0_RAW   : return nvkm_uvmm_mthd_raw   (uvmm, argv, argc);
 	case NVIF_VMM_V0_MTHD(0x00) ... NVIF_VMM_V0_MTHD(0x7f):
 		if (uvmm->vmm->func->mthd) {
 			return uvmm->vmm->func->mthd(uvmm->vmm,
@@ -366,10 +540,11 @@ nvkm_uvmm_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 	struct nvkm_uvmm *uvmm;
 	int ret = -ENOSYS;
 	u64 addr, size;
-	bool managed;
+	bool managed, raw;
 
 	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, more))) {
-		managed = args->v0.managed != 0;
+		managed = args->v0.type == NVIF_VMM_V0_TYPE_MANAGED;
+		raw = args->v0.type == NVIF_VMM_V0_TYPE_RAW;
 		addr = args->v0.addr;
 		size = args->v0.size;
 	} else
@@ -377,12 +552,13 @@ nvkm_uvmm_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 
 	if (!(uvmm = kzalloc(sizeof(*uvmm), GFP_KERNEL)))
 		return -ENOMEM;
+
 	nvkm_object_ctor(&nvkm_uvmm, oclass, &uvmm->object);
 	*pobject = &uvmm->object;
 
 	if (!mmu->vmm) {
-		ret = mmu->func->vmm.ctor(mmu, managed, addr, size, argv, argc,
-					  NULL, "user", &uvmm->vmm);
+		ret = mmu->func->vmm.ctor(mmu, managed || raw, addr, size,
+					  argv, argc, NULL, "user", &uvmm->vmm);
 		if (ret)
 			return ret;
 
@@ -393,6 +569,7 @@ nvkm_uvmm_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 
 		uvmm->vmm = nvkm_vmm_ref(mmu->vmm);
 	}
+	uvmm->vmm->managed.raw = raw;
 
 	page = uvmm->vmm->func->page;
 	args->v0.page_nr = 0;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index ae793f400ba1..eb5fcadcb39a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -676,41 +676,18 @@ nvkm_vmm_ptes_sparse(struct nvkm_vmm *vmm, u64 addr, u64 size, bool ref)
 	return 0;
 }
 
-static void
-nvkm_vmm_ptes_unmap_put(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
-			u64 addr, u64 size, bool sparse, bool pfn)
-{
-	const struct nvkm_vmm_desc_func *func = page->desc->func;
-	nvkm_vmm_iter(vmm, page, addr, size, "unmap + unref",
-		      false, pfn, nvkm_vmm_unref_ptes, NULL, NULL,
-		      sparse ? func->sparse : func->invalid ? func->invalid :
-							      func->unmap);
-}
-
-static int
-nvkm_vmm_ptes_get_map(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
-		      u64 addr, u64 size, struct nvkm_vmm_map *map,
-		      nvkm_vmm_pte_func func)
-{
-	u64 fail = nvkm_vmm_iter(vmm, page, addr, size, "ref + map", true,
-				 false, nvkm_vmm_ref_ptes, func, map, NULL);
-	if (fail != ~0ULL) {
-		if ((size = fail - addr))
-			nvkm_vmm_ptes_unmap_put(vmm, page, addr, size, false, false);
-		return -ENOMEM;
-	}
-	return 0;
-}
-
 static void
 nvkm_vmm_ptes_unmap(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
 		    u64 addr, u64 size, bool sparse, bool pfn)
 {
 	const struct nvkm_vmm_desc_func *func = page->desc->func;
+
+	mutex_lock(&vmm->mutex.map);
 	nvkm_vmm_iter(vmm, page, addr, size, "unmap", false, pfn,
 		      NULL, NULL, NULL,
 		      sparse ? func->sparse : func->invalid ? func->invalid :
 							      func->unmap);
+	mutex_unlock(&vmm->mutex.map);
 }
 
 static void
@@ -718,33 +695,108 @@ nvkm_vmm_ptes_map(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
 		  u64 addr, u64 size, struct nvkm_vmm_map *map,
 		  nvkm_vmm_pte_func func)
 {
+	mutex_lock(&vmm->mutex.map);
 	nvkm_vmm_iter(vmm, page, addr, size, "map", false, false,
 		      NULL, func, map, NULL);
+	mutex_unlock(&vmm->mutex.map);
 }
 
 static void
-nvkm_vmm_ptes_put(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
-		  u64 addr, u64 size)
+nvkm_vmm_ptes_put_locked(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
+			 u64 addr, u64 size)
 {
 	nvkm_vmm_iter(vmm, page, addr, size, "unref", false, false,
 		      nvkm_vmm_unref_ptes, NULL, NULL, NULL);
 }
 
+static void
+nvkm_vmm_ptes_put(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
+		  u64 addr, u64 size)
+{
+	mutex_lock(&vmm->mutex.ref);
+	nvkm_vmm_ptes_put_locked(vmm, page, addr, size);
+	mutex_unlock(&vmm->mutex.ref);
+}
+
 static int
 nvkm_vmm_ptes_get(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
 		  u64 addr, u64 size)
 {
-	u64 fail = nvkm_vmm_iter(vmm, page, addr, size, "ref", true, false,
-				 nvkm_vmm_ref_ptes, NULL, NULL, NULL);
+	u64 fail;
+
+	mutex_lock(&vmm->mutex.ref);
+	fail = nvkm_vmm_iter(vmm, page, addr, size, "ref", true, false,
+			     nvkm_vmm_ref_ptes, NULL, NULL, NULL);
 	if (fail != ~0ULL) {
 		if (fail != addr)
-			nvkm_vmm_ptes_put(vmm, page, addr, fail - addr);
+			nvkm_vmm_ptes_put_locked(vmm, page, addr, fail - addr);
+		mutex_unlock(&vmm->mutex.ref);
+		return -ENOMEM;
+	}
+	mutex_unlock(&vmm->mutex.ref);
+	return 0;
+}
+
+static void
+__nvkm_vmm_ptes_unmap_put(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
+			  u64 addr, u64 size, bool sparse, bool pfn)
+{
+	const struct nvkm_vmm_desc_func *func = page->desc->func;
+
+	nvkm_vmm_iter(vmm, page, addr, size, "unmap + unref",
+		      false, pfn, nvkm_vmm_unref_ptes, NULL, NULL,
+		      sparse ? func->sparse : func->invalid ? func->invalid :
+							      func->unmap);
+}
+
+static void
+nvkm_vmm_ptes_unmap_put(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
+			u64 addr, u64 size, bool sparse, bool pfn)
+{
+	if (vmm->managed.raw) {
+		nvkm_vmm_ptes_unmap(vmm, page, addr, size, sparse, pfn);
+		nvkm_vmm_ptes_put(vmm, page, addr, size);
+	} else {
+		__nvkm_vmm_ptes_unmap_put(vmm, page, addr, size, sparse, pfn);
+	}
+}
+
+static int
+__nvkm_vmm_ptes_get_map(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
+			u64 addr, u64 size, struct nvkm_vmm_map *map,
+			nvkm_vmm_pte_func func)
+{
+	u64 fail = nvkm_vmm_iter(vmm, page, addr, size, "ref + map", true,
+				 false, nvkm_vmm_ref_ptes, func, map, NULL);
+	if (fail != ~0ULL) {
+		if ((size = fail - addr))
+			nvkm_vmm_ptes_unmap_put(vmm, page, addr, size, false, false);
 		return -ENOMEM;
 	}
 	return 0;
 }
 
-static inline struct nvkm_vma *
+static int
+nvkm_vmm_ptes_get_map(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
+		      u64 addr, u64 size, struct nvkm_vmm_map *map,
+		      nvkm_vmm_pte_func func)
+{
+	int ret;
+
+	if (vmm->managed.raw) {
+		ret = nvkm_vmm_ptes_get(vmm, page, addr, size);
+		if (ret)
+			return ret;
+
+		nvkm_vmm_ptes_map(vmm, page, addr, size, map, func);
+
+		return 0;
+	} else {
+		return __nvkm_vmm_ptes_get_map(vmm, page, addr, size, map, func);
+	}
+}
+
+struct nvkm_vma *
 nvkm_vma_new(u64 addr, u64 size)
 {
 	struct nvkm_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
@@ -1045,7 +1097,9 @@ nvkm_vmm_ctor(const struct nvkm_vmm_func *func, struct nvkm_mmu *mmu,
 	vmm->debug = mmu->subdev.debug;
 	kref_init(&vmm->kref);
 
-	__mutex_init(&vmm->mutex, "&vmm->mutex", key ? key : &_key);
+	__mutex_init(&vmm->mutex.vmm, "&vmm->mutex.vmm", key ? key : &_key);
+	mutex_init(&vmm->mutex.ref);
+	mutex_init(&vmm->mutex.map);
 
 	/* Locate the smallest page size supported by the backend, it will
 	 * have the deepest nesting of page tables.
@@ -1101,6 +1155,9 @@ nvkm_vmm_ctor(const struct nvkm_vmm_func *func, struct nvkm_mmu *mmu,
 		if (addr && (ret = nvkm_vmm_ctor_managed(vmm, 0, addr)))
 			return ret;
 
+		vmm->managed.p.addr = 0;
+		vmm->managed.p.size = addr;
+
 		/* NVKM-managed area. */
 		if (size) {
 			if (!(vma = nvkm_vma_new(addr, size)))
@@ -1114,6 +1171,9 @@ nvkm_vmm_ctor(const struct nvkm_vmm_func *func, struct nvkm_mmu *mmu,
 		size = vmm->limit - addr;
 		if (size && (ret = nvkm_vmm_ctor_managed(vmm, addr, size)))
 			return ret;
+
+		vmm->managed.n.addr = addr;
+		vmm->managed.n.size = size;
 	} else {
 		/* Address-space fully managed by NVKM, requiring calls to
 		 * nvkm_vmm_get()/nvkm_vmm_put() to allocate address-space.
@@ -1362,9 +1422,9 @@ void
 nvkm_vmm_unmap(struct nvkm_vmm *vmm, struct nvkm_vma *vma)
 {
 	if (vma->memory) {
-		mutex_lock(&vmm->mutex);
+		mutex_lock(&vmm->mutex.vmm);
 		nvkm_vmm_unmap_locked(vmm, vma, false);
-		mutex_unlock(&vmm->mutex);
+		mutex_unlock(&vmm->mutex.vmm);
 	}
 }
 
@@ -1423,6 +1483,8 @@ nvkm_vmm_map_locked(struct nvkm_vmm *vmm, struct nvkm_vma *vma,
 	nvkm_vmm_pte_func func;
 	int ret;
 
+	map->no_comp = vma->no_comp;
+
 	/* Make sure we won't overrun the end of the memory object. */
 	if (unlikely(nvkm_memory_size(map->memory) < map->offset + vma->size)) {
 		VMM_DEBUG(vmm, "overrun %016llx %016llx %016llx",
@@ -1507,10 +1569,15 @@ nvkm_vmm_map(struct nvkm_vmm *vmm, struct nvkm_vma *vma, void *argv, u32 argc,
 	     struct nvkm_vmm_map *map)
 {
 	int ret;
-	mutex_lock(&vmm->mutex);
+
+	if (nvkm_vmm_in_managed_range(vmm, vma->addr, vma->size) &&
+	    vmm->managed.raw)
+		return nvkm_vmm_map_locked(vmm, vma, argv, argc, map);
+
+	mutex_lock(&vmm->mutex.vmm);
 	ret = nvkm_vmm_map_locked(vmm, vma, argv, argc, map);
 	vma->busy = false;
-	mutex_unlock(&vmm->mutex);
+	mutex_unlock(&vmm->mutex.vmm);
 	return ret;
 }
 
@@ -1620,9 +1687,9 @@ nvkm_vmm_put(struct nvkm_vmm *vmm, struct nvkm_vma **pvma)
 {
 	struct nvkm_vma *vma = *pvma;
 	if (vma) {
-		mutex_lock(&vmm->mutex);
+		mutex_lock(&vmm->mutex.vmm);
 		nvkm_vmm_put_locked(vmm, vma);
-		mutex_unlock(&vmm->mutex);
+		mutex_unlock(&vmm->mutex.vmm);
 		*pvma = NULL;
 	}
 }
@@ -1769,9 +1836,49 @@ int
 nvkm_vmm_get(struct nvkm_vmm *vmm, u8 page, u64 size, struct nvkm_vma **pvma)
 {
 	int ret;
-	mutex_lock(&vmm->mutex);
+	mutex_lock(&vmm->mutex.vmm);
 	ret = nvkm_vmm_get_locked(vmm, false, true, false, page, 0, size, pvma);
-	mutex_unlock(&vmm->mutex);
+	mutex_unlock(&vmm->mutex.vmm);
+	return ret;
+}
+
+void
+nvkm_vmm_raw_unmap(struct nvkm_vmm *vmm, u64 addr, u64 size,
+		   bool sparse, u8 refd)
+{
+	const struct nvkm_vmm_page *page = &vmm->func->page[refd];
+
+	nvkm_vmm_ptes_unmap(vmm, page, addr, size, sparse, false);
+}
+
+void
+nvkm_vmm_raw_put(struct nvkm_vmm *vmm, u64 addr, u64 size, u8 refd)
+{
+	const struct nvkm_vmm_page *page = vmm->func->page;
+
+	nvkm_vmm_ptes_put(vmm, &page[refd], addr, size);
+}
+
+int
+nvkm_vmm_raw_get(struct nvkm_vmm *vmm, u64 addr, u64 size, u8 refd)
+{
+	const struct nvkm_vmm_page *page = vmm->func->page;
+
+	if (unlikely(!size))
+		return -EINVAL;
+
+	return nvkm_vmm_ptes_get(vmm, &page[refd], addr, size);
+}
+
+int
+nvkm_vmm_raw_sparse(struct nvkm_vmm *vmm, u64 addr, u64 size, bool ref)
+{
+	int ret;
+
+	mutex_lock(&vmm->mutex.ref);
+	ret = nvkm_vmm_ptes_sparse(vmm, addr, size, ref);
+	mutex_unlock(&vmm->mutex.ref);
+
 	return ret;
 }
 
@@ -1779,9 +1886,9 @@ void
 nvkm_vmm_part(struct nvkm_vmm *vmm, struct nvkm_memory *inst)
 {
 	if (inst && vmm && vmm->func->part) {
-		mutex_lock(&vmm->mutex);
+		mutex_lock(&vmm->mutex.vmm);
 		vmm->func->part(vmm, inst);
-		mutex_unlock(&vmm->mutex);
+		mutex_unlock(&vmm->mutex.vmm);
 	}
 }
 
@@ -1790,9 +1897,9 @@ nvkm_vmm_join(struct nvkm_vmm *vmm, struct nvkm_memory *inst)
 {
 	int ret = 0;
 	if (vmm->func->join) {
-		mutex_lock(&vmm->mutex);
+		mutex_lock(&vmm->mutex.vmm);
 		ret = vmm->func->join(vmm, inst);
-		mutex_unlock(&vmm->mutex);
+		mutex_unlock(&vmm->mutex.vmm);
 	}
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
index f6188aa9171c..f9bc30cdb2b3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -163,6 +163,7 @@ int nvkm_vmm_new_(const struct nvkm_vmm_func *, struct nvkm_mmu *,
 		  u32 pd_header, bool managed, u64 addr, u64 size,
 		  struct lock_class_key *, const char *name,
 		  struct nvkm_vmm **);
+struct nvkm_vma *nvkm_vma_new(u64 addr, u64 size);
 struct nvkm_vma *nvkm_vmm_node_search(struct nvkm_vmm *, u64 addr);
 struct nvkm_vma *nvkm_vmm_node_split(struct nvkm_vmm *, struct nvkm_vma *,
 				     u64 addr, u64 size);
@@ -173,6 +174,30 @@ void nvkm_vmm_put_locked(struct nvkm_vmm *, struct nvkm_vma *);
 void nvkm_vmm_unmap_locked(struct nvkm_vmm *, struct nvkm_vma *, bool pfn);
 void nvkm_vmm_unmap_region(struct nvkm_vmm *, struct nvkm_vma *);
 
+int nvkm_vmm_raw_get(struct nvkm_vmm *vmm, u64 addr, u64 size, u8 refd);
+void nvkm_vmm_raw_put(struct nvkm_vmm *vmm, u64 addr, u64 size, u8 refd);
+void nvkm_vmm_raw_unmap(struct nvkm_vmm *vmm, u64 addr, u64 size,
+			bool sparse, u8 refd);
+int nvkm_vmm_raw_sparse(struct nvkm_vmm *, u64 addr, u64 size, bool ref);
+
+static inline bool
+nvkm_vmm_in_managed_range(struct nvkm_vmm *vmm, u64 start, u64 size)
+{
+	u64 p_start = vmm->managed.p.addr;
+	u64 p_end = p_start + vmm->managed.p.size;
+	u64 n_start = vmm->managed.n.addr;
+	u64 n_end = n_start + vmm->managed.n.size;
+	u64 end = start + size;
+
+	if (start >= p_start && end <= p_end)
+		return true;
+
+	if (start >= n_start && end <= n_end)
+		return true;
+
+	return false;
+}
+
 #define NVKM_VMM_PFN_ADDR                                 0xfffffffffffff000ULL
 #define NVKM_VMM_PFN_ADDR_SHIFT                                              12
 #define NVKM_VMM_PFN_APER                                 0x00000000000000f0ULL
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c
index 5438384d9a67..5e857c02e9aa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c
@@ -287,15 +287,17 @@ gf100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 			return -EINVAL;
 		}
 
-		ret = nvkm_memory_tags_get(memory, device, tags,
-					   nvkm_ltc_tags_clear,
-					   &map->tags);
-		if (ret) {
-			VMM_DEBUG(vmm, "comp %d", ret);
-			return ret;
+		if (!map->no_comp) {
+			ret = nvkm_memory_tags_get(memory, device, tags,
+						   nvkm_ltc_tags_clear,
+						   &map->tags);
+			if (ret) {
+				VMM_DEBUG(vmm, "comp %d", ret);
+				return ret;
+			}
 		}
 
-		if (map->tags->mn) {
+		if (!map->no_comp && map->tags->mn) {
 			u64 tags = map->tags->mn->offset + (map->offset >> 17);
 			if (page->shift == 17 || !gm20x) {
 				map->type |= tags << 44;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index 17899fc95b2d..f3630d0e0d55 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -453,15 +453,17 @@ gp100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 			return -EINVAL;
 		}
 
-		ret = nvkm_memory_tags_get(memory, device, tags,
-					   nvkm_ltc_tags_clear,
-					   &map->tags);
-		if (ret) {
-			VMM_DEBUG(vmm, "comp %d", ret);
-			return ret;
+		if (!map->no_comp) {
+			ret = nvkm_memory_tags_get(memory, device, tags,
+						   nvkm_ltc_tags_clear,
+						   &map->tags);
+			if (ret) {
+				VMM_DEBUG(vmm, "comp %d", ret);
+				return ret;
+			}
 		}
 
-		if (map->tags->mn) {
+		if (!map->no_comp && map->tags->mn) {
 			tags = map->tags->mn->offset + (map->offset >> 16);
 			map->ctag |= ((1ULL << page->shift) >> 16) << 36;
 			map->type |= tags << 36;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c
index b7548dcd72c7..ff08ad5005a9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c
@@ -296,19 +296,22 @@ nv50_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 			return -EINVAL;
 		}
 
-		ret = nvkm_memory_tags_get(memory, device, tags, NULL,
-					   &map->tags);
-		if (ret) {
-			VMM_DEBUG(vmm, "comp %d", ret);
-			return ret;
-		}
+		if (!map->no_comp) {
+			ret = nvkm_memory_tags_get(memory, device, tags, NULL,
+						   &map->tags);
+			if (ret) {
+				VMM_DEBUG(vmm, "comp %d", ret);
+				return ret;
+			}
 
-		if (map->tags->mn) {
-			u32 tags = map->tags->mn->offset + (map->offset >> 16);
-			map->ctag |= (u64)comp << 49;
-			map->type |= (u64)comp << 47;
-			map->type |= (u64)tags << 49;
-			map->next |= map->ctag;
+			if (map->tags->mn) {
+				u32 tags = map->tags->mn->offset +
+					   (map->offset >> 16);
+				map->ctag |= (u64)comp << 49;
+				map->type |= (u64)comp << 47;
+				map->type |= (u64)tags << 49;
+				map->next |= map->ctag;
+			}
 		}
 	}
 
-- 
2.41.0

