Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36571CBAF85
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90C310EC92;
	Sat, 13 Dec 2025 12:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgpf/c2+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC2A10E9DB
 for <nouveau@lists.freedesktop.org>; Fri, 11 Jul 2025 09:33:23 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7399a2dc13fso2141346b3a.2
 for <nouveau@lists.freedesktop.org>; Fri, 11 Jul 2025 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752226402; x=1752831202; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h5iCt+AL9f4UNEya1UkmziIpzAIFx+Cs0OtkGEYlA34=;
 b=lgpf/c2+BmF0nN2mFbvpAyOGkdjhfpFG59XNSTsKLhgjsUnNV17AWudkbcqBIZECrO
 ncOx99JvJ24v3mvBC9b1N93E78m1cb6sZPF3USP5ww3PcQRSy7WvBp9HDa40YhMy/Xmd
 b9RGY+FmLaf5jm+9gX21ti1NMPkyWNC/7Ggfoz9ijOxMfqEL6MPcbdZKOzsYhvscyqYD
 OLGrzR/rQtBY8sx7IZYETPOH7tR+MVDwfjKSHO4AHaXiOp5wvUBI6oZe5jlpcVncBE5C
 L2hOmmGpnYVTBIbQVktXidGR/jI23YzjHuHnGSbDsPhBIBmnEflKwrYGpxzALEW09Ty3
 ES0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752226402; x=1752831202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h5iCt+AL9f4UNEya1UkmziIpzAIFx+Cs0OtkGEYlA34=;
 b=DB+mVWP8cuWX9UVAve7j+xQtEl3jIrUpKGANkBMAW5ZcLmPYMA/28NnIzhQmWNvQqo
 +kQHipfMpGM8U2/Sim9lXjMPPVPKEix0X7mADMzvNvJBlTeoPF/J2fgksWbPOCLN6TIf
 1CK82T8NnSLoBmu40Ft49iFmKBc6lUjCWMWuuvX4KDbxmv5/XCbLXs3Ikzrm/84ozpG8
 vykqvXM6R58tVp1VduPLiS9jGm++pfwPjOSZlvRoqCT0Qzy4P1K9xLt0EdqMnLRUhrjp
 JOg7AOH4ldEGKrytX+0dHa+WPuhSah9jidJybi6o5wqrvoSQZBQq/Ubd3cIjX0h5bbbe
 HQIQ==
X-Gm-Message-State: AOJu0Yw5OanTkRbQEHKuNFjv5lKNCOZh5ukFDzgY5W4cbN7Cpe8PdorV
 Fzlg5qX2nqJbh9TDpS31uqeU30FQj7h0kFv5ZDGSFNdOTIKwR+A1W5gT
X-Gm-Gg: ASbGncsI7fSGogclRsggo+lJki3jyPM0UV4KXO2HektH0Vt+0A7qCMJTvW+QldTjT+j
 ZW5wC6m8B3tvxcfJV0r027FjnqAg+VMdaQRc8Y5QTPU2+F6u2GESDy8XYhwsFU6gfIVXFVQ+1ft
 u1VDTR86WL6jPmRAFy0EpAbtUtOCkIPURTjK692LMFUS24EfO6OPua8XbGrEXyAfFNHUa3SO6bl
 UGMIE+2/zsmNPA/bYOgulnKOgSup5VYCAeBi91MJUzPdWChMKNiQmAkQ+Ci7RpWhy1g0VVXRFfy
 dEM89y4fpyvPs0HXIhvCOzQert6LsmVYui0Hh1J/gtvG3961L1sPScE2IReZCxh8ENVKhQj2MNW
 dklbJl5AwokFo4oAtuxC0Yd3wIehIi/H3jV4=
X-Google-Smtp-Source: AGHT+IH3B/iJUKxoaQt0Ls6NL/GvCauufAHie/v74wXh4JpTVt8aHREkaECXuuJho7MHYZSPgFJwdQ==
X-Received: by 2002:a05:6a20:9c99:b0:20b:a75e:fa32 with SMTP id
 adf61e73a8af0-2311fa06643mr5181002637.40.1752226402536; 
 Fri, 11 Jul 2025 02:33:22 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe6bc84asm4557889a12.44.2025.07.11.02.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 02:33:22 -0700 (PDT)
From: Quaternions <krakow20@gmail.com>
To: dakr@kernel.org
Cc: nouveau@lists.freedesktop.org,
	Quaternions <krakow20@gmail.com>
Subject: [PATCH] gpu: nova-core: define named constants for magic numbers
Date: Fri, 11 Jul 2025 02:30:15 -0700
Message-ID: <20250711093015.28785-2-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250711093015.28785-1-krakow20@gmail.com>
References: <20250711093015.28785-1-krakow20@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:51 +0000
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

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
---
 drivers/gpu/nova-core/vbios.rs | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 5b5d9f38cbb3..d456c494374d 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -364,8 +364,9 @@ struct BitHeader {
 }
 
 impl BitHeader {
+    const MIN_LEN: usize = 12;
     fn new(data: &[u8]) -> Result<Self> {
-        if data.len() < 12 {
+        if data.len() < Self::MIN_LEN {
             return Err(EINVAL);
         }
 
@@ -467,8 +468,9 @@ struct PciRomHeader {
 }
 
 impl PciRomHeader {
+    const MIN_LEN: usize = 26;
     fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
-        if data.len() < 26 {
+        if data.len() < Self::MIN_LEN {
             // Need at least 26 bytes to read pciDataStrucPtr and sizeOfBlock.
             return Err(EINVAL);
         }
@@ -772,10 +774,11 @@ fn into_image(self) -> Result<BiosImage> {
         BiosImage::try_from(self)
     }
 
+    const MIN_LEN: usize = 26;
     /// Creates a new BiosImageBase from raw byte data.
     fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
         // Ensure we have enough data for the ROM header.
-        if data.len() < 26 {
+        if data.len() < Self::MIN_LEN {
             dev_err!(pdev.as_ref(), "Not enough data for ROM header\n");
             return Err(EINVAL);
         }
@@ -900,8 +903,9 @@ struct PmuLookupTableEntry {
 }
 
 impl PmuLookupTableEntry {
+    const MIN_LEN: usize = 6;
     fn new(data: &[u8]) -> Result<Self> {
-        if data.len() < 6 {
+        if data.len() < Self::MIN_LEN {
             return Err(EINVAL);
         }
 
@@ -928,8 +932,9 @@ struct PmuLookupTable {
 }
 
 impl PmuLookupTable {
+    const MIN_LEN: usize = 4;
     fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
-        if data.len() < 4 {
+        if data.len() < Self::MIN_LEN {
             return Err(EINVAL);
         }
 
-- 
2.50.1

