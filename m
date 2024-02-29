Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD6486CA0F
	for <lists+nouveau@lfdr.de>; Thu, 29 Feb 2024 14:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF1A10E07A;
	Thu, 29 Feb 2024 13:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nppct.ru header.i=@nppct.ru header.b="Fi5mGeks";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 511 seconds by postgrey-1.36 at gabe;
 Thu, 29 Feb 2024 13:19:20 UTC
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A542810E07A
 for <nouveau@lists.freedesktop.org>; Thu, 29 Feb 2024 13:19:20 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id 237711C0E63
 for <nouveau@lists.freedesktop.org>; Thu, 29 Feb 2024 16:10:45 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated,
 assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:to:from:from; s=dkim; t=1709212242; x=
 1710076243; bh=dRCSejW2kzJ3xySBJGPqpUgKdSkvijfiyJXAlXGgd3E=; b=F
 i5mGeksyN0m1+xAorznCpcY5+pNJC12/Kf9nqXJTCyeYyEuLijZLLay/bWgtmYwz
 7KqUV9VRU5loSUNryWLmXwc4Vklo+jXc/8YmSXLfMXRUx7OQNAW16ddaA16CyT1H
 YWWFDgLNX07bpQiJqRoXUAozo0BL4QF78Spuv9Cz0Q=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1a6_aHUG9UVU for <nouveau@lists.freedesktop.org>;
 Thu, 29 Feb 2024 16:10:42 +0300 (MSK)
Received: from localhost.localdomain (mail.dev-ai-melanoma.ru
 [185.130.227.204])
 by mail.nppct.ru (Postfix) with ESMTPSA id 02F0A1C05FF;
 Thu, 29 Feb 2024 16:10:37 +0300 (MSK)
From: Andrey Shumilin <shum.sdl@nppct.ru>
To: Karol Herbst <kherbst@redhat.com>
Cc: Andrey Shumilin <shum.sdl@nppct.ru>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, khoroshilov@ispras.ru, ykarpov@ispras.ru,
 vmerzlyakov@ispras.ru, vefanov@ispras.ru
Subject: [PATCH 3/3] drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.c:
 BUFFER_OVERFLOW
Date: Thu, 29 Feb 2024 16:10:24 +0300
Message-Id: <20240229131024.636527-1-shum.sdl@nppct.ru>
X-Mailer: git-send-email 2.30.2
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

The mxms_structlen function returns u16 (2 bytes).
Therefore it reads 2 bytes beyond the mxms array.

Signed-off-by: Andrey Shumilin <shum.sdl@nppct.ru>
Found by Linux Verification Center (linuxtesting.org) with SVACE.
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.c
index c1acfe642da3..efd0c874742e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.c
@@ -47,7 +47,7 @@ mxm_shadow_rom(struct nvkm_mxm *mxm, u8 version)
 	struct nvkm_bios *bios = device->bios;
 	struct nvkm_i2c *i2c = device->i2c;
 	struct nvkm_i2c_bus *bus = NULL;
-	u8 i2cidx, mxms[6], addr, size;
+	u8 i2cidx, mxms[8], addr, size;
 
 	i2cidx = mxm_ddc_map(bios, 1 /* LVDS_DDC */) & 0x0f;
 	if (i2cidx < 0x0f)
-- 
2.30.2

