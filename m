Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9D22359BC
	for <lists+nouveau@lfdr.de>; Sun,  2 Aug 2020 20:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8FA6E155;
	Sun,  2 Aug 2020 18:18:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637316E136
 for <nouveau@lists.freedesktop.org>; Sun,  2 Aug 2020 18:18:57 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 3so13501074wmi.1
 for <nouveau@lists.freedesktop.org>; Sun, 02 Aug 2020 11:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pgcXrt5aoVBJOcD8ilQRl/gH8mVEoQGHI/SopWr+QuE=;
 b=Buap1iYLmxQl821OjI2X1Xsqk3Xi2nvDr8UwzzmF3I5uFBCEF7qpQThXqoUwp9rtrR
 m2I2oLhgm3ZYlzzLmxK/grwfcqPcUV4F3In2A314uT4LcgHjErLn3Z0UVMlWL4yL2tXt
 qCqwy0zzFL4UvYQqAB9S9f5dRFah0l9vha7O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pgcXrt5aoVBJOcD8ilQRl/gH8mVEoQGHI/SopWr+QuE=;
 b=ksXmVqt5U1dipez1G6Is+BjCxpr3ePaUTW99JX+EvwaKinGO++FKWxljSE3Iysvj8V
 QVh/0AFBE05hyJKR1gz+ZWaSbTtesJy2UWdH0k0yaGgPFbvhNzfYYr1+kgY3E/T5pRjB
 Vi0R6B/xzHos2ygQGwxDTBF7YJ5Lhz1bHjQYtqY3ZQMwdJXVX4MasEV14fZFG/9Jpr7g
 sDb4NvsXUggHZnto4Q1XjPmfZsL75r5yPJ9a17XJ1Ur3LY80zoE7IelvP8lkP+Me0Zum
 mreNqOikCZYXlo5Rue3eN/b0Wasf5w0FyBsUFZbBmPmt6mWmLVnrfbeTdsIUeNSRp280
 sxfA==
X-Gm-Message-State: AOAM533JLXimkZhFo4IVkZKIXSF3qGTd6fSOvE/pPD13wpUsSEP9cEvc
 VTNymCU/jrxDWjM9VavvPGhjPg==
X-Google-Smtp-Source: ABdhPJwm8dmeEFHr57enbo9c/cYgaiTu25roRjbPt5f0rOZoZdps6mCBhqDbj7pudp4bPMYboDagkQ==
X-Received: by 2002:a7b:c205:: with SMTP id x5mr13437744wmi.161.1596392335999; 
 Sun, 02 Aug 2020 11:18:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e16sm19884398wrx.30.2020.08.02.11.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 11:18:55 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Sun,  2 Aug 2020 20:18:49 +0200
Message-Id: <20200802181849.1586281-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH] drm/nouveau: Drop mutex_lock_nested for atomic
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
Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Purely conjecture, but I think the original locking inversion with the
legacy page flip code between flipping and ttm's bo move function
shoudn't exist anymore with atomic: With atomic the bo pinning and
actual modeset commit is completely separated in the code patsh.

This annotation was originally added in

commit 060810d7abaabcab282e062c595871d661561400
Author: Ben Skeggs <bskeggs@redhat.com>
Date:   Mon Jul 8 14:15:51 2013 +1000

    drm/nouveau: fix locking issues in page flipping paths

due to

commit b580c9e2b7ba5030a795aa2fb73b796523d65a78
Author: Maarten Lankhorst <m.b.lankhorst@gmail.com>
Date:   Thu Jun 27 13:48:18 2013 +0200

    drm/nouveau: make flipping lockdep safe

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org
---
I might be totally wrong, so this definitely needs testing :-)

Cheers, Daniel
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7806278dce57..a7b2a9bb0ffe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -776,7 +776,11 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
 			return ret;
 	}
 
-	mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
+	if (drm_drv_uses_atomic_modeset(drm->dev))
+		mutex_lock(&cli->mutex);
+	else
+		mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
+
 	ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, intr);
 	if (ret == 0) {
 		ret = drm->ttm.move(chan, bo, &bo->mem, new_reg);
-- 
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
