Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC237C11B6F
	for <lists+nouveau@lfdr.de>; Mon, 27 Oct 2025 23:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3363A10E572;
	Mon, 27 Oct 2025 22:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="UI8q0+fU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sonic301-32.consmr.mail.ne1.yahoo.com
 (sonic301-32.consmr.mail.ne1.yahoo.com [66.163.184.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7C410E574
 for <nouveau@lists.freedesktop.org>; Mon, 27 Oct 2025 22:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1761604273; bh=a9U7kP/I/puDZM+MBHWIK0IbY1ey9vGl7zuxBecmtz8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=UI8q0+fUYTPlQyvTkUxmtZfXIsuwnEBgscXS+XnKt7CU8FXUJGMh4IxzsXO4bKp/2Tj2f0vygQSkY/A2sDNOVS6j5vute8devOJpT3b0+zMEG3K5bg2W4KJ+Ks+9bEUaBNWsjvGz/rsmGmOIFS2zTvr72kTcSxKnUF4Kc+s7OdruGTFzVgMrORVCibf3gEo0lgSsiUSf3cZrjWVWTULCDdnLSQuAu2ZgfxhLz/NiepwCHTbFqf5nodTQet1SOzTlpjoFU9brClYqmrhD/Ilu6i5ZuQ4FFeI+yH4h89R9Ko2RN3jUXYU2Oje+3cTgmNSM9bMTRokdwqItPTchGl0RKQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1761604273; bh=j7TMULvL3+X10H3TRRWS9bouEtIK+1pmt5Tq2gjHA8n=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=qQXIPcIwJcMtWcflDOyqRf1SKOYA6vTPEs8y1PmBEoN5DbT5yC3PaeYtOloQzri7fX1aLTT8tKaMqkUMGzhp1THY40927EskZ6o++8XMsKYKyyxbGqJBbM8s0vi70Vm33YuLDOSz80TSwR0bcvCLmtHuI02ikVMOMr/7HRaqn5EsRzBDy9Go7ngj0JTucPXYPMrtaeSaj4zPoxelBCe8kF6XySqQMobb9Zj3UtwNHNl1DVQ9A4OQX0ONeFh8WsUHiDkW2zA7voXAwNZs0eB7MrZBQexleKLZ9aQfF2daRtBh+i+UOFVMyiVj1SnB0d+dsMZIx5uHrA3Y6UeM9fmjXA==
X-YMail-OSG: dAgedhQVM1nKIPpuKFWEvQci6KGUgrwH93ZWaoBeNm9MNw.4xNg8p7b4scmLOY3
 WF2iOZc12SabA7sK2OynUSIg8.kXfJvcK00XkJkhXzi.66vLAB7d8hHIc68mGWInoEBMA3peSl0a
 JfdNDgX_OsOqJSu8qkG3bzprYACqVerTnjoQwmQeLZZjnfNa0WjXewXs5ITBagJAyRxjGLjuFEQc
 UEAdwJGTAVwXjQfcs7OCiIQqJuxEUmpQt_uHcJbTk1MUqYQ7o3_ooZFftdbbrH9S7QexQ1HLpuEv
 OX6KHXxyiC6lK_Byu2tfjqFQzsznhRboHOOyaP5Q608z0ndit_cgRhgEsgk5KhWy74T7l1REsRtP
 ecCXHPSWOEEvpXPy4AYLH8jQO4_xpFsn5jDgXuDSJWtk3JA8fu_u8WjAREIppiY4iJyTEA7.Nu9E
 18myRDioDt5MIKBp.qU9OU9lehQc0WZm6cgTUn.iA1CZM30MCp7i5s1h2uEqNzu85hCsUc_4C3e6
 kDo5EVS1zyumz1sAybS6pe8tZRFlKu_W7vMyzZiEpW_5Xy2dwvwxF1E0vcKyNxf8ZFY2MjEvkTin
 O4yF0V3xOmDufnzul2I0TrB_KezwV8Oq7zu6xuERUiCF3amx_kAwm8Z6i_gpBvYtOOgmHOpQTuFi
 Mr.goa689L9WL4UYNJU4tvj5_G6olQKrr5.37nF8j_Q2wy0vr5RKd2uZKTFe8z7CNPPXVwl0XUEb
 iUpGm4ShKYnn5CHhZI27jKbfd7OCEWOaB7gw0IhaaOtxxyFTqVD1ZP.Yw1WE8BkTaJGaHxn5ayNF
 X6_cfLgkTDlgAov3CvrNHyK7VwqPY6wvcwrLhErw5_I8XgiIohDto1TYY01HDkhHaLzRUP_jqF12
 G95ao137cLSl5fFm6Xd_4mQOfFdL7x3JszFDq0FOMP_9Eg1Zco9HZWcD8ypgc3LvH76f0uRvX8k.
 EJil7wbZIdAlwMyeTcuJkZ4WJCzSmPoWcIt72NBnDazZirs7TBr2VWcO84aQCgb5j0AoGFOILfqc
 h.hJCkUREOtWtIRkoz.OdK3GjB1F61X3yo0jkBwlnKZwaGeCYcJKHl82RbDiM3ByMNs44Io6UoS3
 pLcWg1wdr.9njPN8VZibv33SVF8GGzrVVl7zKaBAtjn1y_v7jRxcHJX8RE_ip20ky_rAgY1V1XUO
 H4NlivlIxyBFfCju2IzsuGR7f1_Xh9GPvKCl.f3oTuOH8UxiK0NXQz1nhfMMY9k67kS41zwyECIk
 vgDiNy_NB2IlVEaIOx34SXFd4Ys143bCCH_6I2uVG52y8sbVl9Z578sL_slOkEN8hd7lcS7iRF9G
 LtpRhwGgUhqC3aVXa43_kgcII5cmLSNd_3HeoW8jImkev5kVV065OpMtqVP6TvW7gXznNnInOeBX
 AEaGseJQ9Od.S9dMzwQdK7ozkNHk4NieiMsqnVrPGlSMgbETC8ytC0wCqaiwqMREB2tRqlQCx1CX
 ah5JV4I6XweNflw0d22WArfVGnF68.MiIZ9c6APp7qby9AqLIRMN7kce2FaJt5Fk5siHqhxc7Ywi
 iTzbXKjTHQNIU3BAtDk7yGwcnwLBgntCcWedPd.sISQDxhy6xXMlWtQ0Kbrpe3jrMSNZ26Logvyh
 rRSP_NUfrb.t7SboHar4Nk8Ezrd0a1BR_k_LZ1bNoveVgwwUm.P0rf1okkVZkRTugYgdUREfubQS
 0QimLESOkl6eJBf8yOBu1V8mAQUKEaChjLVD9mEUDXPNHnGVjVDk3Ym5X90A6aG5SqEXUbXAm84H
 C.wXTipWTyFugROzu4p1Yl7GAZNcpdgCFY2_ug3HQnwgoB1pc7QNNWYd8oPgFXRPtqmZCQKh_tJW
 t.e6f.g3p28TOgQ8lYfzSdOr0rIjzpdu8Qk3DN_DDH8l7WoDE4LOQUS6B7faWjyOIuBeOhDJYfyC
 O3Hy410epS_4qPVXOQCjmZGvSYtnDgkvf5BUqZs12jSdtnDjjSDoEHRUECgNDUhBXRpJH5ss4H4.
 LCtoKJZ3tDmGlhtvtNIsvljkoJa8Isjvj9.cDF.9f9GKMtTULVkXa9ZReX1Wfb0aM3CFQxwjUoYD
 xniK2f5CAfXY1rXW39cytK9BZEboYGG4eR8aSMOzqYx4xqwl5juWV8I21ehgjjsGoNjf40veDkux
 W2V9JRAUxl42ddD9KVUjaHYNdasoMwjQwCTd2.WTkUS5sTHS4q3lFoVp1wrDPnM0cb9FCrfgMGAI
 2GukZo0QIpAu1cs5v6ilGjY2Vga7mW8VO9RuWlG7.LDaRbKm4zqS.GA8GCzJXj4nGbzJodRR745u
 RMoBBNEUxU.D864tapcrj_7uO2WwgTt7N_0EeXpNvKrRmcw--
X-Sonic-MF: <lxrmrz732@rocketmail.com>
X-Sonic-ID: dadfd393-5ddd-49d9-ae02-42f075522759
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ne1.yahoo.com with HTTP; Mon, 27 Oct 2025 22:31:13 +0000
Received: by hermes--production-bf1-748c868fb8-9kg9x (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 328c229d3c2a6fd6baa7c259c79aefc2; 
 Mon, 27 Oct 2025 22:31:07 +0000 (UTC)
From: Alex Ramirez <lxrmrz732@rocketmail.com>
To: nouveau@lists.freedesktop.org
Cc: lyude@redhat.com, dakr@kernel.org, Alex Ramirez <lxrmrz732@rocketmail.com>
Subject: [PATCH v3 2/2] drm/nouveau: implement missing DCB connector types;
 gracefully handle unknown connectors
Date: Mon, 27 Oct 2025 18:24:31 -0400
Message-ID: <20251027222934.13711-4-lxrmrz732@rocketmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027222934.13711-2-lxrmrz732@rocketmail.com>
References: <20251027222934.13711-2-lxrmrz732@rocketmail.com>
MIME-Version: 1.0
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

* Implement missing DCB connectors in uconn.c previously defined in conn.h.
* Replace kernel WARN_ON macro with printk message to more gracefully signify
  an unknown connector was encountered.

With this patch, unknown connectors are explicitly marked with value 0
(DCB_CONNECTOR_VGA) to match the tested current behavior. Although 0xff
(DCB_CONNECTOR_NONE) may be more suitable, I don't want to introduce a breaking change.

Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based on nvkm info")
Link: https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html#_connector_table_entry
Signed-off-by: Alex Ramirez <lxrmrz732@rocketmail.com>
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
2.51.0

