Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7674F6C81D0
	for <lists+nouveau@lfdr.de>; Fri, 24 Mar 2023 16:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A008710E534;
	Fri, 24 Mar 2023 15:52:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA7B10E534
 for <nouveau@lists.freedesktop.org>; Fri, 24 Mar 2023 15:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679673144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fPwPDdlv2LUiU7nI+R/JDQaCBzeZ/8ZN3G2D5wvnC8c=;
 b=YJTmZ/QEfaSssPu9VKKEPqb7YmuqlKm4JHCtoj0mNcN5xXqZCdWIWHQhAwrsaQmSUhfJ4w
 Rjuyjov7iLHUvkr0vTGxUX1xGyFU7xmmb66ajvPqsNCvDVb91KHsCySb4Qwcnh230EJDa9
 BwKgB4he+e9RmgPEaYglf9hAFRWHrBM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-3KMUI5ZkNBC7-_hQZ5d0Tg-1; Fri, 24 Mar 2023 11:52:23 -0400
X-MC-Unique: 3KMUI5ZkNBC7-_hQZ5d0Tg-1
Received: by mail-qv1-f70.google.com with SMTP id
 z14-20020a0cd78e000000b005adc8684170so1212013qvi.3
 for <nouveau@lists.freedesktop.org>; Fri, 24 Mar 2023 08:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679673142; x=1682265142;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fPwPDdlv2LUiU7nI+R/JDQaCBzeZ/8ZN3G2D5wvnC8c=;
 b=N9w4c3/Zi1Qp3liR20C0Twhw5uRVNcQzSzs4+2p9pPzNw9RB30GU3pfeHQZyOs1Ave
 2sMdaH6AQiSh+ZoPEUkhpPDryXTS8hrD9K5BgG8EcO++AA1VVRQOkdf8Wc9636f5uJ3P
 Ai21KFoyK2pdYAajRcx9flQFA4RlXP0OGZBCMwsVb74MC2o5kMY4hn1tpI2UDqow7LsB
 TtVkzjoIRpxhqn+Jja+C/cRJT+DDRnaM1wwLEUX7gS4TLSiN8pHCDjZclZheNp2sBScH
 +NWn4lKtji2+DV2f5Yftl5AtK+5SCb9aJZK9fR+pN7SiC84cpTeMAZgjZ3tBAl70nAKy
 n64g==
X-Gm-Message-State: AO0yUKV1TF558+QVsmrQBcN4oqpkXlw/M0jwUrJWNakOQvlH6ZwGkIuY
 yk7F5T214SmNnazqP/om0ygkn8Nilj5AxhfpVcLHgocM4G/9lefbKDwLYUR5l2OhB7+v80dw1P/
 FUQTNDc5dE35L0tg+Jzd61kVBSw==
X-Received: by 2002:a05:622a:1a18:b0:3bf:a60d:43b9 with SMTP id
 f24-20020a05622a1a1800b003bfa60d43b9mr3863464qtb.4.1679673142037; 
 Fri, 24 Mar 2023 08:52:22 -0700 (PDT)
X-Google-Smtp-Source: AK7set9dGMxPoYAht2ipk1CT6ra7hRPMomwAzWoRJH8HLImNw7qE2w09Gg/j8Gpym6lsbF+2QpvsDQ==
X-Received: by 2002:a05:622a:1a18:b0:3bf:a60d:43b9 with SMTP id
 f24-20020a05622a1a1800b003bfa60d43b9mr3863443qtb.4.1679673141779; 
 Fri, 24 Mar 2023 08:52:21 -0700 (PDT)
Received: from kherbst.pingu.com (ip1f1032bf.dynamic.kabel-deutschland.de.
 [31.16.50.191]) by smtp.gmail.com with ESMTPSA id
 do31-20020a05620a2b1f00b00746ac77366fsm670170qkb.12.2023.03.24.08.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 08:52:20 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 24 Mar 2023 16:52:17 +0100
Message-Id: <20230324155217.3548232-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau/gr: enable memory loads on helper
 invocation on all channels
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

We have a lurking bug where Fragment Shader Helper Invocations can't load
from memory. But this is actually required in OpenGL and is causing random
hangs or failures in random shaders.

It is unknown how widespread this issue is, but shaders hitting this can
end up with infinite loops.

We enable those only on all Kepler and newer GPUs where we use our own
Firmware.

Nvidia's firmware provides a way to set a kernelspace controlled list of
mmio registers in the gr space from push buffers via MME macros.

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.c  |  2 ++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.h  |  2 ++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk104.c  |  4 +++-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110.c  | 10 ++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110b.c |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk208.c  |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c  |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm200.c  |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp100.c  |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp102.c  |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp104.c  |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp107.c  |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgv100.c  | 10 ++++++++++
 13 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.c
index cb390e0134a23..950ab7c82582f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.c
@@ -1332,6 +1332,8 @@ gf100_grctx_generate_floorsweep(struct gf100_gr *gr)
 		func->gpc_tpc_nr(gr);
 	if (func->r419f78)
 		func->r419f78(gr);
+	if (func->r419ba4)
+		func->r419ba4(gr);
 	if (func->tpc_mask)
 		func->tpc_mask(gr);
 	if (func->smid_config)
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.h b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.h
index 00dbeda7e3464..f31303efbc0ff 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.h
@@ -57,6 +57,7 @@ struct gf100_grctx_func {
 	void (*r406500)(struct gf100_gr *);
 	void (*gpc_tpc_nr)(struct gf100_gr *);
 	void (*r419f78)(struct gf100_gr *);
+	void (*r419ba4)(struct gf100_gr *);
 	void (*tpc_mask)(struct gf100_gr *);
 	void (*smid_config)(struct gf100_gr *);
 	/* misc other things */
@@ -117,6 +118,7 @@ void gk104_grctx_generate_r418800(struct gf100_gr *);
 
 extern const struct gf100_grctx_func gk110_grctx;
 void gk110_grctx_generate_r419eb0(struct gf100_gr *);
+void gk110_grctx_generate_r419f78(struct gf100_gr *);
 
 extern const struct gf100_grctx_func gk110b_grctx;
 extern const struct gf100_grctx_func gk208_grctx;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk104.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk104.c
index 94233d0119dff..52a234b1ef010 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk104.c
@@ -906,7 +906,9 @@ static void
 gk104_grctx_generate_r419f78(struct gf100_gr *gr)
 {
 	struct nvkm_device *device = gr->base.engine.subdev.device;
-	nvkm_mask(device, 0x419f78, 0x00000001, 0x00000000);
+
+	/* bit 3 set disables loads in fp helper invocations, we need it enabled */
+	nvkm_mask(device, 0x419f78, 0x00000009, 0x00000000);
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110.c
index 4391458e1fb2f..3acdd9eeb74a7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110.c
@@ -820,6 +820,15 @@ gk110_grctx_generate_r419eb0(struct gf100_gr *gr)
 	nvkm_mask(device, 0x419eb0, 0x00001000, 0x00001000);
 }
 
+void
+gk110_grctx_generate_r419f78(struct gf100_gr *gr)
+{
+	struct nvkm_device *device = gr->base.engine.subdev.device;
+
+	/* bit 3 set disables loads in fp helper invocations, we need it enabled */
+	nvkm_mask(device, 0x419f78, 0x00000008, 0x00000000);
+}
+
 const struct gf100_grctx_func
 gk110_grctx = {
 	.main  = gf100_grctx_generate_main,
@@ -854,4 +863,5 @@ gk110_grctx = {
 	.gpc_tpc_nr = gk104_grctx_generate_gpc_tpc_nr,
 	.r418800 = gk104_grctx_generate_r418800,
 	.r419eb0 = gk110_grctx_generate_r419eb0,
+	.r419f78 = gk110_grctx_generate_r419f78,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110b.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110b.c
index 7b9a34f9ec3c7..5597e87624acd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110b.c
@@ -103,4 +103,5 @@ gk110b_grctx = {
 	.gpc_tpc_nr = gk104_grctx_generate_gpc_tpc_nr,
 	.r418800 = gk104_grctx_generate_r418800,
 	.r419eb0 = gk110_grctx_generate_r419eb0,
+	.r419f78 = gk110_grctx_generate_r419f78,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk208.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk208.c
index c78d07a8bb7df..612656496541d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk208.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk208.c
@@ -568,4 +568,5 @@ gk208_grctx = {
 	.dist_skip_table = gf117_grctx_generate_dist_skip_table,
 	.gpc_tpc_nr = gk104_grctx_generate_gpc_tpc_nr,
 	.r418800 = gk104_grctx_generate_r418800,
+	.r419f78 = gk110_grctx_generate_r419f78,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c
index beac66eb2a803..9906974ac3f07 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c
@@ -988,4 +988,5 @@ gm107_grctx = {
 	.r406500 = gm107_grctx_generate_r406500,
 	.gpc_tpc_nr = gk104_grctx_generate_gpc_tpc_nr,
 	.r419e00 = gm107_grctx_generate_r419e00,
+	.r419f78 = gk110_grctx_generate_r419f78,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm200.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm200.c
index 175da8ac656ce..839b706a86e86 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm200.c
@@ -127,4 +127,5 @@ gm200_grctx = {
 	.smid_config = gm200_grctx_generate_smid_config,
 	.r418e94 = gm200_grctx_generate_r418e94,
 	.r419a3c = gm200_grctx_generate_r419a3c,
+	.r419f78 = gk110_grctx_generate_r419f78,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp100.c
index 8485aaeae7a92..068d36490d14c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp100.c
@@ -148,4 +148,5 @@ gp100_grctx = {
 	.tpc_mask = gm200_grctx_generate_tpc_mask,
 	.smid_config = gp100_grctx_generate_smid_config,
 	.r419a3c = gm200_grctx_generate_r419a3c,
+	.r419f78 = gk110_grctx_generate_r419f78,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp102.c
index 7537979a54927..18a5b3ca7d8c5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp102.c
@@ -122,4 +122,5 @@ gp102_grctx = {
 	.smid_config = gp100_grctx_generate_smid_config,
 	.r419a3c = gm200_grctx_generate_r419a3c,
 	.r408840 = gp102_grctx_generate_r408840,
+	.r419f78 = gk110_grctx_generate_r419f78,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp104.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp104.c
index 90b5f793e5676..5366f5b5ce80a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp104.c
@@ -47,4 +47,5 @@ gp104_grctx = {
 	.tpc_mask = gm200_grctx_generate_tpc_mask,
 	.smid_config = gp100_grctx_generate_smid_config,
 	.r419a3c = gm200_grctx_generate_r419a3c,
+	.r419f78 = gk110_grctx_generate_r419f78,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp107.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp107.c
index d191761a04711..d658ff1ce7bbc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp107.c
@@ -55,4 +55,5 @@ gp107_grctx = {
 	.tpc_mask = gm200_grctx_generate_tpc_mask,
 	.smid_config = gp100_grctx_generate_smid_config,
 	.r419a3c = gm200_grctx_generate_r419a3c,
+	.r419f78 = gk110_grctx_generate_r419f78,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgv100.c
index 957ea9d6bad4b..dadc0ecd1722d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgv100.c
@@ -192,6 +192,15 @@ gv100_grctx_unkn88c(struct gf100_gr *gr, bool on)
 	nvkm_rd32(device, 0x408a14);
 }
 
+static void
+gv100_grctx_generate_r419ba4(struct gf100_gr *gr)
+{
+	struct nvkm_device *device = gr->base.engine.subdev.device;
+
+	/* bit 3 set disables loads in fp helper invocations, we need it enabled */
+	nvkm_mask(device, 0x419ba4, 0x00000008, 0x00000000);
+}
+
 const struct gf100_grctx_func
 gv100_grctx = {
 	.unkn88c = gv100_grctx_unkn88c,
@@ -219,4 +228,5 @@ gv100_grctx = {
 	.gpc_tpc_nr = gk104_grctx_generate_gpc_tpc_nr,
 	.smid_config = gp100_grctx_generate_smid_config,
 	.r400088 = gv100_grctx_generate_r400088,
+	.r419ba4 = gv100_grctx_generate_r419ba4,
 };
-- 
2.39.2

