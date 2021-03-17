Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5534333FB9A
	for <lists+nouveau@lfdr.de>; Thu, 18 Mar 2021 00:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E996E85C;
	Wed, 17 Mar 2021 23:02:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857B26E85C
 for <nouveau@lists.freedesktop.org>; Wed, 17 Mar 2021 23:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616022134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1zBaXw6v3nxp+tbBk95VCpO5EeU4VjR0+nYag5nMgA=;
 b=ekB6HX0sh02JPbAwx4u4KVILh2FgFBfOPmAxPual2az2CXCK4JW+fXB5G6dXPUWUmkKffM
 cpoG+D3cGJhcNRW2dj8XHnkHI8P0L58NeyUwuww1mztKaghCxp69kQCTMou6tn4wk6aFtQ
 mh4K7G5wtfUX68guLdnd11//x8ETZPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-73XNEzRCOgec-Wtk9J0Yig-1; Wed, 17 Mar 2021 19:02:11 -0400
X-MC-Unique: 73XNEzRCOgec-Wtk9J0Yig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33FB388EF03;
 Wed, 17 Mar 2021 23:02:09 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-119-60.rdu2.redhat.com [10.10.119.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDB02610F0;
 Wed, 17 Mar 2021 23:02:07 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Wed, 17 Mar 2021 19:01:46 -0400
Message-Id: <20210317230146.504182-3-lyude@redhat.com>
In-Reply-To: <20210317230146.504182-1-lyude@redhat.com>
References: <20210317230146.504182-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: [Nouveau] [PATCH 2/2] drm/nouveau/kms/nv50-: Always validate LUTs
 in nv50_head_atomic_check_lut()
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
 <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

When it comes to gamma or degamma luts, nouveau will actually skip the
calculation of certain LUTs depending on the head and plane states. For
instance, when the head is disabled we don't perform any error checking on
the gamma LUT, and likewise if no planes are present and enabled in our
atomic state we will skip error checking the degamma LUT. This is a bit of
a problem though, since the per-head gamma and degamma props in DRM can be
changed even while a head is disabled - a situation which can be triggered
by the igt testcase mentioned down below.

Originally I thought this was a bit silly and was tempted to just fix the
igt test to only set gamma/degamma with the head enabled. After a bit of
thinking though I realized we should fix this in nouveau. This is because
if a program decides to set an invalid LUT for a head before enabling the
head, such a property change would succeed while also making it impossible
to turn the head back on until the LUT is removed or corrected - something
that could be painful for a user to figure out.

So, fix this checking both degamma and gamma LUTs unconditionally during
atomic checks. We start by calling nv50_head_atomic_check_lut() regardless
of whether the head is active or not in nv50_head_atomic_check(). Then we
move the ilut error checking into nv50_head_atomic_check_lut() and add a
per-head hook for it, primarily because as a per-CRTC property DRM we want
the LUT to be error checked by the head any time it's included in an atomic
state. Of course though, actual programming of the degamma lut to hardware
is still handled in each plane's atomic check and commit.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Testcase: igt/kms_color/pipe-invalid-*-lut-sizes
---
 drivers/gpu/drm/nouveau/dispnv50/base907c.c |  6 +----
 drivers/gpu/drm/nouveau/dispnv50/head.c     | 30 +++++++++++++++------
 drivers/gpu/drm/nouveau/dispnv50/head.h     |  2 ++
 drivers/gpu/drm/nouveau/dispnv50/head907d.c |  6 +++++
 drivers/gpu/drm/nouveau/dispnv50/head917d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  5 +---
 drivers/gpu/drm/nouveau/dispnv50/wndw.h     |  4 +--
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  6 +----
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  7 +++--
 11 files changed, 41 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/base907c.c b/drivers/gpu/drm/nouveau/dispnv50/base907c.c
index 5396e3707cc4..e6b0417c325b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base907c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base907c.c
@@ -103,12 +103,9 @@ base907c_xlut_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 	return 0;
 }
 
-static bool
+static void
 base907c_ilut(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw, int size)
 {
-	if (size != 256 && size != 1024)
-		return false;
-
 	if (size == 1024)
 		asyw->xlut.i.mode = NV907C_SET_BASE_LUT_LO_MODE_INTERPOLATE_1025_UNITY_RANGE;
 	else
@@ -116,7 +113,6 @@ base907c_ilut(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw, int size)
 
 	asyw->xlut.i.enable = NV907C_SET_BASE_LUT_LO_ENABLE_ENABLE;
 	asyw->xlut.i.load = head907d_olut_load;
-	return true;
 }
 
 static inline u32
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index fb821dcf6bd2..3b96eafb7bdd 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -225,9 +225,20 @@ nv50_head_atomic_check_lut(struct nv50_head *head,
 	struct drm_crtc *crtc = &head->base.base;
 	struct nv50_disp *disp = nv50_disp(dev);
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct drm_property_blob *olut = asyh->state.gamma_lut;
+	struct drm_property_blob *olut = asyh->state.gamma_lut,
+				 *ilut = asyh->state.degamma_lut;
 	int size;
 
+	/* Ensure that the ilut is valid */
+	if (ilut) {
+		size = drm_color_lut_size(ilut);
+		if (!head->func->ilut_check(size)) {
+			NV_ATOMIC(drm, "Invalid size %d for degamma on [CRTC:%d:%s]\n",
+				  size, crtc->base.id, crtc->name);
+			return -EINVAL;
+		}
+	}
+
 	/* Determine whether core output LUT should be enabled. */
 	if (olut) {
 		/* Check if any window(s) have stolen the core output LUT
@@ -329,8 +340,17 @@ nv50_head_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	struct drm_connector_state *conns;
 	struct drm_connector *conn;
 	int i, ret;
+	bool check_lut = asyh->state.color_mgmt_changed ||
+			 memcmp(&armh->wndw, &asyh->wndw, sizeof(asyh->wndw));
 
 	NV_ATOMIC(drm, "%s atomic_check %d\n", crtc->name, asyh->state.active);
+
+	if (check_lut) {
+		ret = nv50_head_atomic_check_lut(head, asyh);
+		if (ret)
+			return ret;
+	}
+
 	if (asyh->state.active) {
 		for_each_new_connector_in_state(asyh->state.state, conn, conns, i) {
 			if (conns->crtc == crtc) {
@@ -356,14 +376,8 @@ nv50_head_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 		if (asyh->state.mode_changed || asyh->state.connectors_changed)
 			nv50_head_atomic_check_mode(head, asyh);
 
-		if (asyh->state.color_mgmt_changed ||
-		    memcmp(&armh->wndw, &asyh->wndw, sizeof(asyh->wndw))) {
-			int ret = nv50_head_atomic_check_lut(head, asyh);
-			if (ret)
-				return ret;
-
+		if (check_lut)
 			asyh->olut.visible = asyh->olut.handle != 0;
-		}
 
 		if (asyc) {
 			if (asyc->set.scaler)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.h b/drivers/gpu/drm/nouveau/dispnv50/head.h
index dae841dc05fd..77407f43f873 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.h
@@ -28,6 +28,7 @@ struct nv50_head_func {
 	int (*view)(struct nv50_head *, struct nv50_head_atom *);
 	int (*mode)(struct nv50_head *, struct nv50_head_atom *);
 	bool (*olut)(struct nv50_head *, struct nv50_head_atom *, int);
+	bool (*ilut_check)(int size);
 	bool olut_identity;
 	int  olut_size;
 	int (*olut_set)(struct nv50_head *, struct nv50_head_atom *);
@@ -70,6 +71,7 @@ extern const struct nv50_head_func head907d;
 int head907d_view(struct nv50_head *, struct nv50_head_atom *);
 int head907d_mode(struct nv50_head *, struct nv50_head_atom *);
 bool head907d_olut(struct nv50_head *, struct nv50_head_atom *, int);
+bool head907d_ilut_check(int size);
 int head907d_olut_set(struct nv50_head *, struct nv50_head_atom *);
 int head907d_olut_clr(struct nv50_head *);
 int head907d_core_set(struct nv50_head *, struct nv50_head_atom *);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head907d.c b/drivers/gpu/drm/nouveau/dispnv50/head907d.c
index 85648d790743..18fe4c1e2d6a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head907d.c
@@ -314,6 +314,11 @@ head907d_olut(struct nv50_head *head, struct nv50_head_atom *asyh, int size)
 	return true;
 }
 
+bool head907d_ilut_check(int size)
+{
+	return size == 256 || size == 1024;
+}
+
 int
 head907d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
@@ -409,6 +414,7 @@ head907d = {
 	.view = head907d_view,
 	.mode = head907d_mode,
 	.olut = head907d_olut,
+	.ilut_check = head907d_ilut_check,
 	.olut_size = 1024,
 	.olut_set = head907d_olut_set,
 	.olut_clr = head907d_olut_clr,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head917d.c b/drivers/gpu/drm/nouveau/dispnv50/head917d.c
index ea9f8667305e..4ce47b55f72c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head917d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head917d.c
@@ -119,6 +119,7 @@ head917d = {
 	.view = head907d_view,
 	.mode = head907d_mode,
 	.olut = head907d_olut,
+	.ilut_check = head907d_ilut_check,
 	.olut_size = 1024,
 	.olut_set = head907d_olut_set,
 	.olut_clr = head907d_olut_clr,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
index 63adfeba50e5..a4a3b78ea42c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
@@ -285,6 +285,7 @@ headc37d = {
 	.view = headc37d_view,
 	.mode = headc37d_mode,
 	.olut = headc37d_olut,
+	.ilut_check = head907d_ilut_check,
 	.olut_size = 1024,
 	.olut_set = headc37d_olut_set,
 	.olut_clr = headc37d_olut_clr,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index fd51527b56b8..fd624eb8a0bb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -236,6 +236,7 @@ headc57d = {
 	.view = headc37d_view,
 	.mode = headc57d_mode,
 	.olut = headc57d_olut,
+	.ilut_check = head907d_ilut_check,
 	.olut_identity = true,
 	.olut_size = 1024,
 	.olut_set = headc57d_olut_set,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 0cb1f9d848d3..3aecd46edd53 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -403,10 +403,7 @@ nv50_wndw_atomic_check_lut(struct nv50_wndw *wndw,
 	/* Recalculate LUT state. */
 	memset(&asyw->xlut, 0x00, sizeof(asyw->xlut));
 	if ((asyw->ilut = wndw->func->ilut ? ilut : NULL)) {
-		if (!wndw->func->ilut(wndw, asyw, drm_color_lut_size(ilut))) {
-			DRM_DEBUG_KMS("Invalid ilut\n");
-			return -EINVAL;
-		}
+		wndw->func->ilut(wndw, asyw, drm_color_lut_size(ilut));
 		asyw->xlut.handle = wndw->wndw.vram.handle;
 		asyw->xlut.i.buffer = !asyw->xlut.i.buffer;
 		asyw->set.xlut = true;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.h b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
index f4e0c5080034..9c9f2c2a71a5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
@@ -64,7 +64,7 @@ struct nv50_wndw_func {
 	int (*ntfy_clr)(struct nv50_wndw *);
 	int (*ntfy_wait_begun)(struct nouveau_bo *, u32 offset,
 			       struct nvif_device *);
-	bool (*ilut)(struct nv50_wndw *, struct nv50_wndw_atom *, int);
+	void (*ilut)(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyh, int size);
 	void (*csc)(struct nv50_wndw *, struct nv50_wndw_atom *,
 		    const struct drm_color_ctm *);
 	int (*csc_set)(struct nv50_wndw *, struct nv50_wndw_atom *);
@@ -129,7 +129,7 @@ int wndwc37e_update(struct nv50_wndw *, u32 *);
 
 int wndwc57e_new(struct nouveau_drm *, enum drm_plane_type, int, s32,
 		 struct nv50_wndw **);
-bool wndwc57e_ilut(struct nv50_wndw *, struct nv50_wndw_atom *, int);
+void wndwc57e_ilut(struct nv50_wndw *, struct nv50_wndw_atom *, int);
 int wndwc57e_ilut_set(struct nv50_wndw *, struct nv50_wndw_atom *);
 int wndwc57e_ilut_clr(struct nv50_wndw *);
 int wndwc57e_csc_set(struct nv50_wndw *, struct nv50_wndw_atom *);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
index 57df997c5ff3..183d2c0e65b6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
@@ -82,18 +82,14 @@ wndwc37e_ilut_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 	return 0;
 }
 
-static bool
+static void
 wndwc37e_ilut(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw, int size)
 {
-	if (size != 256 && size != 1024)
-		return false;
-
 	asyw->xlut.i.size = size == 1024 ? NVC37E_SET_CONTROL_INPUT_LUT_SIZE_SIZE_1025 :
 					   NVC37E_SET_CONTROL_INPUT_LUT_SIZE_SIZE_257;
 	asyw->xlut.i.range = NVC37E_SET_CONTROL_INPUT_LUT_RANGE_UNITY;
 	asyw->xlut.i.output_mode = NVC37E_SET_CONTROL_INPUT_LUT_OUTPUT_MODE_INTERPOLATE;
 	asyw->xlut.i.load = head907d_olut_load;
-	return true;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
index abdd3bb658b3..37f6da8b3f2a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
@@ -179,11 +179,11 @@ wndwc57e_ilut_load(struct drm_color_lut *in, int size, void __iomem *mem)
 	writew(readw(mem - 4), mem + 4);
 }
 
-bool
+void
 wndwc57e_ilut(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw, int size)
 {
-	if (size = size ? size : 1024, size != 256 && size != 1024)
-		return false;
+	if (!size)
+		size = 1024;
 
 	if (size == 256)
 		asyw->xlut.i.mode = NVC57E_SET_ILUT_CONTROL_MODE_DIRECT8;
@@ -193,7 +193,6 @@ wndwc57e_ilut(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw, int size)
 	asyw->xlut.i.size = 4 /* VSS header. */ + size + 1 /* Entries. */;
 	asyw->xlut.i.output_mode = NVC57E_SET_ILUT_CONTROL_INTERPOLATE_DISABLE;
 	asyw->xlut.i.load = wndwc57e_ilut_load;
-	return true;
 }
 
 /****************************************************************
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
