Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 649667707E3
	for <lists+nouveau@lfdr.de>; Fri,  4 Aug 2023 20:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF9510E75C;
	Fri,  4 Aug 2023 18:25:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D9D10E75E
 for <nouveau@lists.freedesktop.org>; Fri,  4 Aug 2023 18:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691173508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W5Z69duQZZHczdNva7OYriVP022eEP31h8SDSDX32NU=;
 b=ILkUIerO7w4y8YHCRE3hmt7+RbHq66rfdcEN0BOgPX1Ysyeh6n9LZHLPUuHEvIlTNZtrkS
 nx5c1P+QKdZH7xKsbablfZRnwle0uCe2Jzdr01PhYHDV67Vv3LoqY/MFjFE7oiGggyhOuc
 CqsWcNDWZRy4yPGZekt3n3AmeFiSe/o=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-FqFBcWDSOcKpNJTARdFljw-1; Fri, 04 Aug 2023 14:25:06 -0400
X-MC-Unique: FqFBcWDSOcKpNJTARdFljw-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ba1949656bso13622661fa.0
 for <nouveau@lists.freedesktop.org>; Fri, 04 Aug 2023 11:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691173504; x=1691778304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W5Z69duQZZHczdNva7OYriVP022eEP31h8SDSDX32NU=;
 b=BqVmL/lVGeTkUWNP6YAbLOdrHSUzaxBVsYm9VPAuWmoKvDztwxqfgXZHHEZFRe92gt
 gEAFs3AWI2hzMvhHx9whlnEWwe2XpEURKO9cAwd3lDYZbkvexqk86zTGKsa1INlZtliF
 ErVIdS+sQl0KrYibXcTJcy5bTAmmvRzXl2B6qj/x8bJcEdQZuxEOOBFL3SpAx+jUKKOW
 AS0133yHyZsBNjnEv3oGrY3dYUPmwrB/ys+jaX/ekRgDkpq89terWybqg7q1jj5HiR6D
 pBqDMJUepIElhjXvnI67yGrFxj+WlU4S5k9d+20njwgkluV6o6saFZEXQzsrH8uhyuSI
 S1gw==
X-Gm-Message-State: AOJu0YxglvvknN2EQHkQOAFBx7p+1BsQ53UALP4GeCeZxfJUu1mui+T+
 kF2Js9DmVHBKF4bLK3cuz+f385ihSPaagx/zOezHh/VN3p+g9hJlhjyJLsaryf1wV/6ny5oP7Bj
 6WaoHTA5yHdsYWG8Peacq73prIA==
X-Received: by 2002:a19:9156:0:b0:4fb:79b5:5512 with SMTP id
 y22-20020a199156000000b004fb79b55512mr1680431lfj.66.1691173503034; 
 Fri, 04 Aug 2023 11:25:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHckZLBD9UZ29dhuXsnfDKNqyTYJQIVcjIovUpbNYPb0byfSyyouN4nTlMkLvo7BddTEh6O5w==
X-Received: by 2002:a19:9156:0:b0:4fb:79b5:5512 with SMTP id
 y22-20020a199156000000b004fb79b55512mr1680408lfj.66.1691173502238; 
 Fri, 04 Aug 2023 11:25:02 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a50ec9a000000b0051873c201a0sm1568445edr.26.2023.08.04.11.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 11:25:01 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Fri,  4 Aug 2023 20:23:51 +0200
Message-ID: <20230804182406.5222-12-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v10 11/12] drm/nouveau: implement
 new VM_BIND uAPI
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This commit provides the implementation for the new uapi motivated by the
Vulkan API. It allows user mode drivers (UMDs) to:

1) Initialize a GPU virtual address (VA) space via the new
   DRM_IOCTL_NOUVEAU_VM_INIT ioctl for UMDs to specify the portion of VA
   space managed by the kernel and userspace, respectively.

2) Allocate and free a VA space region as well as bind and unbind memory
   to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
   UMDs can request the named operations to be processed either
   synchronously or asynchronously. It supports DRM syncobjs
   (incl. timelines) as synchronization mechanism. The management of the
   GPU VA mappings is implemented with the DRM GPU VA manager.

3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl. The
   execution happens asynchronously. It supports DRM syncobj (incl.
   timelines) as synchronization mechanism. DRM GEM object locking is
   handled with drm_exec.

Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, use the DRM
GPU scheduler for the asynchronous paths.

Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/driver-uapi.rst       |    3 +
 drivers/gpu/drm/nouveau/Kbuild          |    3 +
 drivers/gpu/drm/nouveau/Kconfig         |    2 +
 drivers/gpu/drm/nouveau/nouveau_abi16.c |   24 +
 drivers/gpu/drm/nouveau/nouveau_abi16.h |    1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  159 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h    |    3 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |   27 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   58 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c  |  411 +++++
 drivers/gpu/drm/nouveau/nouveau_exec.h  |   54 +
 drivers/gpu/drm/nouveau/nouveau_gem.c   |   49 +-
 drivers/gpu/drm/nouveau/nouveau_gem.h   |    3 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h   |    5 +
 drivers/gpu/drm/nouveau/nouveau_prime.c |   13 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c |  419 +++++
 drivers/gpu/drm/nouveau/nouveau_sched.h |  127 ++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  | 1921 +++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.h  |  108 ++
 19 files changed, 3321 insertions(+), 69 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h

diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
index 9c7ca6e33a68..c08bcbb95fb3 100644
--- a/Documentation/gpu/driver-uapi.rst
+++ b/Documentation/gpu/driver-uapi.rst
@@ -13,4 +13,7 @@ drm/nouveau uAPI
 VM_BIND / EXEC uAPI
 -------------------
 
+.. kernel-doc:: drivers/gpu/drm/nouveau/nouveau_exec.c
+    :doc: Overview
+
 .. kernel-doc:: include/uapi/drm/nouveau_drm.h
diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
index 5e5617006da5..cf6b3a80c0c8 100644
--- a/drivers/gpu/drm/nouveau/Kbuild
+++ b/drivers/gpu/drm/nouveau/Kbuild
@@ -47,6 +47,9 @@ nouveau-y += nouveau_prime.o
 nouveau-y += nouveau_sgdma.o
 nouveau-y += nouveau_ttm.o
 nouveau-y += nouveau_vmm.o
+nouveau-y += nouveau_exec.o
+nouveau-y += nouveau_sched.o
+nouveau-y += nouveau_uvmm.o
 
 # DRM - modesetting
 nouveau-$(CONFIG_DRM_NOUVEAU_BACKLIGHT) += nouveau_backlight.o
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index a70bd65e1400..c52e8096cca4 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -10,6 +10,8 @@ config DRM_NOUVEAU
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
+	select DRM_EXEC
+	select DRM_SCHED
 	select I2C
 	select I2C_ALGOBIT
 	select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 82dab51d8aeb..30afbec9e3b1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -35,6 +35,7 @@
 #include "nouveau_chan.h"
 #include "nouveau_abi16.h"
 #include "nouveau_vmm.h"
+#include "nouveau_sched.h"
 
 static struct nouveau_abi16 *
 nouveau_abi16(struct drm_file *file_priv)
@@ -125,6 +126,17 @@ nouveau_abi16_chan_fini(struct nouveau_abi16 *abi16,
 {
 	struct nouveau_abi16_ntfy *ntfy, *temp;
 
+	/* When a client exits without waiting for it's queued up jobs to
+	 * finish it might happen that we fault the channel. This is due to
+	 * drm_file_free() calling drm_gem_release() before the postclose()
+	 * callback. Hence, we can't tear down this scheduler entity before
+	 * uvmm mappings are unmapped. Currently, we can't detect this case.
+	 *
+	 * However, this should be rare and harmless, since the channel isn't
+	 * needed anymore.
+	 */
+	nouveau_sched_entity_fini(&chan->sched_entity);
+
 	/* wait for all activity to stop before cleaning up */
 	if (chan->chan)
 		nouveau_channel_idle(chan->chan);
@@ -261,6 +273,13 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	if (!drm->channel)
 		return nouveau_abi16_put(abi16, -ENODEV);
 
+	/* If uvmm wasn't initialized until now disable it completely to prevent
+	 * userspace from mixing up UAPIs.
+	 *
+	 * The client lock is already acquired by nouveau_abi16_get().
+	 */
+	__nouveau_cli_disable_uvmm_noinit(cli);
+
 	device = &abi16->device;
 	engine = NV_DEVICE_HOST_RUNLIST_ENGINES_GR;
 
@@ -304,6 +323,11 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	if (ret)
 		goto done;
 
+	ret = nouveau_sched_entity_init(&chan->sched_entity, &drm->sched,
+					drm->sched_wq);
+	if (ret)
+		goto done;
+
 	init->channel = chan->chan->chid;
 
 	if (device->info.family >= NV_DEVICE_INFO_V0_TESLA)
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index d5d80d0d9011..9f538486c10e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -26,6 +26,7 @@ struct nouveau_abi16_chan {
 	struct nouveau_bo *ntfy;
 	struct nouveau_vma *ntfy_vma;
 	struct nvkm_mm  heap;
+	struct nouveau_sched_entity sched_entity;
 };
 
 struct nouveau_abi16 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index e38e448d9632..19cab37ac69c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -199,7 +199,7 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, int *align, u64 *size)
 
 struct nouveau_bo *
 nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
-		 u32 tile_mode, u32 tile_flags)
+		 u32 tile_mode, u32 tile_flags, bool internal)
 {
 	struct nouveau_drm *drm = cli->drm;
 	struct nouveau_bo *nvbo;
@@ -233,68 +233,103 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 			nvbo->force_coherent = true;
 	}
 
-	if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI) {
-		nvbo->kind = (tile_flags & 0x0000ff00) >> 8;
-		if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
-			kfree(nvbo);
-			return ERR_PTR(-EINVAL);
+	nvbo->contig = !(tile_flags & NOUVEAU_GEM_TILE_NONCONTIG);
+	if (!nouveau_cli_uvmm(cli) || internal) {
+		/* for BO noVM allocs, don't assign kinds */
+		if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI) {
+			nvbo->kind = (tile_flags & 0x0000ff00) >> 8;
+			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
+				kfree(nvbo);
+				return ERR_PTR(-EINVAL);
+			}
+
+			nvbo->comp = mmu->kind[nvbo->kind] != nvbo->kind;
+		} else if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
+			nvbo->kind = (tile_flags & 0x00007f00) >> 8;
+			nvbo->comp = (tile_flags & 0x00030000) >> 16;
+			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
+				kfree(nvbo);
+				return ERR_PTR(-EINVAL);
+			}
+		} else {
+			nvbo->zeta = (tile_flags & 0x00000007);
 		}
+		nvbo->mode = tile_mode;
+
+		/* Determine the desirable target GPU page size for the buffer. */
+		for (i = 0; i < vmm->page_nr; i++) {
+			/* Because we cannot currently allow VMM maps to fail
+			 * during buffer migration, we need to determine page
+			 * size for the buffer up-front, and pre-allocate its
+			 * page tables.
+			 *
+			 * Skip page sizes that can't support needed domains.
+			 */
+			if (cli->device.info.family > NV_DEVICE_INFO_V0_CURIE &&
+			    (domain & NOUVEAU_GEM_DOMAIN_VRAM) && !vmm->page[i].vram)
+				continue;
+			if ((domain & NOUVEAU_GEM_DOMAIN_GART) &&
+			    (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
+				continue;
 
-		nvbo->comp = mmu->kind[nvbo->kind] != nvbo->kind;
-	} else
-	if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
-		nvbo->kind = (tile_flags & 0x00007f00) >> 8;
-		nvbo->comp = (tile_flags & 0x00030000) >> 16;
-		if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
+			/* Select this page size if it's the first that supports
+			 * the potential memory domains, or when it's compatible
+			 * with the requested compression settings.
+			 */
+			if (pi < 0 || !nvbo->comp || vmm->page[i].comp)
+				pi = i;
+
+			/* Stop once the buffer is larger than the current page size. */
+			if (*size >= 1ULL << vmm->page[i].shift)
+				break;
+		}
+
+		if (WARN_ON(pi < 0)) {
 			kfree(nvbo);
 			return ERR_PTR(-EINVAL);
 		}
-	} else {
-		nvbo->zeta = (tile_flags & 0x00000007);
-	}
-	nvbo->mode = tile_mode;
-	nvbo->contig = !(tile_flags & NOUVEAU_GEM_TILE_NONCONTIG);
-
-	/* Determine the desirable target GPU page size for the buffer. */
-	for (i = 0; i < vmm->page_nr; i++) {
-		/* Because we cannot currently allow VMM maps to fail
-		 * during buffer migration, we need to determine page
-		 * size for the buffer up-front, and pre-allocate its
-		 * page tables.
-		 *
-		 * Skip page sizes that can't support needed domains.
-		 */
-		if (cli->device.info.family > NV_DEVICE_INFO_V0_CURIE &&
-		    (domain & NOUVEAU_GEM_DOMAIN_VRAM) && !vmm->page[i].vram)
-			continue;
-		if ((domain & NOUVEAU_GEM_DOMAIN_GART) &&
-		    (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
-			continue;
-
-		/* Select this page size if it's the first that supports
-		 * the potential memory domains, or when it's compatible
-		 * with the requested compression settings.
-		 */
-		if (pi < 0 || !nvbo->comp || vmm->page[i].comp)
-			pi = i;
 
-		/* Stop once the buffer is larger than the current page size. */
-		if (*size >= 1ULL << vmm->page[i].shift)
-			break;
-	}
+		/* Disable compression if suitable settings couldn't be found. */
+		if (nvbo->comp && !vmm->page[pi].comp) {
+			if (mmu->object.oclass >= NVIF_CLASS_MMU_GF100)
+				nvbo->kind = mmu->kind[nvbo->kind];
+			nvbo->comp = 0;
+		}
+		nvbo->page = vmm->page[pi].shift;
+	} else {
+		/* reject other tile flags when in VM mode. */
+		if (tile_mode)
+			return ERR_PTR(-EINVAL);
+		if (tile_flags & ~NOUVEAU_GEM_TILE_NONCONTIG)
+			return ERR_PTR(-EINVAL);
 
-	if (WARN_ON(pi < 0)) {
-		kfree(nvbo);
-		return ERR_PTR(-EINVAL);
-	}
+		/* Determine the desirable target GPU page size for the buffer. */
+		for (i = 0; i < vmm->page_nr; i++) {
+			/* Because we cannot currently allow VMM maps to fail
+			 * during buffer migration, we need to determine page
+			 * size for the buffer up-front, and pre-allocate its
+			 * page tables.
+			 *
+			 * Skip page sizes that can't support needed domains.
+			 */
+			if ((domain & NOUVEAU_GEM_DOMAIN_VRAM) && !vmm->page[i].vram)
+				continue;
+			if ((domain & NOUVEAU_GEM_DOMAIN_GART) &&
+			    (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
+				continue;
 
-	/* Disable compression if suitable settings couldn't be found. */
-	if (nvbo->comp && !vmm->page[pi].comp) {
-		if (mmu->object.oclass >= NVIF_CLASS_MMU_GF100)
-			nvbo->kind = mmu->kind[nvbo->kind];
-		nvbo->comp = 0;
+			if (pi < 0)
+				pi = i;
+			/* Stop once the buffer is larger than the current page size. */
+			if (*size >= 1ULL << vmm->page[i].shift)
+				break;
+		}
+		if (WARN_ON(pi < 0)) {
+			kfree(nvbo);
+			return ERR_PTR(-EINVAL);
+		}
+		nvbo->page = vmm->page[pi].shift;
 	}
-	nvbo->page = vmm->page[pi].shift;
 
 	nouveau_bo_fixup_align(nvbo, align, size);
 
@@ -307,18 +342,26 @@ nouveau_bo_init(struct nouveau_bo *nvbo, u64 size, int align, u32 domain,
 {
 	int type = sg ? ttm_bo_type_sg : ttm_bo_type_device;
 	int ret;
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.no_wait_gpu = false,
+		.resv = robj,
+	};
 
 	nouveau_bo_placement_set(nvbo, domain, 0);
 	INIT_LIST_HEAD(&nvbo->io_reserve_lru);
 
-	ret = ttm_bo_init_validate(nvbo->bo.bdev, &nvbo->bo, type,
-				   &nvbo->placement, align >> PAGE_SHIFT, false,
+	ret = ttm_bo_init_reserved(nvbo->bo.bdev, &nvbo->bo, type,
+				   &nvbo->placement, align >> PAGE_SHIFT, &ctx,
 				   sg, robj, nouveau_bo_del_ttm);
 	if (ret) {
 		/* ttm will call nouveau_bo_del_ttm if it fails.. */
 		return ret;
 	}
 
+	if (!robj)
+		ttm_bo_unreserve(&nvbo->bo);
+
 	return 0;
 }
 
@@ -332,7 +375,7 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
 	int ret;
 
 	nvbo = nouveau_bo_alloc(cli, &size, &align, domain, tile_mode,
-				tile_flags);
+				tile_flags, true);
 	if (IS_ERR(nvbo))
 		return PTR_ERR(nvbo);
 
@@ -951,6 +994,7 @@ static void nouveau_bo_move_ntfy(struct ttm_buffer_object *bo,
 		list_for_each_entry(vma, &nvbo->vma_list, head) {
 			nouveau_vma_map(vma, mem);
 		}
+		nouveau_uvmm_bo_map_all(nvbo, mem);
 	} else {
 		list_for_each_entry(vma, &nvbo->vma_list, head) {
 			ret = dma_resv_wait_timeout(bo->base.resv,
@@ -959,6 +1003,7 @@ static void nouveau_bo_move_ntfy(struct ttm_buffer_object *bo,
 			WARN_ON(ret <= 0);
 			nouveau_vma_unmap(vma);
 		}
+		nouveau_uvmm_bo_unmap_all(nvbo);
 	}
 
 	if (new_reg)
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 774dd93ca76b..07f671cf895e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -26,6 +26,7 @@ struct nouveau_bo {
 	struct list_head entry;
 	int pbbo_index;
 	bool validate_mapped;
+	bool no_share;
 
 	/* GPU address space is independent of CPU word size */
 	uint64_t offset;
@@ -73,7 +74,7 @@ extern struct ttm_device_funcs nouveau_bo_driver;
 
 void nouveau_bo_move_init(struct nouveau_drm *);
 struct nouveau_bo *nouveau_bo_alloc(struct nouveau_cli *, u64 *size, int *align,
-				    u32 domain, u32 tile_mode, u32 tile_flags);
+				    u32 domain, u32 tile_mode, u32 tile_flags, bool internal);
 int  nouveau_bo_init(struct nouveau_bo *, u64 size, int align, u32 domain,
 		     struct sg_table *sg, struct dma_resv *robj);
 int  nouveau_bo_new(struct nouveau_cli *, u64 size, int align, u32 domain,
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 8325fcf35c5e..4396f501b16a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -68,6 +68,9 @@
 #include "nouveau_platform.h"
 #include "nouveau_svm.h"
 #include "nouveau_dmem.h"
+#include "nouveau_exec.h"
+#include "nouveau_uvmm.h"
+#include "nouveau_sched.h"
 
 DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
@@ -196,6 +199,8 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	WARN_ON(!list_empty(&cli->worker));
 
 	usif_client_fini(cli);
+	nouveau_uvmm_fini(&cli->uvmm);
+	nouveau_sched_entity_fini(&cli->sched_entity);
 	nouveau_vmm_fini(&cli->svm);
 	nouveau_vmm_fini(&cli->vmm);
 	nvif_mmu_dtor(&cli->mmu);
@@ -301,6 +306,12 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	}
 
 	cli->mem = &mems[ret];
+
+	ret = nouveau_sched_entity_init(&cli->sched_entity, &drm->sched,
+					drm->sched_wq);
+	if (ret)
+		goto done;
+
 	return 0;
 done:
 	if (ret)
@@ -568,10 +579,14 @@ nouveau_drm_device_init(struct drm_device *dev)
 	nvif_parent_ctor(&nouveau_parent, &drm->parent);
 	drm->master.base.object.parent = &drm->parent;
 
-	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
+	ret = nouveau_sched_init(drm);
 	if (ret)
 		goto fail_alloc;
 
+	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
+	if (ret)
+		goto fail_sched;
+
 	ret = nouveau_cli_init(drm, "DRM", &drm->client);
 	if (ret)
 		goto fail_master;
@@ -628,7 +643,6 @@ nouveau_drm_device_init(struct drm_device *dev)
 	}
 
 	return 0;
-
 fail_dispinit:
 	nouveau_display_destroy(dev);
 fail_dispctor:
@@ -641,6 +655,8 @@ nouveau_drm_device_init(struct drm_device *dev)
 	nouveau_cli_fini(&drm->client);
 fail_master:
 	nouveau_cli_fini(&drm->master);
+fail_sched:
+	nouveau_sched_fini(drm);
 fail_alloc:
 	nvif_parent_dtor(&drm->parent);
 	kfree(drm);
@@ -692,6 +708,8 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	}
 	mutex_unlock(&drm->clients_lock);
 
+	nouveau_sched_fini(drm);
+
 	nouveau_cli_fini(&drm->client);
 	nouveau_cli_fini(&drm->master);
 	nvif_parent_dtor(&drm->parent);
@@ -1193,6 +1211,9 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_PREP, nouveau_gem_ioctl_cpu_prep, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_FINI, nouveau_gem_ioctl_cpu_fini, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_VM_INIT, nouveau_uvmm_ioctl_vm_init, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_VM_BIND, nouveau_uvmm_ioctl_vm_bind, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_EXEC, nouveau_exec_ioctl_exec, DRM_RENDER_ALLOW),
 };
 
 long
@@ -1240,6 +1261,8 @@ nouveau_driver_fops = {
 static struct drm_driver
 driver_stub = {
 	.driver_features = DRIVER_GEM |
+			   DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE |
+			   DRIVER_GEM_GPUVA |
 			   DRIVER_MODESET |
 			   DRIVER_RENDER,
 	.open = nouveau_drm_open,
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index d28236021971..1fe17ff95f5e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -10,8 +10,8 @@
 #define DRIVER_DATE		"20120801"
 
 #define DRIVER_MAJOR		1
-#define DRIVER_MINOR		3
-#define DRIVER_PATCHLEVEL	1
+#define DRIVER_MINOR		4
+#define DRIVER_PATCHLEVEL	0
 
 /*
  * 1.1.1:
@@ -63,7 +63,9 @@ struct platform_device;
 
 #include "nouveau_fence.h"
 #include "nouveau_bios.h"
+#include "nouveau_sched.h"
 #include "nouveau_vmm.h"
+#include "nouveau_uvmm.h"
 
 struct nouveau_drm_tile {
 	struct nouveau_fence *fence;
@@ -91,6 +93,10 @@ struct nouveau_cli {
 	struct nvif_mmu mmu;
 	struct nouveau_vmm vmm;
 	struct nouveau_vmm svm;
+	struct nouveau_uvmm uvmm;
+
+	struct nouveau_sched_entity sched_entity;
+
 	const struct nvif_mclass *mem;
 
 	struct list_head head;
@@ -112,15 +118,59 @@ struct nouveau_cli_work {
 	struct dma_fence_cb cb;
 };
 
+static inline struct nouveau_uvmm *
+nouveau_cli_uvmm(struct nouveau_cli *cli)
+{
+	if (!cli || !cli->uvmm.vmm.cli)
+		return NULL;
+
+	return &cli->uvmm;
+}
+
+static inline struct nouveau_uvmm *
+nouveau_cli_uvmm_locked(struct nouveau_cli *cli)
+{
+	struct nouveau_uvmm *uvmm;
+
+	mutex_lock(&cli->mutex);
+	uvmm = nouveau_cli_uvmm(cli);
+	mutex_unlock(&cli->mutex);
+
+	return uvmm;
+}
+
 static inline struct nouveau_vmm *
 nouveau_cli_vmm(struct nouveau_cli *cli)
 {
+	struct nouveau_uvmm *uvmm;
+
+	uvmm = nouveau_cli_uvmm(cli);
+	if (uvmm)
+		return &uvmm->vmm;
+
 	if (cli->svm.cli)
 		return &cli->svm;
 
 	return &cli->vmm;
 }
 
+static inline void
+__nouveau_cli_disable_uvmm_noinit(struct nouveau_cli *cli)
+{
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
+
+	if (!uvmm)
+		cli->uvmm.disabled = true;
+}
+
+static inline void
+nouveau_cli_disable_uvmm_noinit(struct nouveau_cli *cli)
+{
+	mutex_lock(&cli->mutex);
+	__nouveau_cli_disable_uvmm_noinit(cli);
+	mutex_unlock(&cli->mutex);
+}
+
 void nouveau_cli_work_queue(struct nouveau_cli *, struct dma_fence *,
 			    struct nouveau_cli_work *);
 
@@ -257,6 +307,10 @@ struct nouveau_drm {
 		struct mutex lock;
 		bool component_registered;
 	} audio;
+
+	struct drm_gpu_scheduler sched;
+	struct workqueue_struct *sched_wq;
+
 };
 
 static inline struct nouveau_drm *
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
new file mode 100644
index 000000000000..42d9dd43ea02
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -0,0 +1,411 @@
+// SPDX-License-Identifier: MIT
+
+#include <drm/drm_exec.h>
+
+#include "nouveau_drv.h"
+#include "nouveau_gem.h"
+#include "nouveau_mem.h"
+#include "nouveau_dma.h"
+#include "nouveau_exec.h"
+#include "nouveau_abi16.h"
+#include "nouveau_chan.h"
+#include "nouveau_sched.h"
+#include "nouveau_uvmm.h"
+
+/**
+ * DOC: Overview
+ *
+ * Nouveau's VM_BIND / EXEC UAPI consists of three ioctls: DRM_NOUVEAU_VM_INIT,
+ * DRM_NOUVEAU_VM_BIND and DRM_NOUVEAU_EXEC.
+ *
+ * In order to use the UAPI firstly a user client must initialize the VA space
+ * using the DRM_NOUVEAU_VM_INIT ioctl specifying which region of the VA space
+ * should be managed by the kernel and which by the UMD.
+ *
+ * The DRM_NOUVEAU_VM_BIND ioctl provides clients an interface to manage the
+ * userspace-managable portion of the VA space. It provides operations to map
+ * and unmap memory. Mappings may be flagged as sparse. Sparse mappings are not
+ * backed by a GEM object and the kernel will ignore GEM handles provided
+ * alongside a sparse mapping.
+ *
+ * Userspace may request memory backed mappings either within or outside of the
+ * bounds (but not crossing those bounds) of a previously mapped sparse
+ * mapping. Subsequently requested memory backed mappings within a sparse
+ * mapping will take precedence over the corresponding range of the sparse
+ * mapping. If such memory backed mappings are unmapped the kernel will make
+ * sure that the corresponding sparse mapping will take their place again.
+ * Requests to unmap a sparse mapping that still contains memory backed mappings
+ * will result in those memory backed mappings being unmapped first.
+ *
+ * Unmap requests are not bound to the range of existing mappings and can even
+ * overlap the bounds of sparse mappings. For such a request the kernel will
+ * make sure to unmap all memory backed mappings within the given range,
+ * splitting up memory backed mappings which are only partially contained
+ * within the given range. Unmap requests with the sparse flag set must match
+ * the range of a previously mapped sparse mapping exactly though.
+ *
+ * While the kernel generally permits arbitrary sequences and ranges of memory
+ * backed mappings being mapped and unmapped, either within a single or multiple
+ * VM_BIND ioctl calls, there are some restrictions for sparse mappings.
+ *
+ * The kernel does not permit to:
+ *   - unmap non-existent sparse mappings
+ *   - unmap a sparse mapping and map a new sparse mapping overlapping the range
+ *     of the previously unmapped sparse mapping within the same VM_BIND ioctl
+ *   - unmap a sparse mapping and map new memory backed mappings overlapping the
+ *     range of the previously unmapped sparse mapping within the same VM_BIND
+ *     ioctl
+ *
+ * When using the VM_BIND ioctl to request the kernel to map memory to a given
+ * virtual address in the GPU's VA space there is no guarantee that the actual
+ * mappings are created in the GPU's MMU. If the given memory is swapped out
+ * at the time the bind operation is executed the kernel will stash the mapping
+ * details into it's internal alloctor and create the actual MMU mappings once
+ * the memory is swapped back in. While this is transparent for userspace, it is
+ * guaranteed that all the backing memory is swapped back in and all the memory
+ * mappings, as requested by userspace previously, are actually mapped once the
+ * DRM_NOUVEAU_EXEC ioctl is called to submit an exec job.
+ *
+ * A VM_BIND job can be executed either synchronously or asynchronously. If
+ * exectued asynchronously, userspace may provide a list of syncobjs this job
+ * will wait for and/or a list of syncobj the kernel will signal once the
+ * VM_BIND job finished execution. If executed synchronously the ioctl will
+ * block until the bind job is finished. For synchronous jobs the kernel will
+ * not permit any syncobjs submitted to the kernel.
+ *
+ * To execute a push buffer the UAPI provides the DRM_NOUVEAU_EXEC ioctl. EXEC
+ * jobs are always executed asynchronously, and, equal to VM_BIND jobs, provide
+ * the option to synchronize them with syncobjs.
+ *
+ * Besides that, EXEC jobs can be scheduled for a specified channel to execute on.
+ *
+ * Since VM_BIND jobs update the GPU's VA space on job submit, EXEC jobs do have
+ * an up to date view of the VA space. However, the actual mappings might still
+ * be pending. Hence, EXEC jobs require to have the particular fences - of
+ * the corresponding VM_BIND jobs they depent on - attached to them.
+ */
+
+static int
+nouveau_exec_job_submit(struct nouveau_job *job)
+{
+	struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
+	struct nouveau_cli *cli = job->cli;
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
+	struct drm_exec *exec = &job->exec;
+	struct drm_gem_object *obj;
+	unsigned long index;
+	int ret;
+
+	ret = nouveau_fence_new(&exec_job->fence);
+	if (ret)
+		return ret;
+
+	nouveau_uvmm_lock(uvmm);
+	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
+			    DRM_EXEC_IGNORE_DUPLICATES);
+	drm_exec_until_all_locked(exec) {
+		struct drm_gpuva *va;
+
+		drm_gpuva_for_each_va(va, &uvmm->umgr) {
+			if (unlikely(va == &uvmm->umgr.kernel_alloc_node))
+				continue;
+
+			ret = drm_exec_prepare_obj(exec, va->gem.obj, 1);
+			drm_exec_retry_on_contention(exec);
+			if (ret)
+				goto err_uvmm_unlock;
+		}
+	}
+	nouveau_uvmm_unlock(uvmm);
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		struct nouveau_bo *nvbo = nouveau_gem_object(obj);
+
+		ret = nouveau_bo_validate(nvbo, true, false);
+		if (ret)
+			goto err_exec_fini;
+	}
+
+	return 0;
+
+err_uvmm_unlock:
+	nouveau_uvmm_unlock(uvmm);
+err_exec_fini:
+	drm_exec_fini(exec);
+	return ret;
+
+}
+
+static void
+nouveau_exec_job_armed_submit(struct nouveau_job *job)
+{
+	struct drm_exec *exec = &job->exec;
+	struct drm_gem_object *obj;
+	unsigned long index;
+
+	drm_exec_for_each_locked_object(exec, index, obj)
+		dma_resv_add_fence(obj->resv, job->done_fence, job->resv_usage);
+
+	drm_exec_fini(exec);
+}
+
+static struct dma_fence *
+nouveau_exec_job_run(struct nouveau_job *job)
+{
+	struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
+	struct nouveau_channel *chan = exec_job->chan;
+	struct nouveau_fence *fence = exec_job->fence;
+	int i, ret;
+
+	ret = nouveau_dma_wait(chan, exec_job->push.count + 1, 16);
+	if (ret) {
+		NV_PRINTK(err, job->cli, "nv50cal_space: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	for (i = 0; i < exec_job->push.count; i++) {
+		nv50_dma_push(chan, exec_job->push.s[i].va,
+			      exec_job->push.s[i].va_len);
+	}
+
+	ret = nouveau_fence_emit(fence, chan);
+	if (ret) {
+		NV_PRINTK(err, job->cli, "error fencing pushbuf: %d\n", ret);
+		WIND_RING(chan);
+		return ERR_PTR(ret);
+	}
+
+	exec_job->fence = NULL;
+
+	return &fence->base;
+}
+
+static void
+nouveau_exec_job_free(struct nouveau_job *job)
+{
+	struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
+
+	nouveau_job_free(job);
+
+	nouveau_fence_unref(&exec_job->fence);
+	kfree(exec_job->push.s);
+	kfree(exec_job);
+}
+
+static enum drm_gpu_sched_stat
+nouveau_exec_job_timeout(struct nouveau_job *job)
+{
+	struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
+	struct nouveau_channel *chan = exec_job->chan;
+
+	if (unlikely(!atomic_read(&chan->killed)))
+		nouveau_channel_kill(chan);
+
+	NV_PRINTK(warn, job->cli, "job timeout, channel %d killed!\n",
+		  chan->chid);
+
+	nouveau_sched_entity_fini(job->entity);
+
+	return DRM_GPU_SCHED_STAT_ENODEV;
+}
+
+static struct nouveau_job_ops nouveau_exec_job_ops = {
+	.submit = nouveau_exec_job_submit,
+	.armed_submit = nouveau_exec_job_armed_submit,
+	.run = nouveau_exec_job_run,
+	.free = nouveau_exec_job_free,
+	.timeout = nouveau_exec_job_timeout,
+};
+
+int
+nouveau_exec_job_init(struct nouveau_exec_job **pjob,
+		      struct nouveau_exec_job_args *__args)
+{
+	struct nouveau_exec_job *job;
+	struct nouveau_job_args args = {};
+	int ret;
+
+	job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return -ENOMEM;
+
+	job->push.count = __args->push.count;
+	if (__args->push.count) {
+		job->push.s = kmemdup(__args->push.s,
+				      sizeof(*__args->push.s) *
+				      __args->push.count,
+				      GFP_KERNEL);
+		if (!job->push.s) {
+			ret = -ENOMEM;
+			goto err_free_job;
+		}
+	}
+
+	job->chan = __args->chan;
+
+	args.sched_entity = __args->sched_entity;
+	args.file_priv = __args->file_priv;
+
+	args.in_sync.count = __args->in_sync.count;
+	args.in_sync.s = __args->in_sync.s;
+
+	args.out_sync.count = __args->out_sync.count;
+	args.out_sync.s = __args->out_sync.s;
+
+	args.ops = &nouveau_exec_job_ops;
+	args.resv_usage = DMA_RESV_USAGE_WRITE;
+
+	ret = nouveau_job_init(&job->base, &args);
+	if (ret)
+		goto err_free_pushs;
+
+	return 0;
+
+err_free_pushs:
+	kfree(job->push.s);
+err_free_job:
+	kfree(job);
+	*pjob = NULL;
+
+	return ret;
+}
+
+static int
+nouveau_exec(struct nouveau_exec_job_args *args)
+{
+	struct nouveau_exec_job *job;
+	int ret;
+
+	ret = nouveau_exec_job_init(&job, args);
+	if (ret)
+		return ret;
+
+	ret = nouveau_job_submit(&job->base);
+	if (ret)
+		goto err_job_fini;
+
+	return 0;
+
+err_job_fini:
+	nouveau_job_fini(&job->base);
+	return ret;
+}
+
+static int
+nouveau_exec_ucopy(struct nouveau_exec_job_args *args,
+		   struct drm_nouveau_exec __user *req)
+{
+	struct drm_nouveau_sync **s;
+	u32 inc = req->wait_count;
+	u64 ins = req->wait_ptr;
+	u32 outc = req->sig_count;
+	u64 outs = req->sig_ptr;
+	u32 pushc = req->push_count;
+	u64 pushs = req->push_ptr;
+	int ret;
+
+	if (pushc) {
+		args->push.count = pushc;
+		args->push.s = u_memcpya(pushs, pushc, sizeof(*args->push.s));
+		if (IS_ERR(args->push.s))
+			return PTR_ERR(args->push.s);
+	}
+
+	if (inc) {
+		s = &args->in_sync.s;
+
+		args->in_sync.count = inc;
+		*s = u_memcpya(ins, inc, sizeof(**s));
+		if (IS_ERR(*s)) {
+			ret = PTR_ERR(*s);
+			goto err_free_pushs;
+		}
+	}
+
+	if (outc) {
+		s = &args->out_sync.s;
+
+		args->out_sync.count = outc;
+		*s = u_memcpya(outs, outc, sizeof(**s));
+		if (IS_ERR(*s)) {
+			ret = PTR_ERR(*s);
+			goto err_free_ins;
+		}
+	}
+
+	return 0;
+
+err_free_pushs:
+	u_free(args->push.s);
+err_free_ins:
+	u_free(args->in_sync.s);
+	return ret;
+}
+
+static void
+nouveau_exec_ufree(struct nouveau_exec_job_args *args)
+{
+	u_free(args->push.s);
+	u_free(args->in_sync.s);
+	u_free(args->out_sync.s);
+}
+
+int
+nouveau_exec_ioctl_exec(struct drm_device *dev,
+			void __user *data,
+			struct drm_file *file_priv)
+{
+	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
+	struct nouveau_cli *cli = nouveau_cli(file_priv);
+	struct nouveau_abi16_chan *chan16;
+	struct nouveau_channel *chan = NULL;
+	struct nouveau_exec_job_args args = {};
+	struct drm_nouveau_exec __user *req = data;
+	int ret = 0;
+
+	if (unlikely(!abi16))
+		return -ENOMEM;
+
+	/* abi16 locks already */
+	if (unlikely(!nouveau_cli_uvmm(cli)))
+		return nouveau_abi16_put(abi16, -ENOSYS);
+
+	list_for_each_entry(chan16, &abi16->channels, head) {
+		if (chan16->chan->chid == req->channel) {
+			chan = chan16->chan;
+			break;
+		}
+	}
+
+	if (!chan)
+		return nouveau_abi16_put(abi16, -ENOENT);
+
+	if (unlikely(atomic_read(&chan->killed)))
+		return nouveau_abi16_put(abi16, -ENODEV);
+
+	if (!chan->dma.ib_max)
+		return nouveau_abi16_put(abi16, -ENOSYS);
+
+	if (unlikely(req->push_count > NOUVEAU_GEM_MAX_PUSH)) {
+		NV_PRINTK(err, cli, "pushbuf push count exceeds limit: %d max %d\n",
+			 req->push_count, NOUVEAU_GEM_MAX_PUSH);
+		return nouveau_abi16_put(abi16, -EINVAL);
+	}
+
+	ret = nouveau_exec_ucopy(&args, req);
+	if (ret)
+		goto out;
+
+	args.sched_entity = &chan16->sched_entity;
+	args.file_priv = file_priv;
+	args.chan = chan;
+
+	ret = nouveau_exec(&args);
+	if (ret)
+		goto out_free_args;
+
+out_free_args:
+	nouveau_exec_ufree(&args);
+out:
+	return nouveau_abi16_put(abi16, ret);
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.h b/drivers/gpu/drm/nouveau/nouveau_exec.h
new file mode 100644
index 000000000000..3032db27b8d7
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __NOUVEAU_EXEC_H__
+#define __NOUVEAU_EXEC_H__
+
+#include <drm/drm_exec.h>
+
+#include "nouveau_drv.h"
+#include "nouveau_sched.h"
+
+struct nouveau_exec_job_args {
+	struct drm_file *file_priv;
+	struct nouveau_sched_entity *sched_entity;
+
+	struct drm_exec exec;
+	struct nouveau_channel *chan;
+
+	struct {
+		struct drm_nouveau_sync *s;
+		u32 count;
+	} in_sync;
+
+	struct {
+		struct drm_nouveau_sync *s;
+		u32 count;
+	} out_sync;
+
+	struct {
+		struct drm_nouveau_exec_push *s;
+		u32 count;
+	} push;
+};
+
+struct nouveau_exec_job {
+	struct nouveau_job base;
+	struct nouveau_fence *fence;
+	struct nouveau_channel *chan;
+
+	struct {
+		struct drm_nouveau_exec_push *s;
+		u32 count;
+	} push;
+};
+
+#define to_nouveau_exec_job(job)		\
+		container_of((job), struct nouveau_exec_job, base)
+
+int nouveau_exec_job_init(struct nouveau_exec_job **job,
+			  struct nouveau_exec_job_args *args);
+
+int nouveau_exec_ioctl_exec(struct drm_device *dev, void __user *data,
+			    struct drm_file *file_priv);
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 9c8d1b911a01..f39360870c70 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -103,6 +103,7 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	struct device *dev = drm->dev->dev;
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
 	struct nouveau_vmm *vmm = nouveau_cli_vmm(cli);
 	struct nouveau_vma *vma;
 	int ret;
@@ -110,6 +111,9 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 	if (vmm->vmm.object.oclass < NVIF_CLASS_VMM_NV50)
 		return 0;
 
+	if (nvbo->no_share && uvmm && &uvmm->resv != nvbo->bo.base.resv)
+		return -EPERM;
+
 	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
 	if (ret)
 		return ret;
@@ -120,7 +124,11 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 		goto out;
 	}
 
-	ret = nouveau_vma_new(nvbo, vmm, &vma);
+	/* only create a VMA on binding */
+	if (!nouveau_cli_uvmm(cli))
+		ret = nouveau_vma_new(nvbo, vmm, &vma);
+	else
+		ret = 0;
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 out:
@@ -187,6 +195,9 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	if (vmm->vmm.object.oclass < NVIF_CLASS_VMM_NV50)
 		return;
 
+	if (nouveau_cli_uvmm(cli))
+		return;
+
 	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
 	if (ret)
 		return;
@@ -209,6 +220,7 @@ const struct drm_gem_object_funcs nouveau_gem_object_funcs = {
 	.free = nouveau_gem_object_del,
 	.open = nouveau_gem_object_open,
 	.close = nouveau_gem_object_close,
+	.export = nouveau_gem_prime_export,
 	.pin = nouveau_gem_prime_pin,
 	.unpin = nouveau_gem_prime_unpin,
 	.get_sg_table = nouveau_gem_prime_get_sg_table,
@@ -224,18 +236,28 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 		struct nouveau_bo **pnvbo)
 {
 	struct nouveau_drm *drm = cli->drm;
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
+	struct dma_resv *resv = NULL;
 	struct nouveau_bo *nvbo;
 	int ret;
 
+	if (domain & NOUVEAU_GEM_DOMAIN_NO_SHARE) {
+		if (unlikely(!uvmm))
+			return -EINVAL;
+
+		resv = &uvmm->resv;
+	}
+
 	if (!(domain & (NOUVEAU_GEM_DOMAIN_VRAM | NOUVEAU_GEM_DOMAIN_GART)))
 		domain |= NOUVEAU_GEM_DOMAIN_CPU;
 
 	nvbo = nouveau_bo_alloc(cli, &size, &align, domain, tile_mode,
-				tile_flags);
+				tile_flags, false);
 	if (IS_ERR(nvbo))
 		return PTR_ERR(nvbo);
 
 	nvbo->bo.base.funcs = &nouveau_gem_object_funcs;
+	nvbo->no_share = domain & NOUVEAU_GEM_DOMAIN_NO_SHARE;
 
 	/* Initialize the embedded gem-object. We return a single gem-reference
 	 * to the caller, instead of a normal nouveau_bo ttm reference. */
@@ -246,7 +268,14 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 		return ret;
 	}
 
-	ret = nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
+	if (resv)
+		dma_resv_lock(resv, NULL);
+
+	ret = nouveau_bo_init(nvbo, size, align, domain, NULL, resv);
+
+	if (resv)
+		dma_resv_unlock(resv);
+
 	if (ret)
 		return ret;
 
@@ -279,13 +308,15 @@ nouveau_gem_info(struct drm_file *file_priv, struct drm_gem_object *gem,
 	else
 		rep->domain = NOUVEAU_GEM_DOMAIN_VRAM;
 	rep->offset = nvbo->offset;
-	if (vmm->vmm.object.oclass >= NVIF_CLASS_VMM_NV50) {
+	if (vmm->vmm.object.oclass >= NVIF_CLASS_VMM_NV50 &&
+	    !nouveau_cli_uvmm(cli)) {
 		vma = nouveau_vma_find(nvbo, vmm);
 		if (!vma)
 			return -EINVAL;
 
 		rep->offset = vma->addr;
-	}
+	} else
+		rep->offset = 0;
 
 	rep->size = nvbo->bo.base.size;
 	rep->map_handle = drm_vma_node_offset_addr(&nvbo->bo.base.vma_node);
@@ -310,6 +341,11 @@ nouveau_gem_ioctl_new(struct drm_device *dev, void *data,
 	struct nouveau_bo *nvbo = NULL;
 	int ret = 0;
 
+	/* If uvmm wasn't initialized until now disable it completely to prevent
+	 * userspace from mixing up UAPIs.
+	 */
+	nouveau_cli_disable_uvmm_noinit(cli);
+
 	ret = nouveau_gem_new(cli, req->info.size, req->align,
 			      req->info.domain, req->info.tile_mode,
 			      req->info.tile_flags, &nvbo);
@@ -721,6 +757,9 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 	if (unlikely(!abi16))
 		return -ENOMEM;
 
+	if (unlikely(nouveau_cli_uvmm(cli)))
+		return -ENOSYS;
+
 	list_for_each_entry(temp, &abi16->channels, head) {
 		if (temp->chan->chid == req->channel) {
 			chan = temp->chan;
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.h b/drivers/gpu/drm/nouveau/nouveau_gem.h
index 3b919c7c931c..10814d446435 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.h
@@ -37,5 +37,6 @@ extern void nouveau_gem_prime_unpin(struct drm_gem_object *);
 extern struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *);
 extern struct drm_gem_object *nouveau_gem_prime_import_sg_table(
 	struct drm_device *, struct dma_buf_attachment *, struct sg_table *);
-
+struct dma_buf *nouveau_gem_prime_export(struct drm_gem_object *gobj,
+					 int flags);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
index 76c86d8bb01e..5365a3d3a17f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
@@ -35,4 +35,9 @@ int nouveau_mem_vram(struct ttm_resource *, bool contig, u8 page);
 int nouveau_mem_host(struct ttm_resource *, struct ttm_tt *);
 void nouveau_mem_fini(struct nouveau_mem *);
 int nouveau_mem_map(struct nouveau_mem *, struct nvif_vmm *, struct nvif_vma *);
+int
+nouveau_mem_map_fixed(struct nouveau_mem *mem,
+		      struct nvif_vmm *vmm,
+		      u8 kind, u64 addr,
+		      u64 offset, u64 range);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index f42c2b1b0363..1b2ff0c40fc1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -50,7 +50,7 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
 
 	dma_resv_lock(robj, NULL);
 	nvbo = nouveau_bo_alloc(&drm->client, &size, &align,
-				NOUVEAU_GEM_DOMAIN_GART, 0, 0);
+				NOUVEAU_GEM_DOMAIN_GART, 0, 0, true);
 	if (IS_ERR(nvbo)) {
 		obj = ERR_CAST(nvbo);
 		goto unlock;
@@ -102,3 +102,14 @@ void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
 
 	nouveau_bo_unpin(nvbo);
 }
+
+struct dma_buf *nouveau_gem_prime_export(struct drm_gem_object *gobj,
+					 int flags)
+{
+	struct nouveau_bo *nvbo = nouveau_gem_object(gobj);
+
+	if (nvbo->no_share)
+		return ERR_PTR(-EPERM);
+
+	return drm_gem_prime_export(gobj, flags);
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
new file mode 100644
index 000000000000..b3b59fbec291
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -0,0 +1,419 @@
+// SPDX-License-Identifier: MIT
+
+#include <linux/slab.h>
+#include <drm/gpu_scheduler.h>
+#include <drm/drm_syncobj.h>
+
+#include "nouveau_drv.h"
+#include "nouveau_gem.h"
+#include "nouveau_mem.h"
+#include "nouveau_dma.h"
+#include "nouveau_exec.h"
+#include "nouveau_abi16.h"
+#include "nouveau_sched.h"
+
+/* FIXME
+ *
+ * We want to make sure that jobs currently executing can't be deferred by
+ * other jobs competing for the hardware. Otherwise we might end up with job
+ * timeouts just because of too many clients submitting too many jobs. We don't
+ * want jobs to time out because of system load, but because of the job being
+ * too bulky.
+ *
+ * For now allow for up to 16 concurrent jobs in flight until we know how many
+ * rings the hardware can process in parallel.
+ */
+#define NOUVEAU_SCHED_HW_SUBMISSIONS		16
+#define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
+
+int
+nouveau_job_init(struct nouveau_job *job,
+		 struct nouveau_job_args *args)
+{
+	struct nouveau_sched_entity *entity = args->sched_entity;
+	int ret;
+
+	job->file_priv = args->file_priv;
+	job->cli = nouveau_cli(args->file_priv);
+	job->entity = entity;
+
+	job->sync = args->sync;
+	job->resv_usage = args->resv_usage;
+
+	job->ops = args->ops;
+
+	job->in_sync.count = args->in_sync.count;
+	if (job->in_sync.count) {
+		if (job->sync)
+			return -EINVAL;
+
+		job->in_sync.data = kmemdup(args->in_sync.s,
+					 sizeof(*args->in_sync.s) *
+					 args->in_sync.count,
+					 GFP_KERNEL);
+		if (!job->in_sync.data)
+			return -ENOMEM;
+	}
+
+	job->out_sync.count = args->out_sync.count;
+	if (job->out_sync.count) {
+		if (job->sync) {
+			ret = -EINVAL;
+			goto err_free_in_sync;
+		}
+
+		job->out_sync.data = kmemdup(args->out_sync.s,
+					  sizeof(*args->out_sync.s) *
+					  args->out_sync.count,
+					  GFP_KERNEL);
+		if (!job->out_sync.data) {
+			ret = -ENOMEM;
+			goto err_free_in_sync;
+		}
+
+		job->out_sync.objs = kcalloc(job->out_sync.count,
+					     sizeof(*job->out_sync.objs),
+					     GFP_KERNEL);
+		if (!job->out_sync.objs) {
+			ret = -ENOMEM;
+			goto err_free_out_sync;
+		}
+
+		job->out_sync.chains = kcalloc(job->out_sync.count,
+					       sizeof(*job->out_sync.chains),
+					       GFP_KERNEL);
+		if (!job->out_sync.chains) {
+			ret = -ENOMEM;
+			goto err_free_objs;
+		}
+
+	}
+
+	ret = drm_sched_job_init(&job->base, &entity->base, NULL);
+	if (ret)
+		goto err_free_chains;
+
+	job->state = NOUVEAU_JOB_INITIALIZED;
+
+	return 0;
+
+err_free_chains:
+	kfree(job->out_sync.chains);
+err_free_objs:
+	kfree(job->out_sync.objs);
+err_free_out_sync:
+	kfree(job->out_sync.data);
+err_free_in_sync:
+	kfree(job->in_sync.data);
+return ret;
+}
+
+void
+nouveau_job_free(struct nouveau_job *job)
+{
+	kfree(job->in_sync.data);
+	kfree(job->out_sync.data);
+	kfree(job->out_sync.objs);
+	kfree(job->out_sync.chains);
+}
+
+void nouveau_job_fini(struct nouveau_job *job)
+{
+	dma_fence_put(job->done_fence);
+	drm_sched_job_cleanup(&job->base);
+	job->ops->free(job);
+}
+
+static int
+sync_find_fence(struct nouveau_job *job,
+		struct drm_nouveau_sync *sync,
+		struct dma_fence **fence)
+{
+	u32 stype = sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
+	u64 point = 0;
+	int ret;
+
+	if (stype != DRM_NOUVEAU_SYNC_SYNCOBJ &&
+	    stype != DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
+		return -EOPNOTSUPP;
+
+	if (stype == DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
+		point = sync->timeline_value;
+
+	ret = drm_syncobj_find_fence(job->file_priv,
+				     sync->handle, point,
+				     sync->flags, fence);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int
+nouveau_job_add_deps(struct nouveau_job *job)
+{
+	struct dma_fence *in_fence = NULL;
+	int ret, i;
+
+	for (i = 0; i < job->in_sync.count; i++) {
+		struct drm_nouveau_sync *sync = &job->in_sync.data[i];
+
+		ret = sync_find_fence(job, sync, &in_fence);
+		if (ret) {
+			NV_PRINTK(warn, job->cli,
+				  "Failed to find syncobj (-> in): handle=%d\n",
+				  sync->handle);
+			return ret;
+		}
+
+		ret = drm_sched_job_add_dependency(&job->base, in_fence);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void
+nouveau_job_fence_attach_cleanup(struct nouveau_job *job)
+{
+	int i;
+
+	for (i = 0; i < job->out_sync.count; i++) {
+		struct drm_syncobj *obj = job->out_sync.objs[i];
+		struct dma_fence_chain *chain = job->out_sync.chains[i];
+
+		if (obj)
+			drm_syncobj_put(obj);
+
+		if (chain)
+			dma_fence_chain_free(chain);
+	}
+}
+
+static int
+nouveau_job_fence_attach_prepare(struct nouveau_job *job)
+{
+	int i, ret;
+
+	for (i = 0; i < job->out_sync.count; i++) {
+		struct drm_nouveau_sync *sync = &job->out_sync.data[i];
+		struct drm_syncobj **pobj = &job->out_sync.objs[i];
+		struct dma_fence_chain **pchain = &job->out_sync.chains[i];
+		u32 stype = sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
+
+		if (stype != DRM_NOUVEAU_SYNC_SYNCOBJ &&
+		    stype != DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ) {
+			ret = -EINVAL;
+			goto err_sync_cleanup;
+		}
+
+		*pobj = drm_syncobj_find(job->file_priv, sync->handle);
+		if (!*pobj) {
+			NV_PRINTK(warn, job->cli,
+				  "Failed to find syncobj (-> out): handle=%d\n",
+				  sync->handle);
+			ret = -ENOENT;
+			goto err_sync_cleanup;
+		}
+
+		if (stype == DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ) {
+			*pchain = dma_fence_chain_alloc();
+			if (!*pchain) {
+				ret = -ENOMEM;
+				goto err_sync_cleanup;
+			}
+		}
+	}
+
+	return 0;
+
+err_sync_cleanup:
+	nouveau_job_fence_attach_cleanup(job);
+	return ret;
+}
+
+static void
+nouveau_job_fence_attach(struct nouveau_job *job)
+{
+	struct dma_fence *fence = job->done_fence;
+	int i;
+
+	for (i = 0; i < job->out_sync.count; i++) {
+		struct drm_nouveau_sync *sync = &job->out_sync.data[i];
+		struct drm_syncobj **pobj = &job->out_sync.objs[i];
+		struct dma_fence_chain **pchain = &job->out_sync.chains[i];
+		u32 stype = sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
+
+		if (stype == DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ) {
+			drm_syncobj_add_point(*pobj, *pchain, fence,
+					      sync->timeline_value);
+		} else {
+			drm_syncobj_replace_fence(*pobj, fence);
+		}
+
+		drm_syncobj_put(*pobj);
+		*pobj = NULL;
+		*pchain = NULL;
+	}
+}
+
+int
+nouveau_job_submit(struct nouveau_job *job)
+{
+	struct nouveau_sched_entity *entity = to_nouveau_sched_entity(job->base.entity);
+	struct dma_fence *done_fence = NULL;
+	int ret;
+
+	ret = nouveau_job_add_deps(job);
+	if (ret)
+		goto err;
+
+	ret = nouveau_job_fence_attach_prepare(job);
+	if (ret)
+		goto err;
+
+	/* Make sure the job appears on the sched_entity's queue in the same
+	 * order as it was submitted.
+	 */
+	mutex_lock(&entity->mutex);
+
+	/* Guarantee we won't fail after the submit() callback returned
+	 * successfully.
+	 */
+	if (job->ops->submit) {
+		ret = job->ops->submit(job);
+		if (ret)
+			goto err_cleanup;
+	}
+
+	drm_sched_job_arm(&job->base);
+	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
+	if (job->sync)
+		done_fence = dma_fence_get(job->done_fence);
+
+	if (job->ops->armed_submit)
+		job->ops->armed_submit(job);
+
+	nouveau_job_fence_attach(job);
+
+	/* Set job state before pushing the job to the scheduler,
+	 * such that we do not overwrite the job state set in run().
+	 */
+	job->state = NOUVEAU_JOB_SUBMIT_SUCCESS;
+
+	drm_sched_entity_push_job(&job->base);
+
+	mutex_unlock(&entity->mutex);
+
+	if (done_fence) {
+		dma_fence_wait(done_fence, true);
+		dma_fence_put(done_fence);
+	}
+
+	return 0;
+
+err_cleanup:
+	mutex_unlock(&entity->mutex);
+	nouveau_job_fence_attach_cleanup(job);
+err:
+	job->state = NOUVEAU_JOB_SUBMIT_FAILED;
+	return ret;
+}
+
+bool
+nouveau_sched_entity_qwork(struct nouveau_sched_entity *entity,
+			   struct work_struct *work)
+{
+	return queue_work(entity->sched_wq, work);
+}
+
+static struct dma_fence *
+nouveau_job_run(struct nouveau_job *job)
+{
+	struct dma_fence *fence;
+
+	fence = job->ops->run(job);
+	if (IS_ERR(fence))
+		job->state = NOUVEAU_JOB_RUN_FAILED;
+	else
+		job->state = NOUVEAU_JOB_RUN_SUCCESS;
+
+	return fence;
+}
+
+static struct dma_fence *
+nouveau_sched_run_job(struct drm_sched_job *sched_job)
+{
+	struct nouveau_job *job = to_nouveau_job(sched_job);
+
+	return nouveau_job_run(job);
+}
+
+static enum drm_gpu_sched_stat
+nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
+{
+	struct nouveau_job *job = to_nouveau_job(sched_job);
+
+	NV_PRINTK(warn, job->cli, "Job timed out.\n");
+
+	if (job->ops->timeout)
+		return job->ops->timeout(job);
+
+	return DRM_GPU_SCHED_STAT_ENODEV;
+}
+
+static void
+nouveau_sched_free_job(struct drm_sched_job *sched_job)
+{
+	struct nouveau_job *job = to_nouveau_job(sched_job);
+
+	nouveau_job_fini(job);
+}
+
+int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
+			      struct drm_gpu_scheduler *sched,
+			      struct workqueue_struct *sched_wq)
+{
+	mutex_init(&entity->mutex);
+	spin_lock_init(&entity->job.list.lock);
+	INIT_LIST_HEAD(&entity->job.list.head);
+	init_waitqueue_head(&entity->job.wq);
+
+	entity->sched_wq = sched_wq;
+	return drm_sched_entity_init(&entity->base,
+				     DRM_SCHED_PRIORITY_NORMAL,
+				     &sched, 1, NULL);
+}
+
+void
+nouveau_sched_entity_fini(struct nouveau_sched_entity *entity)
+{
+	drm_sched_entity_destroy(&entity->base);
+}
+
+static const struct drm_sched_backend_ops nouveau_sched_ops = {
+	.run_job = nouveau_sched_run_job,
+	.timedout_job = nouveau_sched_timedout_job,
+	.free_job = nouveau_sched_free_job,
+};
+
+int nouveau_sched_init(struct nouveau_drm *drm)
+{
+	struct drm_gpu_scheduler *sched = &drm->sched;
+	long job_hang_limit = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
+
+	drm->sched_wq = create_singlethread_workqueue("nouveau_sched_wq");
+	if (!drm->sched_wq)
+		return -ENOMEM;
+
+	return drm_sched_init(sched, &nouveau_sched_ops,
+			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
+			      NULL, NULL, "nouveau_sched", drm->dev->dev);
+}
+
+void nouveau_sched_fini(struct nouveau_drm *drm)
+{
+	destroy_workqueue(drm->sched_wq);
+	drm_sched_fini(&drm->sched);
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
new file mode 100644
index 000000000000..27ac19792597
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef NOUVEAU_SCHED_H
+#define NOUVEAU_SCHED_H
+
+#include <linux/types.h>
+
+#include <drm/drm_exec.h>
+#include <drm/gpu_scheduler.h>
+
+#include "nouveau_drv.h"
+
+#define to_nouveau_job(sched_job)		\
+		container_of((sched_job), struct nouveau_job, base)
+
+struct nouveau_job_ops;
+
+enum nouveau_job_state {
+	NOUVEAU_JOB_UNINITIALIZED = 0,
+	NOUVEAU_JOB_INITIALIZED,
+	NOUVEAU_JOB_SUBMIT_SUCCESS,
+	NOUVEAU_JOB_SUBMIT_FAILED,
+	NOUVEAU_JOB_RUN_SUCCESS,
+	NOUVEAU_JOB_RUN_FAILED,
+};
+
+struct nouveau_job_args {
+	struct drm_file *file_priv;
+	struct nouveau_sched_entity *sched_entity;
+
+	enum dma_resv_usage resv_usage;
+	bool sync;
+
+	struct {
+		struct drm_nouveau_sync *s;
+		u32 count;
+	} in_sync;
+
+	struct {
+		struct drm_nouveau_sync *s;
+		u32 count;
+	} out_sync;
+
+	struct nouveau_job_ops *ops;
+};
+
+struct nouveau_job {
+	struct drm_sched_job base;
+
+	enum nouveau_job_state state;
+
+	struct nouveau_sched_entity *entity;
+
+	struct drm_file *file_priv;
+	struct nouveau_cli *cli;
+
+	struct drm_exec exec;
+	enum dma_resv_usage resv_usage;
+	struct dma_fence *done_fence;
+
+	bool sync;
+
+	struct {
+		struct drm_nouveau_sync *data;
+		u32 count;
+	} in_sync;
+
+	struct {
+		struct drm_nouveau_sync *data;
+		struct drm_syncobj **objs;
+		struct dma_fence_chain **chains;
+		u32 count;
+	} out_sync;
+
+	struct nouveau_job_ops {
+		/* If .submit() returns without any error, it is guaranteed that
+		 * armed_submit() is called.
+		 */
+		int (*submit)(struct nouveau_job *);
+		void (*armed_submit)(struct nouveau_job *);
+		struct dma_fence *(*run)(struct nouveau_job *);
+		void (*free)(struct nouveau_job *);
+		enum drm_gpu_sched_stat (*timeout)(struct nouveau_job *);
+	} *ops;
+};
+
+int nouveau_job_ucopy_syncs(struct nouveau_job_args *args,
+			    u32 inc, u64 ins,
+			    u32 outc, u64 outs);
+
+int nouveau_job_init(struct nouveau_job *job,
+		     struct nouveau_job_args *args);
+void nouveau_job_free(struct nouveau_job *job);
+
+int nouveau_job_submit(struct nouveau_job *job);
+void nouveau_job_fini(struct nouveau_job *job);
+
+#define to_nouveau_sched_entity(entity)		\
+		container_of((entity), struct nouveau_sched_entity, base)
+
+struct nouveau_sched_entity {
+	struct drm_sched_entity base;
+	struct mutex mutex;
+
+	struct workqueue_struct *sched_wq;
+
+	struct {
+		struct {
+			struct list_head head;
+			spinlock_t lock;
+		} list;
+		struct wait_queue_head wq;
+	} job;
+};
+
+int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
+			      struct drm_gpu_scheduler *sched,
+			      struct workqueue_struct *sched_wq);
+void nouveau_sched_entity_fini(struct nouveau_sched_entity *entity);
+
+bool nouveau_sched_entity_qwork(struct nouveau_sched_entity *entity,
+				struct work_struct *work);
+
+int nouveau_sched_init(struct nouveau_drm *drm);
+void nouveau_sched_fini(struct nouveau_drm *drm);
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
new file mode 100644
index 000000000000..b515a21aa08e
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -0,0 +1,1921 @@
+// SPDX-License-Identifier: MIT
+
+/*
+ * Locking:
+ *
+ * The uvmm mutex protects any operations on the GPU VA space provided by the
+ * DRM GPU VA manager.
+ *
+ * The GEMs dma_resv lock protects the GEMs GPUVA list, hence link/unlink of a
+ * mapping to it's backing GEM must be performed under this lock.
+ *
+ * Actual map/unmap operations within the fence signalling critical path are
+ * protected by installing DMA fences to the corresponding GEMs DMA
+ * reservations, such that concurrent BO moves, which itself walk the GEMs GPUVA
+ * list in order to map/unmap it's entries, can't occur concurrently.
+ *
+ * Accessing the DRM_GPUVA_INVALIDATED flag doesn't need any separate
+ * protection, since there are no accesses other than from BO move callbacks
+ * and from the fence signalling critical path, which are already protected by
+ * the corresponding GEMs DMA reservation fence.
+ */
+
+#include "nouveau_drv.h"
+#include "nouveau_gem.h"
+#include "nouveau_mem.h"
+#include "nouveau_uvmm.h"
+
+#include <nvif/vmm.h>
+#include <nvif/mem.h>
+
+#include <nvif/class.h>
+#include <nvif/if000c.h>
+#include <nvif/if900d.h>
+
+#define NOUVEAU_VA_SPACE_BITS		47 /* FIXME */
+#define NOUVEAU_VA_SPACE_START		0x0
+#define NOUVEAU_VA_SPACE_END		(1ULL << NOUVEAU_VA_SPACE_BITS)
+
+#define list_last_op(_ops) list_last_entry(_ops, struct bind_job_op, entry)
+#define list_prev_op(_op) list_prev_entry(_op, entry)
+#define list_for_each_op(_op, _ops) list_for_each_entry(_op, _ops, entry)
+#define list_for_each_op_from_reverse(_op, _ops) \
+	list_for_each_entry_from_reverse(_op, _ops, entry)
+#define list_for_each_op_safe(_op, _n, _ops) list_for_each_entry_safe(_op, _n, _ops, entry)
+
+enum vm_bind_op {
+	OP_MAP = DRM_NOUVEAU_VM_BIND_OP_MAP,
+	OP_UNMAP = DRM_NOUVEAU_VM_BIND_OP_UNMAP,
+	OP_MAP_SPARSE,
+	OP_UNMAP_SPARSE,
+};
+
+struct nouveau_uvma_prealloc {
+	struct nouveau_uvma *map;
+	struct nouveau_uvma *prev;
+	struct nouveau_uvma *next;
+};
+
+struct bind_job_op {
+	struct list_head entry;
+
+	enum vm_bind_op op;
+	u32 flags;
+
+	struct {
+		u64 addr;
+		u64 range;
+	} va;
+
+	struct {
+		u32 handle;
+		u64 offset;
+		struct drm_gem_object *obj;
+	} gem;
+
+	struct nouveau_uvma_region *reg;
+	struct nouveau_uvma_prealloc new;
+	struct drm_gpuva_ops *ops;
+};
+
+struct uvmm_map_args {
+	struct nouveau_uvma_region *region;
+	u64 addr;
+	u64 range;
+	u8 kind;
+};
+
+static int
+nouveau_uvmm_vmm_sparse_ref(struct nouveau_uvmm *uvmm,
+			    u64 addr, u64 range)
+{
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+
+	return nvif_vmm_raw_sparse(vmm, addr, range, true);
+}
+
+static int
+nouveau_uvmm_vmm_sparse_unref(struct nouveau_uvmm *uvmm,
+			      u64 addr, u64 range)
+{
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+
+	return nvif_vmm_raw_sparse(vmm, addr, range, false);
+}
+
+static int
+nouveau_uvmm_vmm_get(struct nouveau_uvmm *uvmm,
+		     u64 addr, u64 range)
+{
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+
+	return nvif_vmm_raw_get(vmm, addr, range, PAGE_SHIFT);
+}
+
+static int
+nouveau_uvmm_vmm_put(struct nouveau_uvmm *uvmm,
+		     u64 addr, u64 range)
+{
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+
+	return nvif_vmm_raw_put(vmm, addr, range, PAGE_SHIFT);
+}
+
+static int
+nouveau_uvmm_vmm_unmap(struct nouveau_uvmm *uvmm,
+		       u64 addr, u64 range, bool sparse)
+{
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+
+	return nvif_vmm_raw_unmap(vmm, addr, range, PAGE_SHIFT, sparse);
+}
+
+static int
+nouveau_uvmm_vmm_map(struct nouveau_uvmm *uvmm,
+		     u64 addr, u64 range,
+		     u64 bo_offset, u8 kind,
+		     struct nouveau_mem *mem)
+{
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+	union {
+		struct gf100_vmm_map_v0 gf100;
+	} args;
+	u32 argc = 0;
+
+	switch (vmm->object.oclass) {
+	case NVIF_CLASS_VMM_GF100:
+	case NVIF_CLASS_VMM_GM200:
+	case NVIF_CLASS_VMM_GP100:
+		args.gf100.version = 0;
+		if (mem->mem.type & NVIF_MEM_VRAM)
+			args.gf100.vol = 0;
+		else
+			args.gf100.vol = 1;
+		args.gf100.ro = 0;
+		args.gf100.priv = 0;
+		args.gf100.kind = kind;
+		argc = sizeof(args.gf100);
+		break;
+	default:
+		WARN_ON(1);
+		return -ENOSYS;
+	}
+
+	return nvif_vmm_raw_map(vmm, addr, range, PAGE_SHIFT,
+				&args, argc,
+				&mem->mem, bo_offset);
+}
+
+static int
+nouveau_uvma_region_sparse_unref(struct nouveau_uvma_region *reg)
+{
+	u64 addr = reg->va.addr;
+	u64 range = reg->va.range;
+
+	return nouveau_uvmm_vmm_sparse_unref(reg->uvmm, addr, range);
+}
+
+static int
+nouveau_uvma_vmm_put(struct nouveau_uvma *uvma)
+{
+	u64 addr = uvma->va.va.addr;
+	u64 range = uvma->va.va.range;
+
+	return nouveau_uvmm_vmm_put(uvma->uvmm, addr, range);
+}
+
+static int
+nouveau_uvma_map(struct nouveau_uvma *uvma,
+		 struct nouveau_mem *mem)
+{
+	u64 addr = uvma->va.va.addr;
+	u64 offset = uvma->va.gem.offset;
+	u64 range = uvma->va.va.range;
+
+	return nouveau_uvmm_vmm_map(uvma->uvmm, addr, range,
+				    offset, uvma->kind, mem);
+}
+
+static int
+nouveau_uvma_unmap(struct nouveau_uvma *uvma)
+{
+	u64 addr = uvma->va.va.addr;
+	u64 range = uvma->va.va.range;
+	bool sparse = !!uvma->region;
+
+	if (drm_gpuva_invalidated(&uvma->va))
+		return 0;
+
+	return nouveau_uvmm_vmm_unmap(uvma->uvmm, addr, range, sparse);
+}
+
+static int
+nouveau_uvma_alloc(struct nouveau_uvma **puvma)
+{
+	*puvma = kzalloc(sizeof(**puvma), GFP_KERNEL);
+	if (!*puvma)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void
+nouveau_uvma_free(struct nouveau_uvma *uvma)
+{
+	kfree(uvma);
+}
+
+static void
+nouveau_uvma_gem_get(struct nouveau_uvma *uvma)
+{
+	drm_gem_object_get(uvma->va.gem.obj);
+}
+
+static void
+nouveau_uvma_gem_put(struct nouveau_uvma *uvma)
+{
+	drm_gem_object_put(uvma->va.gem.obj);
+}
+
+static int
+nouveau_uvma_region_alloc(struct nouveau_uvma_region **preg)
+{
+	*preg = kzalloc(sizeof(**preg), GFP_KERNEL);
+	if (!*preg)
+		return -ENOMEM;
+
+	kref_init(&(*preg)->kref);
+
+	return 0;
+}
+
+static void
+nouveau_uvma_region_free(struct kref *kref)
+{
+	struct nouveau_uvma_region *reg =
+		container_of(kref, struct nouveau_uvma_region, kref);
+
+	kfree(reg);
+}
+
+static void
+nouveau_uvma_region_get(struct nouveau_uvma_region *reg)
+{
+	kref_get(&reg->kref);
+}
+
+static void
+nouveau_uvma_region_put(struct nouveau_uvma_region *reg)
+{
+	kref_put(&reg->kref, nouveau_uvma_region_free);
+}
+
+static int
+__nouveau_uvma_region_insert(struct nouveau_uvmm *uvmm,
+			     struct nouveau_uvma_region *reg)
+{
+	u64 addr = reg->va.addr;
+	u64 range = reg->va.range;
+	u64 last = addr + range - 1;
+	MA_STATE(mas, &uvmm->region_mt, addr, addr);
+
+	if (unlikely(mas_walk(&mas))) {
+		mas_unlock(&mas);
+		return -EEXIST;
+	}
+
+	if (unlikely(mas.last < last)) {
+		mas_unlock(&mas);
+		return -EEXIST;
+	}
+
+	mas.index = addr;
+	mas.last = last;
+
+	mas_store_gfp(&mas, reg, GFP_KERNEL);
+
+	reg->uvmm = uvmm;
+
+	return 0;
+}
+
+static int
+nouveau_uvma_region_insert(struct nouveau_uvmm *uvmm,
+			   struct nouveau_uvma_region *reg,
+			   u64 addr, u64 range)
+{
+	int ret;
+
+	reg->uvmm = uvmm;
+	reg->va.addr = addr;
+	reg->va.range = range;
+
+	ret = __nouveau_uvma_region_insert(uvmm, reg);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void
+nouveau_uvma_region_remove(struct nouveau_uvma_region *reg)
+{
+	struct nouveau_uvmm *uvmm = reg->uvmm;
+	MA_STATE(mas, &uvmm->region_mt, reg->va.addr, 0);
+
+	mas_erase(&mas);
+}
+
+static int
+nouveau_uvma_region_create(struct nouveau_uvmm *uvmm,
+			   u64 addr, u64 range)
+{
+	struct nouveau_uvma_region *reg;
+	int ret;
+
+	if (!drm_gpuva_interval_empty(&uvmm->umgr, addr, range))
+		return -ENOSPC;
+
+	ret = nouveau_uvma_region_alloc(&reg);
+	if (ret)
+		return ret;
+
+	ret = nouveau_uvma_region_insert(uvmm, reg, addr, range);
+	if (ret)
+		goto err_free_region;
+
+	ret = nouveau_uvmm_vmm_sparse_ref(uvmm, addr, range);
+	if (ret)
+		goto err_region_remove;
+
+	return 0;
+
+err_region_remove:
+	nouveau_uvma_region_remove(reg);
+err_free_region:
+	nouveau_uvma_region_put(reg);
+	return ret;
+}
+
+static struct nouveau_uvma_region *
+nouveau_uvma_region_find_first(struct nouveau_uvmm *uvmm,
+			       u64 addr, u64 range)
+{
+	MA_STATE(mas, &uvmm->region_mt, addr, 0);
+
+	return mas_find(&mas, addr + range - 1);
+}
+
+static struct nouveau_uvma_region *
+nouveau_uvma_region_find(struct nouveau_uvmm *uvmm,
+			 u64 addr, u64 range)
+{
+	struct nouveau_uvma_region *reg;
+
+	reg = nouveau_uvma_region_find_first(uvmm, addr, range);
+	if (!reg)
+		return NULL;
+
+	if (reg->va.addr != addr ||
+	    reg->va.range != range)
+		return NULL;
+
+	return reg;
+}
+
+static bool
+nouveau_uvma_region_empty(struct nouveau_uvma_region *reg)
+{
+	struct nouveau_uvmm *uvmm = reg->uvmm;
+
+	return drm_gpuva_interval_empty(&uvmm->umgr,
+					reg->va.addr,
+					reg->va.range);
+}
+
+static int
+__nouveau_uvma_region_destroy(struct nouveau_uvma_region *reg)
+{
+	struct nouveau_uvmm *uvmm = reg->uvmm;
+	u64 addr = reg->va.addr;
+	u64 range = reg->va.range;
+
+	if (!nouveau_uvma_region_empty(reg))
+		return -EBUSY;
+
+	nouveau_uvma_region_remove(reg);
+	nouveau_uvmm_vmm_sparse_unref(uvmm, addr, range);
+	nouveau_uvma_region_put(reg);
+
+	return 0;
+}
+
+static int
+nouveau_uvma_region_destroy(struct nouveau_uvmm *uvmm,
+			    u64 addr, u64 range)
+{
+	struct nouveau_uvma_region *reg;
+
+	reg = nouveau_uvma_region_find(uvmm, addr, range);
+	if (!reg)
+		return -ENOENT;
+
+	return __nouveau_uvma_region_destroy(reg);
+}
+
+static void
+nouveau_uvma_region_dirty(struct nouveau_uvma_region *reg)
+{
+
+	init_completion(&reg->complete);
+	reg->dirty = true;
+}
+
+static void
+nouveau_uvma_region_complete(struct nouveau_uvma_region *reg)
+{
+	complete_all(&reg->complete);
+}
+
+static void
+op_map_prepare_unwind(struct nouveau_uvma *uvma)
+{
+	nouveau_uvma_gem_put(uvma);
+	drm_gpuva_remove(&uvma->va);
+	nouveau_uvma_free(uvma);
+}
+
+static void
+op_unmap_prepare_unwind(struct drm_gpuva *va)
+{
+	drm_gpuva_insert(va->mgr, va);
+}
+
+static void
+nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
+			       struct nouveau_uvma_prealloc *new,
+			       struct drm_gpuva_ops *ops,
+			       struct drm_gpuva_op *last,
+			       struct uvmm_map_args *args)
+{
+	struct drm_gpuva_op *op = last;
+	u64 vmm_get_start = args ? args->addr : 0;
+	u64 vmm_get_end = args ? args->addr + args->range : 0;
+
+	/* Unwind GPUVA space. */
+	drm_gpuva_for_each_op_from_reverse(op, ops) {
+		switch (op->op) {
+		case DRM_GPUVA_OP_MAP:
+			op_map_prepare_unwind(new->map);
+			break;
+		case DRM_GPUVA_OP_REMAP: {
+			struct drm_gpuva_op_remap *r = &op->remap;
+
+			if (r->next)
+				op_map_prepare_unwind(new->next);
+
+			if (r->prev)
+				op_map_prepare_unwind(new->prev);
+
+			op_unmap_prepare_unwind(r->unmap->va);
+			break;
+		}
+		case DRM_GPUVA_OP_UNMAP:
+			op_unmap_prepare_unwind(op->unmap.va);
+			break;
+		default:
+			break;
+		}
+	}
+
+	/* Unmap operation don't allocate page tables, hence skip the following
+	 * page table unwind.
+	 */
+	if (!args)
+		return;
+
+	drm_gpuva_for_each_op(op, ops) {
+		switch (op->op) {
+		case DRM_GPUVA_OP_MAP: {
+			u64 vmm_get_range = vmm_get_end - vmm_get_start;
+
+			if (vmm_get_range)
+				nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
+						     vmm_get_range);
+			break;
+		}
+		case DRM_GPUVA_OP_REMAP: {
+			struct drm_gpuva_op_remap *r = &op->remap;
+			struct drm_gpuva *va = r->unmap->va;
+			u64 ustart = va->va.addr;
+			u64 urange = va->va.range;
+			u64 uend = ustart + urange;
+
+			if (r->prev)
+				vmm_get_start = uend;
+
+			if (r->next)
+				vmm_get_end = ustart;
+
+			if (r->prev && r->next)
+				vmm_get_start = vmm_get_end = 0;
+
+			break;
+		}
+		case DRM_GPUVA_OP_UNMAP: {
+			struct drm_gpuva_op_unmap *u = &op->unmap;
+			struct drm_gpuva *va = u->va;
+			u64 ustart = va->va.addr;
+			u64 urange = va->va.range;
+			u64 uend = ustart + urange;
+
+			/* Nothing to do for mappings we merge with. */
+			if (uend == vmm_get_start ||
+			    ustart == vmm_get_end)
+				break;
+
+			if (ustart > vmm_get_start) {
+				u64 vmm_get_range = ustart - vmm_get_start;
+
+				nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
+						     vmm_get_range);
+			}
+			vmm_get_start = uend;
+			break;
+		}
+		default:
+			break;
+		}
+
+		if (op == last)
+			break;
+	}
+}
+
+static void
+nouveau_uvmm_sm_map_prepare_unwind(struct nouveau_uvmm *uvmm,
+				   struct nouveau_uvma_prealloc *new,
+				   struct drm_gpuva_ops *ops,
+				   u64 addr, u64 range)
+{
+	struct drm_gpuva_op *last = drm_gpuva_last_op(ops);
+	struct uvmm_map_args args = {
+		.addr = addr,
+		.range = range,
+	};
+
+	nouveau_uvmm_sm_prepare_unwind(uvmm, new, ops, last, &args);
+}
+
+static void
+nouveau_uvmm_sm_unmap_prepare_unwind(struct nouveau_uvmm *uvmm,
+				     struct nouveau_uvma_prealloc *new,
+				     struct drm_gpuva_ops *ops)
+{
+	struct drm_gpuva_op *last = drm_gpuva_last_op(ops);
+
+	nouveau_uvmm_sm_prepare_unwind(uvmm, new, ops, last, NULL);
+}
+
+static int
+op_map_prepare(struct nouveau_uvmm *uvmm,
+	       struct nouveau_uvma **puvma,
+	       struct drm_gpuva_op_map *op,
+	       struct uvmm_map_args *args)
+{
+	struct nouveau_uvma *uvma;
+	int ret;
+
+	ret = nouveau_uvma_alloc(&uvma);
+	if (ret)
+		return ret;
+
+	uvma->uvmm = uvmm;
+	uvma->region = args->region;
+	uvma->kind = args->kind;
+
+	drm_gpuva_map(&uvmm->umgr, &uvma->va, op);
+
+	/* Keep a reference until this uvma is destroyed. */
+	nouveau_uvma_gem_get(uvma);
+
+	*puvma = uvma;
+	return 0;
+}
+
+static void
+op_unmap_prepare(struct drm_gpuva_op_unmap *u)
+{
+	drm_gpuva_unmap(u);
+}
+
+static int
+nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
+			struct nouveau_uvma_prealloc *new,
+			struct drm_gpuva_ops *ops,
+			struct uvmm_map_args *args)
+{
+	struct drm_gpuva_op *op;
+	u64 vmm_get_start = args ? args->addr : 0;
+	u64 vmm_get_end = args ? args->addr + args->range : 0;
+	int ret;
+
+	drm_gpuva_for_each_op(op, ops) {
+		switch (op->op) {
+		case DRM_GPUVA_OP_MAP: {
+			u64 vmm_get_range = vmm_get_end - vmm_get_start;
+
+			ret = op_map_prepare(uvmm, &new->map, &op->map, args);
+			if (ret)
+				goto unwind;
+
+			if (args && vmm_get_range) {
+				ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
+							   vmm_get_range);
+				if (ret) {
+					op_map_prepare_unwind(new->map);
+					goto unwind;
+				}
+			}
+			break;
+		}
+		case DRM_GPUVA_OP_REMAP: {
+			struct drm_gpuva_op_remap *r = &op->remap;
+			struct drm_gpuva *va = r->unmap->va;
+			struct uvmm_map_args remap_args = {
+				.kind = uvma_from_va(va)->kind,
+			};
+			u64 ustart = va->va.addr;
+			u64 urange = va->va.range;
+			u64 uend = ustart + urange;
+
+			op_unmap_prepare(r->unmap);
+
+			if (r->prev) {
+				ret = op_map_prepare(uvmm, &new->prev, r->prev,
+						     &remap_args);
+				if (ret)
+					goto unwind;
+
+				if (args)
+					vmm_get_start = uend;
+			}
+
+			if (r->next) {
+				ret = op_map_prepare(uvmm, &new->next, r->next,
+						     &remap_args);
+				if (ret) {
+					if (r->prev)
+						op_map_prepare_unwind(new->prev);
+					goto unwind;
+				}
+
+				if (args)
+					vmm_get_end = ustart;
+			}
+
+			if (args && (r->prev && r->next))
+				vmm_get_start = vmm_get_end = 0;
+
+			break;
+		}
+		case DRM_GPUVA_OP_UNMAP: {
+			struct drm_gpuva_op_unmap *u = &op->unmap;
+			struct drm_gpuva *va = u->va;
+			u64 ustart = va->va.addr;
+			u64 urange = va->va.range;
+			u64 uend = ustart + urange;
+
+			op_unmap_prepare(u);
+
+			if (!args)
+				break;
+
+			/* Nothing to do for mappings we merge with. */
+			if (uend == vmm_get_start ||
+			    ustart == vmm_get_end)
+				break;
+
+			if (ustart > vmm_get_start) {
+				u64 vmm_get_range = ustart - vmm_get_start;
+
+				ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
+							   vmm_get_range);
+				if (ret) {
+					op_unmap_prepare_unwind(va);
+					goto unwind;
+				}
+			}
+			vmm_get_start = uend;
+
+			break;
+		}
+		default:
+			ret = -EINVAL;
+			goto unwind;
+		}
+	}
+
+	return 0;
+
+unwind:
+	if (op != drm_gpuva_first_op(ops))
+		nouveau_uvmm_sm_prepare_unwind(uvmm, new, ops,
+					       drm_gpuva_prev_op(op),
+					       args);
+	return ret;
+}
+
+static int
+nouveau_uvmm_sm_map_prepare(struct nouveau_uvmm *uvmm,
+			    struct nouveau_uvma_prealloc *new,
+			    struct nouveau_uvma_region *region,
+			    struct drm_gpuva_ops *ops,
+			    u64 addr, u64 range, u8 kind)
+{
+	struct uvmm_map_args args = {
+		.region = region,
+		.addr = addr,
+		.range = range,
+		.kind = kind,
+	};
+
+	return nouveau_uvmm_sm_prepare(uvmm, new, ops, &args);
+}
+
+static int
+nouveau_uvmm_sm_unmap_prepare(struct nouveau_uvmm *uvmm,
+			      struct nouveau_uvma_prealloc *new,
+			      struct drm_gpuva_ops *ops)
+{
+	return nouveau_uvmm_sm_prepare(uvmm, new, ops, NULL);
+}
+
+static struct drm_gem_object *
+op_gem_obj(struct drm_gpuva_op *op)
+{
+	switch (op->op) {
+	case DRM_GPUVA_OP_MAP:
+		return op->map.gem.obj;
+	case DRM_GPUVA_OP_REMAP:
+		/* Actually, we're looking for the GEMs backing remap.prev and
+		 * remap.next, but since this is a remap they're identical to
+		 * the GEM backing the unmapped GPUVA.
+		 */
+		return op->remap.unmap->va->gem.obj;
+	case DRM_GPUVA_OP_UNMAP:
+		return op->unmap.va->gem.obj;
+	default:
+		WARN(1, "Unknown operation.\n");
+		return NULL;
+	}
+}
+
+static void
+op_map(struct nouveau_uvma *uvma)
+{
+	struct nouveau_bo *nvbo = nouveau_gem_object(uvma->va.gem.obj);
+
+	nouveau_uvma_map(uvma, nouveau_mem(nvbo->bo.resource));
+}
+
+static void
+op_unmap(struct drm_gpuva_op_unmap *u)
+{
+	struct drm_gpuva *va = u->va;
+	struct nouveau_uvma *uvma = uvma_from_va(va);
+
+	/* nouveau_uvma_unmap() does not unmap if backing BO is evicted. */
+	if (!u->keep)
+		nouveau_uvma_unmap(uvma);
+}
+
+static void
+op_unmap_range(struct drm_gpuva_op_unmap *u,
+	       u64 addr, u64 range)
+{
+	struct nouveau_uvma *uvma = uvma_from_va(u->va);
+	bool sparse = !!uvma->region;
+
+	if (!drm_gpuva_invalidated(u->va))
+		nouveau_uvmm_vmm_unmap(uvma->uvmm, addr, range, sparse);
+}
+
+static void
+op_remap(struct drm_gpuva_op_remap *r,
+	 struct nouveau_uvma_prealloc *new)
+{
+	struct drm_gpuva_op_unmap *u = r->unmap;
+	struct nouveau_uvma *uvma = uvma_from_va(u->va);
+	u64 addr = uvma->va.va.addr;
+	u64 range = uvma->va.va.range;
+
+	if (r->prev)
+		addr = r->prev->va.addr + r->prev->va.range;
+
+	if (r->next)
+		range = r->next->va.addr - addr;
+
+	op_unmap_range(u, addr, range);
+}
+
+static int
+nouveau_uvmm_sm(struct nouveau_uvmm *uvmm,
+		struct nouveau_uvma_prealloc *new,
+		struct drm_gpuva_ops *ops)
+{
+	struct drm_gpuva_op *op;
+
+	drm_gpuva_for_each_op(op, ops) {
+		switch (op->op) {
+		case DRM_GPUVA_OP_MAP:
+			op_map(new->map);
+			break;
+		case DRM_GPUVA_OP_REMAP:
+			op_remap(&op->remap, new);
+			break;
+		case DRM_GPUVA_OP_UNMAP:
+			op_unmap(&op->unmap);
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static int
+nouveau_uvmm_sm_map(struct nouveau_uvmm *uvmm,
+		    struct nouveau_uvma_prealloc *new,
+		    struct drm_gpuva_ops *ops)
+{
+	return nouveau_uvmm_sm(uvmm, new, ops);
+}
+
+static int
+nouveau_uvmm_sm_unmap(struct nouveau_uvmm *uvmm,
+		      struct nouveau_uvma_prealloc *new,
+		      struct drm_gpuva_ops *ops)
+{
+	return nouveau_uvmm_sm(uvmm, new, ops);
+}
+
+static void
+nouveau_uvmm_sm_cleanup(struct nouveau_uvmm *uvmm,
+			struct nouveau_uvma_prealloc *new,
+			struct drm_gpuva_ops *ops, bool unmap)
+{
+	struct drm_gpuva_op *op;
+
+	drm_gpuva_for_each_op(op, ops) {
+		switch (op->op) {
+		case DRM_GPUVA_OP_MAP:
+			break;
+		case DRM_GPUVA_OP_REMAP: {
+			struct drm_gpuva_op_remap *r = &op->remap;
+			struct drm_gpuva_op_map *p = r->prev;
+			struct drm_gpuva_op_map *n = r->next;
+			struct drm_gpuva *va = r->unmap->va;
+			struct nouveau_uvma *uvma = uvma_from_va(va);
+
+			if (unmap) {
+				u64 addr = va->va.addr;
+				u64 end = addr + va->va.range;
+
+				if (p)
+					addr = p->va.addr + p->va.range;
+
+				if (n)
+					end = n->va.addr;
+
+				nouveau_uvmm_vmm_put(uvmm, addr, end - addr);
+			}
+
+			nouveau_uvma_gem_put(uvma);
+			nouveau_uvma_free(uvma);
+			break;
+		}
+		case DRM_GPUVA_OP_UNMAP: {
+			struct drm_gpuva_op_unmap *u = &op->unmap;
+			struct drm_gpuva *va = u->va;
+			struct nouveau_uvma *uvma = uvma_from_va(va);
+
+			if (unmap)
+				nouveau_uvma_vmm_put(uvma);
+
+			nouveau_uvma_gem_put(uvma);
+			nouveau_uvma_free(uvma);
+			break;
+		}
+		default:
+			break;
+		}
+	}
+}
+
+static void
+nouveau_uvmm_sm_map_cleanup(struct nouveau_uvmm *uvmm,
+			    struct nouveau_uvma_prealloc *new,
+			    struct drm_gpuva_ops *ops)
+{
+	nouveau_uvmm_sm_cleanup(uvmm, new, ops, false);
+}
+
+static void
+nouveau_uvmm_sm_unmap_cleanup(struct nouveau_uvmm *uvmm,
+			      struct nouveau_uvma_prealloc *new,
+			      struct drm_gpuva_ops *ops)
+{
+	nouveau_uvmm_sm_cleanup(uvmm, new, ops, true);
+}
+
+static int
+nouveau_uvmm_validate_range(struct nouveau_uvmm *uvmm, u64 addr, u64 range)
+{
+	u64 end = addr + range;
+	u64 kernel_managed_end = uvmm->kernel_managed_addr +
+				 uvmm->kernel_managed_size;
+
+	if (addr & ~PAGE_MASK)
+		return -EINVAL;
+
+	if (range & ~PAGE_MASK)
+		return -EINVAL;
+
+	if (end <= addr)
+		return -EINVAL;
+
+	if (addr < NOUVEAU_VA_SPACE_START ||
+	    end > NOUVEAU_VA_SPACE_END)
+		return -EINVAL;
+
+	if (addr < kernel_managed_end &&
+	    end > uvmm->kernel_managed_addr)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int
+nouveau_uvmm_bind_job_alloc(struct nouveau_uvmm_bind_job **pjob)
+{
+	*pjob = kzalloc(sizeof(**pjob), GFP_KERNEL);
+	if (!*pjob)
+		return -ENOMEM;
+
+	kref_init(&(*pjob)->kref);
+
+	return 0;
+}
+
+static void
+nouveau_uvmm_bind_job_free(struct kref *kref)
+{
+	struct nouveau_uvmm_bind_job *job =
+		container_of(kref, struct nouveau_uvmm_bind_job, kref);
+
+	nouveau_job_free(&job->base);
+	kfree(job);
+}
+
+static void
+nouveau_uvmm_bind_job_get(struct nouveau_uvmm_bind_job *job)
+{
+	kref_get(&job->kref);
+}
+
+static void
+nouveau_uvmm_bind_job_put(struct nouveau_uvmm_bind_job *job)
+{
+	kref_put(&job->kref, nouveau_uvmm_bind_job_free);
+}
+
+static int
+bind_validate_op(struct nouveau_job *job,
+		 struct bind_job_op *op)
+{
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
+	struct drm_gem_object *obj = op->gem.obj;
+
+	if (op->op == OP_MAP) {
+		if (op->gem.offset & ~PAGE_MASK)
+			return -EINVAL;
+
+		if (obj->size <= op->gem.offset)
+			return -EINVAL;
+
+		if (op->va.range > (obj->size - op->gem.offset))
+			return -EINVAL;
+	}
+
+	return nouveau_uvmm_validate_range(uvmm, op->va.addr, op->va.range);
+}
+
+static void
+bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
+{
+	struct nouveau_uvmm_bind_job *bind_job;
+	struct nouveau_sched_entity *entity = job->entity;
+	struct bind_job_op *op;
+	u64 end = addr + range;
+
+again:
+	spin_lock(&entity->job.list.lock);
+	list_for_each_entry(bind_job, &entity->job.list.head, entry) {
+		list_for_each_op(op, &bind_job->ops) {
+			if (op->op == OP_UNMAP) {
+				u64 op_addr = op->va.addr;
+				u64 op_end = op_addr + op->va.range;
+
+				if (!(end <= op_addr || addr >= op_end)) {
+					nouveau_uvmm_bind_job_get(bind_job);
+					spin_unlock(&entity->job.list.lock);
+					wait_for_completion(&bind_job->complete);
+					nouveau_uvmm_bind_job_put(bind_job);
+					goto again;
+				}
+			}
+		}
+	}
+	spin_unlock(&entity->job.list.lock);
+}
+
+static int
+bind_validate_map_common(struct nouveau_job *job, u64 addr, u64 range,
+			 bool sparse)
+{
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
+	struct nouveau_uvma_region *reg;
+	u64 reg_addr, reg_end;
+	u64 end = addr + range;
+
+again:
+	nouveau_uvmm_lock(uvmm);
+	reg = nouveau_uvma_region_find_first(uvmm, addr, range);
+	if (!reg) {
+		nouveau_uvmm_unlock(uvmm);
+		return 0;
+	}
+
+	/* Generally, job submits are serialized, hence only
+	 * dirty regions can be modified concurrently.
+	 */
+	if (reg->dirty) {
+		nouveau_uvma_region_get(reg);
+		nouveau_uvmm_unlock(uvmm);
+		wait_for_completion(&reg->complete);
+		nouveau_uvma_region_put(reg);
+		goto again;
+	}
+	nouveau_uvmm_unlock(uvmm);
+
+	if (sparse)
+		return -ENOSPC;
+
+	reg_addr = reg->va.addr;
+	reg_end = reg_addr + reg->va.range;
+
+	/* Make sure the mapping is either outside of a
+	 * region or fully enclosed by a region.
+	 */
+	if (reg_addr > addr || reg_end < end)
+		return -ENOSPC;
+
+	return 0;
+}
+
+static int
+bind_validate_region(struct nouveau_job *job)
+{
+	struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(job);
+	struct bind_job_op *op;
+	int ret;
+
+	list_for_each_op(op, &bind_job->ops) {
+		u64 op_addr = op->va.addr;
+		u64 op_range = op->va.range;
+		bool sparse = false;
+
+		switch (op->op) {
+		case OP_MAP_SPARSE:
+			sparse = true;
+			bind_validate_map_sparse(job, op_addr, op_range);
+			fallthrough;
+		case OP_MAP:
+			ret = bind_validate_map_common(job, op_addr, op_range,
+						       sparse);
+			if (ret)
+				return ret;
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static void
+bind_link_gpuvas(struct drm_gpuva_ops *ops, struct nouveau_uvma_prealloc *new)
+{
+	struct drm_gpuva_op *op;
+
+	drm_gpuva_for_each_op(op, ops) {
+		switch (op->op) {
+		case DRM_GPUVA_OP_MAP:
+			drm_gpuva_link(&new->map->va);
+			break;
+		case DRM_GPUVA_OP_REMAP:
+			if (op->remap.prev)
+				drm_gpuva_link(&new->prev->va);
+			if (op->remap.next)
+				drm_gpuva_link(&new->next->va);
+			drm_gpuva_unlink(op->remap.unmap->va);
+			break;
+		case DRM_GPUVA_OP_UNMAP:
+			drm_gpuva_unlink(op->unmap.va);
+			break;
+		default:
+			break;
+		}
+	}
+}
+
+static int
+nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
+{
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
+	struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(job);
+	struct nouveau_sched_entity *entity = job->entity;
+	struct drm_exec *exec = &job->exec;
+	struct bind_job_op *op;
+	int ret;
+
+	list_for_each_op(op, &bind_job->ops) {
+		if (op->op == OP_MAP) {
+			op->gem.obj = drm_gem_object_lookup(job->file_priv,
+							    op->gem.handle);
+			if (!op->gem.obj)
+				return -ENOENT;
+		}
+
+		ret = bind_validate_op(job, op);
+		if (ret)
+			return ret;
+	}
+
+	/* If a sparse region or mapping overlaps a dirty region, we need to
+	 * wait for the region to complete the unbind process. This is due to
+	 * how page table management is currently implemented. A future
+	 * implementation might change this.
+	 */
+	ret = bind_validate_region(job);
+	if (ret)
+		return ret;
+
+	/* Once we start modifying the GPU VA space we need to keep holding the
+	 * uvmm lock until we can't fail anymore. This is due to the set of GPU
+	 * VA space changes must appear atomically and we need to be able to
+	 * unwind all GPU VA space changes on failure.
+	 */
+	nouveau_uvmm_lock(uvmm);
+	list_for_each_op(op, &bind_job->ops) {
+		switch (op->op) {
+		case OP_MAP_SPARSE:
+			ret = nouveau_uvma_region_create(uvmm,
+							 op->va.addr,
+							 op->va.range);
+			if (ret)
+				goto unwind_continue;
+
+			break;
+		case OP_UNMAP_SPARSE:
+			op->reg = nouveau_uvma_region_find(uvmm, op->va.addr,
+							   op->va.range);
+			if (!op->reg || op->reg->dirty) {
+				ret = -ENOENT;
+				goto unwind_continue;
+			}
+
+			op->ops = drm_gpuva_sm_unmap_ops_create(&uvmm->umgr,
+								op->va.addr,
+								op->va.range);
+			if (IS_ERR(op->ops)) {
+				ret = PTR_ERR(op->ops);
+				goto unwind_continue;
+			}
+
+			ret = nouveau_uvmm_sm_unmap_prepare(uvmm, &op->new,
+							    op->ops);
+			if (ret) {
+				drm_gpuva_ops_free(&uvmm->umgr, op->ops);
+				op->ops = NULL;
+				op->reg = NULL;
+				goto unwind_continue;
+			}
+
+			nouveau_uvma_region_dirty(op->reg);
+
+			break;
+		case OP_MAP: {
+			struct nouveau_uvma_region *reg;
+
+			reg = nouveau_uvma_region_find_first(uvmm,
+							     op->va.addr,
+							     op->va.range);
+			if (reg) {
+				u64 reg_addr = reg->va.addr;
+				u64 reg_end = reg_addr + reg->va.range;
+				u64 op_addr = op->va.addr;
+				u64 op_end = op_addr + op->va.range;
+
+				if (unlikely(reg->dirty)) {
+					ret = -EINVAL;
+					goto unwind_continue;
+				}
+
+				/* Make sure the mapping is either outside of a
+				 * region or fully enclosed by a region.
+				 */
+				if (reg_addr > op_addr || reg_end < op_end) {
+					ret = -ENOSPC;
+					goto unwind_continue;
+				}
+			}
+
+			op->ops = drm_gpuva_sm_map_ops_create(&uvmm->umgr,
+							      op->va.addr,
+							      op->va.range,
+							      op->gem.obj,
+							      op->gem.offset);
+			if (IS_ERR(op->ops)) {
+				ret = PTR_ERR(op->ops);
+				goto unwind_continue;
+			}
+
+			ret = nouveau_uvmm_sm_map_prepare(uvmm, &op->new,
+							  reg, op->ops,
+							  op->va.addr,
+							  op->va.range,
+							  op->flags & 0xff);
+			if (ret) {
+				drm_gpuva_ops_free(&uvmm->umgr, op->ops);
+				op->ops = NULL;
+				goto unwind_continue;
+			}
+
+			break;
+		}
+		case OP_UNMAP:
+			op->ops = drm_gpuva_sm_unmap_ops_create(&uvmm->umgr,
+								op->va.addr,
+								op->va.range);
+			if (IS_ERR(op->ops)) {
+				ret = PTR_ERR(op->ops);
+				goto unwind_continue;
+			}
+
+			ret = nouveau_uvmm_sm_unmap_prepare(uvmm, &op->new,
+							    op->ops);
+			if (ret) {
+				drm_gpuva_ops_free(&uvmm->umgr, op->ops);
+				op->ops = NULL;
+				goto unwind_continue;
+			}
+
+			break;
+		default:
+			ret = -EINVAL;
+			goto unwind_continue;
+		}
+	}
+
+	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
+			    DRM_EXEC_IGNORE_DUPLICATES);
+	drm_exec_until_all_locked(exec) {
+		list_for_each_op(op, &bind_job->ops) {
+			struct drm_gpuva_op *va_op;
+
+			if (IS_ERR_OR_NULL(op->ops))
+				continue;
+
+			drm_gpuva_for_each_op(va_op, op->ops) {
+				struct drm_gem_object *obj = op_gem_obj(va_op);
+
+				if (unlikely(!obj))
+					continue;
+
+				ret = drm_exec_prepare_obj(exec, obj, 1);
+				drm_exec_retry_on_contention(exec);
+				if (ret) {
+					op = list_last_op(&bind_job->ops);
+					goto unwind;
+				}
+			}
+		}
+	}
+
+	list_for_each_op(op, &bind_job->ops) {
+		struct drm_gpuva_op *va_op;
+
+		if (IS_ERR_OR_NULL(op->ops))
+			continue;
+
+		drm_gpuva_for_each_op(va_op, op->ops) {
+			struct drm_gem_object *obj = op_gem_obj(va_op);
+
+			if (unlikely(!obj))
+				continue;
+
+			/* Don't validate GEMs backing mappings we're about to
+			 * unmap, it's not worth the effort.
+			 */
+			if (unlikely(va_op->op == DRM_GPUVA_OP_UNMAP))
+				continue;
+
+			ret = nouveau_bo_validate(nouveau_gem_object(obj),
+						  true, false);
+			if (ret) {
+				op = list_last_op(&bind_job->ops);
+				goto unwind;
+			}
+		}
+	}
+
+	/* Link and unlink GPUVAs while holding the dma_resv lock.
+	 *
+	 * As long as we validate() all GEMs and add fences to all GEMs DMA
+	 * reservations backing map and remap operations we can be sure there
+	 * won't be any concurrent (in)validations during job execution, hence
+	 * we're safe to check drm_gpuva_invalidated() within the fence
+	 * signalling critical path without holding a separate lock.
+	 *
+	 * GPUVAs about to be unmapped are safe as well, since they're unlinked
+	 * already.
+	 *
+	 * GEMs from map and remap operations must be validated before linking
+	 * their corresponding mappings to prevent the actual PT update to
+	 * happen right away in validate() rather than asynchronously as
+	 * intended.
+	 *
+	 * Note that after linking and unlinking the GPUVAs in this loop this
+	 * function cannot fail anymore, hence there is no need for an unwind
+	 * path.
+	 */
+	list_for_each_op(op, &bind_job->ops) {
+		switch (op->op) {
+		case OP_UNMAP_SPARSE:
+		case OP_MAP:
+		case OP_UNMAP:
+			bind_link_gpuvas(op->ops, &op->new);
+			break;
+		default:
+			break;
+		}
+	}
+	nouveau_uvmm_unlock(uvmm);
+
+	spin_lock(&entity->job.list.lock);
+	list_add(&bind_job->entry, &entity->job.list.head);
+	spin_unlock(&entity->job.list.lock);
+
+	return 0;
+
+unwind_continue:
+	op = list_prev_op(op);
+unwind:
+	list_for_each_op_from_reverse(op, &bind_job->ops) {
+		switch (op->op) {
+		case OP_MAP_SPARSE:
+			nouveau_uvma_region_destroy(uvmm, op->va.addr,
+						    op->va.range);
+			break;
+		case OP_UNMAP_SPARSE:
+			__nouveau_uvma_region_insert(uvmm, op->reg);
+			nouveau_uvmm_sm_unmap_prepare_unwind(uvmm, &op->new,
+							     op->ops);
+			break;
+		case OP_MAP:
+			nouveau_uvmm_sm_map_prepare_unwind(uvmm, &op->new,
+							   op->ops,
+							   op->va.addr,
+							   op->va.range);
+			break;
+		case OP_UNMAP:
+			nouveau_uvmm_sm_unmap_prepare_unwind(uvmm, &op->new,
+							     op->ops);
+			break;
+		}
+
+		drm_gpuva_ops_free(&uvmm->umgr, op->ops);
+		op->ops = NULL;
+		op->reg = NULL;
+	}
+
+	nouveau_uvmm_unlock(uvmm);
+	drm_exec_fini(exec);
+	return ret;
+}
+
+static void
+nouveau_uvmm_bind_job_armed_submit(struct nouveau_job *job)
+{
+	struct drm_exec *exec = &job->exec;
+	struct drm_gem_object *obj;
+	unsigned long index;
+
+	drm_exec_for_each_locked_object(exec, index, obj)
+		dma_resv_add_fence(obj->resv, job->done_fence, job->resv_usage);
+
+	drm_exec_fini(exec);
+}
+
+static struct dma_fence *
+nouveau_uvmm_bind_job_run(struct nouveau_job *job)
+{
+	struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(job);
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
+	struct bind_job_op *op;
+	int ret = 0;
+
+	list_for_each_op(op, &bind_job->ops) {
+		switch (op->op) {
+		case OP_MAP_SPARSE:
+			/* noop */
+			break;
+		case OP_MAP:
+			ret = nouveau_uvmm_sm_map(uvmm, &op->new, op->ops);
+			if (ret)
+				goto out;
+			break;
+		case OP_UNMAP_SPARSE:
+			fallthrough;
+		case OP_UNMAP:
+			ret = nouveau_uvmm_sm_unmap(uvmm, &op->new, op->ops);
+			if (ret)
+				goto out;
+			break;
+		}
+	}
+
+out:
+	if (ret)
+		NV_PRINTK(err, job->cli, "bind job failed: %d\n", ret);
+	return ERR_PTR(ret);
+}
+
+static void
+nouveau_uvmm_bind_job_free_work_fn(struct work_struct *work)
+{
+	struct nouveau_uvmm_bind_job *bind_job =
+		container_of(work, struct nouveau_uvmm_bind_job, work);
+	struct nouveau_job *job = &bind_job->base;
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
+	struct nouveau_sched_entity *entity = job->entity;
+	struct bind_job_op *op, *next;
+
+	list_for_each_op(op, &bind_job->ops) {
+		struct drm_gem_object *obj = op->gem.obj;
+
+		/* When nouveau_uvmm_bind_job_submit() fails op->ops and op->reg
+		 * will be NULL, hence skip the cleanup.
+		 */
+		switch (op->op) {
+		case OP_MAP_SPARSE:
+			/* noop */
+			break;
+		case OP_UNMAP_SPARSE:
+			if (!IS_ERR_OR_NULL(op->ops))
+				nouveau_uvmm_sm_unmap_cleanup(uvmm, &op->new,
+							      op->ops);
+
+			if (op->reg) {
+				nouveau_uvma_region_sparse_unref(op->reg);
+				nouveau_uvmm_lock(uvmm);
+				nouveau_uvma_region_remove(op->reg);
+				nouveau_uvmm_unlock(uvmm);
+				nouveau_uvma_region_complete(op->reg);
+				nouveau_uvma_region_put(op->reg);
+			}
+
+			break;
+		case OP_MAP:
+			if (!IS_ERR_OR_NULL(op->ops))
+				nouveau_uvmm_sm_map_cleanup(uvmm, &op->new,
+							    op->ops);
+			break;
+		case OP_UNMAP:
+			if (!IS_ERR_OR_NULL(op->ops))
+				nouveau_uvmm_sm_unmap_cleanup(uvmm, &op->new,
+							      op->ops);
+			break;
+		}
+
+		if (!IS_ERR_OR_NULL(op->ops))
+			drm_gpuva_ops_free(&uvmm->umgr, op->ops);
+
+		if (obj)
+			drm_gem_object_put(obj);
+	}
+
+	spin_lock(&entity->job.list.lock);
+	list_del(&bind_job->entry);
+	spin_unlock(&entity->job.list.lock);
+
+	complete_all(&bind_job->complete);
+	wake_up(&entity->job.wq);
+
+	/* Remove and free ops after removing the bind job from the job list to
+	 * avoid races against bind_validate_map_sparse().
+	 */
+	list_for_each_op_safe(op, next, &bind_job->ops) {
+		list_del(&op->entry);
+		kfree(op);
+	}
+
+	nouveau_uvmm_bind_job_put(bind_job);
+}
+
+static void
+nouveau_uvmm_bind_job_free_qwork(struct nouveau_job *job)
+{
+	struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(job);
+	struct nouveau_sched_entity *entity = job->entity;
+
+	nouveau_sched_entity_qwork(entity, &bind_job->work);
+}
+
+static struct nouveau_job_ops nouveau_bind_job_ops = {
+	.submit = nouveau_uvmm_bind_job_submit,
+	.armed_submit = nouveau_uvmm_bind_job_armed_submit,
+	.run = nouveau_uvmm_bind_job_run,
+	.free = nouveau_uvmm_bind_job_free_qwork,
+};
+
+static int
+bind_job_op_from_uop(struct bind_job_op **pop,
+		     struct drm_nouveau_vm_bind_op *uop)
+{
+	struct bind_job_op *op;
+
+	op = *pop = kzalloc(sizeof(*op), GFP_KERNEL);
+	if (!op)
+		return -ENOMEM;
+
+	switch (uop->op) {
+	case OP_MAP:
+		op->op = uop->flags & DRM_NOUVEAU_VM_BIND_SPARSE ?
+			 OP_MAP_SPARSE : OP_MAP;
+		break;
+	case OP_UNMAP:
+		op->op = uop->flags & DRM_NOUVEAU_VM_BIND_SPARSE ?
+			 OP_UNMAP_SPARSE : OP_UNMAP;
+		break;
+	default:
+		op->op = uop->op;
+		break;
+	}
+
+	op->flags = uop->flags;
+	op->va.addr = uop->addr;
+	op->va.range = uop->range;
+	op->gem.handle = uop->handle;
+	op->gem.offset = uop->bo_offset;
+
+	return 0;
+}
+
+static void
+bind_job_ops_free(struct list_head *ops)
+{
+	struct bind_job_op *op, *next;
+
+	list_for_each_op_safe(op, next, ops) {
+		list_del(&op->entry);
+		kfree(op);
+	}
+}
+
+static int
+nouveau_uvmm_bind_job_init(struct nouveau_uvmm_bind_job **pjob,
+			   struct nouveau_uvmm_bind_job_args *__args)
+{
+	struct nouveau_uvmm_bind_job *job;
+	struct nouveau_job_args args = {};
+	struct bind_job_op *op;
+	int i, ret;
+
+	ret = nouveau_uvmm_bind_job_alloc(&job);
+	if (ret)
+		return ret;
+
+	INIT_LIST_HEAD(&job->ops);
+	INIT_LIST_HEAD(&job->entry);
+
+	for (i = 0; i < __args->op.count; i++) {
+		ret = bind_job_op_from_uop(&op, &__args->op.s[i]);
+		if (ret)
+			goto err_free;
+
+		list_add_tail(&op->entry, &job->ops);
+	}
+
+	init_completion(&job->complete);
+	INIT_WORK(&job->work, nouveau_uvmm_bind_job_free_work_fn);
+
+	args.sched_entity = __args->sched_entity;
+	args.file_priv = __args->file_priv;
+
+	args.in_sync.count = __args->in_sync.count;
+	args.in_sync.s = __args->in_sync.s;
+
+	args.out_sync.count = __args->out_sync.count;
+	args.out_sync.s = __args->out_sync.s;
+
+	args.sync = !(__args->flags & DRM_NOUVEAU_VM_BIND_RUN_ASYNC);
+	args.ops = &nouveau_bind_job_ops;
+	args.resv_usage = DMA_RESV_USAGE_BOOKKEEP;
+
+	ret = nouveau_job_init(&job->base, &args);
+	if (ret)
+		goto err_free;
+
+	*pjob = job;
+	return 0;
+
+err_free:
+	bind_job_ops_free(&job->ops);
+	kfree(job);
+	*pjob = NULL;
+
+	return ret;
+}
+
+int
+nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
+			   void *data,
+			   struct drm_file *file_priv)
+{
+	struct nouveau_cli *cli = nouveau_cli(file_priv);
+	struct drm_nouveau_vm_init *init = data;
+
+	return nouveau_uvmm_init(&cli->uvmm, cli, init->kernel_managed_addr,
+				 init->kernel_managed_size);
+}
+
+static int
+nouveau_uvmm_vm_bind(struct nouveau_uvmm_bind_job_args *args)
+{
+	struct nouveau_uvmm_bind_job *job;
+	int ret;
+
+	ret = nouveau_uvmm_bind_job_init(&job, args);
+	if (ret)
+		return ret;
+
+	ret = nouveau_job_submit(&job->base);
+	if (ret)
+		goto err_job_fini;
+
+	return 0;
+
+err_job_fini:
+	nouveau_job_fini(&job->base);
+	return ret;
+}
+
+static int
+nouveau_uvmm_vm_bind_ucopy(struct nouveau_uvmm_bind_job_args *args,
+			   struct drm_nouveau_vm_bind __user *req)
+{
+	struct drm_nouveau_sync **s;
+	u32 inc = req->wait_count;
+	u64 ins = req->wait_ptr;
+	u32 outc = req->sig_count;
+	u64 outs = req->sig_ptr;
+	u32 opc = req->op_count;
+	u64 ops = req->op_ptr;
+	int ret;
+
+	args->flags = req->flags;
+
+	if (opc) {
+		args->op.count = opc;
+		args->op.s = u_memcpya(ops, opc,
+				       sizeof(*args->op.s));
+		if (IS_ERR(args->op.s))
+			return PTR_ERR(args->op.s);
+	}
+
+	if (inc) {
+		s = &args->in_sync.s;
+
+		args->in_sync.count = inc;
+		*s = u_memcpya(ins, inc, sizeof(**s));
+		if (IS_ERR(*s)) {
+			ret = PTR_ERR(*s);
+			goto err_free_ops;
+		}
+	}
+
+	if (outc) {
+		s = &args->out_sync.s;
+
+		args->out_sync.count = outc;
+		*s = u_memcpya(outs, outc, sizeof(**s));
+		if (IS_ERR(*s)) {
+			ret = PTR_ERR(*s);
+			goto err_free_ins;
+		}
+	}
+
+	return 0;
+
+err_free_ops:
+	u_free(args->op.s);
+err_free_ins:
+	u_free(args->in_sync.s);
+	return ret;
+}
+
+static void
+nouveau_uvmm_vm_bind_ufree(struct nouveau_uvmm_bind_job_args *args)
+{
+	u_free(args->op.s);
+	u_free(args->in_sync.s);
+	u_free(args->out_sync.s);
+}
+
+int
+nouveau_uvmm_ioctl_vm_bind(struct drm_device *dev,
+			   void __user *data,
+			   struct drm_file *file_priv)
+{
+	struct nouveau_cli *cli = nouveau_cli(file_priv);
+	struct nouveau_uvmm_bind_job_args args = {};
+	struct drm_nouveau_vm_bind __user *req = data;
+	int ret = 0;
+
+	if (unlikely(!nouveau_cli_uvmm_locked(cli)))
+		return -ENOSYS;
+
+	ret = nouveau_uvmm_vm_bind_ucopy(&args, req);
+	if (ret)
+		return ret;
+
+	args.sched_entity = &cli->sched_entity;
+	args.file_priv = file_priv;
+
+	ret = nouveau_uvmm_vm_bind(&args);
+	if (ret)
+		goto out_free_args;
+
+out_free_args:
+	nouveau_uvmm_vm_bind_ufree(&args);
+	return ret;
+}
+
+void
+nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbo, struct nouveau_mem *mem)
+{
+	struct drm_gem_object *obj = &nvbo->bo.base;
+	struct drm_gpuva *va;
+
+	dma_resv_assert_held(obj->resv);
+
+	drm_gem_for_each_gpuva(va, obj) {
+		struct nouveau_uvma *uvma = uvma_from_va(va);
+
+		nouveau_uvma_map(uvma, mem);
+		drm_gpuva_invalidate(va, false);
+	}
+}
+
+void
+nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
+{
+	struct drm_gem_object *obj = &nvbo->bo.base;
+	struct drm_gpuva *va;
+
+	dma_resv_assert_held(obj->resv);
+
+	drm_gem_for_each_gpuva(va, obj) {
+		struct nouveau_uvma *uvma = uvma_from_va(va);
+
+		nouveau_uvma_unmap(uvma);
+		drm_gpuva_invalidate(va, true);
+	}
+}
+
+int
+nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
+		  u64 kernel_managed_addr, u64 kernel_managed_size)
+{
+	int ret;
+	u64 kernel_managed_end = kernel_managed_addr + kernel_managed_size;
+
+	mutex_init(&uvmm->mutex);
+	dma_resv_init(&uvmm->resv);
+	mt_init_flags(&uvmm->region_mt, MT_FLAGS_LOCK_EXTERN);
+	mt_set_external_lock(&uvmm->region_mt, &uvmm->mutex);
+
+	mutex_lock(&cli->mutex);
+
+	if (unlikely(cli->uvmm.disabled)) {
+		ret = -ENOSYS;
+		goto out_unlock;
+	}
+
+	if (kernel_managed_end <= kernel_managed_addr) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (kernel_managed_end > NOUVEAU_VA_SPACE_END) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	uvmm->kernel_managed_addr = kernel_managed_addr;
+	uvmm->kernel_managed_size = kernel_managed_size;
+
+	drm_gpuva_manager_init(&uvmm->umgr, cli->name,
+			       NOUVEAU_VA_SPACE_START,
+			       NOUVEAU_VA_SPACE_END,
+			       kernel_managed_addr, kernel_managed_size,
+			       NULL);
+
+	ret = nvif_vmm_ctor(&cli->mmu, "uvmm",
+			    cli->vmm.vmm.object.oclass, RAW,
+			    kernel_managed_addr, kernel_managed_size,
+			    NULL, 0, &cli->uvmm.vmm.vmm);
+	if (ret)
+		goto out_free_gpuva_mgr;
+
+	cli->uvmm.vmm.cli = cli;
+	mutex_unlock(&cli->mutex);
+
+	return 0;
+
+out_free_gpuva_mgr:
+	drm_gpuva_manager_destroy(&uvmm->umgr);
+out_unlock:
+	mutex_unlock(&cli->mutex);
+	return ret;
+}
+
+void
+nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
+{
+	MA_STATE(mas, &uvmm->region_mt, 0, 0);
+	struct nouveau_uvma_region *reg;
+	struct nouveau_cli *cli = uvmm->vmm.cli;
+	struct nouveau_sched_entity *entity = &cli->sched_entity;
+	struct drm_gpuva *va, *next;
+
+	if (!cli)
+		return;
+
+	rmb(); /* for list_empty to work without lock */
+	wait_event(entity->job.wq, list_empty(&entity->job.list.head));
+
+	nouveau_uvmm_lock(uvmm);
+	drm_gpuva_for_each_va_safe(va, next, &uvmm->umgr) {
+		struct nouveau_uvma *uvma = uvma_from_va(va);
+		struct drm_gem_object *obj = va->gem.obj;
+
+		if (unlikely(va == &uvmm->umgr.kernel_alloc_node))
+			continue;
+
+		drm_gpuva_remove(va);
+
+		dma_resv_lock(obj->resv, NULL);
+		drm_gpuva_unlink(va);
+		dma_resv_unlock(obj->resv);
+
+		nouveau_uvma_unmap(uvma);
+		nouveau_uvma_vmm_put(uvma);
+
+		nouveau_uvma_gem_put(uvma);
+		nouveau_uvma_free(uvma);
+	}
+
+	mas_for_each(&mas, reg, ULONG_MAX) {
+		mas_erase(&mas);
+		nouveau_uvma_region_sparse_unref(reg);
+		nouveau_uvma_region_put(reg);
+	}
+
+	WARN(!mtree_empty(&uvmm->region_mt),
+	     "nouveau_uvma_region tree not empty, potentially leaking memory.");
+	__mt_destroy(&uvmm->region_mt);
+	nouveau_uvmm_unlock(uvmm);
+
+	mutex_lock(&cli->mutex);
+	nouveau_vmm_fini(&uvmm->vmm);
+	drm_gpuva_manager_destroy(&uvmm->umgr);
+	mutex_unlock(&cli->mutex);
+
+	dma_resv_fini(&uvmm->resv);
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
new file mode 100644
index 000000000000..3923c03012f9
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __NOUVEAU_UVMM_H__
+#define __NOUVEAU_UVMM_H__
+
+#include <drm/drm_gpuva_mgr.h>
+
+#include "nouveau_drv.h"
+
+struct nouveau_uvmm {
+	struct nouveau_vmm vmm;
+	struct drm_gpuva_manager umgr;
+	struct maple_tree region_mt;
+	struct mutex mutex;
+	struct dma_resv resv;
+
+	u64 kernel_managed_addr;
+	u64 kernel_managed_size;
+
+	bool disabled;
+};
+
+struct nouveau_uvma_region {
+	struct nouveau_uvmm *uvmm;
+
+	struct {
+		u64 addr;
+		u64 range;
+	} va;
+
+	struct kref kref;
+
+	struct completion complete;
+	bool dirty;
+};
+
+struct nouveau_uvma {
+	struct drm_gpuva va;
+
+	struct nouveau_uvmm *uvmm;
+	struct nouveau_uvma_region *region;
+
+	u8 kind;
+};
+
+struct nouveau_uvmm_bind_job {
+	struct nouveau_job base;
+
+	struct kref kref;
+	struct list_head entry;
+	struct work_struct work;
+	struct completion complete;
+
+	/* struct bind_job_op */
+	struct list_head ops;
+};
+
+struct nouveau_uvmm_bind_job_args {
+	struct drm_file *file_priv;
+	struct nouveau_sched_entity *sched_entity;
+
+	unsigned int flags;
+
+	struct {
+		struct drm_nouveau_sync *s;
+		u32 count;
+	} in_sync;
+
+	struct {
+		struct drm_nouveau_sync *s;
+		u32 count;
+	} out_sync;
+
+	struct {
+		struct drm_nouveau_vm_bind_op *s;
+		u32 count;
+	} op;
+};
+
+#define to_uvmm_bind_job(job) container_of((job), struct nouveau_uvmm_bind_job, base)
+
+#define uvmm_from_mgr(x) container_of((x), struct nouveau_uvmm, umgr)
+#define uvma_from_va(x) container_of((x), struct nouveau_uvma, va)
+
+int nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
+		      u64 kernel_managed_addr, u64 kernel_managed_size);
+void nouveau_uvmm_fini(struct nouveau_uvmm *uvmm);
+
+void nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbov, struct nouveau_mem *mem);
+void nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo);
+
+int nouveau_uvmm_ioctl_vm_init(struct drm_device *dev, void __user *data,
+			       struct drm_file *file_priv);
+
+int nouveau_uvmm_ioctl_vm_bind(struct drm_device *dev, void __user *data,
+			       struct drm_file *file_priv);
+
+static inline void nouveau_uvmm_lock(struct nouveau_uvmm *uvmm)
+{
+	mutex_lock(&uvmm->mutex);
+}
+
+static inline void nouveau_uvmm_unlock(struct nouveau_uvmm *uvmm)
+{
+	mutex_unlock(&uvmm->mutex);
+}
+
+#endif
-- 
2.41.0

