Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 218CA7A53B3
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB6D10E2FF;
	Mon, 18 Sep 2023 20:15:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BD810E305
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:52 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1c3bd829b86so36148025ad.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068151; x=1695672951; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=umpbVtEc7XWCUvA2Rbbb8/22K15RUVEXYcsqos35agk=;
 b=I4ptq/o0wNASashLpA/8tr+waPp5WkLT7FMxaXn9fjwZlBSuKjWgWBUgIybYd2qi2A
 5dAlA/00mAU/LD2/VGlVP2IM3HdrDFtvX07xbxbBE8cH3AiPCQ/IvdYLNRE/zE3LRkN/
 s91nseP+Ws//XFhsiJkAv4/FNUrOoVHkVtNMPCvpoilk3L2oRnzHL+pD1kV/QRjPQ2iN
 4cFZSOGi5z19/vOXQQCO4X9F7/ZdIzScNUJnMHZpODISsDuAyFgZCvBJmxRplPLWt1nl
 6J7lzOITo5exq8dJ172cvZDQJqkJ18CYn7PazE+h4Zade9TM29pFexeUj9XJZDhfNJSS
 ZGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068151; x=1695672951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=umpbVtEc7XWCUvA2Rbbb8/22K15RUVEXYcsqos35agk=;
 b=JtYmsF3vJ5I8hmVeZBGtQHPJGhzfHT31CosWeE7b+byHQZBTrWUzPA9OByAYC63FiN
 3lD9tBozn/u7Qo9c6UIPXvTaS02e7bBxQ7j0BHmIVABuo0c7TxKGwjCiQp+Ll8YNyAAE
 f/alFdVNzLm5VUzGdk/LngS84OyuZEeaWX+CitLiTpEwGXnkFD3lEeh6f7cmX/HmiG6f
 zxeDtPq7k6gqI0p5n2uPxjG0eMi1TJlE30kjwnkHYdbQLluPCG7jVk6cIZbpMxPmkHsu
 txhX1qJHi1vRs7/3n+dKkHCjWA9Z+Q5s0C40j59QFRoFQ7E/9MDVVbpB8JSAMfhZn/vW
 sD0A==
X-Gm-Message-State: AOJu0YzzIqjOfuDFT8mlWB2D9hYlaQzxrsvUbOlmGsbCQPobOEC9gTFs
 T6Ntxn3TNS/b2NOq477NG7WzRi6/4hs=
X-Google-Smtp-Source: AGHT+IGxeR5Bd+FEVARf/ighoiITxGZGj7Bqq4Od/WhCsZYbfdwnpt9Mf0Ve6LcBcasGgJN+BLMFWw==
X-Received: by 2002:a17:902:f689:b0:1c3:2ee6:380d with SMTP id
 l9-20020a170902f68900b001c32ee6380dmr10482224plg.48.1695068151256; 
 Mon, 18 Sep 2023 13:15:51 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:50 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:57 +1000
Message-ID: <20230918201404.3765-38-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 37/44] drm/nouveau/disp: move outp init/fini
 paths to chipset code
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- pre-nv5x doesn't use any of this
- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/base.c   | 31 +++----------------
 .../gpu/drm/nouveau/nvkm/engine/disp/conn.c   | 10 ------
 .../gpu/drm/nouveau/nvkm/engine/disp/conn.h   |  2 --
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   | 14 +++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   | 20 ++----------
 6 files changed, 22 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
index 1dbe68f9a0e0..39f7e7ce9f4a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
@@ -102,18 +102,14 @@ static int
 nvkm_disp_fini(struct nvkm_engine *engine, bool suspend)
 {
 	struct nvkm_disp *disp = nvkm_disp(engine);
-	struct nvkm_conn *conn;
 	struct nvkm_outp *outp;
 
 	if (disp->func->fini)
 		disp->func->fini(disp);
 
 	list_for_each_entry(outp, &disp->outps, head) {
-		nvkm_outp_fini(outp);
-	}
-
-	list_for_each_entry(conn, &disp->conns, head) {
-		nvkm_conn_fini(conn);
+		if (outp->func->fini)
+			outp->func->fini(outp);
 	}
 
 	return 0;
@@ -123,16 +119,12 @@ static int
 nvkm_disp_init(struct nvkm_engine *engine)
 {
 	struct nvkm_disp *disp = nvkm_disp(engine);
-	struct nvkm_conn *conn;
 	struct nvkm_outp *outp;
 	struct nvkm_ior *ior;
 
-	list_for_each_entry(conn, &disp->conns, head) {
-		nvkm_conn_init(conn);
-	}
-
 	list_for_each_entry(outp, &disp->outps, head) {
-		nvkm_outp_init(outp);
+		if (outp->func->init)
+			outp->func->init(outp);
 	}
 
 	if (disp->func->init) {
@@ -156,9 +148,7 @@ nvkm_disp_oneinit(struct nvkm_engine *engine)
 {
 	struct nvkm_disp *disp = nvkm_disp(engine);
 	struct nvkm_subdev *subdev = &disp->engine.subdev;
-	struct nvkm_outp *outp;
 	struct nvkm_head *head;
-	struct nvkm_ior *ior;
 	int ret, i;
 
 	if (disp->func->oneinit) {
@@ -167,19 +157,6 @@ nvkm_disp_oneinit(struct nvkm_engine *engine)
 			return ret;
 	}
 
-	/* Enforce identity-mapped SOR assignment for panels, which have
-	 * certain bits (ie. backlight controls) wired to a specific SOR.
-	 */
-	list_for_each_entry(outp, &disp->outps, head) {
-		if (outp->conn->info.type == DCB_CONNECTOR_LVDS ||
-		    outp->conn->info.type == DCB_CONNECTOR_eDP) {
-			ior = nvkm_ior_find(disp, SOR, ffs(outp->info.or) - 1);
-			if (!WARN_ON(!ior))
-				ior->identity = true;
-			outp->identity = true;
-		}
-	}
-
 	i = 0;
 	list_for_each_entry(head, &disp->heads, head)
 		i = max(i, head->id + 1);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.c
index fbdae1137864..ff88a5a5253a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.c
@@ -29,16 +29,6 @@
 
 #include <nvif/event.h>
 
-void
-nvkm_conn_fini(struct nvkm_conn *conn)
-{
-}
-
-void
-nvkm_conn_init(struct nvkm_conn *conn)
-{
-}
-
 void
 nvkm_conn_del(struct nvkm_conn **pconn)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h
index a0600e72b0ec..01c3146c7066 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h
@@ -19,8 +19,6 @@ struct nvkm_conn {
 int nvkm_conn_new(struct nvkm_disp *, int index, struct nvbios_connE *,
 		  struct nvkm_conn **);
 void nvkm_conn_del(struct nvkm_conn **);
-void nvkm_conn_init(struct nvkm_conn *);
-void nvkm_conn_fini(struct nvkm_conn *);
 
 #define CONN_MSG(c,l,f,a...) do {                                              \
 	struct nvkm_conn *_conn = (c);                                    \
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index aaa7796946ce..b35fae96d855 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -603,6 +603,7 @@ nvkm_dp_fini(struct nvkm_outp *outp)
 static void
 nvkm_dp_init(struct nvkm_outp *outp)
 {
+	nvkm_outp_init(outp);
 	nvkm_dp_enable(outp, outp->dp.enabled);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index 7343b24f10eb..4be09ec4fd5c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -1586,6 +1586,7 @@ nv50_disp_oneinit(struct nvkm_disp *disp)
 	struct nvkm_bios *bios = device->bios;
 	struct nvkm_outp *outp, *outt, *pair;
 	struct nvkm_conn *conn;
+	struct nvkm_ior *ior;
 	int ret, i;
 	u8  ver, hdr;
 	u32 data;
@@ -1747,6 +1748,19 @@ nv50_disp_oneinit(struct nvkm_disp *disp)
 		list_add_tail(&outp->conn->head, &disp->conns);
 	}
 
+	/* Enforce identity-mapped SOR assignment for panels, which have
+	 * certain bits (ie. backlight controls) wired to a specific SOR.
+	 */
+	list_for_each_entry(outp, &disp->outps, head) {
+		if (outp->conn->info.type == DCB_CONNECTOR_LVDS ||
+		    outp->conn->info.type == DCB_CONNECTOR_eDP) {
+			ior = nvkm_ior_find(disp, SOR, ffs(outp->info.or) - 1);
+			if (!WARN_ON(!ior))
+				ior->identity = true;
+			outp->identity = true;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index f1a3e623bb22..bfb2a4db8d64 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -287,13 +287,6 @@ nvkm_outp_acquire(struct nvkm_outp *outp, bool hda)
 	return 0;
 }
 
-void
-nvkm_outp_fini(struct nvkm_outp *outp)
-{
-	if (outp->func->fini)
-		outp->func->fini(outp);
-}
-
 struct nvkm_ior *
 nvkm_outp_inherit(struct nvkm_outp *outp)
 {
@@ -332,8 +325,8 @@ nvkm_outp_inherit(struct nvkm_outp *outp)
 	return ior;
 }
 
-static void
-nvkm_outp_init_route(struct nvkm_outp *outp)
+void
+nvkm_outp_init(struct nvkm_outp *outp)
 {
 	enum nvkm_ior_proto proto;
 	enum nvkm_ior_type type;
@@ -365,14 +358,6 @@ nvkm_outp_init_route(struct nvkm_outp *outp)
 	ior->arm.outp = outp;
 }
 
-void
-nvkm_outp_init(struct nvkm_outp *outp)
-{
-	nvkm_outp_init_route(outp);
-	if (outp->func->init)
-		outp->func->init(outp);
-}
-
 void
 nvkm_outp_del(struct nvkm_outp **poutp)
 {
@@ -420,6 +405,7 @@ nvkm_outp_new_(const struct nvkm_outp_func *func, struct nvkm_disp *disp,
 
 static const struct nvkm_outp_func
 nvkm_outp = {
+	.init = nvkm_outp_init,
 	.detect = nvkm_outp_detect,
 	.inherit = nvkm_outp_inherit,
 	.acquire = nvkm_outp_acquire,
-- 
2.41.0

