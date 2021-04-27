Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A839036C199
	for <lists+nouveau@lfdr.de>; Tue, 27 Apr 2021 11:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1226E936;
	Tue, 27 Apr 2021 09:20:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A9E6E932
 for <nouveau@lists.freedesktop.org>; Tue, 27 Apr 2021 09:20:30 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j5so57738762wrn.4
 for <nouveau@lists.freedesktop.org>; Tue, 27 Apr 2021 02:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOCIo0GxcuBFJ7MAFxsDsYBoZyOhVlSKHbo+qwITV5Q=;
 b=eqYcy5pEgjEbNBPBox4dInLBHfCo5j5j+wLOf5FWeDDHDm35ZfHa+F5PzHefmdBR6Y
 mQW4c1LZ9C340D8p4VatAiPiLY3FHujh7UGENv0MV6WyIJwZcmvgTMPp/O/XIZZvCLfc
 tqpPiLk+lTMEF0Qfwn2RGiopa0yyp2/jXUk1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KOCIo0GxcuBFJ7MAFxsDsYBoZyOhVlSKHbo+qwITV5Q=;
 b=M7MkZli9kJ/FrX2BUyKzCWLTuuK8OhOiIdgQZsTuElc+fCjTIvXrWtbDPYMvXIRA48
 KTjYn4AFF555MD1FkjPM2UV/94ovA2noLZ/0AppdQti2Xz7a9p4MvAkmmqMl7EOMz36R
 hFZ/GAXabdWQWi3+q/WLsVYM/Xv2/CqZsSOMZCjOm4yvAtgyuT06GZ+AruVg3MdCcq8r
 89U8sVuapUmgn6f469q/A1fDspTx+hTqx1z4ht2jdxZe83ou26OyG+PvWHae9Ry0soTL
 EkL+NmTbKUepATZAuPUQkK6Z4EF+71R5rstPpfjU54jW49pA3uMi/0sy69Pe3/yquoD/
 K64A==
X-Gm-Message-State: AOAM530IXdbOuKT8Vc25iZ2wOKeVuvzOiChgECYUtO9dqW9vDqYbXB3C
 imkfsBETsVC1YIl8RUbPCeI5dw==
X-Google-Smtp-Source: ABdhPJxBaxOImxswpfiXYoCXOXsQQQFm/5Ib8J6++xeSyqcKN0bxddZpkjc1KLyL1GncdKpYFf7B5A==
X-Received: by 2002:adf:e60d:: with SMTP id p13mr18428250wrm.326.1619515228862; 
 Tue, 27 Apr 2021 02:20:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r24sm1939816wmh.8.2021.04.27.02.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:20:28 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Tue, 27 Apr 2021 11:20:16 +0200
Message-Id: <20210427092018.832258-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
References: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 6/8] drm/nouveau: Don't set allow_fb_modifiers
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
