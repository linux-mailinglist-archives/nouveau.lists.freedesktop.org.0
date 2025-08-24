Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB32B448D0
	for <lists+nouveau@lfdr.de>; Thu,  4 Sep 2025 23:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C57210EAF2;
	Thu,  4 Sep 2025 21:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="rZZtMxVJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sonic312-24.consmr.mail.ne1.yahoo.com
 (sonic312-24.consmr.mail.ne1.yahoo.com [66.163.191.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDF210E271
 for <nouveau@lists.freedesktop.org>; Sun, 24 Aug 2025 18:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1756059937; bh=++SQuZcgykqEqajlXPx/cHALdFPZ3jzU1y9jec0F4UU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=rZZtMxVJY5hc+kQMBJVgPGJ0C7jQ/PIcCXaXg1LvGjsDRJxWBiIP9p3PbUAP7cw/Q55tGNs2+I+SqXl/87eeeaQ9PS1jIELM3GX0nDxvk7xBSKxVNffWBa0phUxkItWmIlg7hm0atx0GxFOeB6Kyq16UTt+36GroUFfL+UHSIAoe3q7NwZ+JDDZj2JXHpYgOnwlOTTZ5ofKlUYY7Moo2Ie1DvzK0yqNMTmGyX0/JzS9AC5TLny72oH7cQp0oU3wnpL1nT3A6kWtChwqNL8NInjfsWEII/U6EVgY3BpzT0QFtd+zwQuLXx1iZuycmRnMxvzapX/nQjv++f/dKx56AoA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1756059937; bh=4QvOIW9eY1UnAxpgpgWOuRcW7xvYIa7iweIVer0edav=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=GttlikFjwa2/oPiHdmjXEooBbzswZFQTdqsraA8KqEgdwBs+2mjGs6X/DGoFPNv+ZNXDHiVU3oOsfXen9XfzXCObp9aSylNDvkkCDXJy2ZVMnYToQmp1MJaxVrPirRTWns93JnAokGdOef7FIyQ3Ns22VK4N8SrepH4KittGLkdVFqVMeOIIRZJXQ7IPCRm8Zloev14AKmIT7G1F8Tuq4QgVQwkPYIk/NX/C1hsohLr9taIN4V2PQFRQLDe4UsKYDTe9wwPjKoW/wep6MFarYKbkdPTFAhKVRK7Kv3t65MtmU4p8sAnYVoSq+U3Fw2OBjrsYvExGYdGhVvd/jEmsGw==
X-YMail-OSG: WMpwQKcVM1miuTRga4xEuFNMoB1r4gfNKDhDx1Sk37Kl6DxIUYZowciW232R1T.
 XjP4bOUXnVkxALFK_OHYKq1w1lIc5nzfGlxPCRGSIJtwT4qVBW.5q2D6Upn9pv.vUwKjkgWKomWO
 HKUQsJsAPkd5p._GLrpFMlxKO2M66gypMaALkBb1T16k9_gO5rt_9PFQ6j1b8DXBJkxvWAWTBRhD
 0Ek5oJKaoN0DCn.BFgZnXBpvTVw1dgGrKyXw_mjHes47MJEt_vD6cK.Gh5ktM.eKQfsWhkJj6RqW
 Ow60WsEcFm_DITjnPZ28yVUEk7PJN7cDrM3aIS06qsx4pTLOumfGiWovHrgyT55g_VXx5EXLFtCQ
 KV1JeE7TjSGmT62j534Nup852tyMSklvttnbff.US69W5W3RvkPXqtECWDpVg4BunDcihIfK_f2G
 Xm6LPiS.8Nnq5Bam3GX5wZx7C2rvJU1qEWrN9iWLUe3mV.uzMbiWdf6oQQxef4jVuLUYeocSOD4.
 G4Vkn9DpRwyd2ZlgsGmKzHE1P8R2lQ4OdasKnCwNRbhEokq1vba7u99e_byJly.MrLb2LHfZ9Qel
 NGjZZXhO.eUnOSPuq_3hDLSDisUPnVpy7TPhWTTKA_OPHpN_Ojovfyyg5FW2NmABNofhvnBzuaCM
 c7ZNA5BG4j32KZsGjnekakhSlHMf7a8gUdzLiXSXDPLREbprFDIGtORilAazVxYzyH_yIwsubzce
 6dLdMPcOYpm9vbhgccwTvc8TviTLQqHLcZA3fwp5rBPn.HK7WWJSe_WXOT2IPnk3MM9SMZvY_XCK
 Qvd4UrxqneuFDn1bvXtNjQ12PIodgNuIXjWJ3SD37SrOBBpinh2sgsCWHOilt.kBleNvdo.oJO7C
 QgOwVcaawvrfmkJFyrK8AB3lC2LHmbBj4prvCrCiRJcenRrucHGRvA15wK6NjkBRQLOFq1tUU.64
 xkOWx8rpbgXheUVNWd6UXbcwqIdQJAwsAsL649Re.O7WAgCkC6jW5D0PhbaLE2LWIa.DaeFD3tZH
 a8hkqiaeNDdplguIvZEdaHpSfJINrBgBdk6_TYvHAxWEiZf150mv4u1lESEMmm2h923ej3GzVsHq
 IYkMNEtzgLeOOlvGT_lzqAIKOLkb2nUT7swvA2RZQ8C45HwoTvmLe70gyG5ugH2zTpEJe.4cmzBs
 _WUjOINEFcxy4JGQPrTHTPVslw3Q7hfwVWpkGAP_7yFgSHsQwpROATUnuCRXxjHDMapKSScEthTH
 SK4mcSsCytkzkGG7yLFwEKUS2tbyqUygujpq48nd7C0kDr3hENEyOfoVpGfhp5BZWiMWDqCnl3wr
 H5esEQT521vIGV._seSuomKNWLGSJrNbfDzHOZQmzGuvAz4nvuT6Bb15JeRbEwY73uqC_qq7YrF5
 7pYUONACTCnrJAPSBQNkubPUniCD43xDEM52yE66qVWzDLTNY3ZuWUjQfahvmuyQP9lR24B7vdO4
 KhfvFyTZZehCQqTaoIffdD4Ar5wK1olImWhPaWdG6hSr3zp8OxHWB2cep2dJ_EibxdZyUWwl_1Lk
 YQkug5AdV93w836mp5CmnpI2T7bDwmwvSskFIpfaeOR9eZRASG4dmFu1kzIkhuANUcmJGdyh2_Aw
 AQJ58W7dqkMoJFtw8vFyMw3E3aCJDNkVwwp.6.HODCMy0C93HsFXhK94jEC08yB9HsbyNejjEcLs
 QuNCH3hRT4f9v9XOERaM.EY2W7jG9wQjeKgPritd7_lYghWIhG.mEhO5ZYQXnqq6c2DC6uiKYdKp
 xkK3RnsefsqCIJdVM2yGUyof_MhC2Ru1JkaB7vofmhasY0ZkVw6pzhgbm1x9r_ILv.b2CTBvgvjU
 QGcKxu0J5UbjTr7T4hpWc0FxzmW3HYJkSQsvTylZn5kCTe6275eZctgYfUE3WZds2ASPNfq2mg22
 9xTQTq7any.LRhEOUDkUFZYpJ4_e4Nray2zYbfW9IA1rLGvhd9LfKHCp8dp7bq_9BZzrYkLhYYxj
 VaMdSskaBuAhcZ9195_TO4yL5etSa7QgS5_NI23MJUjwq_AKfrMfG8TXjuVUt9TKWqoEmIK2hWiN
 53ZpAbA7olmy2nJL.722nkYbIj8fLsX7X6Y4y6pnkMFCqAsvd67S1Cn5VVtJDdNNOUgfrQan9g9u
 lwO8yxWf83AzJs26kabo1x4dqTpofETTUKZouzUGtO9rYlZkSAebm7KzA0ROTFbqrv8UciSO4s._
 nHWyNklCAInSyyiF3TQppctvRcootn0F2Y48lEK.A1W1emiYHJMf88ufX7liht3q4qOJI_L6G.XZ
 ulJq6Dzmi4bqtgh5jFeSH66PcAemlYo9idP2H
X-Sonic-MF: <lxrmrz732@rocketmail.com>
X-Sonic-ID: d7d2501a-800d-4d71-810e-3a1a6aa4b61e
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ne1.yahoo.com with HTTP; Sun, 24 Aug 2025 18:25:37 +0000
Received: by hermes--production-bf1-689c4795f-hxt8q (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID b3624d997c049b6cbbd96c0e621a8e66; 
 Sun, 24 Aug 2025 18:25:31 +0000 (UTC)
From: =?UTF-8?q?Alex=20Ram=C3=ADrez?= <lxrmrz732@rocketmail.com>
To: nouveau@lists.freedesktop.org
Cc: =?UTF-8?q?Alex=20Ram=C3=ADrez?= <lxrmrz732@rocketmail.com>
Subject: [PATCH 1/2] drm/nouveau: add missing DCB connector types
Date: Sun, 24 Aug 2025 14:07:27 -0400
Message-ID: <20250824182520.13655-2-lxrmrz732@rocketmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250824182520.13655-1-lxrmrz732@rocketmail.com>
References: <20250824182520.13655-1-lxrmrz732@rocketmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Sep 2025 21:49:39 +0000
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

Add missing DCB connectors in conn.h as per the NVIDIA DCB specification.

A lot of connector logic was rewritten for Linux v6.5; some display connector types
went unaccounted-for which caused kernel warnings on devices with the now-unsupported
DCB connectors.

Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based on nvkm info")
Link: https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html
Signed-off-by: Alex Ramírez <lxrmrz732@rocketmail.com>
---
 .../nouveau/include/nvkm/subdev/bios/conn.h   | 85 ++++++++++++++-----
 1 file changed, 64 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
index d1beaad0c82b..61379f8b1130 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
@@ -1,28 +1,71 @@
 /* SPDX-License-Identifier: MIT */
 #ifndef __NVBIOS_CONN_H__
 #define __NVBIOS_CONN_H__
+
+/* Table source: https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html */
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

