Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2521CBA230
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 01:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784D410E949;
	Sat, 13 Dec 2025 00:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yj0bu1iF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E6B10E949
 for <nouveau@lists.freedesktop.org>; Sat, 13 Dec 2025 00:54:05 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-8b2f0f9e4cbso145215785a.0
 for <nouveau@lists.freedesktop.org>; Fri, 12 Dec 2025 16:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765587244; x=1766192044; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kM7eDhCYaMhuaMlSDtFeT2MiNon2203a6LpDIq+OgSc=;
 b=Yj0bu1iFwKG91bluxUxIzfvGgUEjDvMgjaAX6BAl3FIE0lJZwATXQGrHNAf51yjIe6
 GzMe8hKKLWDFAFuByjC5MGPGcqRfn1u92nOdPPQgKITZ+n3m/uhkGSOf1qRy0iCaDFPu
 Mx9Rqb496cUjZrJWplVIGjvP8weCdUea0HVRSI3I30JcZ6/X6x6Be6hp3MYRO4aD7Wky
 llcslfE7IOL11qtlXi7sMtZjcPr40auC7Sok0auGjKti9HmNl3RTqXM+WTSdANF84/7a
 FLgmekKaKN3Ein7tiXnfXaqsX6mUmKCcULs7LInrvuevE8jAgXPplVVBVKrJKa/BLae0
 PE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765587244; x=1766192044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kM7eDhCYaMhuaMlSDtFeT2MiNon2203a6LpDIq+OgSc=;
 b=RziIK0FFhcQ3TaBeHOlwu3jE/H6WsQmOOKACCMVa3XzIBMVQwoh/RHHircUKx+1RDc
 gz6hCKo6mwg1IQhJHL/tuQRD/dP/nm4TIPXPYmEgiMPbhE/MUpc+P9KCvexg5OFvxDrK
 xsKTvu2JSDwDL2dg5jM5mtDDM1kR94IRH23AfS5LIGGJnijftHusb4n/PeyWvBcDX7S3
 EFJQXKGkmoiLuRpQiEdZY0I8TRb65yAO4EDJjqldOQog5bC0DADGuyjqycVXmpfEDytX
 VK0PmkcnAZUiiwlx9sjexbI5vVBYMVUAaTr9rFww1RpWEAqeE5gTbi4kIBqHDFrHiejb
 wEDQ==
X-Gm-Message-State: AOJu0YwVWW8oVjEpoLe/HsG96ZTDSWLVkWJFtdvJDbPdBaM35xCgGWzp
 so6vGMEimgSOFyR6yxMGUmjNPbXHxv5goqhaXvTnSz1dYA1RgD5ZSujE
X-Gm-Gg: AY/fxX4DpKxHlRXTBpNTmSSdg0pyl5/d67dVMxUB6UjGAg67av1Aeunbj/vNBkjq0pc
 so1ugil962Tr/m0iLXtWnl0U2/EwnsGi7ouFLymU1BFUpr2wYOxoHoUWOk2q2KoWqxF3gMOJc5M
 uVrvVLC93XVs/FUzf+fVcXQQhn5G26nlaGwAC5D6Toh5Vm888ZUdLOSsSJ4PEgaorG/v9X5FAuZ
 gqCOoc1VemcEkQC2mzvgbuArazj/sFAXCXme25ZtyfLxnx2BgXfI4VVDqdu67lzKRFe+FEtMp6v
 A7If7/M8BKtiHwzCh1NECP7MUxJWwyoLNqhgnJwdOAmAsepZxVfTKyZOPstiseTp8OZpXEUtjM8
 5zGC2MvWyb9ggRKQ79h2mB91xCGsv/yuhALxg5SeI1tQ7UxEgNwIYbnDqSjDFVBxDDylnHI7Seg
 mF3aZe
X-Google-Smtp-Source: AGHT+IFgJq5MdzNnnYwtERHHcrvhW4fuZoNtGM2NSAawPQLRZv1f3J9YvWmp2/W7TaM+b0Ut+a3xYA==
X-Received: by 2002:a05:620a:468d:b0:8b5:5a81:1dca with SMTP id
 af79cd13be357-8bad3fb390fmr1049159785a.18.1765587244406; 
 Fri, 12 Dec 2025 16:54:04 -0800 (PST)
Received: from kunkbox.lan ([2601:18a:8300:336d::6c2])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88993c61ff0sm4452176d6.21.2025.12.12.16.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 16:54:04 -0800 (PST)
From: lxrmrz732@gmail.com
To: lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com
Cc: nouveau@lists.freedesktop.org, lxrmrz732@rocketmail.com,
 Alex Ramirez <lxrmrz732@gmail.com>
Subject: [PATCH v3 1/2][RESEND 2] drm/nouveau: add missing DCB connector types
Date: Fri, 12 Dec 2025 19:53:26 -0500
Message-ID: <20251213005327.9495-2-lxrmrz732@gmail.com>
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

* Add missing DCB connectors in conn.h as per the NVIDIA DCB specification.

A lot of connector logic was rewritten for Linux v6.5; some display connector types
went unaccounted-for which caused kernel warnings on devices with the now-unsupported
DCB connectors. This patch adds all of the DCB connectors as defined by NVIDIA to the
dcb_connector_type enum to bring back support for these connectors to the new logic.

Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based on nvkm info")
Link: https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html#_connector_table_entry
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
2.52.0

