Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765082507B0
	for <lists+nouveau@lfdr.de>; Mon, 24 Aug 2020 20:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CC06E291;
	Mon, 24 Aug 2020 18:33:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA556E291
 for <nouveau@lists.freedesktop.org>; Mon, 24 Aug 2020 18:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598293985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ygt9wEnux5G4zAvsw/hJsnQUsV+fTkUJXjsJAkh4+/g=;
 b=cXUorzidyiBV2BZiJl90kn6j+8mjQIG9/hJyknQPZ5u2QyI6pbjdkcB9Nl6C27WTwSuAA5
 NJnhyyg/lWorp6Kc5TMbRaOtONKPXfWnEnXGbEifsQAjl+mYxArK+QSVC4wxX1kLb7Indj
 AmlVUpDmbSdW8zTgqVSZE+bYbtHWcGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-Az4be31dN5iaqoMY_9Jylw-1; Mon, 24 Aug 2020 14:33:04 -0400
X-MC-Unique: Az4be31dN5iaqoMY_9Jylw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B31D91DDEC;
 Mon, 24 Aug 2020 18:33:01 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-114-60.rdu2.redhat.com
 [10.10.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBF0E5C1DA;
 Mon, 24 Aug 2020 18:32:59 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Sasha Levin <sashal@kernel.org>
Date: Mon, 24 Aug 2020 14:32:52 -0400
Message-Id: <20200824183253.826343-2-lyude@redhat.com>
In-Reply-To: <20200824183253.826343-1-lyude@redhat.com>
References: <20200824183253.826343-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Subject: [Nouveau] [PATCH 1/2] drm/nouveau/kms/nv50-: Program notifier
 offset before requesting disp caps
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Not entirely sure why this never came up when I originally tested this
(maybe some BIOSes already have this setup?) but the ->caps_init vfunc
appears to cause the display engine to throw an exception on driver
init, at least on my ThinkPad P72:

nouveau 0000:01:00.0: disp: chid 0 mthd 008c data 00000000 0000508c 0000102b

This is magic nvidia speak for "You need to have the DMA notifier offset
programmed before you can call NV507D_GET_CAPABILITIES." So, let's fix
this by doing that, and also perform an update afterwards to prevent
racing with the GPU when reading capabilities.

Changes since v1:
* Don't just program the DMA notifier offset, make sure to actually
  perform an update

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 4a2cb4181b07 ("drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for DP interlacing support")
Cc: <stable@vger.kernel.org> # v5.8+
---
 drivers/gpu/drm/nouveau/dispnv50/core507d.c | 25 ++++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
index e341f572c2696..5e86feec3b720 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
@@ -65,13 +65,26 @@ core507d_ntfy_init(struct nouveau_bo *bo, u32 offset)
 int
 core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
 {
-	u32 *push = evo_wait(&disp->core->chan, 2);
+	struct nv50_core *core = disp->core;
+	u32 interlock[NV50_DISP_INTERLOCK__SIZE] = {0};
+	u32 *push;
 
-	if (push) {
-		evo_mthd(push, 0x008c, 1);
-		evo_data(push, 0x0);
-		evo_kick(push, &disp->core->chan);
-	}
+	core->func->ntfy_init(disp->sync, NV50_DISP_CORE_NTFY);
+
+	push = evo_wait(&core->chan, 4);
+	if (!push)
+		return 0;
+
+	evo_mthd(push, 0x0084, 1);
+	evo_data(push, 0x80000000 | NV50_DISP_CORE_NTFY);
+	evo_mthd(push, 0x008c, 1);
+	evo_data(push, 0x0);
+	evo_kick(push, &core->chan);
+
+	core->func->update(core, interlock, false);
+	if (core->func->ntfy_wait_done(disp->sync, NV50_DISP_CORE_NTFY,
+				       core->chan.base.device))
+		NV_ERROR(drm, "core notifier timeout\n");
 
 	return 0;
 }
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
