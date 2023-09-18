Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA3A7A53E3
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869E110E313;
	Mon, 18 Sep 2023 20:22:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43EB10E312
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:17 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-578a6bb11ecso419360a12.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068537; x=1695673337; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sozhjfioxxChQBhOHetthC2nA3cAD1TYPE+5t+xKoUY=;
 b=XlXo+h8o0UBXsgeDQp5ZXpcBqPDrPMZ5izJpdhTAyiF04qZi6366zzUegkormgc3aD
 Kdf2caC5QE8rbcby9cbWwe+YzRD/6ta4kUuyPKrzAGT5U2gyWoK88IE5hHVsgoC3CPCR
 zaaQXH9HrjRhrN1IaliMIDcFJmpu4MQ1jw5lffLwrE/cRoFeytmYuDg0J8cCZ7BDzuYu
 i/+Oo8KAGsARNcTfJVFBlUtmO2tptzz8QVBIfYzpenZr11i6HWqQNqTGKhtcMlBsIffR
 IpMwpivo1yWngqSawqOAN0zy7BPvVy4hmVSvCkEp8AwwuKcR5h4O2o4ito9E8ceMRxFK
 PO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068537; x=1695673337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sozhjfioxxChQBhOHetthC2nA3cAD1TYPE+5t+xKoUY=;
 b=mRZnBbTleloU+b4QHpyVS4KlOViOYV4qCvJzKiO3vtPdrs4k51n2YC+hAKY4OEfvh4
 Jpdgsec0s6DOIBvF4HUEor/TP0DLtjLaF/HQGCaA+r7izcsZCTKJXCfJalhq8WIRHn70
 F9OO/6Q1a+21Ux3L86DjfLWPCXpFX2RPD5DKS0Zk6UwAoj14D5BY8bg3/6tiTRTZwVc5
 1wOuUdytnFY5zrxXBHxwvzRj1EF16aa69SkE6z6DsL9qq3GyWGTIbUuJqBNK3Zjwrz1d
 hciHt4UJleOUZIMALVZWCVleGaH/D4cE66vO9lQexuZsUfYhBsF2ipk4UipAK4Sz1QDS
 xiBg==
X-Gm-Message-State: AOJu0YyBJ571g7KYkc9CHgyU76hmmFSPXgvtL0MEwuL8B/O4QLtrMtFC
 QZWPMzvklWSAjpNnhtxW8XsIdN5Lkz8=
X-Google-Smtp-Source: AGHT+IFUN2nxgdtdHtdItW5//ONpKBC++C5v8gePn5umJ5XpXD098Vmd5AL6/KnvynWCx5F6uX/BNw==
X-Received: by 2002:a05:6a20:ce96:b0:14c:4dfc:9766 with SMTP id
 if22-20020a056a20ce9600b0014c4dfc9766mr8335115pzb.46.1695068537028; 
 Mon, 18 Sep 2023 13:22:17 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:16 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:11 +1000
Message-ID: <20230918202149.4343-7-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 06/44] drm/nouveau/bar/tu102-: prepare for GSP-RM
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- (temporarily) disable if GSP-RM detected, will be added later
- move BAR2 teardown from dtor(), it doesn't belong there

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c  | 10 +++++++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.c |  4 ++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c
index d017a1b5e5dd..91bc53be97ff 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c
@@ -93,8 +93,16 @@ static int
 nvkm_bar_fini(struct nvkm_subdev *subdev, bool suspend)
 {
 	struct nvkm_bar *bar = nvkm_bar(subdev);
+
+	if (!subdev->use.enabled)
+		return 0;
+
 	if (bar->func->bar1.fini)
 		bar->func->bar1.fini(bar);
+
+	if (!suspend) /* Handled by instmem. */
+		nvkm_bar_bar2_fini(subdev->device);
+
 	return 0;
 }
 
@@ -120,7 +128,7 @@ static void *
 nvkm_bar_dtor(struct nvkm_subdev *subdev)
 {
 	struct nvkm_bar *bar = nvkm_bar(subdev);
-	nvkm_bar_bar2_fini(subdev->device);
+
 	return bar->func->dtor(bar);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.c
index c25ab407b85d..8041bb632835 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.c
@@ -22,6 +22,7 @@
 #include "gf100.h"
 
 #include <core/memory.h>
+#include <subdev/gsp.h>
 #include <subdev/timer.h>
 
 static void
@@ -95,5 +96,8 @@ int
 tu102_bar_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	      struct nvkm_bar **pbar)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return gf100_bar_new_(&tu102_bar, device, type, inst, pbar);
 }
-- 
2.41.0

