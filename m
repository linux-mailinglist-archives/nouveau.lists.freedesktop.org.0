Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8E14FB761
	for <lists+nouveau@lfdr.de>; Mon, 11 Apr 2022 11:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E14010F7A6;
	Mon, 11 Apr 2022 09:25:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644B910F7AC;
 Mon, 11 Apr 2022 09:25:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 10B3FB81134;
 Mon, 11 Apr 2022 09:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582FAC385A4;
 Mon, 11 Apr 2022 09:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649669132;
 bh=xGCmVCrCQsH+YPDi73tUh+YkBtsdj91S133EZ7c1Kk0=;
 h=Subject:To:Cc:From:Date:From;
 b=BIRyNwT5GhS9YGCCHaXArbnUVDhBcfA3okXmsw3P4f2bOf4H492ee52/2CbpfblCM
 kru7DevkgSmH/ThxscyUAsAfWL593utWzattIZgtLaM/qrldHRS0dzxddf9uG3agDL
 MbgJ7Xl+umlVsa0zGjvcvseMmGNRJ5gMu1zw01ZI=
To: bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, kherbst@redhat.com, lyude@redhat.com,
 nouveau@lists.freedesktop.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Apr 2022 11:25:14 +0200
Message-ID: <164966911415249@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
Subject: [Nouveau] Patch "drm/nouveau/pmu: Add missing callbacks for Tegra
 devices" has been added to the 5.15-stable tree
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
Cc: stable-commits@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/nouveau/pmu: Add missing callbacks for Tegra devices

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-nouveau-pmu-add-missing-callbacks-for-tegra-devices.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 38d4e5cf5b08798f093374e53c2f4609d5382dd5 Mon Sep 17 00:00:00 2001
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 22 Mar 2022 13:48:00 +0100
Subject: drm/nouveau/pmu: Add missing callbacks for Tegra devices

From: Karol Herbst <kherbst@redhat.com>

commit 38d4e5cf5b08798f093374e53c2f4609d5382dd5 upstream.

Fixes a crash booting on those platforms with nouveau.

Fixes: 4cdd2450bf73 ("drm/nouveau/pmu/gm200-: use alternate falcon reset sequence")
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.17+
Signed-off-by: Karol Herbst <kherbst@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220322124800.2605463-1-kherbst@redhat.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h  |    1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
@@ -216,6 +216,7 @@ gm20b_pmu = {
 	.intr = gt215_pmu_intr,
 	.recv = gm20b_pmu_recv,
 	.initmsg = gm20b_pmu_initmsg,
+	.reset = gf100_pmu_reset,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c
@@ -23,7 +23,7 @@
  */
 #include "priv.h"
 
-static void
+void
 gp102_pmu_reset(struct nvkm_pmu *pmu)
 {
 	struct nvkm_device *device = pmu->subdev.device;
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
@@ -83,6 +83,7 @@ gp10b_pmu = {
 	.intr = gt215_pmu_intr,
 	.recv = gm20b_pmu_recv,
 	.initmsg = gm20b_pmu_initmsg,
+	.reset = gp102_pmu_reset,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h
@@ -41,6 +41,7 @@ int gt215_pmu_send(struct nvkm_pmu *, u3
 
 bool gf100_pmu_enabled(struct nvkm_pmu *);
 void gf100_pmu_reset(struct nvkm_pmu *);
+void gp102_pmu_reset(struct nvkm_pmu *pmu);
 
 void gk110_pmu_pgob(struct nvkm_pmu *, bool);
 


Patches currently in stable-queue which might be from kherbst@redhat.com are

queue-5.15/drm-nouveau-pmu-add-missing-callbacks-for-tegra-devices.patch
