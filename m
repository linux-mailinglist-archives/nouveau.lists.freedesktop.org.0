Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C136F6BAD
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC3310E47C;
	Thu,  4 May 2023 12:32:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 306 seconds by postgrey-1.36 at gabe;
 Thu, 29 Dec 2022 15:52:52 UTC
Received: from luna (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 [86.15.83.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E381A10E3EF;
 Thu, 29 Dec 2022 15:52:52 +0000 (UTC)
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1pAvD8-002o9Z-1T;
 Thu, 29 Dec 2022 15:52:50 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Thu, 29 Dec 2022 15:52:49 +0000
Message-Id: <20221229155249.669436-1-ben-linux@fluff.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:36 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/mc/ga100: make ga100_mc_device static
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
Cc: Ben Dooks <ben-linux@fluff.org>, bskeggs@redhat.com, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Make ga100_mc_device static as it isn't exported, to
fix the following sparse warning:

drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c:51:1: warning: symbol 'ga100_mc_device' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c
index 1e2eabec1a76..5d28d30d09d5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c
@@ -47,7 +47,7 @@ ga100_mc_device_enabled(struct nvkm_mc *mc, u32 mask)
 	return (nvkm_rd32(mc->subdev.device, 0x000600) & mask) == mask;
 }
 
-const struct nvkm_mc_device_func
+static const struct nvkm_mc_device_func
 ga100_mc_device = {
 	.enabled = ga100_mc_device_enabled,
 	.enable = ga100_mc_device_enable,
-- 
2.39.0

