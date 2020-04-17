Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8AC1AE405
	for <lists+nouveau@lfdr.de>; Fri, 17 Apr 2020 19:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CE96E369;
	Fri, 17 Apr 2020 17:47:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E680C6E34C
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 17:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587145628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lbc+nZAa8lrTk1DeoXBoQVzLNa6MWYjhPC7Mn8AeyEA=;
 b=KIvor9iJZdwFcviyyKnb0nqGhw04dwlBj8btzbSgo65vhWBrT5fhuGMBqTVlECokiWnNst
 epbJhU+PYr/wmFdxPOeJZ5MXtoJJ47RoVz6bm82hccJvnQIoj0RScp6wQBm0Fi7R4Ur6tz
 c/rIpJNP4kyb2q+bxmfvlygBSBeTYoM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-pTqq1APbMnGMetwfV72PTw-1; Fri, 17 Apr 2020 13:47:06 -0400
X-MC-Unique: pTqq1APbMnGMetwfV72PTw-1
Received: by mail-wr1-f69.google.com with SMTP id r11so1376593wrx.21
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 10:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PB3l/ikXY6NA1m5uS8MMClH6p/zkQ/hXz8zt7QOQYE8=;
 b=gwj2ExuvRdpaP4IZ5NJCKF5O51pLAEWnFlkPwm9WLaxWGDHChyDFKoVm/JdAtJNkzP
 dzfyqfc+7cwfWdTw9D/Ovn1IYQuSs5v0w6iDzJ8jXmp6i18vmsSqVCY0McZ1wmMdJW+n
 EyKgEcV23of2xq110azp+ETzqfWLrh5qbKdfrWB2yl3I/EElhBLEe804GGCLhHdYUSLh
 AexNJ+Nl9VtQzulG6KeEBtkjsXiBrjCUI+c8hyx9azm0f+FSu6YZCcJlBJmZm70HNGvn
 qavfugUlOAYVjq/I9W/W2MDcWZrHP0i3WjwwsW8EA+p7PBphFdT/zvx3t2F649P990hv
 copw==
X-Gm-Message-State: AGi0PuaOArJDX3Si+ezq6+ZKRDShzn4kZOf+CTjmm+jhcLTl7EC9s37Q
 sNTFhMKQXcYaIImY5rmpJUURFLCUE34Ff8Ea7fWrVHATp++6BsYm5mdQlts0G9+BwSsGOmbnvIM
 faNbe8S1mBQPwpHRfmiRUVgWmLg==
X-Received: by 2002:a05:600c:4102:: with SMTP id
 j2mr4779512wmi.159.1587145624995; 
 Fri, 17 Apr 2020 10:47:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypKr4Ur582i+22gufT1AolwZpcKhN5AfA/dahD6ueE58T1fmk+bJpqCPFoSUtz+CFb+vMY1qFA==
X-Received: by 2002:a05:600c:4102:: with SMTP id
 j2mr4779497wmi.159.1587145624822; 
 Fri, 17 Apr 2020 10:47:04 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:482c:9537:40:83ba])
 by smtp.gmail.com with ESMTPSA id w3sm15665006wrc.18.2020.04.17.10.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 10:47:03 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 17 Apr 2020 19:45:59 +0200
Message-Id: <20200417174559.37152-3-kherbst@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200417174559.37152-1-kherbst@redhat.com>
References: <20200417174559.37152-1-kherbst@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH 3/3] device: detect vGPUs
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
index 06aa99d47..77633ecda 100644
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
