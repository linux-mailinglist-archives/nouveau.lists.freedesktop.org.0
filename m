Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E9318933B
	for <lists+nouveau@lfdr.de>; Wed, 18 Mar 2020 01:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7246E83D;
	Wed, 18 Mar 2020 00:42:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9178F6E83D
 for <nouveau@lists.freedesktop.org>; Wed, 18 Mar 2020 00:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584492175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQTZZg5BF/ZOQ9Sq3qNr3RLAR/qHM2KbjZ04R3iVkgc=;
 b=alrZ67f+e9iGS3kjp7UwZewHyZ/tyjXrtXq3NLXdWY8n4r4vf+F6ZyqNxQEvpCslu1gqHs
 qogRKnpajaI4PA0uwsk1LrJvdf5xHS6o41F2naC1shL3wWoVMl2p3oenXtIUV09kIPSGbp
 YWhVzi7VdrQLH1jQpkgj7V+bh7cW7Hw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-Urmcq1SkOWWVFowX5bVtEg-1; Tue, 17 Mar 2020 20:42:53 -0400
X-MC-Unique: Urmcq1SkOWWVFowX5bVtEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBCE2800D50;
 Wed, 18 Mar 2020 00:42:51 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-113-173.rdu2.redhat.com
 [10.10.113.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7325160BE0;
 Wed, 18 Mar 2020 00:42:50 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Tue, 17 Mar 2020 20:41:04 -0400
Message-Id: <20200318004159.235623-8-lyude@redhat.com>
In-Reply-To: <20200318004159.235623-1-lyude@redhat.com>
References: <20200318004159.235623-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: [Nouveau] [PATCH 7/9] drm/nouveau/kms/nv50-: Expose nv50_outp_atom
 in disp.h
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
Cc: Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
 Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

In order to make sure that we flush disable updates at the right time
when disabling CRCs, we'll need to be able to look at the outp state to
see if we're changing it at the same time that we're disabling CRCs.

So, expose the struct in disp.h.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 18 ------------------
 drivers/gpu/drm/nouveau/dispnv50/disp.h | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index f510eeafca4b..ef01f2473947 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -56,24 +56,6 @@
 
 #include <subdev/bios/dp.h>
 
-/******************************************************************************
- * Atomic state
- *****************************************************************************/
-
-struct nv50_outp_atom {
-	struct list_head head;
-
-	struct drm_encoder *encoder;
-	bool flush_disable;
-
-	union nv50_outp_atom_mask {
-		struct {
-			bool ctrl:1;
-		};
-		u8 mask;
-	} set, clr;
-};
-
 /******************************************************************************
  * EVO channel
  *****************************************************************************/
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index d54fe00ac3a3..8935ebce8ab0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -70,6 +70,20 @@ struct nv50_dmac {
 	struct mutex lock;
 };
 
+struct nv50_outp_atom {
+	struct list_head head;
+
+	struct drm_encoder *encoder;
+	bool flush_disable;
+
+	union nv50_outp_atom_mask {
+		struct {
+			bool ctrl:1;
+		};
+		u8 mask;
+	} set, clr;
+};
+
 int nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 		     const s32 *oclass, u8 head, void *data, u32 size,
 		     u64 syncbuf, struct nv50_dmac *dmac);
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
