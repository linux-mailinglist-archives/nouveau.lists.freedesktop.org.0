Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8FE310E35
	for <lists+nouveau@lfdr.de>; Fri,  5 Feb 2021 17:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9662D6F49D;
	Fri,  5 Feb 2021 16:55:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806336F49D
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 16:55:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id A09983A1FA8
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 16:45:47 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 6F826E0005;
 Fri,  5 Feb 2021 16:45:24 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: nouveau@lists.freedesktop.org
Date: Fri,  5 Feb 2021 17:45:15 +0100
Message-Id: <20210205164515.4622-1-contact@emersion.fr>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH] nouveau/dispnv50: add cursor size/pitch checks
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

The hardware needs a FB which is packed and not too large. Add
checks to make sure this is the case.

While at it, add a debug log for the existing check. This allows
user-space to more easily figure out why a configuration is
rejected.

This commit depends on "drm/nouveau/kms/nv50-: Report max cursor
size to userspace", otherwise mode_config.cursor_{width,height}
is zero.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Ilia Mirkin <imirkin@alum.mit.edu>
---
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c | 22 ++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index 54fbd6fe751d..9a401751c56d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -99,6 +99,7 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 		 struct nv50_head_atom *asyh)
 {
 	struct nv50_head *head = nv50_head(asyw->state.crtc);
+	struct drm_device *dev = head->base.base.dev;
 	int ret;
 
 	ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
@@ -109,8 +110,27 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 	if (ret || !asyh->curs.visible)
 		return ret;
 
-	if (asyw->image.w != asyw->image.h)
+	if (asyw->image.w != asyw->image.h) {
+		drm_dbg_atomic(dev,
+			       "Invalid cursor image size: width (%d) must match height (%d)",
+			       asyw->image.w, asyw->image.h);
 		return -EINVAL;
+	}
+	if (asyw->image.w > dev->mode_config.cursor_width ||
+	    asyw->image.h > dev->mode_config.cursor_height) {
+		drm_dbg_atomic(dev,
+			       "Invalid cursor image size: too large (%dx%d > %dx%d)",
+			       asyw->image.w, asyw->image.h,
+			       dev->mode_config.cursor_width,
+			       dev->mode_config.cursor_height);
+		return -EINVAL;
+	}
+	if (asyw->image.pitch[0] != asyw->image.w * 4) {
+		drm_dbg_atomic(dev,
+			       "Invalid cursor image pitch: image must be packed (pitch = %d, width = %d)",
+			       asyw->image.pitch[0], asyw->image.w);
+		return -EINVAL;
+	}
 
 	ret = head->func->curs_layout(head, asyw, asyh);
 	if (ret)
-- 
2.30.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
