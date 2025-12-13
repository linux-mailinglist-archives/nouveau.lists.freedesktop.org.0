Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C08ACBA233
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 01:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B936E10E99C;
	Sat, 13 Dec 2025 00:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MTigQRU3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA0D10E99C
 for <nouveau@lists.freedesktop.org>; Sat, 13 Dec 2025 00:54:07 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-8824888ce97so25184086d6.2
 for <nouveau@lists.freedesktop.org>; Fri, 12 Dec 2025 16:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765587247; x=1766192047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vQtFCKqn/Vy0CrF2DeD/KfL/1h1ZSMpG0XzEYRrFseY=;
 b=MTigQRU3eM4wFVEUtIjK6sxla8pnR7YNwP4rMHdCmWTpsLzHTWleLqpdeb+DjzVtov
 XgMTg50XbrPUWpe3Y5dVObQDgVH7fY/OhPAdz9hEsypff8BAVTYUbjgfbVRUwKHJw0iN
 XI035if3NbwRBaBbC9R75CSQF9SeMmkpUwX1/noITdntGg9PA+yMArUMKewzQOgUEdjy
 fOW/KxXWrKwOKwUzUZyaaZSS9VaE4BZrSKFhAmXHAcTv2UNmEhaU/W3a7yshvlsezgST
 SUtEqpwnytU0ZmaLC2II+JPwxhMyDtlOR7030CNqi7hqaqSdMtsusy+lrnDxH3sK9coa
 E+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765587247; x=1766192047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vQtFCKqn/Vy0CrF2DeD/KfL/1h1ZSMpG0XzEYRrFseY=;
 b=fln2ZM1KyRGa3j3tVJM5z3PYF/GQN1vAaTxHKcojrjKXBxkAi3qfXg4x8/T6uz4gcE
 y2Zjj1KyZ25853T+JpmePPxH48dmhLLW6F58Mvm09ptSnjkMFrvjBO+CRYja6NO1++iq
 BVCFvBt2+NS/9zNCYjrsW5kE0bizmcqXEWBWDrRSNMBu9FKtgpeBRR9aF/8oAo1MVdgC
 HWzKUqnbXSPQyn0oBgKDerCf2dgA3FPpfrPLHEtXqf66eEWMjgWgjK97ZdF2TuBCpu9q
 XJSHMMUIkwtwY923fR3TH9vbNtmi7EUQr+Jmy5bf5UF+/ULxfWVVoJWLbnDB4PceuXpj
 9/xQ==
X-Gm-Message-State: AOJu0Ywocv6xcZu8RG+RIq3Ook0TT5OQ/4pRFFMZRVenhUaqlWLCrxYP
 jDokkPwTVqZ5jYowpGyxAxKRCbDlcx6syoShT9huiETidU6f9FCo8vVI2S01I9N8
X-Gm-Gg: AY/fxX7PKxggRSBGGqV3xbSZEmkZlsyAEoH8ByC6IqgQRRZe411d6wOSeJ6vC3xvGqe
 7cViwdosEdJaQnrd2YGMQ2rbjWFynT5r4GQef00TIUxRFhKQiSFxZl3S3ghydo9eEOecD/56QJY
 FCeyai3v+n+5ZXYbnmypL2+eezjIlbnMifsfc1TRIN0/oVaImrzWSPSDU5Zef/WonYMOzBXwmqQ
 R4yr3edlkorzFzDhC7kz8MbbO2dwan8GRqFL3U5dGdfYj1AyQ+kahFbFXiWtEyMVNsMQd87Lj8i
 tHylUGGboPCW1vZT2kHNP1rnClJIsh+fMcBwa+Z0kIfq7JGs3qBXjvSvKq89X4/7URJzO+Z4iTI
 G1Rnp+VQoi5MfBxYL6xGA4CWb61WOyokqde0+GJ5IGJEa8mkyn+ZHxNDYZ2v6/oM8Xk8aOoObyO
 xwOSZn
X-Google-Smtp-Source: AGHT+IFJZ2xHJNMgM/kPIULCkqd8a2VMuys0w04agmaID4F2zTOJT/VezhDgU0Ky6BQZNfPmvHEZww==
X-Received: by 2002:a05:6214:2e8f:b0:888:7f91:e276 with SMTP id
 6a1803df08f44-8887f91e805mr47157006d6.30.1765587246932; 
 Fri, 12 Dec 2025 16:54:06 -0800 (PST)
Received: from kunkbox.lan ([2601:18a:8300:336d::6c2])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88993c61ff0sm4452176d6.21.2025.12.12.16.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 16:54:06 -0800 (PST)
From: lxrmrz732@gmail.com
To: lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com
Cc: nouveau@lists.freedesktop.org, lxrmrz732@rocketmail.com,
 Alex Ramirez <lxrmrz732@gmail.com>
Subject: [PATCH v3 2/2][RESEND 2] drm/nouveau: implement missing DCB connector
 types; gracefully handle unknown connectors
Date: Fri, 12 Dec 2025 19:53:27 -0500
Message-ID: <20251213005327.9495-3-lxrmrz732@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213005327.9495-1-lxrmrz732@gmail.com>
References: <20251213005327.9495-1-lxrmrz732@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Alex Ramirez <lxrmrz732@gmail.com>

* Implement missing DCB connectors in uconn.c previously defined in conn.h.
* Replace kernel WARN_ON macro with printk message to more gracefully signify
  an unknown connector was encountered.

With this patch, unknown connectors are explicitly marked with value 0
(DCB_CONNECTOR_VGA) to match the tested current behavior. Although 0xff
(DCB_CONNECTOR_NONE) may be more suitable, I don't want to introduce a breaking change.

Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based on nvkm info")
Link: https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html#_connector_table_entry
Signed-off-by: Alex Ramírez <lxrmrz732@rocketmail.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 73 ++++++++++++++-----
 1 file changed, 53 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 2dab6612c4fc..d1fed2beee63 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -191,27 +191,60 @@ nvkm_uconn_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	spin_lock(&disp->client.lock);
 	if (!conn->object.func) {
 		switch (conn->info.type) {
-		case DCB_CONNECTOR_VGA      : args->v0.type = NVIF_CONN_V0_VGA; break;
-		case DCB_CONNECTOR_TV_0     :
-		case DCB_CONNECTOR_TV_1     :
-		case DCB_CONNECTOR_TV_3     : args->v0.type = NVIF_CONN_V0_TV; break;
-		case DCB_CONNECTOR_DMS59_0  :
-		case DCB_CONNECTOR_DMS59_1  :
-		case DCB_CONNECTOR_DVI_I    : args->v0.type = NVIF_CONN_V0_DVI_I; break;
-		case DCB_CONNECTOR_DVI_D    : args->v0.type = NVIF_CONN_V0_DVI_D; break;
-		case DCB_CONNECTOR_LVDS     : args->v0.type = NVIF_CONN_V0_LVDS; break;
-		case DCB_CONNECTOR_LVDS_SPWG: args->v0.type = NVIF_CONN_V0_LVDS_SPWG; break;
-		case DCB_CONNECTOR_DMS59_DP0:
-		case DCB_CONNECTOR_DMS59_DP1:
-		case DCB_CONNECTOR_DP       :
-		case DCB_CONNECTOR_mDP      :
-		case DCB_CONNECTOR_USB_C    : args->v0.type = NVIF_CONN_V0_DP; break;
-		case DCB_CONNECTOR_eDP      : args->v0.type = NVIF_CONN_V0_EDP; break;
-		case DCB_CONNECTOR_HDMI_0   :
-		case DCB_CONNECTOR_HDMI_1   :
-		case DCB_CONNECTOR_HDMI_C   : args->v0.type = NVIF_CONN_V0_HDMI; break;
+		/* VGA */
+		case DCB_CONNECTOR_DVI_A	:
+		case DCB_CONNECTOR_POD_VGA	:
+		case DCB_CONNECTOR_VGA		: args->v0.type = NVIF_CONN_V0_VGA; break;
+
+		/* TV */
+		case DCB_CONNECTOR_TV_0		:
+		case DCB_CONNECTOR_TV_1		:
+		case DCB_CONNECTOR_TV_2		:
+		case DCB_CONNECTOR_TV_SCART	:
+		case DCB_CONNECTOR_TV_SCART_D	:
+		case DCB_CONNECTOR_TV_DTERM	:
+		case DCB_CONNECTOR_POD_TV_3	:
+		case DCB_CONNECTOR_POD_TV_1	:
+		case DCB_CONNECTOR_POD_TV_0	:
+		case DCB_CONNECTOR_TV_3		: args->v0.type = NVIF_CONN_V0_TV; break;
+
+		/* DVI */
+		case DCB_CONNECTOR_DVI_I_TV_1	:
+		case DCB_CONNECTOR_DVI_I_TV_0	:
+		case DCB_CONNECTOR_DVI_I_TV_2	:
+		case DCB_CONNECTOR_DVI_ADC	:
+		case DCB_CONNECTOR_DMS59_0	:
+		case DCB_CONNECTOR_DMS59_1	:
+		case DCB_CONNECTOR_DVI_I	: args->v0.type = NVIF_CONN_V0_DVI_I; break;
+		case DCB_CONNECTOR_TMDS		:
+		case DCB_CONNECTOR_DVI_D	: args->v0.type = NVIF_CONN_V0_DVI_D; break;
+
+		/* LVDS */
+		case DCB_CONNECTOR_LVDS		: args->v0.type = NVIF_CONN_V0_LVDS; break;
+		case DCB_CONNECTOR_LVDS_SPWG	: args->v0.type = NVIF_CONN_V0_LVDS_SPWG; break;
+
+		/* DP */
+		case DCB_CONNECTOR_DMS59_DP0	:
+		case DCB_CONNECTOR_DMS59_DP1	:
+		case DCB_CONNECTOR_DP		:
+		case DCB_CONNECTOR_mDP		:
+		case DCB_CONNECTOR_USB_C	: args->v0.type = NVIF_CONN_V0_DP; break;
+		case DCB_CONNECTOR_eDP		: args->v0.type = NVIF_CONN_V0_EDP; break;
+
+		/* HDMI */
+		case DCB_CONNECTOR_HDMI_0	:
+		case DCB_CONNECTOR_HDMI_1	:
+		case DCB_CONNECTOR_HDMI_C	: args->v0.type = NVIF_CONN_V0_HDMI; break;
+
+		/*
+		 * Dock & unused outputs.
+		 * BNC, SPDIF, WFD, and detached LVDS go here.
+		 */
 		default:
-			WARN_ON(1);
+			nvkm_warn(&(disp->engine.subdev),
+				  "unimplemented connector type 0x%02x\n",
+				  conn->info.type);
+			args->v0.type = NVIF_CONN_V0_VGA;
 			ret = -EINVAL;
 			break;
 		}
-- 
2.52.0

