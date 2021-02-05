Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04365311585
	for <lists+nouveau@lfdr.de>; Fri,  5 Feb 2021 23:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEC66F51B;
	Fri,  5 Feb 2021 22:41:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEE36F51B
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 22:41:45 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4BE3C1C000A;
 Fri,  5 Feb 2021 22:41:42 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: nouveau@lists.freedesktop.org
Date: Fri,  5 Feb 2021 23:41:40 +0100
Message-Id: <20210205224140.28174-1-contact@emersion.fr>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v4] nouveau/dispnv50: add cursor pitch check
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

v3:
- Add missing newlines in debug messages (Lyude)
- Use NV_ATOMIC (Lyude)
- Add missing debug log for invalid format (Ilia)

v4: add plane name in debug messages (Ilia)

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c | 31 +++++++++++++++++++--
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index 54fbd6fe751d..9d16918f1e62 100644
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
+	struct nouveau_drm *drm = nouveau_drm(head->base.base.dev);
+	struct drm_framebuffer *fb = asyw->state.fb;
 	int ret;
 
 	ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
@@ -109,14 +112,36 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 	if (ret || !asyh->curs.visible)
 		return ret;
 
-	if (asyw->image.w != asyw->image.h)
+	if (asyw->image.w != asyw->image.h) {
+		NV_ATOMIC(drm,
+			  "%s: invalid cursor image size: width (%d) must match height (%d)\n",
+			  wndw->plane.name, asyw->image.w, asyw->image.h);
 		return -EINVAL;
+	}
+	if (asyw->image.pitch[0] != asyw->image.w * fb->format->cpp[0]) {
+		NV_ATOMIC(drm,
+			  "%s: invalid cursor image pitch: image must be packed (pitch = %d, width = %d)\n",
+			  wndw->plane.name, asyw->image.pitch[0], asyw->image.w);
+		return -EINVAL;
+	}
 
 	ret = head->func->curs_layout(head, asyw, asyh);
-	if (ret)
+	if (ret) {
+		NV_ATOMIC(drm,
+			  "%s: invalid cursor image size: unsupported size %dx%d\n",
+			  wndw->plane.name, asyw->image.w, asyw->image.h);
+		return ret;
+	}
+
+	ret = head->func->curs_format(head, asyw, asyh);
+	if (ret) {
+		NV_ATOMIC(drm,
+			  "%s: invalid cursor image format 0x%X\n",
+			  wndw->plane.name, fb->format->format);
 		return ret;
+	}
 
-	return head->func->curs_format(head, asyw, asyh);
+	return 0;
 }
 
 static const u32
-- 
2.30.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
