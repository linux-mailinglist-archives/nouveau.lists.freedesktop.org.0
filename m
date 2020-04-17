Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B921AE403
	for <lists+nouveau@lfdr.de>; Fri, 17 Apr 2020 19:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5FB6E2DD;
	Fri, 17 Apr 2020 17:47:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6196E2DD
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 17:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587145625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=80JMWiuUHSlwZu6hLj9egtbR/kZ0gHnUjmy4lUY2Aj4=;
 b=fSLqdeGCgMUY/F5mtVXD2aYgdixVY5W7QP2vNYbF0Id8flLRuLN2E0SaO2XoIFcknKRw5K
 +njYKDN9XZitINyX+tqbfHaTb72dfXOpY+FawL/Ir1PjawqyNo4Fra4KbpxOUVTh2+o8QR
 rl6duFrCT8SF+msnU94PL/HHV3cMHOU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-2M5mf-OjMsGwgUzaNJHz8w-1; Fri, 17 Apr 2020 13:47:03 -0400
X-MC-Unique: 2M5mf-OjMsGwgUzaNJHz8w-1
Received: by mail-wm1-f69.google.com with SMTP id o5so1323328wmo.6
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 10:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c2+3lkjWo6Yi+Sso3X2t7JBnbz4vvnf/0wtUX21SbkM=;
 b=DoEqbpj2WBdNN+7uSkvZBFnnQCW3O/WmsN+VD193QKLOX6d0jp43hgpJu+GBMaIKft
 fqSM+/cAuPiVsa2MjSq59JDskG2wIvmcFVdj2dpaBb29sAfuxPTiXSmvgSG3l2ilBLMw
 pmxzQA6nug68APnkfXTGtyqpgphHYA3Peotv4BF9yXf0AfhCVutwF0nrFNvOgREmjuD+
 4l303gzof09Bd5Xzp03YHz5oAppBM4+D25MaNLGBuKAKwwyzLYNxm61a5fnnsY+cD/Wi
 U/ufQAwvZBtouHKEZJ79LqyzCmISWNMK5dXsTg0Df6S8UzWyyVHb6kq5veevWDbOA66g
 L8sA==
X-Gm-Message-State: AGi0PuZoRNGLdnI+hZ7w6QJQKVqkF5Q8+ARexnYAv7usKGI+guqD0w/N
 Kj2a317u1zG6vNSno4Jxy4Fr5rbuTU7wD7iAaQ01E3pTUrj2/Vz9i8eQNhQkaugJP8ZII4Ob5B0
 BrXTk73btiysLMGWeN/e8Jj+d4w==
X-Received: by 2002:adf:ce0d:: with SMTP id p13mr5490327wrn.66.1587145622373; 
 Fri, 17 Apr 2020 10:47:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypLAmsMYZapxzTOsHHCU6PY4JPFsy8RQvX49vPujtYleTNda3XM7JIMddD1hj3UT0G1Ea4GgVg==
X-Received: by 2002:adf:ce0d:: with SMTP id p13mr5490316wrn.66.1587145622179; 
 Fri, 17 Apr 2020 10:47:02 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:482c:9537:40:83ba])
 by smtp.gmail.com with ESMTPSA id w3sm15665006wrc.18.2020.04.17.10.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 10:47:00 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 17 Apr 2020 19:45:57 +0200
Message-Id: <20200417174559.37152-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH 1/3] device: use the correct mmio size when mapping
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
 drm/nouveau/nvkm/engine/device/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index 8ebbe1656..17676c75a 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -2963,7 +2963,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 
 	/* identify the chipset, and determine classes of subdev/engines */
 	if (detect) {
-		map = ioremap(mmio_base, 0x102000);
+		map = ioremap(mmio_base, mmio_size);
 		if (ret = -ENOMEM, map == NULL)
 			goto done;
 
-- 
2.25.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
