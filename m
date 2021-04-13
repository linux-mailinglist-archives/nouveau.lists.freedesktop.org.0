Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE5A35DBA9
	for <lists+nouveau@lfdr.de>; Tue, 13 Apr 2021 11:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2806E3B7;
	Tue, 13 Apr 2021 09:49:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11186E323
 for <nouveau@lists.freedesktop.org>; Tue, 13 Apr 2021 09:49:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id x7so15751532wrw.10
 for <nouveau@lists.freedesktop.org>; Tue, 13 Apr 2021 02:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOCIo0GxcuBFJ7MAFxsDsYBoZyOhVlSKHbo+qwITV5Q=;
 b=adN7hP+T0iNVXfFXZvSvgr+93E9K98/BtliqF90MH8R8o5FKRtDJItG5KKbuc4MYMe
 qWK/ti+Hc73ReMOF1oIb5bn0cRI5vWpR+7N32rqQp4F42mweFWw9zjUMLl9kWoBC0RcG
 wxR9XZDiqN0RFaXyrUK1NIeHoIMwzwAMXoYoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KOCIo0GxcuBFJ7MAFxsDsYBoZyOhVlSKHbo+qwITV5Q=;
 b=aKvEIdh9B1T8fro6q5rqGXDam04/DwSGxMoSZAguuzVQ7c3X3SwDk2GMhbmLW8S8Ze
 pTwRrnGEjB56tvbvJAj2T6rpNO2n7trBffl5n3ItpQD5SYGlYlifn4rZLsnJXrKkr9PC
 3pdkg79nNGZLuQ3qC3NzUJ3aL0tN4I3ljS1iPgoBfqBYO72gWOdxsyBJYzDDzFWYzFM/
 2PPOr+RfJ6XSqXbEmmnM39xCNcgQ0C86nF3ZHlYECCzv4ch7Lmf8CHvAXVIZZFAhU0H9
 mpoKUcJrXJn+tww7OYEY+o3jQa66q0mHqAfl1E/BS9KZNUgLVK3vuUvtH4I930ym3rog
 15IQ==
X-Gm-Message-State: AOAM531KzgupinuwkbfupaScIcG/dqGpvI71kS5tl7eVotJEjbVR1WgU
 gc/hXNPGy1YZQ4vit3Ld5ARmRQ==
X-Google-Smtp-Source: ABdhPJzuwM6zgnq1ioNXEfS/WwdqokduH0KbRvUyJrFDtNqmDFhRlSCyaOxnBcCKHkMTz2CRCLLbEg==
X-Received: by 2002:a05:6000:1004:: with SMTP id
 a4mr34540971wrx.202.1618307357555; 
 Tue, 13 Apr 2021 02:49:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 64sm1956458wmz.7.2021.04.13.02.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 02:49:17 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Tue, 13 Apr 2021 11:48:59 +0200
Message-Id: <20210413094904.3736372-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 08/12] drm/nouveau: Don't set allow_fb_modifiers
 explicitly
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Since

commit 890880ddfdbe256083170866e49c87618b706ac7
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Fri Jan 4 09:56:10 2019 +0100

    drm: Auto-set allow_fb_modifiers when given modifiers at plane init

this is done automatically as part of plane init, if drivers set the
modifier list correctly. Which is the case here.

Note that this fixes an inconsistency: We've set the cap everywhere,
but only nv50+ supports modifiers. Hence cc stable, but not further
back then the patch from Paul.

Cc: stable@vger.kernel.org # v5.1 +
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 14101bd2a0ff..929de41c281f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -697,7 +697,6 @@ nouveau_display_create(struct drm_device *dev)
 
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.prefer_shadow = 1;
-	dev->mode_config.allow_fb_modifiers = true;
 
 	if (drm->client.device.info.chipset < 0x11)
 		dev->mode_config.async_page_flip = false;
-- 
2.31.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
