Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DFD35074F
	for <lists+nouveau@lfdr.de>; Wed, 31 Mar 2021 21:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030B46E220;
	Wed, 31 Mar 2021 19:21:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 504 seconds by postgrey-1.36 at gabe;
 Wed, 31 Mar 2021 13:21:12 UTC
Received: from mail-m121143.qiye.163.com (mail-m121143.qiye.163.com
 [115.236.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0E26EA97
 for <nouveau@lists.freedesktop.org>; Wed, 31 Mar 2021 13:21:12 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m121143.qiye.163.com (Hmail) with ESMTPA id CA0365404C0;
 Wed, 31 Mar 2021 21:12:42 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Wed, 31 Mar 2021 06:12:35 -0700
Message-Id: <20210331131237.60826-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGkgeHRkdTEgfSUkdVkpNSkxKQk1ITUhLQk1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MVE6FQw5CD8TMDUBTi8KNEgp
 ETwwFAhVSlVKTUpMSkJNSE1ISE9MVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFOSkhLNwY+
X-HM-Tid: 0a78886a2cfeb038kuuuca0365404c0
X-Mailman-Approved-At: Wed, 31 Mar 2021 19:21:51 +0000
Subject: [Nouveau] [PATCH] drm/nouveau: cleanup-coding-style-a-bit
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This change is to make the code a bit readable.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c | 44 ++++++++++-----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
index 57df997c5ff3..053e86845d63 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
@@ -41,9 +41,9 @@ static int
 wndwc37e_csc_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
 	struct nvif_push *push = wndw->wndw.push;
-	int ret;
+	int ret = PUSH_WAIT(push, 13);
 
-	if ((ret = PUSH_WAIT(push, 13)))
+	if (ret)
 		return ret;
 
 	PUSH_MTHD(push, NVC37E, SET_CSC_RED2RED, asyw->csc.matrix, 12);
@@ -54,9 +54,9 @@ static int
 wndwc37e_ilut_clr(struct nv50_wndw *wndw)
 {
 	struct nvif_push *push = wndw->wndw.push;
-	int ret;
+	int ret = PUSH_WAIT(push, 2);
 
-	if ((ret = PUSH_WAIT(push, 2)))
+	if (ret)
 		return ret;
 
 	PUSH_MTHD(push, NVC37E, SET_CONTEXT_DMA_INPUT_LUT, 0x00000000);
@@ -67,9 +67,9 @@ static int
 wndwc37e_ilut_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
 	struct nvif_push *push = wndw->wndw.push;
-	int ret;
+	int ret = PUSH_WAIT(push, 4);
 
-	if ((ret = PUSH_WAIT(push, 4)))
+	if (ret)
 		return ret;
 
 	PUSH_MTHD(push, NVC37E, SET_CONTROL_INPUT_LUT,
@@ -100,9 +100,9 @@ int
 wndwc37e_blend_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
 	struct nvif_push *push = wndw->wndw.push;
-	int ret;
+	int ret = PUSH_WAIT(push, 8);
 
-	if ((ret = PUSH_WAIT(push, 8)))
+	if (ret)
 		return ret;
 
 	PUSH_MTHD(push, NVC37E, SET_COMPOSITION_CONTROL,
@@ -145,9 +145,9 @@ int
 wndwc37e_image_clr(struct nv50_wndw *wndw)
 {
 	struct nvif_push *push = wndw->wndw.push;
-	int ret;
+	int ret = PUSH_WAIT(push, 4);
 
-	if ((ret = PUSH_WAIT(push, 4)))
+	if (ret)
 		return ret;
 
 	PUSH_MTHD(push, NVC37E, SET_PRESENT_CONTROL,
@@ -162,9 +162,9 @@ static int
 wndwc37e_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
 	struct nvif_push *push = wndw->wndw.push;
-	int ret;
+	int ret = PUSH_WAIT(push, 17);
 
-	if ((ret = PUSH_WAIT(push, 17)))
+	if (ret)
 		return ret;
 
 	PUSH_MTHD(push, NVC37E, SET_PRESENT_CONTROL,
@@ -215,9 +215,9 @@ int
 wndwc37e_ntfy_clr(struct nv50_wndw *wndw)
 {
 	struct nvif_push *push = wndw->wndw.push;
-	int ret;
+	int ret = PUSH_WAIT(push, 2);
 
-	if ((ret = PUSH_WAIT(push, 2)))
+	if (ret)
 		return ret;
 
 	PUSH_MTHD(push, NVC37E, SET_CONTEXT_DMA_NOTIFIER, 0x00000000);
@@ -228,9 +228,9 @@ int
 wndwc37e_ntfy_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
 	struct nvif_push *push = wndw->wndw.push;
-	int ret;
+	int ret = PUSH_WAIT(push, 3);
 
-	if ((ret = PUSH_WAIT(push, 3)))
+	if (ret)
 		return ret;
 
 	PUSH_MTHD(push, NVC37E, SET_CONTEXT_DMA_NOTIFIER, asyw->ntfy.handle,
@@ -245,9 +245,9 @@ int
 wndwc37e_sema_clr(struct nv50_wndw *wndw)
 {
 	struct nvif_push *push = wndw->wndw.push;
-	int ret;
+	int ret = PUSH_WAIT(push, 2);
 
-	if ((ret = PUSH_WAIT(push, 2)))
+	if (ret)
 		return ret;
 
 	PUSH_MTHD(push, NVC37E, SET_CONTEXT_DMA_SEMAPHORE, 0x00000000);
@@ -258,9 +258,9 @@ int
 wndwc37e_sema_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
 	struct nvif_push *push = wndw->wndw.push;
-	int ret;
+	int ret = PUSH_WAIT(push, 5);
 
-	if ((ret = PUSH_WAIT(push, 5)))
+	if (ret)
 		return ret;
 
 	PUSH_MTHD(push, NVC37E, SET_SEMAPHORE_CONTROL, asyw->sema.offset,
@@ -274,9 +274,9 @@ int
 wndwc37e_update(struct nv50_wndw *wndw, u32 *interlock)
 {
 	struct nvif_push *push = wndw->wndw.push;
-	int ret;
+	int ret = PUSH_WAIT(push, 5);
 
-	if ((ret = PUSH_WAIT(push, 5)))
+	if (ret)
 		return ret;
 
 	PUSH_MTHD(push, NVC37E, SET_INTERLOCK_FLAGS, interlock[NV50_DISP_INTERLOCK_CURS] << 1 |
-- 
2.31.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
