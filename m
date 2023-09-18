Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEB37A53B2
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDB410E304;
	Mon, 18 Sep 2023 20:15:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D014110E300
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:49 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1c4586b12feso13857295ad.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068149; x=1695672949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M3oroFOwaf7d9VtHjhXAOpGT/uTBLWGHcZg32AUfXxg=;
 b=dFZsVDfQiNYhc1N3mZ74Topm0XBMwJfiRy6ebhSow9KSLItplB24Q/A0+6PIHV5VRf
 WX1pMZuQ1njc/Wnc+cpCwjUUBJ2RP0GnjMeoBZPMKx4xAKrHmAg/enCRLsU+IuFW+hBN
 A7FGfcF76PT9AV2e5lbF3WfNrrD4Pk7AYB2bNmMGw8qkRG3EoGi6I9Uo1GOasnBFa20W
 rHvvcJc/GROh56PWm/0jgv9kSseNl565WrBp9mdT3m8f6EAo6rO4xnvqPsiHqD1jZwX7
 fePdywD62HVImMSEmwDD3P6aSzFNCvMaTAEeTWOOIIouzQ/vw/mQZG17GZqNrnIPJCK0
 h/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068149; x=1695672949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M3oroFOwaf7d9VtHjhXAOpGT/uTBLWGHcZg32AUfXxg=;
 b=SXTOTSow9lzjEcQGte49SP8dWdr2gbqrjHGFKa2uG5lht9+CreMe9R/TfnG7I+Dpw7
 wRUA/wrR5aZMCobhXYrxy149IxKX7t5hxbWWayBWScj5XZTKkMrCKsxvSU6TQvV6JZ2J
 U5M9RCwQkBDoxKfBwtkfHVuL/TXy7OdEG5cj7jRlPz/LVKFskVe9U8/5D9HudiOl0mUr
 Z8sh3dM7iPtj2ZD6/NUYUVrjZa7+WPSnLXz3Pr0/N4lw8Lgfb3axR+FBV/MCfqPCnvXK
 3O7nwPrxTF5abnKqS1mbDi9HEHaBLGr91H/f1nsxjV3IAKBJVutDU312gFJwoR7euUq4
 6YHQ==
X-Gm-Message-State: AOJu0YyNX+tXlTF83+c9gNWx1X9gG3QVAci+TmnSNSA9ECa212nY6SBl
 war4+GMGODUCca9hulZXzD5UNZJOaTo=
X-Google-Smtp-Source: AGHT+IGrxehozEc1NdyyC6P7FwlCf4uh3hw7lu54M2x3xWdyBJTBqSw6PDWU41dtMP+j/LzXsSia8w==
X-Received: by 2002:a17:903:4294:b0:1c0:e6e1:4a11 with SMTP id
 ju20-20020a170903429400b001c0e6e14a11mr7043745plb.54.1695068148826; 
 Mon, 18 Sep 2023 13:15:48 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:48 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:56 +1000
Message-ID: <20230918201404.3765-37-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 36/44] drm/nouveau/disp: move outp/conn
 construction to chipset code
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

- pre-nv5x doesn't use any of this, has its own version DRM-side
- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/base.c   | 117 +----------------
 .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   | 122 +++++++++++++++++-
 2 files changed, 121 insertions(+), 118 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
index 73104b59f97f..1dbe68f9a0e0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
@@ -23,15 +23,12 @@
  */
 #include "priv.h"
 #include "conn.h"
-#include "dp.h"
 #include "head.h"
 #include "ior.h"
 #include "outp.h"
 
 #include <core/client.h>
 #include <core/ramht.h>
-#include <subdev/bios.h>
-#include <subdev/bios/dcb.h>
 
 #include <nvif/class.h>
 #include <nvif/cl0046.h>
@@ -159,123 +156,11 @@ nvkm_disp_oneinit(struct nvkm_engine *engine)
 {
 	struct nvkm_disp *disp = nvkm_disp(engine);
 	struct nvkm_subdev *subdev = &disp->engine.subdev;
-	struct nvkm_bios *bios = subdev->device->bios;
-	struct nvkm_outp *outp, *outt, *pair;
-	struct nvkm_conn *conn;
+	struct nvkm_outp *outp;
 	struct nvkm_head *head;
 	struct nvkm_ior *ior;
-	struct nvbios_connE connE;
-	struct dcb_output dcbE;
-	u8  hpd = 0, ver, hdr;
-	u32 data;
 	int ret, i;
 
-	/* Create output path objects for each VBIOS display path. */
-	i = -1;
-	while ((data = dcb_outp_parse(bios, ++i, &ver, &hdr, &dcbE))) {
-		if (ver < 0x40) /* No support for chipsets prior to NV50. */
-			break;
-		if (dcbE.type == DCB_OUTPUT_UNUSED)
-			continue;
-		if (dcbE.type == DCB_OUTPUT_EOL)
-			break;
-		outp = NULL;
-
-		switch (dcbE.type) {
-		case DCB_OUTPUT_ANALOG:
-		case DCB_OUTPUT_TV:
-		case DCB_OUTPUT_TMDS:
-		case DCB_OUTPUT_LVDS:
-			ret = nvkm_outp_new(disp, i, &dcbE, &outp);
-			break;
-		case DCB_OUTPUT_DP:
-			ret = nvkm_dp_new(disp, i, &dcbE, &outp);
-			break;
-		case DCB_OUTPUT_WFD:
-			/* No support for WFD yet. */
-			ret = -ENODEV;
-			continue;
-		default:
-			nvkm_warn(subdev, "dcb %d type %d unknown\n",
-				  i, dcbE.type);
-			continue;
-		}
-
-		if (ret) {
-			if (outp) {
-				if (ret != -ENODEV)
-					OUTP_ERR(outp, "ctor failed: %d", ret);
-				else
-					OUTP_DBG(outp, "not supported");
-				nvkm_outp_del(&outp);
-				continue;
-			}
-			nvkm_error(subdev, "failed to create outp %d\n", i);
-			continue;
-		}
-
-		list_add_tail(&outp->head, &disp->outps);
-		hpd = max(hpd, (u8)(dcbE.connector + 1));
-	}
-
-	/* Create connector objects based on available output paths. */
-	list_for_each_entry_safe(outp, outt, &disp->outps, head) {
-		/* VBIOS data *should* give us the most useful information. */
-		data = nvbios_connEp(bios, outp->info.connector, &ver, &hdr,
-				     &connE);
-
-		/* No bios connector data... */
-		if (!data) {
-			/* Heuristic: anything with the same ccb index is
-			 * considered to be on the same connector, any
-			 * output path without an associated ccb entry will
-			 * be put on its own connector.
-			 */
-			int ccb_index = outp->info.i2c_index;
-			if (ccb_index != 0xf) {
-				list_for_each_entry(pair, &disp->outps, head) {
-					if (pair->info.i2c_index == ccb_index) {
-						outp->conn = pair->conn;
-						break;
-					}
-				}
-			}
-
-			/* Connector shared with another output path. */
-			if (outp->conn)
-				continue;
-
-			memset(&connE, 0x00, sizeof(connE));
-			connE.type = DCB_CONNECTOR_NONE;
-			i = -1;
-		} else {
-			i = outp->info.connector;
-		}
-
-		/* Check that we haven't already created this connector. */
-		list_for_each_entry(conn, &disp->conns, head) {
-			if (conn->index == outp->info.connector) {
-				outp->conn = conn;
-				break;
-			}
-		}
-
-		if (outp->conn)
-			continue;
-
-		/* Apparently we need to create a new one! */
-		ret = nvkm_conn_new(disp, i, &connE, &outp->conn);
-		if (ret) {
-			nvkm_error(subdev, "failed to create outp %d conn: %d\n", outp->index, ret);
-			nvkm_conn_del(&outp->conn);
-			list_del(&outp->head);
-			nvkm_outp_del(&outp);
-			continue;
-		}
-
-		list_add_tail(&outp->conn->head, &disp->conns);
-	}
-
 	if (disp->func->oneinit) {
 		ret = disp->func->oneinit(disp);
 		if (ret)
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index e9d0a9b715d4..7343b24f10eb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -23,7 +23,9 @@
  */
 #include "priv.h"
 #include "chan.h"
+#include "conn.h"
 #include "head.h"
+#include "dp.h"
 #include "ior.h"
 #include "outp.h"
 
@@ -1581,7 +1583,14 @@ nv50_disp_oneinit(struct nvkm_disp *disp)
 	const struct nvkm_disp_func *func = disp->func;
 	struct nvkm_subdev *subdev = &disp->engine.subdev;
 	struct nvkm_device *device = subdev->device;
+	struct nvkm_bios *bios = device->bios;
+	struct nvkm_outp *outp, *outt, *pair;
+	struct nvkm_conn *conn;
 	int ret, i;
+	u8  ver, hdr;
+	u32 data;
+	struct dcb_output dcbE;
+	struct nvbios_connE connE;
 
 	if (func->wndw.cnt) {
 		disp->wndw.nr = func->wndw.cnt(disp, &disp->wndw.mask);
@@ -1628,8 +1637,117 @@ nv50_disp_oneinit(struct nvkm_disp *disp)
 	if (ret)
 		return ret;
 
-	return nvkm_ramht_new(device, func->ramht_size ? func->ramht_size :
-			      0x1000, 0, disp->inst, &disp->ramht);
+	ret = nvkm_ramht_new(device, func->ramht_size ? func->ramht_size : 0x1000, 0, disp->inst,
+			     &disp->ramht);
+	if (ret)
+		return ret;
+
+	/* Create output path objects for each VBIOS display path. */
+	i = -1;
+	while ((data = dcb_outp_parse(bios, ++i, &ver, &hdr, &dcbE))) {
+		if (WARN_ON((ver & 0xf0) != 0x40))
+			return -EINVAL;
+		if (dcbE.type == DCB_OUTPUT_UNUSED)
+			continue;
+		if (dcbE.type == DCB_OUTPUT_EOL)
+			break;
+		outp = NULL;
+
+		switch (dcbE.type) {
+		case DCB_OUTPUT_ANALOG:
+		case DCB_OUTPUT_TV:
+		case DCB_OUTPUT_TMDS:
+		case DCB_OUTPUT_LVDS:
+			ret = nvkm_outp_new(disp, i, &dcbE, &outp);
+			break;
+		case DCB_OUTPUT_DP:
+			ret = nvkm_dp_new(disp, i, &dcbE, &outp);
+			break;
+		case DCB_OUTPUT_WFD:
+			/* No support for WFD yet. */
+			ret = -ENODEV;
+			continue;
+		default:
+			nvkm_warn(subdev, "dcb %d type %d unknown\n",
+				  i, dcbE.type);
+			continue;
+		}
+
+		if (ret) {
+			if (outp) {
+				if (ret != -ENODEV)
+					OUTP_ERR(outp, "ctor failed: %d", ret);
+				else
+					OUTP_DBG(outp, "not supported");
+				nvkm_outp_del(&outp);
+				continue;
+			}
+			nvkm_error(subdev, "failed to create outp %d\n", i);
+			continue;
+		}
+
+		list_add_tail(&outp->head, &disp->outps);
+	}
+
+	/* Create connector objects based on available output paths. */
+	list_for_each_entry_safe(outp, outt, &disp->outps, head) {
+		/* VBIOS data *should* give us the most useful information. */
+		data = nvbios_connEp(bios, outp->info.connector, &ver, &hdr,
+				     &connE);
+
+		/* No bios connector data... */
+		if (!data) {
+			/* Heuristic: anything with the same ccb index is
+			 * considered to be on the same connector, any
+			 * output path without an associated ccb entry will
+			 * be put on its own connector.
+			 */
+			int ccb_index = outp->info.i2c_index;
+			if (ccb_index != 0xf) {
+				list_for_each_entry(pair, &disp->outps, head) {
+					if (pair->info.i2c_index == ccb_index) {
+						outp->conn = pair->conn;
+						break;
+					}
+				}
+			}
+
+			/* Connector shared with another output path. */
+			if (outp->conn)
+				continue;
+
+			memset(&connE, 0x00, sizeof(connE));
+			connE.type = DCB_CONNECTOR_NONE;
+			i = -1;
+		} else {
+			i = outp->info.connector;
+		}
+
+		/* Check that we haven't already created this connector. */
+		list_for_each_entry(conn, &disp->conns, head) {
+			if (conn->index == outp->info.connector) {
+				outp->conn = conn;
+				break;
+			}
+		}
+
+		if (outp->conn)
+			continue;
+
+		/* Apparently we need to create a new one! */
+		ret = nvkm_conn_new(disp, i, &connE, &outp->conn);
+		if (ret) {
+			nvkm_error(subdev, "failed to create outp %d conn: %d\n", outp->index, ret);
+			nvkm_conn_del(&outp->conn);
+			list_del(&outp->head);
+			nvkm_outp_del(&outp);
+			continue;
+		}
+
+		list_add_tail(&outp->conn->head, &disp->conns);
+	}
+
+	return 0;
 }
 
 static const struct nvkm_disp_func
-- 
2.41.0

