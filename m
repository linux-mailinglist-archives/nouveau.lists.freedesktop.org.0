Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E720411D
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 22:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3D46E8FA;
	Mon, 22 Jun 2020 20:09:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E606E8FA
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 20:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592856552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZYhBvbDDNRy7VCCeT+Z/3+KFjbOGADAaOoqLREGB6A=;
 b=N6B64eTTUwa9/DzyWeUIL/Zcz+OCmbHFVZKMzh/44XMR3QoOep8+hBupLofY6LJD3ErgQ7
 RvywAPhdyD4w6xXQeRR7CVa8njYK09VTJ1kzJUINGMd/pahAwBEE6kAmK5sRm8blK61uX3
 17qhED6MX9fJ2wziFrSEIpum7PQGo7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-i68MNScaNN2_TUS01uOEkw-1; Mon, 22 Jun 2020 16:09:10 -0400
X-MC-Unique: i68MNScaNN2_TUS01uOEkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D035109AEA7;
 Mon, 22 Jun 2020 20:08:26 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-117-166.rdu2.redhat.com
 [10.10.117.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 594DF5C662;
 Mon, 22 Jun 2020 20:08:22 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Mon, 22 Jun 2020 16:07:28 -0400
Message-Id: <20200622200730.120716-9-lyude@redhat.com>
In-Reply-To: <20200622200730.120716-1-lyude@redhat.com>
References: <20200622200730.120716-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Subject: [Nouveau] [RFC v5 08/10] drm/nouveau/kms/nv50-: Expose
 nv50_outp_atom in disp.h
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
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
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
index 368069a5b181a..090882794f7d6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -57,24 +57,6 @@
 
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
index 696e70a6b98b6..c7b72fa850995 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -71,6 +71,20 @@ struct nv50_dmac {
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
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
