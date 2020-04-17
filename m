Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1C51AE404
	for <lists+nouveau@lfdr.de>; Fri, 17 Apr 2020 19:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871466E313;
	Fri, 17 Apr 2020 17:47:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E526E2DD
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 17:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587145627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQclUDDhkIlzLuJvvxMFLLsC9J1lpHg26RfA9BaAmrE=;
 b=BdclI6hzVBxU38ER/IpRqKc5w2LkdhgtyXtUOtZnNV/XskHJhF4GhBszCzrj8f6i11t1Ol
 bzxoaPyVbdyQELjmomznCdXWjysISwTFyM1p6zFCsRXd1+hUOJlKTgYCjYkb8WOcXA4rr0
 N7+DlXnoxcprUy5CnzQxuZn9jz8aPDQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-2RHTmZryPa-ITCPo9DZXKg-1; Fri, 17 Apr 2020 13:47:05 -0400
X-MC-Unique: 2RHTmZryPa-ITCPo9DZXKg-1
Received: by mail-wr1-f69.google.com with SMTP id i10so1388116wrq.8
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 10:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kYlFJXtfrg9t/WRwwp1MD7e7fvkxmnve9XdtDShsSzU=;
 b=sF/DCKtKKstuLkL1H/YcSE7f3l9DQ76tjsZTn6Zn37+wIUqfv/18twbhnw/+OwSO7e
 lndeSPwgYhxQg/rrFCSwUG45r24fZsPAbPW50vVFKMshDJJzn4ZVoj0IcsMTX6NJ1onf
 De2kbg6SLx/y13UQDqAGadSfLzxwDK6huddRdLS97Rb/t0rugWea0Nqxa4DEcB89UYto
 MB1r1WKaU0fbNS4ujF7K7Wps8Qfxp66/8QFkjriVw+DaEQadij/4FiJW8oiUzZDG9Tdg
 wpT/1Q3nZj2v2rJbB5o17RwZwOMPi0RutjxaHrB0vcf9vF1u34Wfx78AbcwF2w1gN1rK
 kMqg==
X-Gm-Message-State: AGi0PuY0PKCOg34GhW33f3UwSn57Tr+CYzlHjuZM5w2mwUQNn5BcOZvM
 9m3Wj0DKVRsZeoU33N5fwU0e/2Bf1lQYTOuNxcid5BGyT7GL62yfXAiV6fsJNxkXDOw75AZk77K
 Jr3EMjFPGXoBlwwujPGe5pC5awQ==
X-Received: by 2002:adf:f54c:: with SMTP id j12mr4774605wrp.183.1587145623609; 
 Fri, 17 Apr 2020 10:47:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypJJsLRS6G/023eK4fF6gcgULwQUHZieRMwXPW7OSvrdsCtQ7D4ZhrPrhuJvQPaIdagEXlrKyg==
X-Received: by 2002:adf:f54c:: with SMTP id j12mr4774591wrp.183.1587145623454; 
 Fri, 17 Apr 2020 10:47:03 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:482c:9537:40:83ba])
 by smtp.gmail.com with ESMTPSA id w3sm15665006wrc.18.2020.04.17.10.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 10:47:02 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 17 Apr 2020 19:45:58 +0200
Message-Id: <20200417174559.37152-2-kherbst@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200417174559.37152-1-kherbst@redhat.com>
References: <20200417174559.37152-1-kherbst@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH 2/3] device: detect if changing endianness failed
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

Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drm/nouveau/nvkm/engine/device/base.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index 17676c75a..06aa99d47 100644
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
+	if (boot1 != 0x01000001)
+		return false;
+#else
+	if (boot1 != 0x00000000)
+		return false;
+#endif
+	return true;
+}
+
 int
 nvkm_device_ctor(const struct nvkm_device_func *func,
 		 const struct nvkm_device_quirk *quirk,
@@ -2968,13 +2982,15 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 			goto done;
 
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
2.25.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
