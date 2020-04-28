Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D7F1BC5DB
	for <lists+nouveau@lfdr.de>; Tue, 28 Apr 2020 18:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668A988E41;
	Tue, 28 Apr 2020 16:55:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3C188E41
 for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2020 16:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588092920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3y0OwP3DHB0N6vsQRyBcDyfsjTQsEoLoaE7b/zuJZDw=;
 b=gOeLYcR1sZL0DPicggvtWjtCLHisvbTTOygx8YHHn+0XBEeqhbXQPQ6vAInoe5i4iVGqwq
 3y2/k97barh6glcHiZ/EKRmdZefZL9juQ68le6X4dJKaGegIDvoW7SRgdsKXB5qGVrlrkG
 G64Zm+5EkiILjFu9Zti2bXk04cEuvbw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-LwoCYKlmOp65Z-hlcvEefg-1; Tue, 28 Apr 2020 12:55:18 -0400
X-MC-Unique: LwoCYKlmOp65Z-hlcvEefg-1
Received: by mail-wr1-f71.google.com with SMTP id q10so12606645wrv.10
 for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2020 09:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1csIwpN9M21XKx/u0znhZ/n2u6I+fVkSqp791XslAMQ=;
 b=U9SyX3x2qIsd2nUK99K1P1+vR3j7d2EvbbU4WbIWLNHRHBjRlcnmP8CxlM9SOqx8W7
 fMuwaxlfCbTRH+kCgU3Mfn+JVm7o0EpY4q2KzHM/+QMo8eJ+lI8ARrZNgzGcvikdsX6a
 eaAnM7QSVgHrIDD7tdyHJZ+H6PMmVTfjZe/1+SR2ioGmJ5hn6+TMdoq9WCX2nv0C5bTK
 L4v4GHSW9FxCWqFGnLJxGEOvTtBRrWLAvA886+DL1+v6SW3okuzvRyRTDMgB+v/2gPsl
 5g2za7CTen+baD8MXfZJ957eRCnGohEEmQs81bqm4pNchVbKmQ270ulAsUlBx8ZUIeTf
 81RA==
X-Gm-Message-State: AGi0PuZskRQCf75q3yG3LNjOZOjIzzZT4Fi1tIKSbHQ/LiM9lswB/jUb
 IZMqnsI4PrnM+bnZDJ9YAGIfd23Gi4v6AYZo6LoV/P4BpJZt5oqryDUJg80VAPgZ5NO3Xl5dJ57
 RzBQtZScQQ2pegLrT+5+fwo5OOA==
X-Received: by 2002:a5d:6945:: with SMTP id r5mr36937368wrw.363.1588092916562; 
 Tue, 28 Apr 2020 09:55:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypIlVau793Kv/5zwcfApsDEceiIuT+wqwiKNGzHKM8whI8XtuR9Q976TXGmwkaZ+Vkf1rsp7SA==
X-Received: by 2002:a5d:6945:: with SMTP id r5mr36937347wrw.363.1588092916342; 
 Tue, 28 Apr 2020 09:55:16 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:482c:9537:40:83ba])
 by smtp.gmail.com with ESMTPSA id z16sm27344137wrl.0.2020.04.28.09.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 09:55:15 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 28 Apr 2020 18:54:03 +0200
Message-Id: <20200428165404.936235-2-kherbst@redhat.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200428165404.936235-1-kherbst@redhat.com>
References: <20200428165404.936235-1-kherbst@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH v3 2/3] device: detect if changing endianness
 failed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

v2: relax the checks a little

Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drm/nouveau/nvkm/engine/device/base.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index 37589f365..c732074bf 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -2924,6 +2924,20 @@ nvkm_device_del(struct nvkm_device **pdevice)
 	}
 }
 
+static inline bool
+nvkm_device_endianness(void __iomem *pri)
+{
+	u32 boot1 = ioread32_native(pri + 0x000004) & 0x01000001;
+#ifdef __BIG_ENDIAN
+	if (!boot1)
+		return false;
+#else
+	if (boot1)
+		return false;
+#endif
+	return true;
+}
+
 int
 nvkm_device_ctor(const struct nvkm_device_func *func,
 		 const struct nvkm_device_quirk *quirk,
@@ -2973,13 +2987,15 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	/* identify the chipset, and determine classes of subdev/engines */
 	if (detect) {
 		/* switch mmio to cpu's native endianness */
-#ifndef __BIG_ENDIAN
-		if (ioread32_native(map + 0x000004) != 0x00000000) {
-#else
-		if (ioread32_native(map + 0x000004) == 0x00000000) {
-#endif
+		if (!nvkm_device_endianness(map)) {
 			iowrite32_native(0x01000001, map + 0x000004);
 			ioread32_native(map);
+			if (!nvkm_device_endianness(map)) {
+				nvdev_error(device,
+					    "GPU not supported on big-endian\n");
+				ret = -ENOSYS;
+				goto done;
+			}
 		}
 
 		/* read boot0 and strapping information */
-- 
2.25.3

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
