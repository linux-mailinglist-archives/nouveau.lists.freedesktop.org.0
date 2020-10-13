Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A514428CD86
	for <lists+nouveau@lfdr.de>; Tue, 13 Oct 2020 14:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1FC6E301;
	Tue, 13 Oct 2020 12:01:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C1B6E301
 for <nouveau@lists.freedesktop.org>; Tue, 13 Oct 2020 12:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602590494;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type: content-transfer-encoding:content-transfer-encoding;
 bh=SY+IXK60WMLkovPAZCiL3JRJthBgVHPsDnShX2G9jEo=;
 b=bBRGjCJvRnLs4h93eKui4bAX7TwtDljw4lyilOxOhWeHTBVC9cu3zVFSH8euepz1QT0uD9
 WqFJJpJSPeB1IAnf3L4GXuGgj6uEHibpADMjf/+1hOWBBoMi539XBDDJAdYQ3Sl+k32Qq0
 RNj1tzWoF7IL9nCDymJ/285/99T/SFU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-TxJnA9NVOIqhPMrGTiXkIg-1; Tue, 13 Oct 2020 08:01:30 -0400
X-MC-Unique: TxJnA9NVOIqhPMrGTiXkIg-1
Received: by mail-wm1-f72.google.com with SMTP id l15so5831127wmh.9
 for <nouveau@lists.freedesktop.org>; Tue, 13 Oct 2020 05:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :mime-version:content-transfer-encoding;
 bh=SY+IXK60WMLkovPAZCiL3JRJthBgVHPsDnShX2G9jEo=;
 b=YavfYfV5ryBtidHeGw331moOOsLBOGX6LPe7xf3raqiNhkbLYPG6rJV86+3oPmUY5R
 k9T7MLjiBeRbjH/ezWbMdi8gDv6BZLp3xHxPnVJMMBnwmRK+/NkdIeDNy1loM4XGWbMQ
 yKlD91rh22tl5L9W2NkhuAcXSS1ZXmKacgbuu+d0rhG2LDvSIINEoFsvR5Q8G+nPCflj
 pluRo0ocGF6/XhzvkpNlLKRUcnZ86bIa2hoKxEFomEZUlc3isA9zJNKAJi81z/sa6jsc
 cpKZJV5go1fPy+4RKp1Ckvfht5RLxkVD3lpP218zk6P1M+B9JdQKdqrD6xDOuQ04ag3a
 1PEg==
X-Gm-Message-State: AOAM531FGAJiUlfXoLPLXDCisO8qHQB/sqCj3Ro2LoaJoTG2tC3tVLB4
 NUAK7Amxdn7LMbcYU5PBeWXdZcRNoyaxVI15zlCiaW7puKm7zRQTPZVgSS7pO/XZXWnySpzN/9S
 rJSN/NutRfxlmkvnerLM53i58TQ==
X-Received: by 2002:a7b:c112:: with SMTP id w18mr10193143wmi.62.1602590488777; 
 Tue, 13 Oct 2020 05:01:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD9Y+99ofd9t4jmQ1SM2HOCV8UN/qBe37vcGbS6XJQKpQmDEuANgmZvKoOmJu6oQiYazM+fA==
X-Received: by 2002:a7b:c112:: with SMTP id w18mr10193121wmi.62.1602590488481; 
 Tue, 13 Oct 2020 05:01:28 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b088:c000:2bdf:b7aa:eede:d65f])
 by smtp.gmail.com with ESMTPSA id k18sm10468901wrx.96.2020.10.13.05.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 05:01:27 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: Ondrej Zary <linux@zary.sk>
Date: Tue, 13 Oct 2020 14:01:26 +0200
Message-Id: <20201013120126.59411-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH] drm/nouveau/device: fix changing endianess code
 to work on older GPUs
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
Reply-To: 202010101049.37663.linux@zary.sk
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

With this we try to detect if the endianess switch works and assume LE if
not. Suggested by Ben.

Fixes: 51c05340e407 ("drm/nouveau/device: detect if changing endianness failed")
---
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 39 ++++++++++++-------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index dcb70677d0acc..7851bec5f0e5f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2924,17 +2924,34 @@ nvkm_device_del(struct nvkm_device **pdevice)
 	}
 }
 
+/* returns true if the GPU is in the CPU native byte order */
 static inline bool
 nvkm_device_endianness(struct nvkm_device *device)
 {
-	u32 boot1 = nvkm_rd32(device, 0x000004) & 0x01000001;
 #ifdef __BIG_ENDIAN
-	if (!boot1)
-		return false;
+	const bool big_endian = true;
 #else
-	if (boot1)
-		return false;
+	const bool big_endian = false;
 #endif
+
+	/* Read NV_PMC_BOOT_1, and assume non-functional endian switch if it
+	 * doesn't contain the expected values.
+	 */
+	u32 pmc_boot_1 = nvkm_rd32(device, 0x000004);
+	if (pmc_boot_1 && pmc_boot_1 != 0x01000001)
+		return !big_endian; /* Assume GPU is LE in this case. */
+
+	/* 0 means LE and 0x01000001 means BE GPU. Condition is true when
+	 * GPU/CPU endianness don't match.
+	 */
+	if (big_endian == !pmc_boot_1) {
+		nvkm_wr32(device, 0x000004, 0x01000001);
+		nvkm_rd32(device, 0x000000);
+		if (nvkm_rd32(device, 0x000004) != (big_endian ? 0x01000001 : 0x00000000))
+			return !big_endian; /* Assume GPU is LE on any unexpected read-back. */
+	}
+
+	/* CPU/GPU endianness should (hopefully) match. */
 	return true;
 }
 
@@ -2987,14 +3004,10 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	if (detect) {
 		/* switch mmio to cpu's native endianness */
 		if (!nvkm_device_endianness(device)) {
-			nvkm_wr32(device, 0x000004, 0x01000001);
-			nvkm_rd32(device, 0x000000);
-			if (!nvkm_device_endianness(device)) {
-				nvdev_error(device,
-					    "GPU not supported on big-endian\n");
-				ret = -ENOSYS;
-				goto done;
-			}
+			nvdev_error(device,
+				    "Couldn't switch GPU to CPUs endianess\n");
+			ret = -ENOSYS;
+			goto done;
 		}
 
 		boot0 = nvkm_rd32(device, 0x000000);
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
