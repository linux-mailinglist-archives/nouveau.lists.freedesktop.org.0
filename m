Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D207A6DED
	for <lists+nouveau@lfdr.de>; Wed, 20 Sep 2023 00:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3283210E2A5;
	Tue, 19 Sep 2023 22:05:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EAF10E29A
 for <nouveau@lists.freedesktop.org>; Tue, 19 Sep 2023 22:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWCGR98wkeIiAHrX3S0J2Z0Uk4CaKPi9pzUAX0nYCVM=;
 b=MOcLsAyDs0016K3zqova5X9oUGrRp1+CwmEBgfuRE7M58FelZlYabd8hz1b+r7/nvh68gp
 GV7X5E1m7vw4fSogYpF27LbGQPxGvJ7l0+tcWtqCgSWuMOLMbCQtrmUj80gEzOxlD9V4cp
 4p5GIq+P+qR8z1ou/roWuUsCaaaDy80=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-e9ZITAc5N1q5GBhuAHJVWg-1; Tue, 19 Sep 2023 18:05:11 -0400
X-MC-Unique: e9ZITAc5N1q5GBhuAHJVWg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93712800888;
 Tue, 19 Sep 2023 22:05:10 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A52340C2064;
 Tue, 19 Sep 2023 22:05:10 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 17:55:59 -0400
Message-ID: <20230919220442.202488-5-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Nouveau] [PATCH v3 04/44] drm/nouveau/mmu/gp100-: always
 invalidate TLBs at CACHE_LEVEL_ALL
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
Cc: open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

Fixes some issues when running on top of RM.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index f3630d0e0d55d..bddac77f48f06 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -558,7 +558,7 @@ gp100_vmm_invalidate_pdb(struct nvkm_vmm *vmm, u64 addr)
 void
 gp100_vmm_flush(struct nvkm_vmm *vmm, int depth)
 {
-	u32 type = (5 /* CACHE_LEVEL_UP_TO_PDE3 */ - depth) << 24;
+	u32 type = 0;
 	if (atomic_read(&vmm->engref[NVKM_SUBDEV_BAR]))
 		type |= 0x00000004; /* HUB_ONLY */
 	type |= 0x00000001; /* PAGE_ALL */
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
index 6cb5eefa45e9a..0095d58d4d9a1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
@@ -27,7 +27,7 @@ static void
 tu102_vmm_flush(struct nvkm_vmm *vmm, int depth)
 {
 	struct nvkm_device *device = vmm->mmu->subdev.device;
-	u32 type = (5 /* CACHE_LEVEL_UP_TO_PDE3 */ - depth) << 24;
+	u32 type = 0;
 
 	type |= 0x00000001; /* PAGE_ALL */
 	if (atomic_read(&vmm->engref[NVKM_SUBDEV_BAR]))
-- 
2.41.0

