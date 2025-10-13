Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DD9BD6A30
	for <lists+nouveau@lfdr.de>; Tue, 14 Oct 2025 00:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A31310E13A;
	Mon, 13 Oct 2025 22:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="CGH/TjL+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sonic317-33.consmr.mail.ne1.yahoo.com
 (sonic317-33.consmr.mail.ne1.yahoo.com [66.163.184.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A9510E13A
 for <nouveau@lists.freedesktop.org>; Mon, 13 Oct 2025 22:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1760395089; bh=EDQkZ2vPmN5TwiGC3gNlshu2mu5Z6liBtUJK+1g45a8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=CGH/TjL+myBYj5N30LY22lCmm1KtXs+QAT0OnvmBP5KOQ0U7p7/LeZXtgKVq5EivNCldyS6veF1I0u73aeEZlyucH5mRKHMo+iDcpcFWq6S3vuBHums5Px6zLVLO18H8cIAnNQlolS9HHRxk+nTzUNST92xHK2gOZw/OIYiFhso6eoylgVWTq0er2UCi6VfLXm7h6IQSTRGug7MbODq64tOWnXW7CgCKB0cL+xMLo8pMJOr/fNvdp9MPhSZMyoLp6CNxHxpkFE1aiWBM6HMlTvTty8p4w2QjHJoPZXVBpbgUM+67Afq0NiA2rMEkjxxSDaQ1ieeNB8TkxzwasUvTSg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1760395089; bh=/8Awfy1fvbYB248BhEzMF2riPms8rJz+Zle9CORoKnT=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=VgirLxqVZ+7g3HrtjelPhlVU6upewT9h8ii5/H+lnqjA7a+R8c5NJgbRDeuYBECpWrW0GEIfin/M0QVCfu551dROZ6BlaNH5PZhjirBaf1Gj3GrWCviQYGC/rp2GC1jEAOh59mOhhC/+qYO/L+/rvEQ+okpBw7MWdI/5kB4Q2T78dEEymcN4073zfvD3lpB8EWh3e5HLV6QaGYgnkFwlMDw13MBpS5cA64lU73k8TnUEgAozq7RNPMBu0rJgygxbQF5RQvfDUswJ0yaXqNkO85/1kO3YkHZWkpawWNioaJ5euEnp1BBo/ClZTqjmyP7JucMbHuE/1g/mmly1UWjuQQ==
X-YMail-OSG: 3wdKmrEVM1mhvFI4vErvEjqWjdfuHpoL3IgI3KpcRHBjetrlrrxLbsWJ_1Cv7_a
 nzdm1Qwz9xkNhuvygXGHpXsaFfLb4_.BGDXPCrID1Y1VzHdIl_Ms21nnEz2ihJ40h_IG0HArgHhL
 AgMUxAhafLYsoK8cWpBHPD.g32R_Ykp5zYVrkMCb5tXCqdbk9Tc9BZQAS5XonAxHaHvIwhUQaqjs
 bUN52qWDXvOISucnmq81ZGGE0aTQtxQSRwSa1PRAiKMPf7xxMqwdOXagzT2ksBHuI5XhR8LEaIr9
 h0.UsXRvSCpBE4wdOkVTtPUzSdH4ywlLleCmfbnFB4oFFCY_9nT7n_nLXGAK_Hc3wd.QM5SlDJbL
 zRbnNM3jPCeYwO0qstOePBFeGHEr1vsiESzRxXll5ywIbfSoCILLAyCjuTDEctWo24c54d9nETH9
 4GbWfgR_Jep4ASJep5ed1d5B8RCgyOn26N2dd5ivjzG5Q8P_BI45FtR.bv7_d0F52EqL1SRxCRdP
 HJbJNKienrxny_UM4W5bMxX5vGxvfNLdSdgloYG3qJlrfyKg0PdEl4aI1mSGoUon8S_h46uVWz71
 2LTqdb5xhZ8QaXewaJ1Yn5nuIxQEOfMe.QtLHGgT5MdGRN7p0SrmiHFrdckCpUbda9U05Z17_T8f
 COCecBbO7YxQl.KRqgLKU.W2iqx7SKvN0vQn979jJAyeR7EQYgQ3zvhLu16xYsJaSs58qCgIOh1M
 6FdCAhA_Mdt7Kn8QgdKXuNHFHuq7cet20pko_fTLVwlyavyLO.OlF2vhM1wGc1PSjc39dxlGaLoK
 fug1W5HUrPbZ.vez09kPY8TyRSJMSpq4oEld.DD1y0vnrmndxd27G0.RACO.xxlY5bsIf.JI_7eO
 VC4pgt_XIsVIlRXZy9j0Rq__r.VFqnmYtUIckRXV60RROqDufVwOyjK306y4qKizvjU5XbX3cqWZ
 XNbFZwPmezIkgZfLtlUBDwbHOYSjIQJ7DPtjp_WQmHCY1JNL2QC.zmfJ3OdURlMACT0ljLLylznp
 .KqXv.E5bY_AKI2ajEtNBqqUqO1BVuRFSAU1Gz49cttZG.cpuoKEW88CGhZn9B7RHEzsfgNiEn4X
 eOafinCCSpl0TzP9iIiw1AFxnMoZeo1SbfS3YKSo54VlDAtue0isUaartIBASQHd8vq2Nr2PU5gT
 b.kFglr5jIPP_gSsLhVadv_bfiE2ap4vCNNvWiA4I7VwL2Uo8fy3RgWQOxIQe4zYMWjnvTdAHubC
 bWBXfpefpmHQzeLeK0apjnp.KaIIDkAHclMrqzR5zYNdLMT7MYIghtXytysUiYmmkskIGM53s6NB
 pu5BqoW5MKfzM7bbQdWHjGfn7PPAqEv049mpDwDLklrs3ZqnGxRL7OWCWoCmM5r8BXEeljfLIPKJ
 AKrXu4qc6UgErEed0lZ_4R6YQl0VBC3fZ11v6wbfoqxDyT8gHAXnx1xSd6KCdpdzl_a85j6TE7b4
 HXhln93fEjc7NpoMlK651ladZxkimpZUraiJ3wfshSIBP1JZcugGue1.k0tsEu9BBJnDpV5QGF1h
 _9g65Wn0R7h00lPeSFNrkpRwuFLMp_pzAGwQuf0nQ34Vz9Acw1QfG4wk1MS1N0HeMlTmMXofXdtD
 d7mzgZM8om2jk_yfXqsdf2L9JS2GwAjRnOZ7R8Pey6L7KOTFV__9ybJGwMk9UurFtswvUi.8Juxn
 sweyzXLkis2cp4E2FugVBh9gsPtXKH4bMtStlIbdD7aT8tacs.7AAF8DbhuRL8W6AdH8ovrMugsf
 2NUKU.VPvPvTNUCHMR8kzrlGqpo7ezt4v8ocV1tD.zLZa88TX40pquTSZwf2e0nl2o2FzrkR2SvD
 U4UO5aQ_mReZuVQvKCkBe9skuATNQSqQ3RgMU5PsY.ZvZfiVJso3fJrw2GFYGPTjiO_c7XLxOeIQ
 zdYe7MF6zufIAqNFsSv0LvGA6KHqjAfVwmcFc.GRbgZJa6.V2q4fjlxfVkcvn5KU4ayKr3y0s8Qy
 YhuJSPVEbGgBKFUg.sKecOUC49VoT0xBpxuO3XtKwo_UHDVPgayQQRVetfwjOnPHiUtCiJSTTkuF
 HIhqH7TKDNLHykxtEjPNSR3czJPUOcrMqh8YDmLbhiTnArnwhh3MG9UteGMFRPnfC3CVUAcRgjKX
 dJoKEcQfocQgiYVUn_6F.9moLLr_a2DJdjJ6eTEOcUQnGWA_dj3wAiXZWYiy42KHj_phyl8XW6vO
 phT6i00v.bxDrZu58VfLWBSNjFzTT1a4zgVc2VTfxMHdZV8nU58FDwMfmenV1xH14bC4NPibsf8Q
 FGINbeBDEbwdXU05kEnyeFrmmDGf4x.kPrjKFksfNea9y
X-Sonic-MF: <lxrmrz732@rocketmail.com>
X-Sonic-ID: 9a2f69fa-5ed3-4c11-b2f2-ca9b2583c757
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.ne1.yahoo.com with HTTP; Mon, 13 Oct 2025 22:38:09 +0000
Received: by hermes--production-bf1-565465579b-69p8l (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID ee1871ff4eb270e645c795535edeed4d; 
 Mon, 13 Oct 2025 22:38:03 +0000 (UTC)
From: =?UTF-8?q?Alex=20Ram=C3=ADrez?= <lxrmrz732@rocketmail.com>
To: nouveau@lists.freedesktop.org
Cc: =?UTF-8?q?Alex=20Ram=C3=ADrez?= <lxrmrz732@rocketmail.com>
Subject: [PATCH v2 1/2] drm/nouveau: add missing DCB connector types
Date: Mon, 13 Oct 2025 18:18:13 -0400
Message-ID: <20251013222424.12613-5-lxrmrz732@rocketmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013222424.12613-3-lxrmrz732@rocketmail.com>
References: <20251013222424.12613-3-lxrmrz732@rocketmail.com>
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

* Add missing DCB connectors in conn.h as per the NVIDIA DCB specification.

A lot of connector logic was rewritten for Linux v6.5; some display connector types
went unaccounted-for which caused kernel warnings on devices with the now-unsupported
DCB connectors. This patch adds all of the DCB connectors as defined by NVIDIA to the
dcb_connector_type enum to bring back support for these connectors to the new logic.

Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based on nvkm info")
Link: https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html
Signed-off-by: Alex Ramírez <lxrmrz732@rocketmail.com>
---
 .../nouveau/include/nvkm/subdev/bios/conn.h   | 84 ++++++++++++++-----
 1 file changed, 63 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
index d1beaad0c82b..538306522d9a 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
@@ -1,28 +1,70 @@
 /* SPDX-License-Identifier: MIT */
 #ifndef __NVBIOS_CONN_H__
 #define __NVBIOS_CONN_H__
+
 enum dcb_connector_type {
-	DCB_CONNECTOR_VGA = 0x00,
-	DCB_CONNECTOR_TV_0 = 0x10,
-	DCB_CONNECTOR_TV_1 = 0x11,
-	DCB_CONNECTOR_TV_3 = 0x13,
-	DCB_CONNECTOR_DVI_I = 0x30,
-	DCB_CONNECTOR_DVI_D = 0x31,
-	DCB_CONNECTOR_DMS59_0 = 0x38,
-	DCB_CONNECTOR_DMS59_1 = 0x39,
-	DCB_CONNECTOR_LVDS = 0x40,
-	DCB_CONNECTOR_LVDS_SPWG = 0x41,
-	DCB_CONNECTOR_DP = 0x46,
-	DCB_CONNECTOR_eDP = 0x47,
-	DCB_CONNECTOR_mDP = 0x48,
-	DCB_CONNECTOR_HDMI_0 = 0x60,
-	DCB_CONNECTOR_HDMI_1 = 0x61,
-	DCB_CONNECTOR_HDMI_C = 0x63,
-	DCB_CONNECTOR_DMS59_DP0 = 0x64,
-	DCB_CONNECTOR_DMS59_DP1 = 0x65,
-	DCB_CONNECTOR_WFD	= 0x70,
-	DCB_CONNECTOR_USB_C = 0x71,
-	DCB_CONNECTOR_NONE = 0xff
+	/* Analog outputs */
+	DCB_CONNECTOR_VGA = 0x00,		// VGA 15-pin connector
+	DCB_CONNECTOR_DVI_A = 0x01,		// DVI-A
+	DCB_CONNECTOR_POD_VGA = 0x02,		// Pod - VGA 15-pin connector
+	DCB_CONNECTOR_TV_0 = 0x10,		// TV - Composite Out
+	DCB_CONNECTOR_TV_1 = 0x11,		// TV - S-Video Out
+	DCB_CONNECTOR_TV_2 = 0x12,		// TV - S-Video Breakout - Composite
+	DCB_CONNECTOR_TV_3 = 0x13,		// HDTV Component - YPrPb
+	DCB_CONNECTOR_TV_SCART = 0x14,		// TV - SCART Connector
+	DCB_CONNECTOR_TV_SCART_D = 0x16,	// TV - Composite SCART over D-connector
+	DCB_CONNECTOR_TV_DTERM = 0x17,		// HDTV - D-connector (EIAJ4120)
+	DCB_CONNECTOR_POD_TV_3 = 0x18,		// Pod - HDTV - YPrPb
+	DCB_CONNECTOR_POD_TV_1 = 0x19,		// Pod - S-Video
+	DCB_CONNECTOR_POD_TV_0 = 0x1a,		// Pod - Composite
+
+	/* DVI digital outputs */
+	DCB_CONNECTOR_DVI_I_TV_1 = 0x20,	// DVI-I-TV-S-Video
+	DCB_CONNECTOR_DVI_I_TV_0 = 0x21,	// DVI-I-TV-Composite
+	DCB_CONNECTOR_DVI_I_TV_2 = 0x22,	// DVI-I-TV-S-Video Breakout-Composite
+	DCB_CONNECTOR_DVI_I = 0x30,		// DVI-I
+	DCB_CONNECTOR_DVI_D = 0x31,		// DVI-D
+	DCB_CONNECTOR_DVI_ADC = 0x32,		// Apple Display Connector (ADC)
+	DCB_CONNECTOR_DMS59_0 = 0x38,		// LFH-DVI-I-1
+	DCB_CONNECTOR_DMS59_1 = 0x39,		// LFH-DVI-I-2
+	DCB_CONNECTOR_BNC = 0x3c,		// BNC Connector [for SDI?]
+
+	/* LVDS / TMDS digital outputs */
+	DCB_CONNECTOR_LVDS = 0x40,		// LVDS-SPWG-Attached [is this name correct?]
+	DCB_CONNECTOR_LVDS_SPWG = 0x41,		// LVDS-OEM-Attached (non-removable)
+	DCB_CONNECTOR_LVDS_REM = 0x42,		// LVDS-SPWG-Detached [following naming above]
+	DCB_CONNECTOR_LVDS_SPWG_REM = 0x43,	// LVDS-OEM-Detached (removable)
+	DCB_CONNECTOR_TMDS = 0x45,		// TMDS-OEM-Attached (non-removable)
+
+	/* DP digital outputs */
+	DCB_CONNECTOR_DP = 0x46,		// DisplayPort External Connector
+	DCB_CONNECTOR_eDP = 0x47,		// DisplayPort Internal Connector
+	DCB_CONNECTOR_mDP = 0x48,		// DisplayPort (Mini) External Connector
+
+	/* Dock outputs (not used) */
+	DCB_CONNECTOR_DOCK_VGA_0 = 0x50,	// VGA 15-pin if not docked
+	DCB_CONNECTOR_DOCK_VGA_1 = 0x51,	// VGA 15-pin if docked
+	DCB_CONNECTOR_DOCK_DVI_I_0 = 0x52,	// DVI-I if not docked
+	DCB_CONNECTOR_DOCK_DVI_I_1 = 0x53,	// DVI-I if docked
+	DCB_CONNECTOR_DOCK_DVI_D_0 = 0x54,	// DVI-D if not docked
+	DCB_CONNECTOR_DOCK_DVI_D_1 = 0x55,	// DVI-D if docked
+	DCB_CONNECTOR_DOCK_DP_0 = 0x56,		// DisplayPort if not docked
+	DCB_CONNECTOR_DOCK_DP_1 = 0x57,		// DisplayPort if docked
+	DCB_CONNECTOR_DOCK_mDP_0 = 0x58,	// DisplayPort (Mini) if not docked
+	DCB_CONNECTOR_DOCK_mDP_1 = 0x59,	// DisplayPort (Mini) if docked
+
+	/* HDMI? digital outputs */
+	DCB_CONNECTOR_HDMI_0 = 0x60,		// 3-Pin DIN Stereo Connector [for real?]
+	DCB_CONNECTOR_HDMI_1 = 0x61,		// HDMI-A connector
+	DCB_CONNECTOR_SPDIF = 0x62,		// Audio S/PDIF connector
+	DCB_CONNECTOR_HDMI_C = 0x63,		// HDMI-C (Mini) connector
+
+	/* Misc. digital outputs */
+	DCB_CONNECTOR_DMS59_DP0 = 0x64,		// LFH-DP-1
+	DCB_CONNECTOR_DMS59_DP1 = 0x65,		// LFH-DP-2
+	DCB_CONNECTOR_WFD = 0x70,		// Virtual connector for Wifi Display (WFD)
+	DCB_CONNECTOR_USB_C = 0x71,		// [DP over USB-C; not present in docs]
+	DCB_CONNECTOR_NONE = 0xff		// Skip Entry
 };
 
 struct nvbios_connT {
-- 
2.51.0

