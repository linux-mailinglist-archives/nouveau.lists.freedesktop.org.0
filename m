Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1833112F4
	for <lists+nouveau@lfdr.de>; Fri,  5 Feb 2021 22:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312966F4D2;
	Fri,  5 Feb 2021 21:00:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 15321 seconds by postgrey-1.36 at gabe;
 Fri, 05 Feb 2021 21:00:48 UTC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAC26F4D2
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 21:00:48 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id BF010FF804;
 Fri,  5 Feb 2021 21:00:45 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: nouveau@lists.freedesktop.org
Date: Fri,  5 Feb 2021 22:00:44 +0100
Message-Id: <20210205210044.2665-1-contact@emersion.fr>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v2] nouveau/dispnv50: add cursor pitch check
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

The hardware needs a FB which is packed. Add checks to make sure
this is the case.

While at it, add debug logs for the existing checks. This allows
user-space to more easily figure out why a configuration is
rejected.

v2:
- Use drm_format_info instead of hardcoding bytes-per-pixel (Ilia)
- Remove unnecessary size check (Ilia)

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Ilia Mirkin <imirkin@alum.mit.edu>
---
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index 54fbd6fe751d..00f09c9a8d15 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -30,6 +30,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_fourcc.h>
 
 bool
 curs507a_space(struct nv50_wndw *wndw)
@@ -99,6 +100,8 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 		 struct nv50_head_atom *asyh)
 {
 	struct nv50_head *head = nv50_head(asyw->state.crtc);
+	struct drm_device *dev = head->base.base.dev;
+	struct drm_framebuffer *fb = asyw->state.fb;
 	int ret;
 
 	ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
@@ -109,12 +112,26 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 	if (ret || !asyh->curs.visible)
 		return ret;
 
-	if (asyw->image.w != asyw->image.h)
+	if (asyw->image.w != asyw->image.h) {
+		drm_dbg_atomic(dev,
+			       "Invalid cursor image size: width (%d) must match height (%d)",
+			       asyw->image.w, asyw->image.h);
 		return -EINVAL;
+	}
+	if (asyw->image.pitch[0] != asyw->image.w * fb->format->cpp[0]) {
+		drm_dbg_atomic(dev,
+			       "Invalid cursor image pitch: image must be packed (pitch = %d, width = %d)",
+			       asyw->image.pitch[0], asyw->image.w);
+		return -EINVAL;
+	}
 
 	ret = head->func->curs_layout(head, asyw, asyh);
-	if (ret)
+	if (ret) {
+		drm_dbg_atomic(dev,
+			       "Invalid cursor image size: unsupported size %dx%d",
+			       asyw->image.w, asyw->image.h);
 		return ret;
+	}
 
 	return head->func->curs_format(head, asyw, asyh);
 }
-- 
2.30.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
