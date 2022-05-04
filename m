Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0651751A9DE
	for <lists+nouveau@lfdr.de>; Wed,  4 May 2022 19:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236FB10F1F6;
	Wed,  4 May 2022 17:19:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C95E10F1F6
 for <nouveau@lists.freedesktop.org>; Wed,  4 May 2022 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651684739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3t8epFEjcxVGinupv1KfUngZ1NH7mCjOSa22VqDXFR0=;
 b=TT0SRnuCQfIV4xoudazdAtQ0QCazkEyeypRBznxd0DMBOBDyWIuAUtoIPJgiVtgl603m1a
 x0cglTTGTE5b0KZs9BAp5eEjR62nfeGxZ7zfwEScZeOODU/m7V3xPkq+cG7bOzzsyqomw5
 QZdrINplIITeXdfGeeAbtQYg56ONjPU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-TMMhYwGLP8mgBSqmcmpHVA-1; Wed, 04 May 2022 13:18:56 -0400
X-MC-Unique: TMMhYwGLP8mgBSqmcmpHVA-1
Received: by mail-ed1-f71.google.com with SMTP id
 z20-20020a50f154000000b0042815e3008cso1082694edl.15
 for <nouveau@lists.freedesktop.org>; Wed, 04 May 2022 10:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3t8epFEjcxVGinupv1KfUngZ1NH7mCjOSa22VqDXFR0=;
 b=5OXVdSnAJ9QlhpZcp+oTbzhE7AkYuoSxgc1Kwuef2EAC9sgJv1WYmFjuEpHo4ClFe8
 1jQN38O4VEQeXYsbxIWvGT4/oVWNV/VK9Fu4RS+BkfvdhCC53JA8FBJs798RGuvg6dfQ
 yxsD792HsVFwAAopqXBiVMg5Zwubqdc2AKZRU+zODNl2/WaNoItNQqMe8Tc1rsWvTUm3
 McZB/A1FbLgOpr1W7EEg7hmASIdTQp8I8HRO7xCpE/sCXTwPzEFFNIzNJZGbEZudDdbc
 BWc673wcwqTswBJ2va8ZaVCdKotf9pCsN/JKi43zMf/GcuRdR4kBl1bsUeicHFmfKae9
 NNBA==
X-Gm-Message-State: AOAM530ZbBjYoo2Y7XyNIAlZ2b2ZZxytIuo2K3pkfNU1A31YJ8U4loIE
 1BxPyIHEq3KXTciti4uzUbknSLuYyvkZ6JjTMVHLIqobEucnfZeaiAK8j9foZTjCNuOn0As18A5
 ApyasYu/+k9MQo7SpF6ycNNzKjQ==
X-Received: by 2002:a17:907:a407:b0:6f4:3f14:7707 with SMTP id
 sg7-20020a170907a40700b006f43f147707mr16222524ejc.351.1651684734990; 
 Wed, 04 May 2022 10:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeNLSEO6aMZEJmeSDZvOrdtsRQbX4QDRaEAbooQf77kraL3riqlGTEh69XjibmoSyspABsDQ==
X-Received: by 2002:a17:907:a407:b0:6f4:3f14:7707 with SMTP id
 sg7-20020a170907a40700b006f43f147707mr16222496ejc.351.1651684734772; 
 Wed, 04 May 2022 10:18:54 -0700 (PDT)
Received: from fedora.nat2.vcit.vutbr.net (nat2.vcit.vutbr.net.
 [185.62.108.68]) by smtp.gmail.com with ESMTPSA id
 bf16-20020a0564021a5000b0042617ba63aesm9492598edb.56.2022.05.04.10.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 10:18:54 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Wed,  4 May 2022 19:18:51 +0200
Message-Id: <20220504171851.17188-1-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mmenzyns@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH] drm/nouveau: reorder nouveau_drm_device_fini
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Resources needed for output poll workers are destroyed in
nouveau_fbcon_fini() before output poll workers are cleared in
nouveau_display_fini(). This means there is a time between fbcon_fini
and display_fini, where if output poll happens, it crashes.

BUG: KASAN: use-after-free in
__drm_fb_helper_initial_config_and_unlock.cold+0x1f3/0x291
[drm_kms_helper]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Mark Menzynski <mmenzyns@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 561309d447e0..773efdd20d2f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -588,12 +588,6 @@ nouveau_drm_device_init(struct drm_device *dev)
 	if (ret)
 		goto fail_dispctor;
 
-	if (dev->mode_config.num_crtc) {
-		ret = nouveau_display_init(dev, false, false);
-		if (ret)
-			goto fail_dispinit;
-	}
-
 	nouveau_debugfs_init(drm);
 	nouveau_hwmon_init(dev);
 	nouveau_svm_init(drm);
@@ -601,6 +595,12 @@ nouveau_drm_device_init(struct drm_device *dev)
 	nouveau_fbcon_init(dev);
 	nouveau_led_init(dev);
 
+	if (dev->mode_config.num_crtc) {
+		ret = nouveau_display_init(dev, false, false);
+		if (ret)
+			goto fail_dispinit;
+	}
+
 	if (nouveau_pmops_runtime()) {
 		pm_runtime_use_autosuspend(dev->dev);
 		pm_runtime_set_autosuspend_delay(dev->dev, 5000);
@@ -641,15 +641,14 @@ nouveau_drm_device_fini(struct drm_device *dev)
 		pm_runtime_forbid(dev->dev);
 	}
 
+	if (dev->mode_config.num_crtc)
+		nouveau_display_fini(dev, false, false);
 	nouveau_led_fini(dev);
 	nouveau_fbcon_fini(dev);
 	nouveau_dmem_fini(drm);
 	nouveau_svm_fini(drm);
 	nouveau_hwmon_fini(dev);
 	nouveau_debugfs_fini(drm);
-
-	if (dev->mode_config.num_crtc)
-		nouveau_display_fini(dev, false, false);
 	nouveau_display_destroy(dev);
 
 	nouveau_accel_fini(drm);
-- 
2.32.0

