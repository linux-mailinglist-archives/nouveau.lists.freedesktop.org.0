Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06D8BCB361
	for <lists+nouveau@lfdr.de>; Fri, 10 Oct 2025 01:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726CF10EB33;
	Thu,  9 Oct 2025 23:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G4IXJ65N";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A0B10EB33
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 23:39:46 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-46e6674caa5so8129685e9.0
 for <nouveau@lists.freedesktop.org>; Thu, 09 Oct 2025 16:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760053185; x=1760657985; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61fl0QmalDC2B70Ur7984Y98C8MPZlXSrMQqbp1jaho=;
 b=G4IXJ65N+zYrqICVzkwRVUlWpySqr9iOI+P0Wwkpcea/njOnpcf5+hEJ9w3yctf4Vp
 w2yGCbX/GorlfkhnolBvjxa7+zNYhpQcgum5XgSLBc2sCqyXQJf2IDUZto1E5T1O/wsv
 2nrnf9/i2q9VhVAgBlM/sAic28a3lrru4S7LlCPLrzjONquZqwi50RCXc0dtSsnpudvR
 N74kgrdt6iac0nTglWf4rnnRSUA7md+hPUK5ajUkgFYtpdUkIJNT/wx5m5Sxlj8PbgeH
 UBO+2KTReQvjBeij+JMvbikvB+LJTMdD8cI4JeZkg3Njb/IjZ4WwqvkSdNM2MzZyV1MC
 W/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760053185; x=1760657985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=61fl0QmalDC2B70Ur7984Y98C8MPZlXSrMQqbp1jaho=;
 b=CqEfXPNpHeae0lCR4g5YDnY9hBfNCX7b3TbKWSMrtfzVtLoo/8K3htAZqDkXIpWAW7
 Aq2xs1Vsdji9SyKQMJcZpsiOmIZCFAI+twZ+pGFCUSSaKRO5FiZe02oUoQZFqhorinhC
 3hR4MAQmij8Ss5+r60xbyLP9rf6cH4Ukw/zVxJsFSy9QuGQFgxRwJFG5Y7MAtleTh1ru
 6eTPpSXxlYAWuCJfy29luTltwoW2JMuYetpdTAHpkYB0Vp24MdiiyoC1cA8XC2AqWLjn
 BfI3ee4+Z0CPRz+zjt/fYmlrJfccmbnLxaWzY78vGIXpgOE5etlE/fHPN4plrtJT9aR7
 rPKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMQdMhKgPkKR1Gqeg7eNq9FcgfgiUGPTFiFvjW87QszSJcgeLsHL2x38NOfvKwSCOgx0kSVnqj@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2iaUrTmpWhXOOzc9ef+3BUiEWHecH5AT2eaTZiZLmU9Y2D7jt
 k4NMh+hsnDvTirNf/+il45Z3UBIBArLTMS07k241WuejoqnG1sCEKGLBoPh7kg==
X-Gm-Gg: ASbGncspbUZSPIVkBv8g/G8UKrylLEgrQubTCRs2MxWmBPH3SCzvIbDEb+OL1ZSBsCP
 0cE7rC2w/WYkcBeSZqpzL2qjtmOMGHBvl/yFQSGIDeCz+zppRFrRZ6f4ouKmAo37C3pvWiaRWmU
 LTLTxzAIIwdazPjO/R0pqXNQF+xEJqqOB2Pe7zp8GtIQBvxS+RVPQs66HpvMaxOMuSrYEr6DVvc
 yD2jKQPcS49WvW/FXz0CFNF0RnFqLNtPnwpypHR+op+z9oM0yE3xHLb6mRoGToRGhKXwIJNiSfm
 AbhBbRyk+TbjI9zr7I6iA05f5XkeSEl1CpHiXsU1vQhywyXvVcpAqM7iNQqGbx8kTcOi+Mj6r/I
 6V9jCRBq9mDDyN7hII9uoJ5xNpVl0wyP+tYYZfj9eSAAZOXAz0mfc
X-Google-Smtp-Source: AGHT+IGKhAP1SwjKQyd4gXEeUKmnVqILTkgIT5bozEqWpm87eGAj421N2AI9bjTAYBj21oh0zBP4/Q==
X-Received: by 2002:a05:600d:4384:b0:46e:6d12:ee2a with SMTP id
 5b1f17b1804b1-46fa29f5e70mr60200355e9.16.1760053185395; 
 Thu, 09 Oct 2025 16:39:45 -0700 (PDT)
Received: from fedora ([41.45.27.42]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3e3206sm46066075e9.4.2025.10.09.16.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 16:39:43 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@nvidia.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH 4/5] drm/nouveau/mmu/tu102: Add support for compressed kinds
Date: Fri, 10 Oct 2025 02:38:36 +0300
Message-ID: <20251009233837.10283-5-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
References: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@nvidia.com>

Allow compressed PTE kinds to be written into PTEs when GSP-RM is
present, rather than reverting to their non-compressed versions.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 46 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index ecff1096a1bb..ed15a4475181 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -109,12 +109,34 @@ gp100_vmm_pgt_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 	nvkm_done(pt->memory);
 }
 
+static inline u64
+gp100_vmm_comptag_nr(u64 size)
+{
+	return size >> 16; /* One comptag per 64KiB VRAM. */
+}
+
+static inline u64
+gp100_vmm_pte_comptagline_base(u64 addr)
+{
+	/* RM allocates enough comptags for all of VRAM, so use a 1:1 mapping. */
+	return (1 + gp100_vmm_comptag_nr(addr)) << 36; /* NV_MMU_VER2_PTE_COMPTAGLINE */
+}
+
+static inline u64
+gp100_vmm_pte_comptagline_incr(u32 page_size)
+{
+	return gp100_vmm_comptag_nr(page_size) << 36; /* NV_MMU_VER2_PTE_COMPTAGLINE */
+}
+
 static inline void
 gp100_vmm_pgt_pte(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 		  u32 ptei, u32 ptes, struct nvkm_vmm_map *map, u64 addr)
 {
 	u64 data = (addr >> 4) | map->type;
 
+	if (map->ctag)
+		data |= gp100_vmm_pte_comptagline_base(addr);
+
 	while (ptes--) {
 		VMM_WO064(pt, vmm, ptei++ * 8, data);
 		data += map->next;
@@ -195,6 +217,9 @@ gp100_vmm_pd0_pte(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 {
 	u64 data = (addr >> 4) | map->type;
 
+	if (map->ctag)
+		data |= gp100_vmm_pte_comptagline_base(addr);
+
 	while (ptes--) {
 		VMM_WO128(pt, vmm, ptei++ * 0x10, data, 0ULL);
 		data += map->next;
@@ -440,9 +465,26 @@ gp100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 		return -EINVAL;
 	}
 
+	/* Handle compression. */
 	if (kindm[kind] != kind) {
-		/* Revert to non-compressed kind. */
-		kind = kindm[kind];
+		struct nvkm_device *device = vmm->mmu->subdev.device;
+
+		/* Compression is only supported when using GSP-RM, as
+		 * PMU firmware is required in order to initialise the
+		 * compbit backing store.
+		 */
+		if (nvkm_gsp_rm(device->gsp)) {
+			/* Turing GPUs require PTE_COMPTAGLINE to be filled,
+			 * in addition to specifying a compressed kind.
+			 */
+			if (device->card_type < GA100) {
+				map->ctag  = gp100_vmm_pte_comptagline_incr(1 << map->page->shift);
+				map->next |= map->ctag;
+			}
+		} else {
+			/* Revert to non-compressed kind. */
+			kind = kindm[kind];
+		}
 	}
 
 	map->type |= BIT(0);
-- 
2.51.0

