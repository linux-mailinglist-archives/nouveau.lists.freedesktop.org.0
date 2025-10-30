Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CE6C22A12
	for <lists+nouveau@lfdr.de>; Fri, 31 Oct 2025 00:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B4710EA70;
	Thu, 30 Oct 2025 23:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kafyQLw/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34DC10EA74
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 23:04:37 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so12230885e9.3
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 16:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761865476; x=1762470276; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zzdi8nfSSs1sZofLN+Os1wqi0upcCWxbMTjLpxylR+I=;
 b=kafyQLw/cqEwA/BZAYCNlLbXNyVn/WO3k0OjJ6HE9qe08FRAtYSt+DHQSyrJwL5oxA
 aAvb4fdbrW1djjfG2hmVcQblqg/VJ86nwNapZBGU5CN8wXzvIhQZ1RxzdsqD6T7DlA7D
 idco6MEp53thilHSxBf5BB4t7qAFrwIYD0/gCF+H5aefMbbME+r5NQHmVg3E93BtN0RT
 mF1aEa3dhHjgcTZjLZ1Bw4bjNiAsrm7yp26YtDZdjx7wwzX41MXqwtuRXto/+pUKMHp9
 FbEOYfpgQSOzWyJkFQqi07i4Qdex6FBGxIPMRvzVits+Bl3QRnUhhHdPROBJqsNXE+F8
 bX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761865476; x=1762470276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zzdi8nfSSs1sZofLN+Os1wqi0upcCWxbMTjLpxylR+I=;
 b=FWrW4pTc67EQ3tNhGNzGaxNgUYlUly0pkXfZ2ZCs3KWir5LwhxlVSyxVYM4252Txel
 hCoWHT17jvDkmS1aLAL2CTbDJ+07BHIZI3jyNk4hABELxoOSYo6CjBzxbvAh7OHR4Z8S
 M804cKn3AMtqD1IRHEOl9vSHOAanuliURx5gY1b3m8sb4wao5SDq1f9yPLUoJz6ImEUn
 hJweaJhuIgX8dStIxnXkn7D5ui7rDhU9vh3qQ4wAgnx10slfhWGHBc4yhRlUqwCUyZdD
 Qj+robj+rLSrK4huHD9QXHZpu8isParR8i8HLb6Gd2khswRBNBpVdFuBcwzbyWv1AvHe
 MVgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZOkEptilxfRuLFgXXOw3XMMxOJv4GZHEyHGPpPvJ/pPEhEJq0RXOQURFeLlV2sm+ptaJBV2tz@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmohyhSak9fQnes/C/jTdpO9bSt0UBTxFOB/8fG1NVl8huhnL8
 XxFgRpueEy+4snPlsTysCMdLwF3P7Ug3fBS5yWW9TapoBzerbAs910Kl
X-Gm-Gg: ASbGncuqefZkZ7AxXFBjcCtvI61ojHxKD1xVAF2xeuwA8u+Zm6hywZ/kjNwP5CTLwji
 MzJaEPG6sj4VKPRIo8nLWemx0JDZUa9NqLrfJUbakT3eQnRWkLXXggZT7rPWCN+bxLmxgBSp9tU
 AWtRCcQdpI6vDSkh7fWw425CVWL/bmw0ox+GSMPOm+vTM60fWd7BDJ7DBMOpONY/P42+e/aJNFy
 4aARVfPGdEV8hgnX45q9mUNU74WjS3yn9bfYu+g7ASt9qIqLTARieU0f1ryJZl9xRsWLeIFke4b
 +jSvgF5b82Wds9uwP1XoX1W9327de68NFa1BR1XDE+z90PRWt4apXWy1szmkLpVGxdoZipl7vx7
 J1MMRb05aG++c2r9wwaeTd6RQVrfc66f3SDZXswKgtP1Rmk02MZJEpEydckfZ8WgZw0HUhbOivL
 BUlTdIDuKCIMU=
X-Google-Smtp-Source: AGHT+IF1so7IsZ9CcfqAXskg5gm7+8a7SRpdoFYm2WfU1UNPEHE0EN5YGGHblVJH7Zxh/5bqtSuH+Q==
X-Received: by 2002:a05:600c:8706:b0:45f:2922:2aef with SMTP id
 5b1f17b1804b1-477308b0a8bmr14151015e9.28.1761865475936; 
 Thu, 30 Oct 2025 16:04:35 -0700 (PDT)
Received: from fedora ([154.182.161.198]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732ff8235sm2227025e9.14.2025.10.30.16.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 16:04:35 -0700 (PDT)
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
Subject: [PATCH v3 4/5] drm/nouveau/mmu/tu102: Add support for compressed kinds
Date: Fri, 31 Oct 2025 01:03:56 +0200
Message-ID: <20251030230357.45070-5-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
References: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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
2.51.1

