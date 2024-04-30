Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CBD8B7EED
	for <lists+nouveau@lfdr.de>; Tue, 30 Apr 2024 19:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CCF112DC2;
	Tue, 30 Apr 2024 17:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="htzZoJSb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E6ED112DC0;
 Tue, 30 Apr 2024 17:39:54 +0000 (UTC)
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.174.176])
 by linux.microsoft.com (Postfix) with ESMTPSA id 11AB1210FBDF;
 Tue, 30 Apr 2024 10:39:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 11AB1210FBDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1714498794;
 bh=2awojmCcrYHSFAnzLGFfwPsc4GsaxB9Ca4K7Bj7Q+lE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=htzZoJSbHITKCfrlx0PrPnJqdtP5WYr7h24RYyEYAs6vX5eMEtybpbvPsPzR3n17n
 l/nKf8va3DuUcIzMxRn9yT10jenrOLykbJqkYunzZfnpT12aDkB021UtCJ0Xp7jKUy
 O1N4belG+yi3RuxDAzenGXjUkKKe7NeIn2tUWetg=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Steve Glendinning <steve.glendinning@shawell.net>,
 Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org (open list:SMSC UFX6000 and UFX7000 USB to VGA
 DRIVER), dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
 linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
 linux-media@vger.kernel.org (open list:BTTV VIDEO4LINUX DRIVER),
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [PATCH v1 11/12] fbdev/smscufx: Make I2C terminology more inclusive
Date: Tue, 30 Apr 2024 17:38:10 +0000
Message-Id: <20240430173812.1423757-12-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
References: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
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

I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
with more appropriate terms. Inspired by and following on to Wolfram's
series to fix drivers/i2c/[1], fix the terminology for users of
I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
in the specification.

Compile tested, no functionality changes intended

[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/video/fbdev/smscufx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 35d682b110c4..1c80c1a3d516 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -1292,7 +1292,7 @@ static int ufx_realloc_framebuffer(struct ufx_data *dev, struct fb_info *info)
 	return 0;
 }
 
-/* sets up I2C Controller for 100 Kbps, std. speed, 7-bit addr, master,
+/* sets up I2C Controller for 100 Kbps, std. speed, 7-bit addr, host,
  * restart enabled, but no start byte, enable controller */
 static int ufx_i2c_init(struct ufx_data *dev)
 {
@@ -1321,7 +1321,7 @@ static int ufx_i2c_init(struct ufx_data *dev)
 	/* 7-bit (not 10-bit) addressing */
 	tmp &= ~(0x10);
 
-	/* enable restart conditions and master mode */
+	/* enable restart conditions and host mode */
 	tmp |= 0x21;
 
 	status = ufx_reg_write(dev, 0x1000, tmp);
-- 
2.34.1

