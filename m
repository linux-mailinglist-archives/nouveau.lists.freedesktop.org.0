Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFAF20C3D2
	for <lists+nouveau@lfdr.de>; Sat, 27 Jun 2020 21:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B896E25E;
	Sat, 27 Jun 2020 19:47:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6EA6E260
 for <nouveau@lists.freedesktop.org>; Sat, 27 Jun 2020 19:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593287246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QV52nXHjLgHC1/7OIn2WKhkaShhr6wbwwFMyzWNiYr8=;
 b=Zwjghs4XjXr3/Mi22Iy9uj2UO7ByHsnJDuO1k4XAwgQjOlu4UhAp5VfEIHVgcw/5ysis5p
 Uf+qPeDwnmYVnYWcFja87Vd8V2ndgfYwc1uPqNRHAmABxOMgGUh8LaF7FJ+jaA8EIgMO8m
 e640x+eDrXThF1PHElWT4LOExebgPzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-cnXG3G_pP-2gHbjDSYCFLQ-1; Sat, 27 Jun 2020 15:47:24 -0400
X-MC-Unique: cnXG3G_pP-2gHbjDSYCFLQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3273680058A;
 Sat, 27 Jun 2020 19:47:23 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-112-223.rdu2.redhat.com
 [10.10.112.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A58AE7F4F9;
 Sat, 27 Jun 2020 19:47:21 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Sat, 27 Jun 2020 15:46:54 -0400
Message-Id: <20200627194657.156514-7-lyude@redhat.com>
In-Reply-To: <20200627194657.156514-1-lyude@redhat.com>
References: <20200627194657.156514-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Subject: [Nouveau] [RFC v8 6/9] drm/nouveau/kms/nv140-: Track wndw mappings
 in nv50_head_atom
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
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

While we're not quite ready yet to add support for flexible wndw
mappings, we are going to need to at least keep track of the static wndw
mappings we're currently using in each head's atomic state. We'll likely
use this in the future to implement real flexible window mapping, but
the primary reason we'll need this is for CRC support.

See: on nvidia hardware, each CRC entry in the CRC notifier dma context
has a "tag". This tag corresponds to the nth update on a specific
EVO/NvDisplay channel, which itself is referred to as the "controlling
channel". For gf119+ this can be the core channel, ovly channel, or base
channel. Since we don't expose CRC entry tags to userspace, we simply
ignore this feature and always use the core channel as the controlling
channel. Simple.

Things get a little bit more complicated on gv100+ though. GV100+ only
lets us set the controlling channel to a specific wndw channel, and that
wndw must be owned by the head that we're grabbing CRCs when we enable
CRC generation. Thus, we always need to make sure that each atomic head
state has at least one wndw that is mapped to the head, which will be
used as the controlling channel.

Note that since we don't have flexible wndw mappings yet, we don't
expect to run into any scenarios yet where we'd have a head with no
mapped wndws. When we do add support for flexible wndw mappings however,
we'll need to make sure that we handle reprogramming CRC capture if our
controlling wndw is moved to another head (and potentially reject the
new head state entirely if we can't find another available wndw to
replace it).

With that being said, nouveau currently tracks wndw visibility on heads.
It does not keep track of the actual ownership mappings, which are
(currently) statically programmed. To fix this, we introduce another
bitmask into nv50_head_atom.wndw to keep track of ownership separately
from visibility. We then introduce a nv50_head callback to handle
populating the wndw ownership map, and call it during the atomic check
phase when core->assign_windows is set to true.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/atom.h     |  1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 16 ++++++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/head.h     |  2 ++
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c | 10 ++++++++++
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c |  2 ++
 5 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h b/drivers/gpu/drm/nouveau/dispnv50/atom.h
index 24f7700768dab..62faaf60f47a5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/atom.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/atom.h
@@ -18,6 +18,7 @@ struct nv50_head_atom {
 
 	struct {
 		u32 mask;
+		u32 owned;
 		u32 olut;
 	} wndw;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d472942102f50..368069a5b181a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2287,12 +2287,28 @@ static int
 nv50_disp_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct nv50_atom *atom = nv50_atom(state);
+	struct nv50_core *core = nv50_disp(dev)->core;
 	struct drm_connector_state *old_connector_state, *new_connector_state;
 	struct drm_connector *connector;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_crtc *crtc;
+	struct nv50_head *head;
+	struct nv50_head_atom *asyh;
 	int ret, i;
 
+	if (core->assign_windows && core->func->head->static_wndw_map) {
+		drm_for_each_crtc(crtc, dev) {
+			new_crtc_state = drm_atomic_get_crtc_state(state,
+								   crtc);
+			if (IS_ERR(new_crtc_state))
+				return PTR_ERR(new_crtc_state);
+
+			head = nv50_head(crtc);
+			asyh = nv50_head_atom(new_crtc_state);
+			core->func->head->static_wndw_map(head, asyh);
+		}
+	}
+
 	/* We need to handle colour management on a per-plane basis. */
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 		if (new_crtc_state->color_mgmt_changed) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.h b/drivers/gpu/drm/nouveau/dispnv50/head.h
index c32b27cdaefc9..c05bbba9e247c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.h
@@ -40,6 +40,7 @@ struct nv50_head_func {
 	void (*dither)(struct nv50_head *, struct nv50_head_atom *);
 	void (*procamp)(struct nv50_head *, struct nv50_head_atom *);
 	void (*or)(struct nv50_head *, struct nv50_head_atom *);
+	void (*static_wndw_map)(struct nv50_head *, struct nv50_head_atom *);
 };
 
 extern const struct nv50_head_func head507d;
@@ -86,6 +87,7 @@ int headc37d_curs_format(struct nv50_head *, struct nv50_wndw_atom *,
 void headc37d_curs_set(struct nv50_head *, struct nv50_head_atom *);
 void headc37d_curs_clr(struct nv50_head *);
 void headc37d_dither(struct nv50_head *, struct nv50_head_atom *);
+void headc37d_static_wndw_map(struct nv50_head *, struct nv50_head_atom *);
 
 extern const struct nv50_head_func headc57d;
 #endif
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
index 9ef3c603fc43e..c2619652ff2ee 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
@@ -204,6 +204,15 @@ headc37d_view(struct nv50_head *head, struct nv50_head_atom *asyh)
 	}
 }
 
+void
+headc37d_static_wndw_map(struct nv50_head *head, struct nv50_head_atom *asyh)
+{
+	int i, end;
+
+	for (i = head->base.index * 2, end = i + 2; i < end; i++)
+		asyh->wndw.owned |= BIT(i);
+}
+
 const struct nv50_head_func
 headc37d = {
 	.view = headc37d_view,
@@ -219,4 +228,5 @@ headc37d = {
 	.dither = headc37d_dither,
 	.procamp = headc37d_procamp,
 	.or = headc37d_or,
+	.static_wndw_map = headc37d_static_wndw_map,
 };
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index 97141eb8e75ab..1c1887749f4c5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -211,4 +211,6 @@ headc57d = {
 	.dither = headc37d_dither,
 	.procamp = headc57d_procamp,
 	.or = headc57d_or,
+	/* TODO: flexible window mappings */
+	.static_wndw_map = headc37d_static_wndw_map,
 };
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
