Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF26D3D15B1
	for <lists+nouveau@lfdr.de>; Wed, 21 Jul 2021 19:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D116EB74;
	Wed, 21 Jul 2021 17:56:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B34B6EBED
 for <nouveau@lists.freedesktop.org>; Wed, 21 Jul 2021 17:56:07 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id k3so2462311qtq.7
 for <nouveau@lists.freedesktop.org>; Wed, 21 Jul 2021 10:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GUwvh6F0pQ4ZVFR78iCJytl/tOQMbNgvBCeSAoGO32w=;
 b=SA4Zrn25cfpJIaL1oes57Z7JCR3eBnrUW+LbmmYg2NoYKgy89T9xfgbzU26RKLeq85
 /56pmzOU/P8oZ7k66zL0/6gKhIeI0QYTfOOoLVgK/9JGhAdVi3VvLnNCgKxbNbnNqXcC
 FRPqIWTf1PlLHiTcakkqVqYqmdHe+kwYxVFAgBdESqvkiu0A9GWBR7u3l53u43iGwGbo
 NQFEW8EOKuza0N5jXmKEjzmLyr42gzcq8dDjIEn+1U58Ea93QgSI6eYldtPtgMY5zdId
 FK46NymLFaDajXeqq/p+XcQGzj++BXlSCDOr1KV38bOinIyLVLtYl6r5rtna+1PRMcGH
 QNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GUwvh6F0pQ4ZVFR78iCJytl/tOQMbNgvBCeSAoGO32w=;
 b=GExT1zhiEgR+WZe6ec2YHZUaWOLI7wn4q37YPz67J6gGEVHdFU4dxNJWAGn10TukQf
 MJvYYo4HvMzv0k5JsV0wwGcK4MIer3UusyNlS0eK+WC+sN1PoqIoOKL7h1UkFg19eXVy
 HGnGXHETBMti/AV5i36BI4GF3EF2jCFQWGeUU6eSIvPcaBTqDkHYbB0mKRPl05owI7TU
 8nkLxmXjcwZWmaDamhoChgZbXJJ6vWvqRTTBu3Ym5Cr1u1hjTPHjQBG7tQKBYke9eFDG
 ts0K6cBxNBUj4dGlZuPB6nNi6ttqUeVVenDO2bYlcFrsOUIPYjD0vtNGxVMMHZiNSfsX
 Hs7A==
X-Gm-Message-State: AOAM530akHwOlXD4Jl7rGL78af1HP8ZHxpgefGqfx/bECeOqNFlGVfqF
 7nFNf/uDm1+eAohjO7oGO5Cfvg==
X-Google-Smtp-Source: ABdhPJxqL3Z3uzLnVy2E2LxuR435PtjjUG1Jd5JQfh+eyTJXtq/EnC0WqJtxzZimSwr0+IVbfvjjjQ==
X-Received: by 2002:ac8:531a:: with SMTP id t26mr32998247qtn.207.1626890166796; 
 Wed, 21 Jul 2021 10:56:06 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id ay31sm1780760qkb.41.2021.07.21.10.56.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:56:06 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Date: Wed, 21 Jul 2021 13:55:15 -0400
Message-Id: <20210721175526.22020-9-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
MIME-Version: 1.0
Subject: [Nouveau] [RESEND PATCH v6 08/14] drm/nouveau: Change debug checks
 to specifically target syslog
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
Cc: nouveau@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Since the logs protected by these checks specifically target syslog,
use the new drm_debug_syslog_enabled() call to avoid triggering
these prints when only trace is enabled.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-9-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-Rebased on drm-tip, changes in dispnv50/disp.h were rebased out
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index ba65f136cf48..2caa5720f451 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -260,11 +260,11 @@ void nouveau_drm_device_remove(struct drm_device *dev);
 #define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->client, f, ##a)
 
 #define NV_DEBUG(drm,f,a...) do {                                              \
-	if (drm_debug_enabled(DRM_UT_DRIVER))                                  \
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))                                  \
 		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
 } while(0)
 #define NV_ATOMIC(drm,f,a...) do {                                             \
-	if (drm_debug_enabled(DRM_UT_ATOMIC))                                  \
+	if (drm_debug_syslog_enabled(DRM_UT_ATOMIC))                                  \
 		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
 } while(0)
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
