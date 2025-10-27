Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1851BC11B66
	for <lists+nouveau@lfdr.de>; Mon, 27 Oct 2025 23:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B28910E570;
	Mon, 27 Oct 2025 22:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="FVjx4Z18";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sonic309-21.consmr.mail.ne1.yahoo.com
 (sonic309-21.consmr.mail.ne1.yahoo.com [66.163.184.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0527B10E570
 for <nouveau@lists.freedesktop.org>; Mon, 27 Oct 2025 22:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1761604266; bh=5rPALBGrl4zsDwsLG9L+2Qv1motePkXVUJvH+mVqtgY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=FVjx4Z18fUHkeYzQxU94j+aomIcTtsBpimm0xRTkD5NkrEX2miQXUrpUK8+GAWuOzIQ4g7MHTLlmfVIv4MyU7hFSNTrnX4qdTG60IHwIROukziaYshWUd4TVlFDZgP+m5l8zR/WRbnTgTpF4MQGWP6O79X/knbQRgj6HFHbkRGjd0nE2lMiIps8Ln8NpwrDINPSvqiFmtS7mmqm6N6La792cTwV28oikooW00LMrIM7C2zWqDxBz/Wt4UMmDPgSSR7tbW9v0USRy/OLgyap7fIb5Sc5M5DEcb2uZEXaLW6dkwlaC/gLFBF2Pq/uxFGBGNNq+ZRs2CN0dcBtqBVWLXA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1761604266; bh=YfNSFnH9o/tsv4FUUMH2duoRvKsbv/KcxTvNfFDKaB+=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=iqYS7x2AlCikgX2cH/bwAT1LyY1wPqWRZd6P/Iv6LC62rHPakRvcjjdSsZ91g4uHR5+2NjFo1cZujNsRm8tgc3q0gOZxOyxbiJTjCjtB7mOprUP3g+4rXqpM+cO3wW6DR+lT/uE5PSLdvJJ3PFRrRVlb5L+r3Ke7RMbb5vfiCHzS/tIAZ02bvqPZe31+xA6++dHYXJOVJfpN/7AovvHl0ivrHY333bbZ1KzxItmMNhxro+L71TO4lLtlvSQbwc7ew8fNqj3iWTDssHnfNXxojMhJcu6FNrjdWN1oFxTG0/ANZfecPe0GMsapH04exmyRSKyZC7UQDtwH+4bJkjggzA==
X-YMail-OSG: cBcHrfYVM1kiNOyrMCxtY6E2Nfn3yOUlL05qPxpQhrccArGB2I.n_vYgXfq0k1e
 oAAmyLby9cTUNsOzIyY7iKSMwYrVbfQyzvqsBUQIHr5fk8WwwK1erD9fUHA4h6QZWfFywvLtouZt
 t88wvUwNQR2OvRSjmCaYPHeiYHgYSBCftj8qPngzwJj0YGgvG8J6HDkVZLMosQb2.GmIrpMgf4BD
 9zGcj3ewCtukQ3_QPVSrc1VnDBbBw.QTsgWHqufzrwdyHR2cHnefQCNO0MhMhFim_c6YcxA0axl0
 MOn.ylwXPVSYFTGBI8hOw4TZJm8r8Z57RbbkEwOpUThJSuXiKwLAf4YYbu6og5IIbnR_RQFbdZWR
 AT8MGBC.GyvGnnbGmzS3AKFdNTvr4HXuzuG9jMvw8GAyI7qpa72KftV3Yl13fguLTy4x6e8GrQtZ
 shcg3HGtCigLQtzZynZ3GWoRfmo1WukB9z4hknn1ul4YlhWnv55Jickm9gimXfztcYVZyNVQjkrf
 Pq1CMx1OaRJFYACMynmbZb1WzplkZ8n6FcmMGmK_voz5AL1Jfno6e6aFzOUuWX9PrgiHvEszu.8d
 yzt4RpZ5o3ADwyCeP4umPHITUvbEZT3MtZ7GCXoA_HVyJG.IU9zC22nSDUzFCGgRRochW2bV9__8
 DysL2IrPJTSio55FtrZtUUqal_t83Vs6MFBBdpZmwrfjuXndYW2FqsFEJYqNje1m8oUOPSKqc4Qr
 ABuuY.TbjGlaQeIKOLN1ocEnFidCe8mS2RFc3COIfKDT1mBhQy0vuah0LpsjiZutOtqA.od2DL0c
 Ty7KHRUJtpg2MLMhdr1o1eDoDHkSd2wOAsYsxy7G_LXsQg3FdIJJB573D1SLBpMlQODZMr_QEgJ4
 lmlRjHujtK47mdyAU6xCDALCi3qZSo8ue3N1VmYAo7Zi1f383ZV11eatX666sXDLfkCFVMGbfN6z
 blZoamTE5s3IHVRUj7AnhAnubsjKA_HkciLH0gmimlUzNRjAT0IfTtv.DvBWXBQQaYsXvq.P3NyY
 vwf_8PhukdIhhGSJkdXGYVlmNFz9fldQeC5EN9u5NuTxPct_O8rhVi4HKWxrLpbnZBNPpmAHWMvi
 QzI9WA_QVmoREbfyeAiXdddPORsVDv50qDcLl.EwpJeNoBbkkzEbWNns8qvzhv7T_DEWp_9_qOfk
 ll.79Lefsmz5fCUf46UHTunIx2kBhr3tonUKpR_Z82S_rulG8L7fMfyqdeWPCg7sEGKFWEZj5sAp
 .wdxmqXCjLB2j.LIT.bgXXiNB4y553kPBFov17vcnhZpwFTvkcSLL1hoiVsbyX_wmvFjPyshQFU8
 j1EEsVkqWpTiFZO7kx1e60OOAdLonBt9Ona44cioAOgg9p55ab4yPThjoimANgUc5DERNzfwEU.G
 zJ2auRoaA.6rJX44G78ZtOIL2SkbBprFbVQjcRn9x.ORtDVoPZVE2Hn8a__JG0hUbOZvFcYfQtOr
 EKs4X4sIQtcvYCLw__02mCdWBjdL11fB62nwHqV6eTWHZPZA6DA87FnYXJRA.AAVUUVahzX73jnP
 S8wRfmBjcswDGqo98NlqXHHg9a3qfjA0fQTXou5lt27pgmiYFAi.UvWBJy1uaHVIVeC8rvG_7GQr
 NicHXe9yLq7vdZw4JeU8ouw5oNlvtvSMes2D51dYCzWaD4TcMUd6yXPNTewoZHWpo4JgAq3GdyXW
 Ac3ZzG3h3HlrlJukbchDWjBBw4vUMR5MM.4yByBUkrIWcjvQ.9deQrHINym9gAgqjYIoU.dic2wr
 vE6iYN8RGs32l55qeekmMWx.8nhz3PcNmIYNkKTZt9MR5zQDaHPQQIO30kR3TYKVtjNT0__mM1Q.
 9cf3WfirsOZhPFPyvrbIQYWFNFZX.TmDfCwYlxi5HKSBIUtmu2sf556XretVbTWyyqSjRu8WqVen
 Jrj4JWanvxEalpBptijFJoBm9oOsEeY6eKsEfl91CooZ9vGK4xG854On3CBpCwhwehE10fuGrDru
 AstkR4eg_bT5WtFZz7_ANXnTCBo48ujYx4xRm6mSCNJLxebIBZkR6PclTG0PHaYGIrdssLMhWWAp
 xZnP4gfE1W5nvB072xp1P9Y5oGiY4b06upTH1zfPZGmj3tecQerqLVWJMxwTEKxgOjzWk6rTCJhO
 NhpNtzVLbYIBOSLbmxaADl6MKArAkGCatkP5p1mhLOPM2d7u3tJZaf0uw2rge6_fYKLVwiN.hCkY
 SBuXXXJ..mBQz1KeiJlZWgMaHG19smM7MGIwNALh5m_uwgiqvd61nP.tYHtNVoqQapygE0LKYn_p
 W0zHRwEzS0bb3ppcfyJCsJ59kU_PXa9S6k0fLRgW20kn0ig--
X-Sonic-MF: <lxrmrz732@rocketmail.com>
X-Sonic-ID: a413893d-adc0-4b83-b547-b0c6ded10dc2
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Mon, 27 Oct 2025 22:31:06 +0000
Received: by hermes--production-bf1-748c868fb8-9kg9x (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 328c229d3c2a6fd6baa7c259c79aefc2; 
 Mon, 27 Oct 2025 22:31:01 +0000 (UTC)
From: Alex Ramirez <lxrmrz732@rocketmail.com>
To: nouveau@lists.freedesktop.org
Cc: lyude@redhat.com, dakr@kernel.org, Alex Ramirez <lxrmrz732@rocketmail.com>
Subject: [PATCH v3 1/2] drm/nouveau: add missing DCB connector types
Date: Mon, 27 Oct 2025 18:24:30 -0400
Message-ID: <20251027222934.13711-3-lxrmrz732@rocketmail.com>
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

* Add missing DCB connectors in conn.h as per the NVIDIA DCB specification.

A lot of connector logic was rewritten for Linux v6.5; some display connector types
went unaccounted-for which caused kernel warnings on devices with the now-unsupported
DCB connectors. This patch adds all of the DCB connectors as defined by NVIDIA to the
dcb_connector_type enum to bring back support for these connectors to the new logic.

Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based on nvkm info")
Link: https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html#_connector_table_entry
Signed-off-by: Alex Ramirez <lxrmrz732@rocketmail.com>
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

