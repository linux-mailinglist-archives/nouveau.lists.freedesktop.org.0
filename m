Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8BE88773D
	for <lists+nouveau@lfdr.de>; Sat, 23 Mar 2024 07:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232A0112B25;
	Sat, 23 Mar 2024 06:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nppct.ru header.i=@nppct.ru header.b="HxbItX1E";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F3B112B25
 for <nouveau@lists.freedesktop.org>; Sat, 23 Mar 2024 06:39:42 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id 9065C1C14EC
 for <nouveau@lists.freedesktop.org>; Sat, 23 Mar 2024 09:39:38 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated,
 assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:to:from:from; s=dkim; t=1711175978; x=
 1712039979; bh=8Ru1KtR1m4ULexCA5WK3GVpaEyvcpR5jkF1JflcEVtQ=; b=H
 xbItX1E7eNLuKU8HAcFtn+KjHLExvv1PNbmvQsMs6QYFmAHym9arCs/tsIfjOV4Q
 mLFdht/gwHOCPfz2vdyignBhtag/DWqVquG+TqaMgNHkhklD01R2NrFsLN4Fz+GE
 UEY3BFvx5IB1rTa5XiH+zEC+xYn9Hy/YvQyhBY6UJI=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7k4NWNwFIrHz for <nouveau@lists.freedesktop.org>;
 Sat, 23 Mar 2024 09:39:38 +0300 (MSK)
Received: from localhost.localdomain (mail.dev-ai-melanoma.ru
 [185.130.227.204])
 by mail.nppct.ru (Postfix) with ESMTPSA id 1C6961C11FE;
 Sat, 23 Mar 2024 09:39:35 +0300 (MSK)
From: Andrey Shumilin <shum.sdl@nppct.ru>
To: Karol Herbst <kherbst@redhat.com>
Cc: Andrey Shumilin <shum.sdl@nppct.ru>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 khoroshilov@ispras.ru, ykarpov@ispras.ru, vmerzlyakov@ispras.ru,
 vefanov@ispras.ru
Subject: [PATCH] therm.c: Adding an array index check before accessing an
 element.
Date: Sat, 23 Mar 2024 09:39:33 +0300
Message-Id: <20240323063933.665695-1-shum.sdl@nppct.ru>
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

It is possible to access an element at index -1 if at the
first iteration of the loop the result of switch is equal to 0x25
Added variable checking.

Found by Linux Verification Center (linuxtesting.org) with SVACE.
Signed-off-by: Andrey Shumilin <shum.sdl@nppct.ru>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
index 5babc5a7c7d5..78387053f214 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
@@ -180,6 +180,8 @@ nvbios_therm_fan_parse(struct nvkm_bios *bios, struct nvbios_therm_fan *fan)
 			cur_trip->fan_duty = duty_lut[(value & 0xf000) >> 12];
 			break;
 		case 0x25:
+			if (fan->nr_fan_trip == 0)
+				fan->nr_fan_trip++;
 			cur_trip = &fan->trip[fan->nr_fan_trip - 1];
 			cur_trip->fan_duty = value;
 			break;
-- 
2.30.2

