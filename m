Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0708782EE58
	for <lists+nouveau@lfdr.de>; Tue, 16 Jan 2024 12:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F51810E50E;
	Tue, 16 Jan 2024 11:47:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 584 seconds by postgrey-1.36 at gabe;
 Thu, 16 Nov 2023 06:40:46 UTC
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D733A10E249
 for <nouveau@lists.freedesktop.org>; Thu, 16 Nov 2023 06:40:46 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id 922251C0E03
 for <nouveau@lists.freedesktop.org>; Thu, 16 Nov 2023 09:30:58 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated,
 assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:to:from:from; s=dkim; t=1700116258; x=
 1700980259; bh=/9MO8o7o6nntPf+7n/of28fm2Es83s6OBU6s1H6hwTA=; b=k
 PjlYx5ZWDj+EpWLiT3v60MmQyXnhu+8FlV9aPRkwbH+idUXuV7+J7zUFtVCV3xTM
 sJewLvpk6FMhZIvUT4Z1uwxLaZ5QA/USQ/1yBayGwfRX4anAuTmWR4aX2Ni85Ayl
 vh0VFv3L7eNXGF29bRZAVLF/MxREFAs7Wax1NiS42Q=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6bwfGpdVLIfJ for <nouveau@lists.freedesktop.org>;
 Thu, 16 Nov 2023 09:30:58 +0300 (MSK)
Received: from localhost.localdomain (mail.dev-ai-melanoma.ru
 [185.130.227.204])
 by mail.nppct.ru (Postfix) with ESMTPSA id 57B921C061A;
 Thu, 16 Nov 2023 09:30:55 +0300 (MSK)
From: Andrey Shumilin <shum.sdl@nppct.ru>
To: Karol Herbst <kherbst@redhat.com>
Subject: [PATCH] therm.c: Adding an array index check before accessing an
 element.
Date: Thu, 16 Nov 2023 09:30:28 +0300
Message-Id: <20231116063028.35871-1-shum.sdl@nppct.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 Jan 2024 11:47:29 +0000
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
Cc: nouveau@lists.freedesktop.org, Andrey Shumilin <shum.sdl@nppct.ru>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 vefanov@ispras.ru, ykarpov@ispras.ru, Daniel Vetter <daniel@ffwll.ch>,
 vmerzlyakov@ispras.ru, khoroshilov@ispras.ru
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

It is possible to access an element at index -1 if at the first iteration of the loop the result of switch is equal to 0x25

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

