Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F0D296EDE
	for <lists+nouveau@lfdr.de>; Fri, 23 Oct 2020 14:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2806E5CA;
	Fri, 23 Oct 2020 12:22:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AD76E5A5
 for <nouveau@lists.freedesktop.org>; Fri, 23 Oct 2020 12:22:51 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x7so1595454wrl.3
 for <nouveau@lists.freedesktop.org>; Fri, 23 Oct 2020 05:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xQPq+yAA8AW/svlJ9AY1HOlvb3EW8VTS4T+GBR6wLrU=;
 b=NbbqlkrQtu0CB8BYCG4gn7RuzIui8JESMpqzF0eOWNi7WRWNJsMD67jNJ/wTMkx80t
 dHejKFxffPPJcYZQ5OPid41hRwZwXJIpXBjPuiO9kFq/IVZWKe8WcsaP/i3jxoMxdCp5
 3SKI/6UoxcqWqPY5Z7UgEnhEd3hKOFis+lAKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xQPq+yAA8AW/svlJ9AY1HOlvb3EW8VTS4T+GBR6wLrU=;
 b=IoL3f7Y2H72GJPQ5sATLLKSCpj9ZpjbppK+OFa4y0543KrgSH36e4jB2ZEslvV6x9Y
 1Sd8J4GicivI6OM9B2cU91fkMCJs0ngIsK6HXs6Dlc1uJgLIm+m8Ixs816fq8DSfSDJ+
 +6rS7HK4PnY4FUuwTVvRl293PA8dgfwlsK6Vwm0zHB8GVbBCXLmW+GpRYrVltSM3gS9b
 849J6pF6jPZhlhcP9k1YUfUy65je/0l+m3dO8gF0j0mVTYeQGA0dT2spzE0k8tGt4zab
 gcrcqaOnG9XRqve1U7zHNAgz2jzGmfQmCBOeScGkWH611q79cbiFzGkbjSHkqV4iJxPr
 oRiw==
X-Gm-Message-State: AOAM532fhmzi4LUaYj/r8a0IsFwr6YBhLX5Wy2mZNP5uREX6rML7NT6G
 aCtvvk3r7/Do7x7Uq0ZE0iCefx54ElDmdo6X
X-Google-Smtp-Source: ABdhPJzSQqrDw6b5+z+eaZhTT8mvZTxmEyqPgiuTUkvBgDnQP2YTPSXTYeqNjOlv1o0+3jz665V43Q==
X-Received: by 2002:adf:e8c7:: with SMTP id k7mr2367177wrn.102.1603455770631; 
 Fri, 23 Oct 2020 05:22:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:22:50 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Fri, 23 Oct 2020 14:21:36 +0200
Message-Id: <20201023122216.2373294-25-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 25/65] drm/nouveau: Drop mutex_lock_nested for
 atomic
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
Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
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

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org
---
I might be totally wrong, so this definitely needs testing :-)

Cheers, Daniel
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 70b6f3b1ae85..c04a808664f8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -775,7 +775,10 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
 			return ret;
 	}
 
-	mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
+	if (drm_drv_uses_atomic_modeset(drm->dev))
+		mutex_lock(&cli->mutex);
+	else
+		mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
 	ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, ctx->interruptible);
 	if (ret == 0) {
 		ret = drm->ttm.move(chan, bo, &bo->mem, new_reg);
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
