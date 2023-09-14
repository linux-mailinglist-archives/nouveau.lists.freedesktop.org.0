Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF02779FEE9
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E0810E54E;
	Thu, 14 Sep 2023 08:48:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C012710E54B
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:22 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-68fb79ef55eso614856b3a.0
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681302; x=1695286102; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8tkJn4LivlT0XSeYD019n4+7hbiqaW2ndEPCKkVySYw=;
 b=NUTvTAqZ5INsR2dxZ/IFhx6ZHrO0jlutfvtMPxfAC5N1A0aEX9GePtEB2hWNCXoOR8
 k4buwy7vrG3L7kU8kuw0KbV4/x+CRFqOgowh8PLLF0fFpzaBQtDSVD3/oxKpND22R/AS
 f3mjxxRW5CwqaSyk7mxBd3BH6/csxyB9R8VayVi1LCc29e3S+uHoPQuJpqIbKHMLyHBu
 YWb6+6UQl2yM7Vn9awKCC2Y8/5HjAmOY0LYgs242PXOH+Tf5tcIEnmW5q6vEZpxiocZO
 TSUxYWeWoI79s6bGbCcB1PXIqXa9XKo8JpbHVhg7St3nwlK8OwdYSZiEXLjW82VkDq+f
 /YGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681302; x=1695286102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8tkJn4LivlT0XSeYD019n4+7hbiqaW2ndEPCKkVySYw=;
 b=TagDYGvGcXOIKVNMyvSt385QEWM0RcdEuZdvlgFaHOZV2+atyQp9nuv5gi8rtERo3s
 7WzeGOykYoiQKefhHAQOvJbKH5GeHlh6FgI+XZwCpf2MPO+MaIXPFPVgnaVUk5azk5eo
 nHRkoGPimcGnDzqpjR7wbA8iJ97MowrJfwKh8FhETz1TMpT5hGcmuOMTGMRFIE9B2lMl
 cQJAbXgi68svsr7c31D5WTLGP9XgN/A0idjcSFUsCthOTq6zXgsOwQcpEfcL1GahzSUl
 fohCGX/pkl+7esV7jGoPhmiBkDIHdqQ69ONn6FUY9uTR3saYh6LqmmiWMLwizgTLvX9k
 Q3sQ==
X-Gm-Message-State: AOJu0Yz0s51jkp/W7WYAjIRJBrV1NmTULYg2JrEMQsN4aEH0//NVnfQc
 vlpcvnNZCDqTRmgV2RwqIyHaDYld2f0=
X-Google-Smtp-Source: AGHT+IGaZLX6SJ6pDz7wyswkcXf5/eeXGBrHhbhvPOzvHLv2TmcZQFDl9jWkdUEpbwZe01vZVmyeyQ==
X-Received: by 2002:a05:6a20:6a0b:b0:153:b245:50ff with SMTP id
 p11-20020a056a206a0b00b00153b24550ffmr5313625pzk.40.1694681301647; 
 Thu, 14 Sep 2023 01:48:21 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:48:21 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:19 +1000
Message-ID: <20230914084624.2299765-40-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 38/44] drm/nouveau/disp: move outp init/fini paths
 to chipset code
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

