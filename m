Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D03CF1BC5DE
	for <lists+nouveau@lfdr.de>; Tue, 28 Apr 2020 18:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5284F6E835;
	Tue, 28 Apr 2020 16:55:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737F96E830
 for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2020 16:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588092921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TP4D6jhgQ+fiTS3o09Z+c0MvMuOCNlqWdeP8LlU+E2I=;
 b=Dw/tlqB+p72LuJqzk8W5VyXz39boR9j9Zu6eqcoP/QgEEvWdWZy6OBqUoVFgZ34PTlB23N
 naqM8cNh2gQLAkE9y5A8PFHQm6k/06UDpiaeQU+1/OZcoioP0CwN+U+84S1xAvgZ7U/w3u
 PRNi6OaFe79mpsXV/jXG33GVmb0qMfI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-TFCFH9MpNBm3Qee0s_8yNg-1; Tue, 28 Apr 2020 12:55:19 -0400
X-MC-Unique: TFCFH9MpNBm3Qee0s_8yNg-1
Received: by mail-wr1-f69.google.com with SMTP id g7so12550328wrw.18
 for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2020 09:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1F/TsJMxX7z3OTlg9R7rqxSoYyzlQB8OIq4zTk362+Q=;
 b=mYEjzaowWJHwfAftlwVKL7CSyDM3FjVwZGgBojbkJlQvCof3GHRXdhoEu4SmSGsm4P
 ZXedYJEGxhb4TtRsKqxJkt2AzpY22i/TPFSvcj/mr0sdqCz4y/rNBGy5wHWQe2Tgy2P5
 1haEQzF7R27qZSXWGPU0nhYyDHO9iII3R0JVb+vERc38pcXHXjEm5uu4ek8G6Jnt03Mg
 I2lcfwDEE1pXlIAy30TZ3NUr5KA4MAjYokQYzGsxd0NAv5/fnDqbBgep2uT4rS8hCIMr
 yrFnEMHU3TdjF73IZI5PUCIGk6T+knjx/N+vn7fPkXc+ClVp5tztnTZdJD3KFdMwo3Ze
 4f6Q==
X-Gm-Message-State: AGi0PuYoogXT6gST6MNApoqlF4+kAsmpBazH1YUAVKvHfGiUBvAhtQ4y
 kk/225AlpZIRpS43stTU0v8vIGjmFJPv7hevqdeUk64fRD6cUwrmSRQReMtrNnZvUsOncOYIfTG
 +asBR/pWxZlHmv5HYHoVJT/tQrA==
X-Received: by 2002:a5d:6503:: with SMTP id x3mr37490731wru.153.1588092917802; 
 Tue, 28 Apr 2020 09:55:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypKnti7m7kcsbBASe+NhPA8oUX9GF6YGmSu9/sAirdfPgjgLuIuMbvP3w5F9+eAqPweeSGc1Aw==
X-Received: by 2002:a5d:6503:: with SMTP id x3mr37490716wru.153.1588092917639; 
 Tue, 28 Apr 2020 09:55:17 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:482c:9537:40:83ba])
 by smtp.gmail.com with ESMTPSA id z16sm27344137wrl.0.2020.04.28.09.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 09:55:16 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 28 Apr 2020 18:54:04 +0200
Message-Id: <20200428165404.936235-3-kherbst@redhat.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200428165404.936235-1-kherbst@redhat.com>
References: <20200428165404.936235-1-kherbst@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH v3 3/3] device: detect vGPUs
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

v2: move check further down

Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drm/nouveau/nvkm/engine/device/base.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index c732074bf..f977dddcd 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -2948,7 +2948,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 {
 	struct nvkm_subdev *subdev;
 	u64 mmio_base, mmio_size;
-	u32 boot0, strap;
+	u32 boot0, boot1, strap;
 	void __iomem *map = NULL;
 	int ret = -EEXIST, i;
 	unsigned chipset;
@@ -2998,9 +2998,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 			}
 		}
 
-		/* read boot0 and strapping information */
 		boot0 = ioread32_native(map + 0x000000);
-		strap = ioread32_native(map + 0x101000);
 
 		/* chipset can be overridden for devel/testing purposes */
 		chipset = nvkm_longopt(device->cfgopt, "NvChipset", 0);
@@ -3158,6 +3156,17 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		nvdev_info(device, "NVIDIA %s (%08x)\n",
 			   device->chip->name, boot0);
 
+		/* vGPU detection */
+		boot1 = ioread32_native(map + 0x000004);
+		if (device->card_type >= TU100 && (boot1 & 0x00030000)) {
+			nvdev_info(device, "vGPUs are not supported\n");
+			ret = -ENODEV;
+			goto done;
+		}
+
+		/* read strapping information */
+		strap = ioread32_native(map + 0x101000);
+
 		/* determine frequency of timing crystal */
 		if ( device->card_type <= NV_10 || device->chipset < 0x17 ||
 		    (device->chipset >= 0x20 && device->chipset < 0x25))
-- 
2.25.3

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
