Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F74413C4ED
	for <lists+nouveau@lfdr.de>; Wed, 15 Jan 2020 15:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC5F6EA23;
	Wed, 15 Jan 2020 14:08:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA656EA23
 for <nouveau@lists.freedesktop.org>; Wed, 15 Jan 2020 14:08:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y11so15870565wrt.6
 for <nouveau@lists.freedesktop.org>; Wed, 15 Jan 2020 06:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zOG3gslUIp2aajc8ofWEsgmTDRhGhvfYrKvkK7j/6Cw=;
 b=VDr6tDsOaWkIeJlYFoMPymy5qsLBZl/eUIpJuBCHCa2sV92O3e5g4s4ZI5FX41IL0K
 xSl9VelfzbqKmzLD12LG8Hjvwxm/YKJG7fsaHEKnrA5AwcanB3yQdcykj1nPz4A61lak
 fLrH7PL4+AlRliUHWVuhE4DSOv4TSuVAsQFUzmY8Xa79GSfQasExNbRYdzB6SQwVqjS/
 VYjybPGGUpUnE7CMPb61T3XNJDCFdIhB/VTuggXY5AbBKZBxVrA9u8/NrwH+lwjK+sNu
 oLacQysoTmyhNKswBtAPsqlXmu4Cm8UVtQzu9FwP4/zPPCirypytaWpqfAWbCSkLVbb9
 HwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zOG3gslUIp2aajc8ofWEsgmTDRhGhvfYrKvkK7j/6Cw=;
 b=VSAsD8qjl2/q7cPdb4Hd9MKENcy1STCqbh5orcJ8nb+EdO+Ae9IjfddMwr6uuUFbZr
 8PGCS8KSvlnBQwUNONW31dqcJfGkCaQO+gtc9XeQF+QOeT08CdHez7MRMkFhAcQmfahL
 GcnANkIN3/BB/bozMJhMYx8gQ/3uw9fwb7sUKVl+UaYcznJH3T2+j+27K+48vO49rGfc
 Aa4eCiYbz+B0DybpkdlU7/k1d0SPt8m2rhI34k10d5c3BCVQ7BD6SqexbC3PDMeyVPGU
 4CbaPGf9IsvJA1tSq243+NM0qaVIxioewJ+WBlsp0sYB+1Cwi+4FHVipq3gfjGMxXnw9
 npcQ==
X-Gm-Message-State: APjAAAUe44W5agRxPBeaPqMhgMGfxbG4Tl4xy8KWtEfqgWHV2867+qRX
 2zrz58QDAixOz4Qipqga0htf7e8a
X-Google-Smtp-Source: APXvYqxgQ5gs/WvwfgdNbYMteyftk+CBVLGkkImNsXns/XeT7bgOvd2hU1QLLFCsqi7S+ybXMLG5Mg==
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr33007606wrt.100.1579097278979; 
 Wed, 15 Jan 2020 06:07:58 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
 by smtp.gmail.com with ESMTPSA id g2sm24872434wrw.76.2020.01.15.06.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 06:07:58 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 15 Jan 2020 15:07:56 +0100
Message-Id: <20200115140756.70830-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Nouveau] [PATCH] drm/nouveau: gp10b: Use gp100_grctx and
 gp100_gr_zbc
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

gp10b doesn't have all the registers that gp102_gr_zbc wants to access,
which causes IBUS MMIO faults to occur. Avoid this by using the gp100
variants of grctx and gr_zbc.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h | 1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
index fafdd0bbea9b..c4b2e6346684 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
@@ -245,6 +245,7 @@ void gp100_gr_init_fecs_exceptions(struct gf100_gr *);
 void gp100_gr_init_shader_exceptions(struct gf100_gr *, int, int);
 void gp100_gr_zbc_clear_color(struct gf100_gr *, int);
 void gp100_gr_zbc_clear_depth(struct gf100_gr *, int);
+extern const struct gf100_gr_func_zbc gp100_gr_zbc;
 
 void gp102_gr_init_swdx_pes_mask(struct gf100_gr *);
 extern const struct gf100_gr_func_zbc gp102_gr_zbc;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c
index 9d0521ce309a..ef16fee61327 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c
@@ -62,7 +62,7 @@ gp100_gr_zbc_clear_depth(struct gf100_gr *gr, int zbc)
 			  gr->zbc_depth[zbc].format << ((znum % 4) * 7));
 }
 
-static const struct gf100_gr_func_zbc
+const struct gf100_gr_func_zbc
 gp100_gr_zbc = {
 	.clear_color = gp100_gr_zbc_clear_color,
 	.clear_depth = gp100_gr_zbc_clear_depth,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c
index 303dceddd4a8..0b375b2587d2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c
@@ -48,8 +48,8 @@ gp10b_gr = {
 	.gpc_nr = 1,
 	.tpc_nr = 2,
 	.ppc_nr = 1,
-	.grctx = &gp102_grctx,
-	.zbc = &gp102_gr_zbc,
+	.grctx = &gp100_grctx,
+	.zbc = &gp100_gr_zbc,
 	.sclass = {
 		{ -1, -1, FERMI_TWOD_A },
 		{ -1, -1, KEPLER_INLINE_TO_MEMORY_B },
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
