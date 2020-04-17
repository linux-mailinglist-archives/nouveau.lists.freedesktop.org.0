Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AE61AE450
	for <lists+nouveau@lfdr.de>; Fri, 17 Apr 2020 20:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD04A6E439;
	Fri, 17 Apr 2020 18:10:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E406E439
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 18:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587147040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+sLR2xpALBFXmkUQtCJWQBX26NChOn0To6ROBjU9wPQ=;
 b=SZtosLk6WLmYH+EkWEFQeRCjM5QvMZ2LPP1dJ6pQZgFlTGOfCJ6GvOLwoRSOiLSC2+fLi4
 ccD9DGJme/TfPnbNBeOjfwns/VwDIew9zeV7mHksuQ8ovasvhw2tiAYAwfQS2my2Nq+IWk
 X8gFHH/2qsqD8qVaVLnf/GOauetNxAE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-AtawrY_GMQmXSCwBC-ssVA-1; Fri, 17 Apr 2020 14:10:39 -0400
X-MC-Unique: AtawrY_GMQmXSCwBC-ssVA-1
Received: by mail-wr1-f71.google.com with SMTP id m5so1411982wru.15
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 11:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s7FleODcFLUimtWnO/Q4gTrE8GjlwLOO0aZF5VEQp18=;
 b=qAVov8WVSpe5FuNCUmpojdMTp59ArKqP2ATw8nHCQ1+tMwEiKu8ji/A7T07LrcBzUK
 WHC1VbZwjWHqGjMqh5ApVlTm9frGiVKW5cvmww98vQIp7soBeICzijlcNfsSPeKMK+8y
 kUE+x5atSZRE0xVGDY7QWnkLdcFQ2hRZjTomHJiuePZQYNSBdEYtLP4ys7aw38Yt048s
 iLxIVXHQZsaYpGg2IYQWbRwhF4I42UjxXiyzkeyobGeiV595a+qfNE9Qr0whLwJson6i
 TgE3e8VJKHOLRPI+6mIOuZ0cB0LglZRl4fa7O6tCAjlLxkqO2CDxoPD0F2cXP5Xc/PTn
 isuQ==
X-Gm-Message-State: AGi0PuaVOTtld+Vp+lalpBks3/PfTaTxB9k6uiCMiAtAfVM1omxcFcDE
 BmFcpPVVHH62vXmjObH1UhE1rPyhfZfra6k0Nxx8wV/ro1YuRHXpf5Z46fZwZDNh1qKX0otk3tU
 dUAiycMFpYDBx1fmLykIM27cN0Q==
X-Received: by 2002:adf:de8b:: with SMTP id w11mr4965353wrl.48.1587147037376; 
 Fri, 17 Apr 2020 11:10:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypIQC1CY5O7jrsxFGsegY6mBxkRTxYwqro6JwOduWEg/jErHhyiKSMn3WyRDFmC2ojAYT/XJCQ==
X-Received: by 2002:adf:de8b:: with SMTP id w11mr4965346wrl.48.1587147037233; 
 Fri, 17 Apr 2020 11:10:37 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:482c:9537:40:83ba])
 by smtp.gmail.com with ESMTPSA id e5sm33878381wru.92.2020.04.17.11.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 11:10:36 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 17 Apr 2020 20:09:32 +0200
Message-Id: <20200417180932.111335-3-kherbst@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200417180932.111335-1-kherbst@redhat.com>
References: <20200417180932.111335-1-kherbst@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH v2 3/3] device: detect vGPUs
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

Using ENODEV as this prevents probe failed errors in dmesg.

Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drm/nouveau/nvkm/engine/device/base.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index ddaa96a75..70effb36e 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -2948,7 +2948,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 {
 	struct nvkm_subdev *subdev;
 	u64 mmio_base, mmio_size;
-	u32 boot0, strap;
+	u32 boot0, boot1, strap;
 	void __iomem *map;
 	int ret = -EEXIST, i;
 	unsigned chipset;
@@ -2993,8 +2993,19 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 			}
 		}
 
-		/* read boot0 and strapping information */
+		/* vGPU detection */
 		boot0 = ioread32_native(map + 0x000000);
+		boot1 = ioread32_native(map + 0x000004);
+		chipset = (boot0 & 0x1ff00000) >> 20;
+
+		if (chipset >= 0x160 && (boot1 & 0x00030000)) {
+			iounmap(map);
+			nvdev_info(device, "vGPUs are not supported\n");
+			ret = -ENODEV;
+			goto done;
+		}
+
+		/* read strapping information */
 		strap = ioread32_native(map + 0x101000);
 		iounmap(map);
 
-- 
2.25.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
