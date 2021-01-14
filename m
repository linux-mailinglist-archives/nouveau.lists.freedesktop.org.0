Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22992F6D77
	for <lists+nouveau@lfdr.de>; Thu, 14 Jan 2021 22:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134D989F77;
	Thu, 14 Jan 2021 21:50:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC5389F77
 for <nouveau@lists.freedesktop.org>; Thu, 14 Jan 2021 21:50:28 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 2D25C3A6071
 for <nouveau@lists.freedesktop.org>; Thu, 14 Jan 2021 21:44:31 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id F2F3F1BF207;
 Thu, 14 Jan 2021 21:44:07 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Jan 2021 22:44:06 +0100
Message-Id: <20210114214406.77976-1-contact@emersion.fr>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH] drm/nouveau/dispnv50: cleanup on
 nv50_head_atom_get failure
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

When nv50_head_atom_get fails, we need to un-do everything we've
done so far: release the fence and unpin the BO.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Ilia Mirkin <imirkin@alum.mit.edu>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 0356474ad6f6..60aabb1bc095 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -562,8 +562,12 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 
 	if (wndw->func->prepare) {
 		asyh = nv50_head_atom_get(asyw->state.state, asyw->state.crtc);
-		if (IS_ERR(asyh))
+		if (IS_ERR(asyh)) {
+			dma_fence_put(asyw->state.fence);
+			asyw->state.fence = NULL;
+			nouveau_bo_unpin(nvbo);
 			return PTR_ERR(asyh);
+		}
 
 		wndw->func->prepare(wndw, asyh, asyw);
 	}
-- 
2.30.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
