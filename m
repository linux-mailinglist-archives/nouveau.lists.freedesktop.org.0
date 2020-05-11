Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 509BF1CE854
	for <lists+nouveau@lfdr.de>; Tue, 12 May 2020 00:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D606E5CC;
	Mon, 11 May 2020 22:42:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289706E5CA
 for <nouveau@lists.freedesktop.org>; Mon, 11 May 2020 22:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589236964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=epEYmcBn92xG4SxCsxcKOrCOQQyl4rw+y+9iUjYuTBY=;
 b=aPXnOIHbRM11JwxO6xy/h8WtBO8gY5eEsNzm9PsyHClQpT7XgHK4VheQP5YYkMvMLAI9r9
 dHS6YC7xPle2VzK4aehHJw9msbNBICKAWTr8nXIJGq5/dKcseD9oFID7UJjbLsJ4OQQbtH
 ykRCWUSDG0RaPXtk0qqRnHSTEz52f7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-xxsv2v9RMUWlMB2fBB3itg-1; Mon, 11 May 2020 18:42:38 -0400
X-MC-Unique: xxsv2v9RMUWlMB2fBB3itg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8549D460;
 Mon, 11 May 2020 22:42:37 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-117-238.rdu2.redhat.com
 [10.10.117.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A01877F2E;
 Mon, 11 May 2020 22:42:36 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 11 May 2020 18:41:25 -0400
Message-Id: <20200511224148.598468-4-lyude@redhat.com>
In-Reply-To: <20200511224148.598468-1-lyude@redhat.com>
References: <20200511224148.598468-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Subject: [Nouveau] [PATCH v3 3/5] drm/nouveau/kms/gv100-: Add support for
 interlaced modes
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

We advertise being able to set interlaced modes, so let's actually make
sure to do that. Otherwise, we'll end up hanging the display engine due
to trying to set a mode with timings adjusted for interlacing without
telling the hardware it's actually an interlaced mode.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c | 5 +++--
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c | 5 +++--
 drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
index 00011ce109a6..4a9a32b89f74 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
@@ -168,14 +168,15 @@ headc37d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 	struct nv50_dmac *core = &nv50_disp(head->base.base.dev)->core->chan;
 	struct nv50_head_mode *m = &asyh->mode;
 	u32 *push;
-	if ((push = evo_wait(core, 12))) {
+	if ((push = evo_wait(core, 13))) {
 		evo_mthd(push, 0x2064 + (head->base.index * 0x400), 5);
 		evo_data(push, (m->v.active  << 16) | m->h.active );
 		evo_data(push, (m->v.synce   << 16) | m->h.synce  );
 		evo_data(push, (m->v.blanke  << 16) | m->h.blanke );
 		evo_data(push, (m->v.blanks  << 16) | m->h.blanks );
 		evo_data(push, (m->v.blank2e << 16) | m->v.blank2s);
-		evo_mthd(push, 0x200c + (head->base.index * 0x400), 1);
+		evo_mthd(push, 0x2008 + (head->base.index * 0x400), 2);
+		evo_data(push, m->interlace);
 		evo_data(push, m->clock * 1000);
 		evo_mthd(push, 0x2028 + (head->base.index * 0x400), 1);
 		evo_data(push, m->clock * 1000);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index 938d910a1b1e..859131a8bc3c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -173,14 +173,15 @@ headc57d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 	struct nv50_dmac *core = &nv50_disp(head->base.base.dev)->core->chan;
 	struct nv50_head_mode *m = &asyh->mode;
 	u32 *push;
-	if ((push = evo_wait(core, 12))) {
+	if ((push = evo_wait(core, 13))) {
 		evo_mthd(push, 0x2064 + (head->base.index * 0x400), 5);
 		evo_data(push, (m->v.active  << 16) | m->h.active );
 		evo_data(push, (m->v.synce   << 16) | m->h.synce  );
 		evo_data(push, (m->v.blanke  << 16) | m->h.blanke );
 		evo_data(push, (m->v.blanks  << 16) | m->h.blanks );
 		evo_data(push, (m->v.blank2e << 16) | m->v.blank2s);
-		evo_mthd(push, 0x200c + (head->base.index * 0x400), 1);
+		evo_mthd(push, 0x2008 + (head->base.index * 0x400), 2);
+		evo_data(push, m->interlace);
 		evo_data(push, m->clock * 1000);
 		evo_mthd(push, 0x2028 + (head->base.index * 0x400), 1);
 		evo_data(push, m->clock * 1000);
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 43bcbb6d73c4..6dae00da5d7e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1065,7 +1065,7 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
 		return get_slave_funcs(encoder)->mode_valid(encoder, mode);
 	case DCB_OUTPUT_DP:
 		if (mode->flags & DRM_MODE_FLAG_INTERLACE &&
-		    !nv_encoder->dp.caps.interlace)
+		    !nv_encoder->caps.dp_interlace)
 			return MODE_NO_INTERLACE;
 
 		max_clock  = nv_encoder->dp.link_nr;
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
