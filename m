Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37EA1AE61E
	for <lists+nouveau@lfdr.de>; Fri, 17 Apr 2020 21:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C89F6E93C;
	Fri, 17 Apr 2020 19:43:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7B46E93C
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 19:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587152592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B9UDKl9q4SMe0iLTyb0J1NInjvyeAg31FlF/WzpwaPQ=;
 b=XdrJWoNjlmmH5XNvby6gbzbSjpXFQgVjnPGFH53NB33ku+QyqgZigv+9fDefLV4OFRTbuc
 jbc/yThHItU9pNy8HlnLyW/+lt83nk1ViHdKgGTonhassnRwRcqJqnksloyo/xrFNqR+oI
 GQbSnlrY1CmVbJxYhaHGb7G5sfdLulM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-e0znxQZyNseKvvRB8wAcuQ-1; Fri, 17 Apr 2020 15:43:06 -0400
X-MC-Unique: e0znxQZyNseKvvRB8wAcuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B522801F78;
 Fri, 17 Apr 2020 19:43:04 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-114-140.rdu2.redhat.com [10.10.114.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDA505D9CA;
 Fri, 17 Apr 2020 19:42:59 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Date: Fri, 17 Apr 2020 15:40:57 -0400
Message-Id: <20200417194145.36350-11-lyude@redhat.com>
In-Reply-To: <20200417194145.36350-1-lyude@redhat.com>
References: <20200417194145.36350-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Subject: [Nouveau] [RFC v3 10/11] drm/nouveau/kms/nv50-: Move hard-coded
 object handles into header
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
 Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

While most of the functionality on Nvidia GPUs doesn't require using an
explicit handle instead of the main VRAM handle + offset, there are a
couple of places that do require explicit handles, such as CRC
functionality. Since this means we're about to add another
nouveau-chosen handle, let's just go ahead and move any hard-coded
handles into a single header. This is just to keep things slightly
organized, and to make it a little bit easier if we need to add more
handles in the future.

This patch should contain no functional changes.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c    |  7 +++++--
 drivers/gpu/drm/nouveau/dispnv50/handles.h | 15 +++++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c    |  3 ++-
 3 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/handles.h

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 5d5661967d50..568029825f62 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -26,6 +26,7 @@
 #include "core.h"
 #include "head.h"
 #include "wndw.h"
+#include "handles.h"
 
 #include <linux/dma-mapping.h>
 #include <linux/hdmi.h>
@@ -154,7 +155,8 @@ nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 	if (!syncbuf)
 		return 0;
 
-	ret = nvif_object_init(&dmac->base.user, 0xf0000000, NV_DMA_IN_MEMORY,
+	ret = nvif_object_init(&dmac->base.user, NV50_DISP_HANDLE_SYNCBUF,
+			       NV_DMA_IN_MEMORY,
 			       &(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
@@ -165,7 +167,8 @@ nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 	if (ret)
 		return ret;
 
-	ret = nvif_object_init(&dmac->base.user, 0xf0000001, NV_DMA_IN_MEMORY,
+	ret = nvif_object_init(&dmac->base.user, NV50_DISP_HANDLE_VRAM,
+			       NV_DMA_IN_MEMORY,
 			       &(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/handles.h b/drivers/gpu/drm/nouveau/dispnv50/handles.h
new file mode 100644
index 000000000000..e3a62c7a0d08
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv50/handles.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NV50_KMS_HANDLES_H__
+#define __NV50_KMS_HANDLES_H__
+
+/*
+ * Various hard-coded object handles that nouveau uses. These are made-up by
+ * nouveau developers, not Nvidia. The only significance of the handles chosen
+ * is that they must all be unique.
+ */
+#define NV50_DISP_HANDLE_SYNCBUF                                        0xf0000000
+#define NV50_DISP_HANDLE_VRAM                                           0xf0000001
+
+#define NV50_DISP_HANDLE_WNDW_CTX(kind)                        (0xfb000000 | kind)
+
+#endif /* !__NV50_KMS_HANDLES_H__ */
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 39cca8eaa066..cb67a715bd69 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -21,6 +21,7 @@
  */
 #include "wndw.h"
 #include "wimm.h"
+#include "handles.h"
 
 #include <nvif/class.h>
 #include <nvif/cl0002.h>
@@ -44,7 +45,7 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct nouveau_framebuffer *fb)
 	struct nouveau_drm *drm = nouveau_drm(fb->base.dev);
 	struct nv50_wndw_ctxdma *ctxdma;
 	const u8    kind = fb->nvbo->kind;
-	const u32 handle = 0xfb000000 | kind;
+	const u32 handle = NV50_DISP_HANDLE_WNDW_CTX(kind);
 	struct {
 		struct nv_dma_v0 base;
 		union {
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
