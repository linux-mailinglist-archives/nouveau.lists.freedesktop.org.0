Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC72B79FEE8
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A45C10E542;
	Thu, 14 Sep 2023 08:48:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E20810E550
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:20 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68fb7074348so612565b3a.2
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681299; x=1695286099; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rxLfqvu+lYF/a0zB8iwRrYDsqxUeTrnh0B6Cm0TvamU=;
 b=ZIUn2TmDA6VSItqmOMbYfp369++JMjfq7JAHpi4uh2qUNqOsrOluLcSFdZc8H1QFS5
 tN5S9rRclCyq4b0t7I27O5IhjeLqU5zzT4n5mBmGT5qkUVsEnlYgX3YV2KpoRYzDoEhq
 AYtDIrovDZWTrhCyqQpXpa0TaFc3iDUZjZ3WzAezWDJRYiQWJCtu0ALjJsLCTjVkG/L1
 7jf5ywIzXnVKaMu3gjvziFArivCn27olb72dm5RfbKqOSnPdR7GAP4vZQaLojn4nx8qA
 Nwl+/30mBzqt5e87qbzpUwIelox7ItoS+tCZlCR28M7SRNouC8Nx8lSZ7fXJ1ZVRaGjp
 mRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681299; x=1695286099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rxLfqvu+lYF/a0zB8iwRrYDsqxUeTrnh0B6Cm0TvamU=;
 b=qH6baTsgkubAVOTZD+7dLf4M/6ZYOUoktja99Wn9lIIrklyUgIM11cNG2rB7rBdAGs
 yOMGU/Vu6E/ct8hrDnO0vOvfMJhPnXBuorfVkkQ9vwfjOX1yltCVuPrHfRMK45p100aW
 pKgaLeh1ETIMu7hbpzO2d2m5Xg0nQfX8mv4We7EHT9RWOric10O7U5kdOik9vMgfMG33
 qzrC6/wvUGUloZ/8Zc/UTvMkcjqc4XRDiJ1w48JgP9ymmKo1hlxdOm87x7PaR+AkB+mM
 djSQ/TyTRVzMbIfbcuT99ZDCOMwMBfZOY5hnS0BydtC7xQkmrAYmjcOWRg//sXAlgLju
 vFqw==
X-Gm-Message-State: AOJu0YxFy86mFUiLHJvrCMT1Uuitb8vLrJMXyem+36q3cUkdjj8gyZX5
 hfndEdT46qohp8CT1+0qUEszPkOyP+E=
X-Google-Smtp-Source: AGHT+IH+eofzF1EK38eQ1OIuzIKrBeSUoGe1ebd3qBuTzm+QZ/GRVZvjHUZiIyUfz89V54zk4Blb1Q==
X-Received: by 2002:aa7:88c8:0:b0:68f:cb69:8e4f with SMTP id
 k8-20020aa788c8000000b0068fcb698e4fmr5991142pff.1.1694681299449; 
 Thu, 14 Sep 2023 01:48:19 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:48:19 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:18 +1000
Message-ID: <20230914084624.2299765-39-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 37/44] drm/nouveau/disp: move outp/conn
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

