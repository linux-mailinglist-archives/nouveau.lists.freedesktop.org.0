Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5001528567
	for <lists+nouveau@lfdr.de>; Mon, 16 May 2022 15:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F058F1121D7;
	Mon, 16 May 2022 13:31:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55BE1121D7
 for <nouveau@lists.freedesktop.org>; Mon, 16 May 2022 13:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652707869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w+eIR1jdJFJp4FEreIhpWwIkPEB98By7uRBAllkcS2c=;
 b=bKs/5kNP+QxKznoVljEkL6x5guwnykcLAEEHUQqDLVkuAWY64HnBTlueFvg7dU6KN3El1d
 k1QYOi5jD5BSDQY16RBnWrtFrYA7GUAqwt7kfnYDtFdwhRvUnlhQBfpXu7hi8MxFkEg6rl
 WnfbjOu+LgxVQums9bRKL/637/cVRPQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-htWmIkHqOyWpmdJf0OV5tA-1; Mon, 16 May 2022 09:31:08 -0400
X-MC-Unique: htWmIkHqOyWpmdJf0OV5tA-1
Received: by mail-ej1-f69.google.com with SMTP id
 nb10-20020a1709071c8a00b006e8f89863ceso5826849ejc.18
 for <nouveau@lists.freedesktop.org>; Mon, 16 May 2022 06:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w+eIR1jdJFJp4FEreIhpWwIkPEB98By7uRBAllkcS2c=;
 b=yuXKtGQMJGVjZybLzTJe8tncUUwAVg0P54BAZeG7hfSLvMEqetB2Oe1X4eN1cGPkrI
 KE1bYpZxIwaeIlRcxa0AvISTk2bgkq0WaSjWZh4BdiEMwdZMPaYuWMVd50BujBV/C5wK
 Ofb+IboYSiQaoPzZrWy0pKx5HcBsNOxwr/106lRc9JVYjY+53/aXsbvHTjBc2C/W8QJ4
 z69toQS1KvxhnI4A5YhUemV852IE0ODV63cs2vhOeEjTO0dJsPbBBHWNVjF9VSi9EEhv
 zPUgysQeAsNElIiIX0AHsb36PSrkv17zWTnh5u16OID1JZvahw7zXX10JtdhmiRBLqWe
 NCgA==
X-Gm-Message-State: AOAM533kIdAY7L8udiyEOg+zvfjNOJPj18u9br1z7oo40s9SZr1ecOj2
 8xpUbgss1Hu72xaJGjt51gokfZKEBt4iB9mgSz7KEesLsw6VcSkusB+4AW3KGa9Ys3sQNgU36Z+
 c52CxKrXMfabr2iXgVn+tmBEXXA==
X-Received: by 2002:a17:907:1687:b0:6f4:ebc2:da77 with SMTP id
 hc7-20020a170907168700b006f4ebc2da77mr14924492ejc.508.1652707867473; 
 Mon, 16 May 2022 06:31:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0fOyJSx7iSNVdMn7CYLSlWrFP1mGJaYESmuOYZfdVRlB9QZmxDbNE8F2fpbTaT5BDFciIPw==
X-Received: by 2002:a17:907:1687:b0:6f4:ebc2:da77 with SMTP id
 hc7-20020a170907168700b006f4ebc2da77mr14924475ejc.508.1652707867235; 
 Mon, 16 May 2022 06:31:07 -0700 (PDT)
Received: from fedora.. (78-80-114-84.customers.tmcz.cz. [78.80.114.84])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a50fa83000000b0042ab8c5e99fsm868438edr.14.2022.05.16.06.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:31:06 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 16 May 2022 15:31:03 +0200
Message-Id: <20220516133103.324365-1-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mmenzyns@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH v2] drm/nouveau: reorder nouveau_drm_device_fini
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
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Resources needed for output poll workers are destroyed in
nouveau_fbcon_fini() before output poll workers are cleared in
nouveau_display_fini(). This means there is a time between fbcon_fini()
and display_fini(), where if output poll happens, it crashes.

This makes output poll workers cleared right before fbcon resources are
destroyed.

BUG: KASAN: use-after-free in
__drm_fb_helper_initial_config_and_unlock.cold+0x1f3/0x291
[drm_kms_helper]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Mark Menzynski <mmenzyns@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 4f9b3aa5deda..5226323e55d3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -39,6 +39,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_probe_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_atomic.h>
@@ -605,6 +606,7 @@ nouveau_fbcon_fini(struct drm_device *dev)
 	if (!drm->fbcon)
 		return;
 
+	drm_kms_helper_poll_fini(dev);
 	nouveau_fbcon_accel_fini(dev);
 	nouveau_fbcon_destroy(dev, drm->fbcon);
 	kfree(drm->fbcon);
-- 
2.32.0

