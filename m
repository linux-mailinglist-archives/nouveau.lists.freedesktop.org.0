Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B9EBBF63F
	for <lists+nouveau@lfdr.de>; Mon, 06 Oct 2025 22:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525F810E4D0;
	Mon,  6 Oct 2025 20:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hsy374JS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5B010E452
 for <nouveau@lists.freedesktop.org>; Mon,  6 Oct 2025 19:14:25 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-421851bcb25so2922090f8f.2
 for <nouveau@lists.freedesktop.org>; Mon, 06 Oct 2025 12:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759778064; x=1760382864; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rTAULiuztj0Agha/BlSN2X8C2BFYZNs5crXxh++Rvjg=;
 b=Hsy374JSR/OFi6oFAYdfK+cFQLLuK18OKiE4yxebmIHl9MMXy9pgvrR55bHKLDv3m7
 c6AjF6jSXp4LtvKLSdgT98sMi02EKP6EyOgCaIwJbLjS4408AagFowB1uK95WZTXt9k7
 iHSP2pca45HrmC535xBpSCKG5Z1cdO+85jlKkHToOXGZdfnhEqKNDkjZv+C7/HN3j6n8
 l426sU76BN3DzzAnugy/89TwXQgjMVo5D51RIzFMuW3PGV3d+ibwIrklWhbBI4FnmKZN
 d/nhtM6cUBNs+Q/nAgDZaxp8ii85/etEor0mXwWeTFIwt0hH2pr/35EHtFig6yBrmIon
 FONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759778064; x=1760382864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rTAULiuztj0Agha/BlSN2X8C2BFYZNs5crXxh++Rvjg=;
 b=s13l4SJ3N/9KTj0W2eu8AEh5MujZR9pHs55fbTEoem4GnzDgvQk6YtvR48pxDXxA1P
 fBUt0ECQLJhzFSdVhRBNxbmx4MJjIK8RYkGgMDAraq6936SPd9xMZpjIK8NxNgkL8jIY
 vnINfMx/5p6aGLn5C1qO9RGdOZKwKPaPHMw5j2lC3P+Np3bAszdUoCeK6J7rLhzCqzOz
 3kIoIkB6df7MnLyDSvaZ/Rzi1Slsdb5lNAreTa8k4LmQ8Y4FIAyygm8qzNO/COV0zaf1
 1mwv9Odic7/Mk5HYrI49FKLyi8lPMfo3XZoxrbdEtsN0vAJjvX2juxUSI+FoPgkc022+
 niKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiiQJEb0CQ/SStmYPxCTHi/OO/FsEZNiOBGiPOTtIphObGFLTDpy8I9OE0W6j1snIHB7ExIkF3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS1JiUEhEOuJMfHDA/DNzCbCyu1ookkwMaj9/9E3kOaJdDOoRV
 QMh/fwZToYq9zlI2sBiOvMp3u/M8Z397ljFZToRrBVbfCxH4xvW/Y5t2
X-Gm-Gg: ASbGncsN0jqfE7OgSRaK53YfjFBA+f6WuF9mT4M+HtTW8V/RgBYX2AhKjYGD62b0RL3
 V8yZ2clZh4+WOrjLK/pOZOaiJ1cMmxLjjsCjAHL/PWme1hmwhK27QBsxAK+CMQHcKUE/LEqB8XW
 JJ6KAhof9vCFWgc4N3jaJffyNoVLA7Y34Da5eFTDPGsvNeqpIRI+ol9j8Z7TBgtu7i3aXhtsAV5
 /uzfdkT13jQC//YxX2qzg7PPJI6qsA9VkwbbkRMsp+4Prr5ms3Dfwvh3L4vgKhTDg8D61g9vLzb
 UElVoQ62sQ+DWLLT08gWSv4hmVrW8JL2sX+sIGZONIulVHJIdarADfTWFzLw1iMhYmhyqiKiZ1J
 +Zl7QwpixHG1tRHD0NfY2Qtiy7RvErP6lJk9FnIe6htZiacVm5rpQ6kPdSg==
X-Google-Smtp-Source: AGHT+IFxV7him0HZhacECWXwTdjy1PuaFOX6jioW6BihS5lIl+hV4dVQt7up8H4JJKnMcGudT+WEzQ==
X-Received: by 2002:a05:6000:2003:b0:3ec:ea73:a91e with SMTP id
 ffacd0b85a97d-4256712a61bmr9129477f8f.12.1759778063608; 
 Mon, 06 Oct 2025 12:14:23 -0700 (PDT)
Received: from fedora ([154.182.208.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4256866060fsm16646435f8f.14.2025.10.06.12.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 12:14:22 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org
Subject: [PATCH 4/5] drm/nouveau/mmu/tu102: Add support for compressed kinds
Date: Mon,  6 Oct 2025 22:13:27 +0300
Message-ID: <20251006191329.277485-5-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
References: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Oct 2025 20:49:11 +0000
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

