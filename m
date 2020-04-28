Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7441BC5DD
	for <lists+nouveau@lfdr.de>; Tue, 28 Apr 2020 18:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F76B6E830;
	Tue, 28 Apr 2020 16:55:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F0688E41
 for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2020 16:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588092918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2JZTQCrRy/2klysh1jl2oybi9O5Jluyv99sc5o9nmmw=;
 b=WnYBx3ZarulGeSs1j2wwAzWzJbuOawoQeW+Z6oo0uhXH1AaxX+MGDMIxGynPE4nCq+SErB
 z/oaHh7SkKgA364a4Kp/G9n478W+q+GKFLRAXJmbAWqKFkWXtaTou5KhNxyZO5LZtBOgib
 v2MBuiMvyPO1uLGA58QmiN2nZd3vP9Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-Vf2NHFQHNxqtQZwC0kX6yA-1; Tue, 28 Apr 2020 12:55:16 -0400
X-MC-Unique: Vf2NHFQHNxqtQZwC0kX6yA-1
Received: by mail-wm1-f70.google.com with SMTP id t62so1356575wma.0
 for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2020 09:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o+fqThosu8AThbRnDmksHGE6D+QGSJm9aV/0wcWDKWE=;
 b=WYoHidkqWsZYW/+JI7O8C8tb04gALWMy+aoVlvTJmeNGqZSmXbK+RrmbeMI/d06K0t
 jSLFg9d3/nGpptMtdZdEEiV4WQ8W/ReSInp3zGuRxo+HnE+p78rjIO+WbFYIFUFwESwB
 PkbP+S/aax80wRVRA5W3M+lQIEgWvVffeyCIvQ+M0eCmYaTGo1sISNBVyNgqNhokPrfn
 McMFckQIrLjHLkneoGpuMRDolrml93MR8rtwMPdthPUYIUYOL6Yum5XlCo0PylwnJ0Oy
 sNYyKzvkSia5/ba5rA0ZMuRXgb6W1h3hPX8jbQkX/apsa2ESWj+hLxqADM6VHaEz3GN2
 k1nw==
X-Gm-Message-State: AGi0PuaX4WMtRky1yj+nMEnQ7g8rR7a1JMspfh3Z8xiU9Q7R3d4ZlA9b
 gOyOKawjBdYlkE/3B8+tuVhuYFDoI1CWSomH5rHHkDUYXR8f/15bd8iH4dT45kwP57OqhyTHqSf
 iY789KTGeT6bo7Ck41v3epB5XGQ==
X-Received: by 2002:a05:600c:295a:: with SMTP id
 n26mr6193436wmd.16.1588092915033; 
 Tue, 28 Apr 2020 09:55:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypL8JSYApb46rw6wH2MvIngJAstdHuaZRCgxav2oTacw1y6nAUWjdYgzccWzZRIdCVAFX1Ah/Q==
X-Received: by 2002:a05:600c:295a:: with SMTP id
 n26mr6193428wmd.16.1588092914853; 
 Tue, 28 Apr 2020 09:55:14 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:482c:9537:40:83ba])
 by smtp.gmail.com with ESMTPSA id z16sm27344137wrl.0.2020.04.28.09.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 09:55:14 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 28 Apr 2020 18:54:02 +0200
Message-Id: <20200428165404.936235-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH v3 1/3] device: rework mmio mapping code to get
 rid of second map
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

Fixes warnings on GPUs with smaller a smaller mmio region like vGPUs.

Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drm/nouveau/nvkm/engine/device/base.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index 8ebbe1656..37589f365 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -2935,7 +2935,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	struct nvkm_subdev *subdev;
 	u64 mmio_base, mmio_size;
 	u32 boot0, strap;
-	void __iomem *map;
+	void __iomem *map = NULL;
 	int ret = -EEXIST, i;
 	unsigned chipset;
 
@@ -2961,12 +2961,17 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	mmio_base = device->func->resource_addr(device, 0);
 	mmio_size = device->func->resource_size(device, 0);
 
-	/* identify the chipset, and determine classes of subdev/engines */
-	if (detect) {
-		map = ioremap(mmio_base, 0x102000);
-		if (ret = -ENOMEM, map == NULL)
+	if (detect || mmio) {
+		map = ioremap(mmio_base, mmio_size);
+		if (map == NULL) {
+			nvdev_error(device, "unable to map PRI\n");
+			ret = -ENOMEM;
 			goto done;
+		}
+	}
 
+	/* identify the chipset, and determine classes of subdev/engines */
+	if (detect) {
 		/* switch mmio to cpu's native endianness */
 #ifndef __BIG_ENDIAN
 		if (ioread32_native(map + 0x000004) != 0x00000000) {
@@ -2980,7 +2985,6 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		/* read boot0 and strapping information */
 		boot0 = ioread32_native(map + 0x000000);
 		strap = ioread32_native(map + 0x101000);
-		iounmap(map);
 
 		/* chipset can be overridden for devel/testing purposes */
 		chipset = nvkm_longopt(device->cfgopt, "NvChipset", 0);
@@ -3159,12 +3163,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		device->name = device->chip->name;
 
 	if (mmio) {
-		device->pri = ioremap(mmio_base, mmio_size);
-		if (!device->pri) {
-			nvdev_error(device, "unable to map PRI\n");
-			ret = -ENOMEM;
-			goto done;
-		}
+		device->pri = map;
 	}
 
 	mutex_init(&device->mutex);
@@ -3254,6 +3253,10 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 
 	ret = 0;
 done:
+	if (map && (!mmio || ret)) {
+		device->pri = NULL;
+		iounmap(map);
+	}
 	mutex_unlock(&nv_devices_mutex);
 	return ret;
 }
-- 
2.25.3

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
